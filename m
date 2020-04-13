Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4CE31A61D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 05:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgDMD6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 23:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:55140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728631AbgDMD6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 23:58:18 -0400
Received: from m177134.mail.qiye.163.com (m177134.mail.qiye.163.com [123.58.177.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B75C0A3BE0;
        Sun, 12 Apr 2020 20:58:18 -0700 (PDT)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 4788A4E16BA;
        Mon, 13 Apr 2020 11:58:14 +0800 (CST)
From:   Wang Wenhu <wenhu.wang@vivo.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Wang Wenhu <wenhu.wang@vivo.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com
Subject: [PATCH] soc: qmi: move tlv-micros to header file
Date:   Sun, 12 Apr 2020 20:57:56 -0700
Message-Id: <20200413035758.60238-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUlXWQgYFAkeWUFZTVVMT05LS0tITUlIQk1JT1lXWShZQU
        hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCI6GAw*Mjg5EgtRKSoDKA04
        PD0aCjJVSlVKTkNNTE5LSUJNTUJCVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
        Q1VJTkpVTE9VSUlNWVdZCAFZQU5NSUs3Bg++
X-HM-Tid: 0a7171b009fe9376kuws4788a4e16ba
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's highly helpful to move the definitions of TLV related micros
into header file for user reference. The OPTIONAL_TLV_TYPE_START
should be known to any user that might define messages containing
optional fields. SIZE fields are the same, for users to calculate
message buffer length.

While encoding messages, Type always occurs together with Length.
So the better way is to use TL_SIZE, rather than (T_SIZE + L_SIZE).

Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 28 ++++++++++++----------------
 include/linux/soc/qcom/qmi.h  |  5 +++++
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 3aaab71d1b2c..a674c68efab2 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -53,10 +53,6 @@ do { \
 	decoded_bytes += rc; \
 } while (0)
 
-#define TLV_LEN_SIZE sizeof(u16)
-#define TLV_TYPE_SIZE sizeof(u8)
-#define OPTIONAL_TLV_TYPE_START 0x10
-
 static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
 		      const void *in_c_struct, u32 out_buf_len,
 		      int enc_level);
@@ -142,7 +138,7 @@ static int qmi_calc_min_msg_len(struct qmi_elem_info *ei_array,
 		 * nested structure.
 		 */
 		if (level == 1)
-			min_msg_len += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
+			min_msg_len += QMI_TLV_TL_SIZE;
 	}
 
 	return min_msg_len;
@@ -253,8 +249,7 @@ static int qmi_encode_string_elem(struct qmi_elem_info *ei_array,
 	}
 
 	if (enc_level == 1) {
-		if (string_len + TLV_LEN_SIZE + TLV_TYPE_SIZE >
-		    out_buf_len) {
+		if (string_len + QMI_TLV_TL_SIZE > out_buf_len) {
 			pr_err("%s: Output len %d > Out Buf len %d\n",
 			       __func__, string_len, out_buf_len);
 			return -ETOOSMALL;
@@ -311,7 +306,7 @@ static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
 	tlv_pointer = buf_dst;
 	tlv_len = 0;
 	if (enc_level == 1)
-		buf_dst = buf_dst + (TLV_LEN_SIZE + TLV_TYPE_SIZE);
+		buf_dst = buf_dst + QMI_TLV_TL_SIZE;
 
 	while (temp_ei->data_type != QMI_EOTI) {
 		buf_src = in_c_struct + temp_ei->offset;
@@ -342,8 +337,8 @@ static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
 			/* Check to avoid out of range buffer access */
-			if ((data_len_sz + encoded_bytes + TLV_LEN_SIZE +
-			    TLV_TYPE_SIZE) > out_buf_len) {
+			if ((data_len_sz + encoded_bytes + QMI_TLV_TL_SIZE) >
+			    out_buf_len) {
 				pr_err("%s: Too Small Buffer @DATA_LEN\n",
 				       __func__);
 				return -ETOOSMALL;
@@ -367,7 +362,7 @@ static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
 		case QMI_SIGNED_4_BYTE_ENUM:
 			/* Check to avoid out of range buffer access */
 			if (((data_len_value * temp_ei->elem_size) +
-			    encoded_bytes + TLV_LEN_SIZE + TLV_TYPE_SIZE) >
+			    encoded_bytes + QMI_TLV_TL_SIZE) >
 			    out_buf_len) {
 				pr_err("%s: Too Small Buffer @data_type:%d\n",
 				       __func__, temp_ei->data_type);
@@ -410,10 +405,10 @@ static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
 
 		if (encode_tlv && enc_level == 1) {
 			QMI_ENCDEC_ENCODE_TLV(tlv_type, tlv_len, tlv_pointer);
-			encoded_bytes += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
+			encoded_bytes += QMI_TLV_TL_SIZE;
 			tlv_pointer = buf_dst;
 			tlv_len = 0;
-			buf_dst = buf_dst + TLV_LEN_SIZE + TLV_TYPE_SIZE;
+			buf_dst = buf_dst + QMI_TLV_TL_SIZE;
 			encode_tlv = 0;
 		}
 	}
@@ -613,10 +608,11 @@ static int qmi_decode(struct qmi_elem_info *ei_array, void *out_c_struct,
 			tlv_pointer = buf_src;
 			QMI_ENCDEC_DECODE_TLV(&tlv_type,
 					      &tlv_len, tlv_pointer);
-			buf_src += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
-			decoded_bytes += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
+			buf_src += QMI_TLV_TL_SIZE;
+			decoded_bytes += QMI_TLV_TL_SIZE;
 			temp_ei = find_ei(ei_array, tlv_type);
-			if (!temp_ei && tlv_type < OPTIONAL_TLV_TYPE_START) {
+			if (!temp_ei && tlv_type <
+			    QMI_OPTIONAL_TLV_TYPE_START) {
 				pr_err("%s: Inval element info\n", __func__);
 				return -EINVAL;
 			} else if (!temp_ei) {
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index e712f94b89fc..eb53aebdf45e 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -34,6 +34,11 @@ struct qmi_header {
 #define QMI_INDICATION	4
 
 #define QMI_COMMON_TLV_TYPE 0
+#define QMI_OPTIONAL_TLV_TYPE_START 0x10
+
+#define QMI_TLV_LEN_SIZE sizeof(u16)
+#define QMI_TLV_TYPE_SIZE sizeof(u8)
+#define QMI_TLV_TL_SIZE (QMI_TLV_LEN_SIZE + QMI_TLV_TYPE_SIZE)
 
 enum qmi_elem_type {
 	QMI_EOTI,
-- 
2.17.1

