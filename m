Return-Path: <linux-arm-msm+bounces-74735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147EB9C8CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31170179525
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F61F2BE7D1;
	Wed, 24 Sep 2025 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvBPHbpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F9329CB48
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756399; cv=none; b=TYX0AvZsgur/6yKKL4uDHaXFXCmu652YR3g42DamVWu13m4yoPJYnVAJah7wH/ylTku0uuPJArRJ+vLbVEE4N/p5v2sF5XDMUQlTorNBE2LvZ3CtS88qJzMpX6Ax1GBkYRiCO18Tqte8LV7zHgyIVs5W9hVUFkFrx8Ee6mivC00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756399; c=relaxed/simple;
	bh=KK69pnbAoNl5x144Z6VFHt42qN29ZBsdut7CQJHZRrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=otaWOcUgBjg5+bfuWfPlpX/yxDncIYRlLUS1adQbewdP+tbM73MIu9pd376bhXO3TxWUxKHvBhi6AozWchuWajv+hLEk/ZYcIqRCsg28KDjSYjjcbdImVrASuB+SzaZDZJ+dOIhe0T2JpgExMskRsKdqjWDK5GABG5SavX1dkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvBPHbpg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCfvb5016528
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GYGy+4NKYRu
	cBFROr7rYVhlIyW1M+CzZsu0iJLkrIuE=; b=AvBPHbpgGphAVrGGZUK/MJP9vqS
	SrZSJcrmTVfWtBT98muad+oIgnxKNSjWd9XVms5paPJOdPWitc+93RdizMGyViFl
	enJ1vfR5tbB9W+oV3zbB1vKXM5MB4lmVcwHuAiXgwobgryiaUp4TKz7YJCo4/rbJ
	EdywNnQADtT9DId+fihOlj0t8/4uW9AywtrxknT/vsth588nKPzt0L/tpOqOMQzc
	zvh853nSLVORqhJgvCgzzN2AJoPW5TAKQbDr9/9gZAOw3YH+406rrxqFAaLPyIm0
	cb130naS/dJCafewk3tc6cIC2Pl8q4COQD0NhfkJHmKQ2M9QvgsSUJNsSiA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhugh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27c62320f16so3653675ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756396; x=1759361196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYGy+4NKYRucBFROr7rYVhlIyW1M+CzZsu0iJLkrIuE=;
        b=qWdwUIn2CJ7wXTkEjJGyl5oTYi6eEhPR4j0TNbkyPBtY/bypIX10I0rXXcQspavMk7
         kHx7jA0MO9E6pPsWg1a50GKmj775/HeOaEuHPHQ0SrqOKUL2IQsSwN6JIldJPBRzGVvt
         UXAQWV1lgJ4w2KJt0WYZOX01BlonBZP97bhcdusk2yjhMNx4JWGXCSm+3paGgHmFDU5A
         mN0zQgXEn8L3ysCIoo94Pg461iTQcPVRZoV/q9T88CHyTY+fm9EySSIzBsulYrLsghev
         /27rYtBIQLVJGdvd5hbt5iy4phrHl/hkwtkmYD8CGoX4P5+TJK/r+F6ds9HcJTshKTgj
         OxVw==
X-Forwarded-Encrypted: i=1; AJvYcCWYRfMCVOJJPiSFJ0m6wYzdKCfN5G0+EVRer7TvBHH7LN7cvjRxOwZdsqfmmmantkaId52f2gYd+6BflzsY@vger.kernel.org
X-Gm-Message-State: AOJu0YytqZJysXemwiVlIlwli6Gm2vNvOU+U+gBXQvf9/FkntZ/oKjbh
	/8Uy5eo15EtPQu5ibnTyWs7mI+WTaeJ27i8eC3Jn7f/E/mDzO752zL+AJev2wdBKvjRsu3CWIv4
	JaXT4pjgii+BexKCgISDtbTPCoDqvmY4g4oFj2yO15s5TEdsTlfE5YyO4NFxZOg9JPiBU
X-Gm-Gg: ASbGncshpZUBSmqxiqGDF0agqquPK+TVuI7MIZy1c33X6cZPGbsOgmPMIrTCYYzsHGn
	PyVeGapxbSqXRKxPopKlhnqi1woocYBhuswMxMfN3cZ2xpCBzUqP45J/jk+CemxX0r3hM7uQ59d
	6zz3Gg0EVsPBPyK+aRH9TdnG+LhF7mwtWAPO/iHmGuCdttTwGWQRUktqnbKrSWqeuR2zRdymq7j
	XaLsKF5lyVQ7wGo3enNwW+focVyaQi4FrNqXAWYI/DqyguwGAFDwbH1whhA4ZHPyqrFslns6NaB
	ETnfIs/7V4nan45z8MbIF9MiR9Bemld1jFt9eQ3oGpKAPXb+xQHPEJWk1HrCkV4+KE+je/NTKYo
	qsP2Kr8WZXIq2qMRvRz9y22ZJDRk=
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr15578865ad.28.1758756396280;
        Wed, 24 Sep 2025 16:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKn09t+UKPyA6h0HbQGalUfPWYpaUodXo/WnK1LPlyaXBPEVy2q7a1JeG82EUURTm4VlE8bQ==
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr15578685ad.28.1758756395854;
        Wed, 24 Sep 2025 16:26:35 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821ebsm4005735ad.84.2025.09.24.16.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:26:35 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to support UCSI v2
