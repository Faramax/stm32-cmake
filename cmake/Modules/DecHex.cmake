MACRO(CHAR_HEX_TO_DEC val out)
   STRING(TOUPPER ${val} val)
   IF(val STREQUAL A)
      SET(${out} 10)
   ELSEIF(val STREQUAL B)
      SET(${out} 11)
   ELSEIF(val STREQUAL C)
      SET(${out} 12)
   ELSEIF(val STREQUAL D)
      SET(${out} 13)
   ELSEIF(val STREQUAL E)
      SET(${out} 14)
   ELSEIF(val STREQUAL F)
      SET(${out} 15)
   ELSE()
      SET(${out} ${val})
   ENDIF()
ENDMACRO(CHAR_HEX_TO_DEC)

MACRO(CHAR_DEC_TO_HEX val out)
   STRING(TOUPPER ${val} val)
   IF(val STREQUAL 10)
      SET(${out} A)
   ELSEIF(val STREQUAL 11)
      SET(${out} B)
   ELSEIF(val STREQUAL 12)
      SET(${out} C)
   ELSEIF(val STREQUAL 13)
      SET(${out} D)
   ELSEIF(val STREQUAL 14)
      SET(${out} E)
   ELSEIF(val STREQUAL 15)
      SET(${out} F)
   ELSE()
      SET(${out} ${val})
   ENDIF()
ENDMACRO(CHAR_DEC_TO_HEX)

MACRO(CONVERT_TODEC out) # args: out [val]
   IF(${ARGC} EQUAL 2)
      SET(TMP_VAL ${ARGV1})
      IF(TMP_VAL MATCHES "^0[xX][0-9a-fA-F]+$")
         SET(TMPOUT 0)
         SET(TMPS 2)
         STRING(LENGTH ${TMP_VAL} TMPE)
         MATH(EXPR TMPE "${TMPE} - 1")
         FOREACH(I RANGE ${TMPS} ${TMPE})
            STRING(SUBSTRING ${TMP_VAL} ${I} 1 TMP_CH)
            CHAR_HEX_TO_DEC(${TMP_CH} TMP_CH)
            MATH(EXPR TMPOUT "${TMPOUT} * 16 + ${TMP_CH}")
         ENDFOREACH(I)
         SET(${out} ${TMPOUT})
      ELSE()
         SET(${out} ${TMP_VAL})
      ENDIF()
   ELSEIF(${ARGC} EQUAL 1)
      CONVERT_TODEC(${out} ${${out}})
   ELSE()
      MESSAGE(FATAL "Wrong arguments to CONVERT_TOHEX")
   ENDIF()
ENDMACRO(CONVERT_TODEC)

MACRO(CONVERT_TOHEX out)  # args: out [val]
   IF(${ARGC} EQUAL 2)
      SET(TMP_VAL ${ARGV1})
      IF(TMP_VAL MATCHES "^[0-9]+$")
         IF(TMP_VAL EQUAL 0)
            SET(TMPOUT "0")
         ELSE()
            SET(TMPOUT "")
            WHILE(TMP_VAL GREATER 0)
               MATH(EXPR TMP_CH "${TMP_VAL} % 16")
               CHAR_DEC_TO_HEX(${TMP_CH} TMP_CH)
               SET(TMPOUT "${TMP_CH}${TMPOUT}")
               MATH(EXPR TMP_VAL "${TMP_VAL} / 16")
            ENDWHILE()
         ENDIF()
         SET(${out} "0x${TMPOUT}")
      ELSE()
         SET(${out} ${TMP_VAL})
      ENDIF()
   ELSEIF(${ARGC} EQUAL 1)
      CONVERT_TOHEX(${out} ${${out}})
   ELSE()
      MESSAGE(FATAL "Wrong arguments to CONVERT_TOHEX")
   ENDIF()
ENDMACRO(CONVERT_TOHEX)
