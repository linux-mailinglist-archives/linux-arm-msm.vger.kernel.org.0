Return-Path: <linux-arm-msm+bounces-95970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GTdLdcPrGlIjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:45:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C2122B8CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB1B0307B651
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5710635836A;
	Sat,  7 Mar 2026 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5xH9dh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFars3X6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF973563E9
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883747; cv=none; b=sCkkOcTD87LniQbZCmTm9UV0p8qASdGHTocKJv5ygzzrKqPNWCkx0n3S4W8JJWEb8Lf0juNp4ctZvhHqJuKedPm52Tf8v4OUfBF7GlSFnILp+kkyzCZPZnxC2yhEwd1UjvSM8V0g00JPCFcCF6M8IoFHOZXtSKfHHKLAhJEv4RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883747; c=relaxed/simple;
	bh=McPnRZC5WUBs06Eu6S+05ajVf/2AASOXcpXG+shgcL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fs6GMAuY9UftY5dcHJ5AcOVLBfwTLIclP0dA6IUjdKqIpxWancVaayhTbAQX4d1mm3ubBNxeL1O/hqFpblYSx8OAqcbkqgaNFUEeW8JtA3nilO2j2K4AzZL1cyzWUeow9bDzqjT1CKuAINJC9ssxjil0qfzp+DWfqNjrr59hwqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5xH9dh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFars3X6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qqhH3098381
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=; b=D5xH9dh762LhVitI
	i83guZKqD15/hYO5iRREcmno9jDXEswiErwKSxmn+Ozzp9tu0YGwNhMwN/HgNS+R
	cNHsenMNULEOgzUurieZ1+EDPTLs1pvTTHwKV4i/diV3sdQ3H8qjyTEorsf+Cul9
	cYydzxd1Bkzz8KNd1htSVEpBTp3y8xArLNTTRaDHSk8ybNHLjL0eu7UrajEFIi8v
	0VPTZ8g5kTEtbXPU1T4HvDfihDLUtzkjJaHVguwAOQOI9ATEgLx/p4BAH2Yyc0cv
	PzPmlm+oYXFABJuPyWs6Ebh6gkd6XttAItuPkowZNstWTzXJo1wrdJHu4NcMZ/+X
	t0gaHA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrguh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:42:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae669a8ff1so214389175ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883744; x=1773488544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=;
        b=ZFars3X6Xbc6EOJ4ABFTbmsYV4aCjltaJwTtW/MG9LIpvLysLjCV/TLRTTs/wXW2wa
         FbMtthgBaKZtcztp9/vXdIfZpw/F54fG6jlGxvNGJ6Gu5eXHFNaq5xenhDFnilkvXGQD
         t7F99dYcb20OYUXM2jckf3qxh1jyIDG1u1nX5KwvdTn3D6SQ6wuOFDby0F+MgLig/rCZ
         VdMO4CopyUVJAWp5xZNE/MGykWPbJdeZ86AF+qZMmoY0zlANgD5MRxgGquL9nSm/51cC
         Zt46OktZIWFAw9YT9eXFPgqI+pdih8wJDYoQb69Tp76sASbWpNnsW4gwpjjgqwj4zVMu
         ltdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883744; x=1773488544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=;
        b=AYp9S/tdE+LTrSshgK0Xrg8WIw9kJJxvrhf1nJ2ZythoTfvUN7MnVrmGY9e9EsWD/g
         dcjYMhYiVNTCt5XoHqOTGdE6GBIvJ9j3II6JZ1G/ypjC8JJkzJRFeZGB7gF1YxLPDufG
         +z8oEIhy05cfJ0GcD31JMw2XQlkx+Scq99kHU16oiBjgqJfXt5TX2Hd4ioT2YEBb+lJI
         SJfwZVo+J1HqKxS19dZo8N/wvIP4ehRKsySN/opKB0Xbk6PGdu/qt/2Er5jO7GcQDP1Q
         iQPtil2ujHB/jocXrZMEzfYE7Tr7JW+2jQE1niFECZQtYbf1N1iAIwpjlFwo05fwtIZS
         RmuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeTS+5B+1dLR+XKaiNyjWK+wTVTLPFZ4dix/cg9+aT02rIPVRkHBZRENugvghqAlgqfIOPQJ5e4SEDWOzO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyelypq9ewmOWojgQA5j2oSplKjk7XY5JRlhcwX+dcL/toyRwxC
	9HfoPPNphMaC3yYmVWrsMN89t0/3/qpO7QxSdmhv/LjxnazthbxVO9qn3Ki8LjdZe8TmDIXkigj
	fsu3tqFt7woMoex3oCOGpfkGTXTFFZcsbXdWdYBoHkPYxGGfQrr7seUJ9muW5hSq8j5k8
