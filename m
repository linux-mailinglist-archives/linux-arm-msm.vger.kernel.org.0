Return-Path: <linux-arm-msm+bounces-62241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE30DAE7248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FD235A2601
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C992571A5;
	Tue, 24 Jun 2025 22:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVDZfTJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98E3074AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750804168; cv=none; b=kpL/HWKOpdC68Efy0I5zmQt8iVMsqhBaKpahmRrIEo2xHsppnAw9uM7enDZjtAkqUtwNy57F5u9JLOPH/XKKNQ360APn8RntDrVvFhTp8TbFdzGalA/5j7LiyfiYHf22SB7oGL/o6mGllMNI11dVa4hHZcqt/QkHHa5UHe1CyhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750804168; c=relaxed/simple;
	bh=9ojkd/dBItAGXhFPy+iRT5H7yKncISWurAFa2VKyRMM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=l+cWQ+kWEyGLczSmMmxbel8Bz2AqGO8U4nxtPJaM5THTjN9j1NRT+ZaXJ3163Ahm2MLKfslPwvWubfAXQm7i/KdJ/HiycvpQ1X5QCAczzaJXLnABIQY+4MR48cx+gCoeBEaPQlH0qpNDN2yrtEYHLb7wYJYm7KcDl+NqrXCpxYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVDZfTJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ODvAvw000866
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=afm3laDmhWveEChc7j13Jv
	LNji/3QQI3RCZRRCMeHns=; b=YVDZfTJ9YBeriiegGOP1YswkwVVfG1nCXKUGby
	DilLozi8CJBG6kIgX0GH6bKYws2tZaiOpItmjOOHq5xAUZj4tNBmcrmXfjTr1ELj
	0+A/vKA23siHZv+lTuj6WxR8OBZd/MIBEUTK+xu1xd/i5Bh4hefw+Ue9nD7IGe/M
	2EsMxIM4Z+QjacBpwJWPjnm9t4Ckojv1jMokDLbFjFkkWcyxQucUtP1InCS6SESd
	T5Wip8O0dALGPnsSxOu0Itcs0OI8hBAD+dniZKIaiMB0eUwcv1MlipBwMy1FJ44X
	u05kO5uAvtb6d0pgS2GcMX3xbNQd4IBkNuQct1B9flZ10cbw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmqe30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:29:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235c897d378so8291685ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 15:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750804165; x=1751408965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afm3laDmhWveEChc7j13JvLNji/3QQI3RCZRRCMeHns=;
        b=jw2Qav0eIFrUNlIfdKboVIIqMh0B3ke2WN5xTPpmjxDAJmjWG2Te92Lx4nr1H3QtQ/
         rVWgKHYn2XNxDDrJ6sIfKKNAO3KRj5+zMsMmVTw/D7opFtwCxd+Pbk/q1EH7BRdlehbd
         glljvDQlnhNsV3id8NAZSIRQaiIcv3P3gsBT8BRcKDTs8+Igp4OufHPyku1OV/3V/Izj
         S8huktCL+sZCkOETdu+GseX1+n4IvQ2O+hSk/jMg3ajpBI1ams7ynHJIgEO+BxHaqbIf
         3YcgLVnGxVIfU2OOna9OmC9b4jc4/dWxtC6drUbsfG55VoEy9C+rQMLekgVMRVyrpF9z
         ZiOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyZhftao21ZOr5olypKll+3FdHW2uyEojFs3AKyEz+8v4EbdIg+px2qvKrph7o7gwGDBjYgwWEDJmvw/F3@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuP3OCgFYkiinjX+h3vdgVsYudpw+YA8DycTuvqf4q4JzFuL4
	b2BHUFgo3gLLAb2JMCRV/FWiA+tfCyeNHjZt5EWwKoiZ4Z7lLHCJWKgD5BinJvQlevLba5PNQtA
	u4n9P3pbny773LeHNppIhHzOOWubjDONs5mIIYRsCbOlZJXPq4WwT3DzmLxOuqsGv/m55
X-Gm-Gg: ASbGncvfe8xIIkm6oZphBYAy533jop9nA3A6zJ7fbneByYUsax39vUCIeE1cH9Ym3K+
	n1gcJqu51wGKqwixtEZr/5epBttm+MqQF/Q46Lmzvfq5l4RQmdoVCwSfoOybnq8vMmzCF7uqNNa
	LyS5VwJYJwwHFxeB18wYrRT8DqPA9SEt9jquVcz2XvYyoUDN/aUk/0qSTk1VkOrA1b6QU02n0SJ
	dpLIoZVQ5oHMZYutThzuQcMNiOazt0uuSYnArSOnyOvrlo1LfNOEglxxIb0KnxsEX195tZTp2Xv
	fdj3th5ylOPYNly5WSmQ00zoZN5YSgFFnq6+paAM09TpLEwubjDsFfVgO+nXfwQUGb5ZldGvAlF
	U084BDpTDfg==
