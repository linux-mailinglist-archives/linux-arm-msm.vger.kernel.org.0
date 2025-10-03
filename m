Return-Path: <linux-arm-msm+bounces-75860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45525BB5AB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 02:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A7A44E24E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 00:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172C8143C69;
	Fri,  3 Oct 2025 00:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmGW/2GY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845F3B1BF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759450856; cv=none; b=u65DpwX6oTnisEsxQ6CaY89+xXQZPFuWV/9UO41ZE1tx46Td7Y7unz/ERcG6uJtnzGkogITY0TASUSBrMkCu7d/gRramhtuPI9fn4av88oTKY5Z2ClBFwhb5McEJEwNFJHKQulLeYMhQULTMnETTiKCglKpxGFKLaBSHZAC4sbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759450856; c=relaxed/simple;
	bh=3cyjRiL4lcUmndU7o/wfFQ0HYsbwM9Aydw3J2N8yu/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AGb6S/crCiA015MvfacNZLrNdOJMXrK9GsvbdSVV0kyYwvXUNRHeJNSHI0aac4EiKSD/Web1AOTGgTVjlrjmdhG2j2+R5kAeXmMpc0pHQlgybC4lxPFhOXIZ2PlWDj8c8C/LbCoZxAReMd7jLLKajFIhyodc1alu6GsqixX3VUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmGW/2GY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592LYFOK006173
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 00:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QoLaMgeORBf
	SIAcGQOIMWfUaR1zLHwTW+Dns9so/XPY=; b=MmGW/2GYt1ar2ymIaZ88SxhBtKj
	t+TdL5Pi3Z/GbZ6ddoObgL0PS8XbaiFtKUhh/NhZLv/PTPzhESJOvPQgzdKtziqK
	oAwhPxBVPBbYYXdv2j/rM2KRHycLSFwrp9qhWQispPqggImVg7w4yIN3yP8OhePT
	mwWED7WKUulLnnUE4oCvBQLbX0PPXfmc2qdICVq+E78PpnbewaTwPwbDU5ik4cdb
	jhAskZavb6Eup1OGUXRhdlzGtMS4keTFN6SZlW4gbLsZpKORB1AcUEeZ1EETaSI8
	7o/W3ZM9VWS2KJNWihGBKv/bBDFpO8+qByfXGXkxN3CsXDu0JMTE8acuIng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851sc2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 00:20:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5509ed1854so1050363a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 17:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759450849; x=1760055649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoLaMgeORBfSIAcGQOIMWfUaR1zLHwTW+Dns9so/XPY=;
        b=WFhY4T3cF88Pp8g2MQnrTlr7FfHhDL6AmdIksXNqgqM/HmJYQtX7boxDerjRZrE860
         ic/6DJO2i+RfoHGRc9bhibnjMqjEy7Jmpc5KOV3zlIJ1rAOG/F0ITvjVK+nzlIipR/TW
         lqr/LW1WcdVre1pdC+j7O1GsJLbLWNLEExfobVUV4EId513ysyTGU4u9NxeE8aP5XUpj
         Xjq2LXa8WF+A+A74Q0swqDeLe1u8LDOqYesirX2DW+r/fNuvTGQB4dTDSnIvhxH310Mk
         dvg2NPdWtq6c0iWsEU4cEF3VsRPvjaM1WcJzrnDQKxMGjbSz8JGN1Ky1CSNy8Qm3x6HC
         zQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCXX/8L79anWUxGreEzYa/g7jQAt9HUi7YMxcYHolR5wdWMgN/uw9FCDvVeqCA5fgQHsIpge1egsAP/xq2ga@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqQ1fv1GUvdUJMNEn1geNhgIZcwbqIBvdprrpudvmehsvAXsZ
	lpB+BvTRR1F9o/NKkNKY7tjAByiPaHuyFnZ3FuUu8BcnBywSr9B2XeeOC1mUu0vZmSVPn+csLPn
	0r0FVql3dKkTB1jOprxHaO45xxpI81eTTR7ywkZdLh080E3i5a0mOE9L2ZYlSC+40+ijG2JDkay
	eu
X-Gm-Gg: ASbGnctgQdgaZIvKeBcyv1QjEQOU/xGifpekgFR84WITvlPwVWN/+Nbyk1IYLCgbShU
	jxyjtpAH0FMtC8ku6N1BFanYgBoUOUXpv0a0C7Y3+fcvU5wPNEQGh4jdK2C5F5dR5pQCZGID4BA
	DacOSSo0lT25/mS6SZHp26xglNjUBdgRf+tcta1BV/XvveJH/tE0zXzlTFkIWImgJPUVMIlh1xB
	6GfE2GDMHXaVUg0W5pC09Ao/UzbF3kwloY8zqNB1zCf0WE8YoEVM/fsBb9Ty+60Db8udhpZi3gb
	FO/1HGDoD4tBmV8KdDbfghhQBU5r48UYYQ/PB6h4yHIFfi/Lbt0x2bty1Ge0LVfuP06bqKOoKdU
	+52Jbkg+UPD+3weRzOyr30OKAZPww+7HP
X-Received: by 2002:a05:6a20:7d9c:b0:2c5:f4a:8839 with SMTP id adf61e73a8af0-32b6213ef51mr1369042637.60.1759450848681;
        Thu, 02 Oct 2025 17:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhVZuqJXzaWO1w4N5q8KAOpGa6PrhujnxtMK9xFie0UJw2QokcxvzbXUoAjFLCXAyjh9SGVA==
