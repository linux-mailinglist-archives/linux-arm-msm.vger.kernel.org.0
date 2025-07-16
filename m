Return-Path: <linux-arm-msm+bounces-65118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5FB06AE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 02:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9092A1A640D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 00:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527C9218592;
	Wed, 16 Jul 2025 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9DI5IvW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320712C544
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752627150; cv=none; b=TXjeB7meD7iMsAEIEqhjiwKk451WziMTHlw7/fiSkP9iWIvcelrXMRSzQppvwsjYH8GRF/oJ59/vKJp/3TgJNe82l4KhKM9noTBrSfOi/Qz+E7VMnOI+U5nWlagnK0Gg1UuVlVFXoQWKP8G+apQn+Dl6dobDDmDdCPdlctUHku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752627150; c=relaxed/simple;
	bh=KMT5z8mhczbyFwWS7RYpw5Qrr1RGxPSb+bo/wxuCfOk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RqRDZummKynHoYvvdSLi6liOnTpkcq2AFxZq5ppMdVN+61BDFAMUHmLvEsNmwj3yx8by3aikYxh5hgqFt61ojGaUTGK4nrczpLYSaFCgg8Pf1VemRmdO84+mcD3tLuZj1wSJ9LQSGL6HDL0XP/sK1Y4Y+u+ATHGFwT/wuzhfUVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9DI5IvW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDKJW003436
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=25xQM2KEtU4vblrflgweIvHQ5dspnQlwKDq
	ajlJ5ujY=; b=K9DI5IvW4EJecxEAH+s8vIlHUrT511UVAXWSQrvov3zfsjRY8Vt
	Sq9drhV8OecLtG386+YC7DcEEKjlckjLElKpB5VNAsmcWs0eTa4xjjpVmtGZbTLF
	1UalJyhgSTPLLQ4lwWNJ9WmxbRRiPP4VDYU8HMX4v4bOEFwMRJCyQcJRM/FFIFKQ
	X2S1yCY7b+J2oL90EhQYZcmlQDYbuzrt0NaHu/SnqKqj9p6ed37Kec7nYWqM7Pmg
	AejiXKDAuKdTFFyHLLPdKdXF12qLmqBW0N0lXqtGty1LDMgHQ+Qb0Lp7kLxl3Uj+
	jPQiV6kPrX/5P+ZfMY0EOzs79mk0U11ya4w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drmxme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:52:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3184712fd8so4804061a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752627147; x=1753231947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25xQM2KEtU4vblrflgweIvHQ5dspnQlwKDqajlJ5ujY=;
        b=pL4qgZsBdE403rfyPf39VGNtghh12dXQF21ZJALvgpK2KX9OvOyX1K2WDTST8/Kyzv
         4yrToiK/p/Va+hDNkkpi7QZOkaJxF//S3UhLfmiDsL4f4PZiBlOaLM/WRzd2ErVICRlq
         qxz/7CTKii+1buMyEud5zqsJFHGo0I1xSvvV53gO+VaX/mGsSc3X/wpNm/995tVB0yew
         qzqxlu+brjRdGufaOlgbgK0HBDsq0CFeSUQsSYwUVl2DN1RvEMqFSOH/EErpn3y7e+JU
         qotL4GBTgJYQpFpW38eezbmtXtKdu1wG+2J461FA9yTP0jVC0lG4Glx+mrIFVkfHE/G5
         c1nw==
X-Forwarded-Encrypted: i=1; AJvYcCXD6CA0/ucptro+AixjIuwUdCqr25qstdgyhj5Y6f7hZcwdZKfvQLIHVyDbdZ7OhpscEX9IkozKb60G9omh@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXlRTdrgZfwKJ9drg0OG8uFc2JVT2cMLLqybkOfQgOaixQ6zl
	nGab9GzgVkStsNYZuZAl+FJH/qeT1P53E6/C2xhdz2/DsiohCSkuf6DznOmREvIozi8e4N0MiM6
	LIDc+sIZddYkO5vqAbno+waN+eS+grJ1gwS9cql5p2or3UpnzOB6mUANVInbsLzzdG1Kd
X-Gm-Gg: ASbGncuW+DNDy9RNmRkOn2yokiFq1dqPNN5JmjwjOefeWMvuYJTiGrKaL5OE7w5CHnv
	fBldhyoX51WKhZLQqvF5/L37PY94d7QKDc36DVDvzNQQJC5KaiXy6nIWw7TD8EbD/s9p9aiBfJ2
	9S7zy3sA/draxY5CWD0k22EJGM0zwVHl8aSbZuZwHhrViPMXyyBZZlWaikbkSNXAEaILLljCLTd
	W6WFWqN+YBGOZUmblfzEita467k790QMDvtUHSirnGbELdxIUXp4LvW1Sa/WEr0tIy73n3u3ZDn
	aQar33qLMq3YnMaDIWSiQ13J9GirnB/2r0QVPQaaaVjZl4kW7Mj55f3lp0f627YcQUZqFV2bNEU
	SoPfjM8t+h7ZFDCO844jpCv43RRw=
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr1001219637.36.1752627146626;
        Tue, 15 Jul 2025 17:52:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYu/eOGeqhr9LJldFOKWzeuC3GEI23AZZeiCfg36XrTPAaeml4wmmR1iwzwasmrypGBn2QCQ==
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr1001189637.36.1752627146224;
        Tue, 15 Jul 2025 17:52:26 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6f7507sm12752326a12.56.2025.07.15.17.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:52:25 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to support UCSI v2