X-Gm-Gg: ATEYQzyufETS9enL8D7ZilunEYjVei26qMzfvCyliWfdo+fpsxugaoIXuowYxd67BPr
	N7q1CPrFMNp4JYLvxUcjE7V0yEqYkDLp2KUofB9Rtw1nGLwjaJ+ksjeNTSGJYLhE/5B5Jj3Ogc+
	e21xkrMFcgWYMmtctq/EztZPShkWk1cWvf2zck2OkSH9rzSasXx738wFh3r4UDNS/KoVdYH2Hs5
	Xokq2rIHlqcyaQcbAqNGkj7sGsQpKHOEJl5BbJoC7Qa3ysaqROxqZoWqY4MhHqIN7kMUYxuPEKu
	O/OyEbsZ5Mulu0ZUYsQv9kmfyf2sIaJQ8P6rD88RUBoapqejwUDaEo3WKx3Ps3GljHUoN1p8zso
	hf71fK536ja0KCepesSzLY/d0ro+ImPulCKJWOcVem7GgbHrtNbs=
X-Received: by 2002:a17:903:1968:b0:2ae:8062:8362 with SMTP id d9443c01a7336-2ae82266d9fmr51669145ad.0.1772883743698;
        Sat, 07 Mar 2026 03:42:23 -0800 (PST)
X-Received: by 2002:a17:903:1968:b0:2ae:8062:8362 with SMTP id d9443c01a7336-2ae82266d9fmr51668875ad.0.1772883743238;
        Sat, 07 Mar 2026 03:42:23 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:22 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:27 +0530
Subject: [PATCH v2 6/9] bus: mhi: Load DDR training data using per-device
 serial number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-6-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3692;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=McPnRZC5WUBs06Eu6S+05ajVf/2AASOXcpXG+shgcL8=;
 b=/todAhtMbh8tFvxjx2w9XFXvnGlfpGJTYVN+29dh4Z3dq17sjAF3Pro6/6WgjiZnJeVmxJVQ6
 LqwCNEkdXMcCqIkt4DUmOEwvVVCLoyVZAnqiZwj2udbkqLxXIQnmFXz
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ac0f20 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6j3Cpf__ZLy2wSJmqF-XB4rdxRoqJMjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOSBTYWx0ZWRfX4ssErCzatcYB
 hNwJZR6RBuMMmngaEyvz1xRTld/avm2TXfnpNNHked2w1bsAAXdoP/XW4yLhmopcl5zfc3qFL6u
 EY6GYoikbiMRY7d8cT2DPQVj6YauptAqrRMJRWY7870P9xqvMICHUXsn1NrF4YP2RHpBK7te2dh
 le+0hX02/0X1d+ymoLjl2jBnL0GSChmS1Pbbira9Att/pCX+uNpzPwAF3kN8lHTcNQ7ITdgQNU1
 NqRN0sCaxyiwqQ9jaUMB/3D7TzG9yGGzCzTwE66PyqlSCRfYj1488GH6VrmguvseaKl++OyBp9Q
 rZBB8foWZn6FyKyVJb5bkR4iXOHONm2Wy3y1PtipQgcDYHqVzK1Wc6Hq1HfNZduF2Yz3keu1OAi
 HqdoKQ2taMHDU/8cutkCrjcejmHpgHqgQDwnsPWjtJMBYkvclzgyERySGBEz51JTj2la3PXCIol
 T1hCuShtG2NpxNnBtvw==
X-Proofpoint-GUID: 6j3Cpf__ZLy2wSJmqF-XB4rdxRoqJMjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070109
X-Rspamd-Queue-Id: 33C2122B8CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95970-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.936];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Devices may provide device-specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
per-device training data is available.

Extend the firmware loading logic to first attempt loading a per-device
DDR training image using the device serial number. If the serial-specific
image is not present, fallback to the existing default image, preserving
current behavior.

This change enables DDR training data reuse when available while keeping
the existing training flow unchanged for devices without saved data.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 56 ++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 73ae722122a35b77760a4816bc60e6607aa53455..19fb9cb78fbecee047ba27674043c0940e749195 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -61,6 +61,8 @@
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
 
+#define SAHARA_DDR_TRAINING_IMG_ID	34
+
 struct sahara_packet {
 	__le32 cmd;
 	__le32 length;
@@ -319,6 +321,7 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -335,18 +338,47 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return -EINVAL;
 	}
 
-	/*
-	 * This image might be optional. The device may continue without it.
-	 * Only the device knows. Suppress error messages that could suggest an
-	 * a problem when we were actually able to continue.
-	 */
-	ret = firmware_request_nowarn(&context->firmware,
-				      context->image_table[image_id],
-				      &context->mhi_dev->dev);
-	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
-			image_id, context->image_table[image_id], ret);
-		return ret;
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (ret) {
+			ret = firmware_request_nowarn(&context->firmware,
+						      context->image_table[image_id],
+						      &context->mhi_dev->dev);
+			if (ret) {
+				dev_dbg(&context->mhi_dev->dev,
+					"request for image id %d / file %s failed %d\n",
+					image_id, context->image_table[image_id], ret);
+			}
+			return ret;
+		}
+	} else {
+		/*
+		 * This image might be optional. The device may continue without it.
+		 * Only the device knows. Suppress error messages that could suggest an
+		 * a problem when we were actually able to continue.
+		 */
+		ret = firmware_request_nowarn(&context->firmware,
+					      context->image_table[image_id],
+					      &context->mhi_dev->dev);
+		if (ret) {
+			dev_dbg(&context->mhi_dev->dev,
+				"request for image id %d / file %s failed %d\n",
+				image_id, context->image_table[image_id], ret);
+			return ret;
+		}
 	}
 
 	context->active_image_id = image_id;

-- 
2.34.1