Date: Wed, 24 Sep 2025 16:26:31 -0700
Message-Id: <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d47e2d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pUSBQGTQOVeKylh7KsIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: X2Pi4RzYpcwNOJ2HdKp7htJWMP3O0Db2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfXwFvdwqDoxTxl
 XMN8zYg9ziY7DYQ4wlcgLDY4Xeq9+rn5NZZbiMfGw6ck8nGTWQtD7S7/5D3GzZ/4w9DLyZFW9mK
 6y/MXWXT9WTLz9uFKbJOhbZ0RYKsM3SZ2KWQ+5wKYc2+lCj7+5iTe/HjrYSnaZZNkpyfFJON+8r
 dyMwv/NhGhzJs+HVWVuzjnPNKfzEKUZ7TQqQ7dEgt4HBFZc+PfyatJibP32m70iNLhOnI/YtX95
 FS6y+mgvBz2a5Kn4gtIfKU4ryG8576kJV5ALbPzOMScHYgFYfM0VuvxsT7u7/9XBI+RW75DJ7Rd
 Sdiw9snI4TOta5mtPesIYaD3UF7+mCAS+t9TmjQKxtKp0icRvakHP/VLOdI6jR1rB1T1Cfb7mEF
 ZU49eie6
X-Proofpoint-ORIG-GUID: X2Pi4RzYpcwNOJ2HdKp7htJWMP3O0Db2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 81 ++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1f9f0d942c1a..7f19b4d23fed 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -16,10 +16,10 @@
 
 #define PMIC_GLINK_MAX_PORTS		3
 
-#define UCSI_BUF_SIZE                   48
+#define UCSI_BUF_V1_SIZE		(UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
+#define UCSI_BUF_V2_SIZE		(UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
 
 #define MSG_TYPE_REQ_RESP               1
-#define UCSI_BUF_SIZE                   48
 
 #define UC_NOTIFY_RECEIVER_UCSI         0x0
 #define UC_UCSI_READ_BUF_REQ            0x11
@@ -30,15 +30,27 @@ struct ucsi_read_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 };
 
-struct __packed ucsi_read_buf_resp_msg {
+struct __packed ucsi_v1_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	u8                      buf[UCSI_BUF_V1_SIZE];
 	u32                     ret_code;
 };
 
-struct __packed ucsi_write_buf_req_msg {
+struct __packed ucsi_v2_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	u8                      buf[UCSI_BUF_V2_SIZE];
+	u32                     ret_code;
+};
+
+struct __packed ucsi_v1_write_buf_req_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     reserved;
+};
+
+struct __packed ucsi_v2_write_buf_req_msg {
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
@@ -131,18 +143,34 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
 static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
 					const void *val, size_t val_len)
 {
-	struct ucsi_write_buf_req_msg req = {};
-	unsigned long left;
+	struct ucsi_v2_write_buf_req_msg req = {};
+	unsigned long left, max_buf_len;
+	size_t req_len;
 	int ret;
 
+	memset(&req, 0, sizeof(req));
 	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
 	req.hdr.type = MSG_TYPE_REQ_RESP;
 	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
+
+	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
+		req_len = sizeof(struct ucsi_v2_write_buf_req_msg);
+		max_buf_len = UCSI_BUF_V2_SIZE;
+	} else if (ucsi->ucsi->version) {
+		req_len = sizeof(struct ucsi_v1_write_buf_req_msg);
+		max_buf_len = UCSI_BUF_V1_SIZE;
+	} else {
+		return -EINVAL;
+	}
+
+	if (offset + val_len > max_buf_len)
+		return -EINVAL;
+
 	memcpy(&req.buf[offset], val, val_len);
 
 	reinit_completion(&ucsi->write_ack);
 
-	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
+	ret = pmic_glink_send(ucsi->client, &req, req_len);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
 		return ret;
@@ -216,12 +244,39 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
 {
-	const struct ucsi_read_buf_resp_msg *resp = data;
+	u8 *buf = ((struct ucsi_v2_read_buf_resp_msg *)data)->buf;
+	u32 ret_code, max_len;
+	u32 buf_len = 0;
+
+	if (ucsi->ucsi->version) {
+		if (ucsi->ucsi->version >= UCSI_VERSION_2_0)
+			buf_len = UCSI_BUF_V2_SIZE;
+		else
+			buf_len = UCSI_BUF_V1_SIZE;
+	} else if (!ucsi->ucsi_registered) {
+		/*
+		 * If UCSI version is not known yet because device is not registered,
+		 * choose buffer size which best fits incoming data
+		 */
+		if (len > sizeof(struct pmic_glink_hdr) + UCSI_BUF_V2_SIZE)
+			buf_len = UCSI_BUF_V2_SIZE;
+		else
+			buf_len = UCSI_BUF_V1_SIZE;
+	}
 
-	if (resp->ret_code)
+	max_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
+
+	if (len > max_len)
+		return;
+
+	if (buf_len > len - sizeof(struct pmic_glink_hdr) - sizeof(u32))
+		buf_len = len - sizeof(struct pmic_glink_hdr) - sizeof(u32);
+
+	memcpy(&ret_code, buf + buf_len, sizeof(u32));
+	if (ret_code)
 		return;
 
-	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
+	memcpy(ucsi->read_buf, buf, buf_len);
 	complete(&ucsi->read_ack);
 }
 
-- 
2.34.1