Date: Tue, 15 Jul 2025 17:52:24 -0700
Message-Id: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7S448GfuW6djkPn7qMDbTOs4OJY8evu3
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6876f7cb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HougwLLIzSuBeMajkRwA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 7S448GfuW6djkPn7qMDbTOs4OJY8evu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAwNSBTYWx0ZWRfX7ocqbv2riPxJ
 u95UcPJg1u2RJZtEybxApt4Sz678BI5q28mdF3HGhumraK4vRnb7ZrUYqjQxl5mYy4WKvxMTrcH
 7IH2R5JdNAWEOmXS3hzPW41O7JM4JwNJtsAzHIXWOaX4pt6epc8Os8I5dkkopYIb96yUEjCQ+Cn
 Q2yRbRQ2Vysnq0WgWVpSGZlZhq2oAwtg2LQmW9pF4sUr/dXYOEBaCHZQwX3B1V7QF5shAKyZfoK
 xvikj0PCCSqqkSXNMguN4kIjYj+FQlptFWFA5I9sDF8FHYI6zkOjIhoaVOwk62p9WrpEpTUEHfj
 g8FsMOyxJyhv1mL7OqXX9ku6fGlg960OkgJ3pXN/sx06B3eQhpfJDy3SUJpbt2E0wrwihUvncVj
 6PvtnjnOPSX3LS4S6XCDfxM23wtWLzadePEg08PsVHQ2q/oqpzwQFY71a0YKaJ1dPyeRlxM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=776 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160005

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
Changes since v1:
 - Defined buf size in terms of other UCSI defines
 - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
 - Removed Qualcomm copyright
 - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 58 ++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 8af79101a2fc..2918c88e54d2 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -16,10 +16,10 @@
 
 #define PMIC_GLINK_MAX_PORTS		3
 
-#define UCSI_BUF_SIZE                   48
+#define UCSI_BUF_V1_SIZE               (UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
+#define UCSI_BUF_V2_SIZE               (UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
 
 #define MSG_TYPE_REQ_RESP               1
-#define UCSI_BUF_SIZE                   48
 
 #define UC_NOTIFY_RECEIVER_UCSI         0x0
 #define UC_UCSI_READ_BUF_REQ            0x11
@@ -32,13 +32,25 @@ struct ucsi_read_buf_req_msg {
 
 struct ucsi_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     ret_code;
+};
+
+struct ucsi_v2_read_buf_resp_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V2_SIZE];
 	u32                     ret_code;
 };
 
 struct ucsi_write_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     reserved;
+};
+
+struct ucsi_v2_write_buf_req_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V2_SIZE];
 	u32                     reserved;
 };
 
@@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
 	bool ucsi_registered;
 	bool pd_running;
 
-	u8 read_buf[UCSI_BUF_SIZE];
+	u8 read_buf[UCSI_BUF_V2_SIZE];
 };
 
 static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
@@ -131,8 +143,9 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
 static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
 					const void *val, size_t val_len)
 {
-	struct ucsi_write_buf_req_msg req = {};
+	struct ucsi_v2_write_buf_req_msg req = {};
 	unsigned long left;
+	size_t len;
 	int ret;
 
 	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
@@ -142,7 +155,18 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 
 	reinit_completion(&ucsi->write_ack);
 
-	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
+	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
+		/* If UCSI version is unknown, use the maximum buffer size */
+		len = sizeof(req);
+	} else {
+		/*
+		 * If UCSI V1, buffer size should be UCSI_BUF_V1_SIZE so update
+		 * len accordingly
+		 */
+		len = sizeof(struct ucsi_write_buf_req_msg);
+	}
+
+	ret = pmic_glink_send(ucsi->client, &req, len);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
 		return ret;
@@ -216,12 +240,26 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
 {
-	const struct ucsi_read_buf_resp_msg *resp = data;
+	const struct ucsi_v2_read_buf_resp_msg *resp = data;
+	u32 ret_code, buffer_len;
+
+	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
+		/* If UCSI version is unknown, use the maximum buffer size */
+		ret_code = resp->ret_code;
+		buffer_len = UCSI_BUF_V2_SIZE;
+	} else {
+		/*
+		 * If UCSI V1, use UCSI_BUF_V1_SIZE buffer size and
+		 * update ret_code offset accordingly
+		 */
+		ret_code = ((struct ucsi_read_buf_resp_msg *)data)->ret_code;
+		buffer_len = UCSI_BUF_V1_SIZE;
+	}
 
-	if (resp->ret_code)
+	if (ret_code)
 		return;
 
-	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
+	memcpy(ucsi->read_buf, resp->buf, buffer_len);
 	complete(&ucsi->read_ack);
 }
 
-- 
2.34.1


