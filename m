Return-Path: <linux-arm-msm+bounces-78241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67978BF9826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 02:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11FD51888941
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 00:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A36D1E9B0D;
	Wed, 22 Oct 2025 00:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaCWdTIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB91A2C0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093963; cv=none; b=EcJdqw4qANK8ootwigD5ee8AGglsRiClQ5BgBp0btcmpz30pdq+F5kVmqYihgNLqvoWN/w0mzyIrAq+D0V8XdHxSmKo3yUAA9NatkZb02rCw2PossXQiwfVTNpcjab0HRjKgtIrUTaa65LKE/dWKGn0cDEZW8igN85La+xEhcYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093963; c=relaxed/simple;
	bh=pWxHW44EZoYVSkOewAQZ0Iz+uCPAjge1yg8BskkCR7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tKu8M6d4UJlm8xPs574SPR65BgVjuXkdM0vMlX9RS9r4ux8xbwsI5YpCcpHtOzprrjN+bUCM2auYVs+NuJgNR+rYpJT8XkWkGZG/3/FAOORMwMIdqvP1shoUaa3VdxLsTslEipPnhCEySvNea69Y0nKzb1keTQL837rNE9p1RT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VaCWdTIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEitn7031255
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ofz4SPaaGCE
	jihV6QVq9ZPH2b088K+t4UidQCmtgRC4=; b=VaCWdTIkFArEhHkxLlC9B88rryZ
	h9tRtVeoxL5XUDfBk1uvVtYyssCYKpk5CzmsXYEqvuuFPblWvceOPavXzG82Qx45
	HcwjSBBBrdSh287cfV9Ovd6iWiOxfZ5+fBs2Re06LsP0SVa6je+OXDMyOYf91pIY
	jOstS5lw2wAECHFuWRXaZMgEPTjV8SCAbqPcUU3S6Tj/ffsI/t9RKr50ZAGRYuG0
	h3ZXr7FWQQXi+UdLnX8AjIO9epEmeHJYBiQUjlQd9Z5Khba7/kwT0uNp/QAkMNrW
	hHki3TeCljKWxiIeUR/AnSjJjdq4FkNe0IH3Vwpa6I4UFmR+lpxiFjyFZEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kagrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:46:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28eb14e3cafso123184025ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 17:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761093960; x=1761698760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ofz4SPaaGCEjihV6QVq9ZPH2b088K+t4UidQCmtgRC4=;
        b=MC1xV1dbFxGqWHjJCdJQa1XSeM5zzchC8wzXgXcTNpe8oFe0dmrRUOjamnRAsWtw7T
         gyyXMVvs1dsNWdPbXPe4FTF9uQht0Cyr1AywGXS1UNdQo07yNHrYvBLyDPgutymXBZnC
         x78LPsPHMpjSg75fU7Qae+7lSw5g8CLH/SAJmwBrlQHwNckZ8SbFFFi+1u7gjU/Q5YvP
         zfG7FgoKyH5kibkNC65lyNoh/wUNhQ0ku8Exjs5VODj6Y8mXkdVEyuBlW/4kUHZ1kEnv
         0OIg5MHKJOGj4YOoSiltda4giioYfMx+cYIZJ9DUAlozKXJA4tA0+1jcksiMtNYFX2yo
         kH7A==
X-Forwarded-Encrypted: i=1; AJvYcCUD6AdmC6hVL5FUWqRn3OELVLuRFclnItX7YepxZT+iVDE2IOB7zPE1xinJRZ/jJQuQkN8e0ykE/9OjxnBf@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCgvDO7gu8nNtei/pPdz60G3AjIsb4WN5wzJ1uetfVdx9HrcT
	64atDGeRLeCE+h5AuT8KRa7un31FKYSZAnwg85B1Xw7MxSPQWyMULRiMnGmGecQE90G//MZRP2a
	T04hVTXyjRzF/oUKDDqRV9ivD7y9w+EoNpBOEzvKau+g2TcWPfhkLbI7MylqYGH4t6op/
X-Gm-Gg: ASbGncuepbGbp4JMXUuJNZwzDQH1ypodXHF0dhnazBbQYRKN1acK8kV2YFduvgw0WIg
	JNtYTs9XI2mhK6K+5rmQZ5nssIlR3eDAT+iRo5BkjNP6k8TCM/PrXKKh/z+ggmMgwedcW2e3h+T
	LPGXjFrzAvstkKLgJH3ITz1ruDFWEhU+FqhPYPnFz66aQTiut9DwiuUKVZpcvR2d00n+KpZBolF
	Olwg0a5zigmI2xbO0APC3ZzQ8vaBVMu1qVPIDopI8rfAYCk/gB9nWJgpkD5S5R1VeUYeEb6bx+Y
	pk1Sk4K2FT2JnysGAUc+eWvcskTrLgkI14bur23EXTMk3YFNEmSunQEPX1h0YL+YnPtjh96U29/
	ye6c9lMAiDzbkv9BXcsQGXjYn6823kjdCWJJoLc/PoYO1Yghz9gXcTPaDIZbv3A==
X-Received: by 2002:a17:903:1250:b0:290:dfab:ca91 with SMTP id d9443c01a7336-290dfabccd9mr198000195ad.54.1761093959885;
        Tue, 21 Oct 2025 17:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP2bGgL//K1+9S3/naE7QJvU094EI8LGpgUEBEN4PEQmvyRXKJYh7a9Zju5xNxs8aORy14XQ==
X-Received: by 2002:a17:903:1250:b0:290:dfab:ca91 with SMTP id d9443c01a7336-290dfabccd9mr197999975ad.54.1761093959412;
        Tue, 21 Oct 2025 17:45:59 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcf67sm121913045ad.15.2025.10.21.17.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 17:45:58 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 2/2] usb: typec: ucsi_glink: Increase buffer size to support UCSI v2
Date: Tue, 21 Oct 2025 17:45:54 -0700
Message-Id: <20251022004554.1956729-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
References: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J7nsVpcPKnnEVNXiyrEkWqgeG8ytz9gl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXzsszLyeyN/jM
 0+N8LavaZ0+JDbp7KXq3cLPJCOuqX+Pe1Q1JVcil16aUBL+jsbPJGSYu+NGQLdKSFh2CPJrJQ8Q
 UPhRP17EaO9vDPGhZsWDIpb25cwTL78tAB8b5R1cbn9zrWij801NBhu0LjUK4FeCYRFyZCf77nn
 eD55XjH6Gl0a+TaPrfJpxOXcmc98UpJmkRgUHdZZ1k+X1YD2znzeXNubEYjSVfRDxHzAxFWDyJO
 RsEuhKjXsM9CLDxFbNWc/FkFQj3fHZ64tKRzUfcQ8Ctqo37B4U4Ndf9vRo1ajgQ5GCC6kSGkPGC
 FGLvfnCNfQkdhe1myELOohMwXpHUcgeLqaglw5p/CZ7yCRyYNroIESItdwss59tPUh6NKoGVCmz
 YPNFHDAz04ow9N+JX/eb8S+zPvTt3A==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f82948 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=bL7WY3GH-9A0ZCLeatoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: J7nsVpcPKnnEVNXiyrEkWqgeG8ytz9gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 80 +++++++++++++++++++++++++----
 1 file changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1f9f0d942c1a..11b3e24e34e2 100644
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
@@ -216,12 +240,48 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 
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
+	} else {
+		dev_err(ucsi->dev, "Device has been registered but UCSI version is still unknown\n");
+		return;
+	}
 
-	if (resp->ret_code)
+	resp_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
+
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