X-Received: by 2002:a05:6a20:7d9c:b0:2c5:f4a:8839 with SMTP id adf61e73a8af0-32b6213ef51mr1369025637.60.1759450848202;
        Thu, 02 Oct 2025 17:20:48 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9a3f1sm3128632b3a.12.2025.10.02.17.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 17:20:47 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 2/2] usb: typec: ucsi_glink: Increase buffer size to support UCSI v2
Date: Thu,  2 Oct 2025 17:20:44 -0700
Message-Id: <20251003002044.2944497-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com>
References: <20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68df16e1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=bL7WY3GH-9A0ZCLeatoA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX6EzgFjzfSB24
 /oxe0v8j2YOFyJZpHYRTbjw/Qx7REQjrHvO/kV6O5osuSJ+dedKAUddQwR0TvRHV5dXDcMs+mAY
 K5anoUZ7HY+dWnaxFe+r5XjvAnp+HN8owTltxrZEDs7Hwl72vanwRivl4C47J6czLn6/1r+w1ee
 VVDh3ssgnazHuapWQCQSudB6AL6gZcpJDxR44TC1Hg3NBTbnnVIQ2Cvb9xDqkwBIntg3p3ep3DS
 wnvxhB+uyZRusg/ULsRv0xQyzKJTJ4lXdln2m/UmGpXXLheNE6/bmxvQoYP63/jEhHTYY9aI+BF
 LqTQNIzvY+LJkWrQXzI0qkmlhM9GLPaXgzBBrTSM8R6x0MsmQ3SUyQvxJ0frZzYOtUOiJjdxOso
 YOHnGXH87hpyh1rCn1RGx8g8a3Bvnw==
X-Proofpoint-ORIG-GUID: NoCOC7t35RPbLvAYKhcAohj0WL2ZuoB_
X-Proofpoint-GUID: NoCOC7t35RPbLvAYKhcAohj0WL2ZuoB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 76 +++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1f9f0d942c1a..a324fadb4e11 100644
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
@@ -32,13 +32,19 @@ struct ucsi_read_buf_req_msg {
 
 struct __packed ucsi_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	union {
+		u8 v2_buf[UCSI_BUF_V2_SIZE];
+		u8 v1_buf[UCSI_BUF_V1_SIZE];
+	} buf;
 	u32                     ret_code;
 };
 
 struct __packed ucsi_write_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	union {
+		u8 v2_buf[UCSI_BUF_V2_SIZE];
+		u8 v1_buf[UCSI_BUF_V1_SIZE];
+	} buf;
 	u32                     reserved;
 };
 
@@ -72,7 +78,7 @@ struct pmic_glink_ucsi {
 	bool ucsi_registered;
 	bool pd_running;
 
-	u8 read_buf[UCSI_BUF_SIZE];
+	u8 read_buf[UCSI_BUF_V2_SIZE];
 };
 
 static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
@@ -132,17 +138,35 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 					const void *val, size_t val_len)
 {
 	struct ucsi_write_buf_req_msg req = {};
+	size_t req_len, buf_len;
 	unsigned long left;
 	int ret;
+	u8 *buf;
 
 	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
 	req.hdr.type = MSG_TYPE_REQ_RESP;
 	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
-	memcpy(&req.buf[offset], val, val_len);
+
+	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
+		buf_len = UCSI_BUF_V2_SIZE;
+		buf = req.buf.v2_buf;
+	} else if (ucsi->ucsi->version) {
+		buf_len = UCSI_BUF_V1_SIZE;
+		buf = req.buf.v1_buf;
+	} else {
+		dev_err(ucsi->dev, "UCSI version unknown\n");
+		return -EINVAL;
+	}
+	req_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
+
+	if (offset + val_len > buf_len)
+		return -EINVAL;
+
+	memcpy(&buf[offset], val, val_len);
 
 	reinit_completion(&ucsi->write_ack);
 
-	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
+	ret = pmic_glink_send(ucsi->client, &req, req_len);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
 		return ret;
@@ -216,12 +240,44 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
 {
-	const struct ucsi_read_buf_resp_msg *resp = data;
+	u32 ret_code, resp_len, buf_len = 0;
+	u8 *buf;
+
+	if (ucsi->ucsi->version) {
+		if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
+			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v2_buf;
+			buf_len = UCSI_BUF_V2_SIZE;
+		} else {
+			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v1_buf;
+			buf_len = UCSI_BUF_V1_SIZE;
+		}
+	} else if (!ucsi->ucsi_registered) {
+		/*
+		 * If UCSI version is not known yet because device is not registered, choose buffer
+		 * size which best fits incoming data
+		 */
+		if (len > sizeof(struct pmic_glink_hdr) + UCSI_BUF_V2_SIZE) {
+			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v2_buf;
+			buf_len = UCSI_BUF_V2_SIZE;
+		} else {
+			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v1_buf;
+			buf_len = UCSI_BUF_V1_SIZE;
+		}
+	}
+	resp_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
 
-	if (resp->ret_code)
+	if (len > resp_len)
+		return;
+
+	/* Ensure that buffer_len leaves space for ret_code to be read back from memory */
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