X-Received: by 2002:a17:903:1ce:b0:235:f4f7:a62b with SMTP id d9443c01a7336-2382405d084mr16964205ad.41.1750804164607;
        Tue, 24 Jun 2025 15:29:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgYE/Tz06+OWi+qimpl8jaktLopABBmdH1yZyMrkFkP0S82AicFJFiqgLVUNEgFpkkIyJ7+A==
X-Received: by 2002:a17:903:1ce:b0:235:f4f7:a62b with SMTP id d9443c01a7336-2382405d084mr16963765ad.41.1750804164199;
        Tue, 24 Jun 2025 15:29:24 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237f7f87676sm57867405ad.122.2025.06.24.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:29:23 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: ucsi_glink: Increase buffer size to support UCSI v2
Date: Tue, 24 Jun 2025 15:29:22 -0700
Message-Id: <20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7_RdpoRZp70pXVXB9N0vKU9Hsfd-oWGY
X-Proofpoint-ORIG-GUID: 7_RdpoRZp70pXVXB9N0vKU9Hsfd-oWGY
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685b26c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=nNVKvzsFg4rUH3MCaoEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3OSBTYWx0ZWRfX4Dr9P/QaSsLu
 5D2u3wyuJ8SKkqAjSNeAl3j5Ysi6QGzGn7+INTJV0/QKAlRAWuopTwcq4yQMUzoBa1q9VD1blZe
 fRTSEtWcBtLwkWaEjT4DFKqJnPPTUiNCQ6n4V7C+a7asIibbT9/G4oVeMjYx2KB303pbA/uYH6k
 4rpTX6LlsBsBSfzQ3rW3KH/dgsOTgk31QJq5vUNELVVkVyw/PInQ1yIwesZD7RxE+WKLc769+M1
 hzBgGuIDMunXyv6RmQRgK8zuX8R2o50lz2PounLwjBu0rMU00fK7+n8hmPjjz+LhPWpr0FKFbaP
 j1rPEdXeEWftOCghl7lJiIA3yqx6m8BYfxvRDkzq/Ow2fNuxwp9NKrIEYX5ZabAU12vNgtq8w2q
 s5fKlQ87vc5N3pRdDcL+EkcxAXcKAb1hx4fH03jib4/JSFY1RM6lnxv442++P8CGt2zEQdxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240179

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 50 ++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 8af79101a2fc..d20f01a0cd5c 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2023, Linaro Ltd
+ * ​Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
@@ -16,10 +17,11 @@
 
 #define PMIC_GLINK_MAX_PORTS		3
 
-#define UCSI_BUF_SIZE                   48
+#define UCSI_BUF_V1_SIZE                48
+#define UCSI_BUF_V2_SIZE                528
 
 #define MSG_TYPE_REQ_RESP               1
-#define UCSI_BUF_SIZE                   48
+#define UCSI_BUF_SIZE                   UCSI_BUF_V2_SIZE
 
 #define UC_NOTIFY_RECEIVER_UCSI         0x0
 #define UC_UCSI_READ_BUF_REQ            0x11
@@ -36,12 +38,24 @@ struct ucsi_read_buf_resp_msg {
 	u32                     ret_code;
 };
 
+struct ucsi_v1_read_buf_resp_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     ret_code;
+};
+
 struct ucsi_write_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
 	u32                     reserved;
 };
 
+struct ucsi_v1_write_buf_req_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     reserved;
+};
+
 struct ucsi_write_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u32                     ret_code;
@@ -133,6 +147,7 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 {
 	struct ucsi_write_buf_req_msg req = {};
 	unsigned long left;
+	size_t len;
 	int ret;
 
 	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
@@ -142,7 +157,18 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 
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
+		len = sizeof(struct ucsi_v1_write_buf_req_msg);
+	}
+
+	ret = pmic_glink_send(ucsi->client, &req, len);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
 		return ret;
@@ -217,11 +243,25 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
 {
 	const struct ucsi_read_buf_resp_msg *resp = data;
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
+		ret_code = ((struct ucsi_v1_read_buf_resp_msg *)data)->ret_code;
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


