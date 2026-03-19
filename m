Return-Path: <linux-arm-msm+bounces-98646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MopKvyYu2nwlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:34:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AD2C6D53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6C5C31E30B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6893A34E743;
	Thu, 19 Mar 2026 06:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d92Vgpa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Od/2QhmS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A493451CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901937; cv=none; b=uZYcRpcBI8nO3rx/tPyDx4GNZwcjozUpO4yKygNp55ibTlulkV1yJVM/NibbDGax0ulOZ7AlGumgx+i8S8fr6MiPjgjHUK3ukLZeDsQmRpXCf/f7dmZc9yLqzQZ3DOb1h36KpT8+MIK+0To1H/h5M81dGxaPrR8aK/mf6UcpDmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901937; c=relaxed/simple;
	bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwHi7QFqLs4rvpocLT4IsxDwak1vwidMxHQvmmO+5yJr4U4iYJMtg50gBG70DTUcce3retzYe4olRTZ02yXUiwditp3WIhd2BPN9CbmT7XSjvHwV9rz+rw18o56C3z74KIoAJS/0hv+5zTjgWLmSvZn8pkw9oYVT04uiUnH+Fes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d92Vgpa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Od/2QhmS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XoUK2470046
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=; b=d92Vgpa8NFRAuX3N
	+nVgU9lUwaxEKaSZTk8Ip21p7jgIRnlFt2pj+YV/dKyykHtdo44AtPfZlX56lW9U
	5lqSlEvCYqHloW2Ap+4rvIyGCCm4+zPBWNAFrIyXgCj4MjGZWQ3jLz7Oe8fe/hjw
	EOrAsa1/+1KdJMcPREs7jpW1vHobAUthvsLKwEXYFmpUQ4KIimafgaAIrf1YBace
	lNtth1WqAR20221Qv+DLLHhXVepNYmI+4Bj6cLOkGvzubuLWem/ITj4o0L8nEQmb
	WsvY4/cf1rNx7Uwr7i4AkUoR+knYHPM4/HiXyRTFjle8QrzyMnTyB6VHL3YcqSrU
	8AHjQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj53mrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04db6c138so8905195ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901933; x=1774506733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=Od/2QhmSkwe1x9bzDKAtJGAWo4w3hZtB7/PgPlTxW8sIvH9CUTveuJnWT5g2PDVXj3
         ReK2aqvreUNEpb0Krw2rR3tbGyWke350lXRQUh6N9gT2mmJ0c8uzyzmY/xgxb5haFAUL
         oBHbKE333hB/cnhlOUV8pDiyPfZBDDv93MSkoTPnLI/V3z5ySBPfZzkc5vcryWdSH4RM
         3aiqeQj2IYa0SBf5DUHy9ytEgk0W0H7d+jAYfOtY/UJwSKek2vUqP4XC+aqll136IYE2
         XpH+fCjE2xQYRhXCeFxgmentl2bAQa87kltLB+rtjC+rIan92BeExLK/31JMwOlqOEMf
         wViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901933; x=1774506733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=fkJsjGfVlVXU71m1/6if+xzbTbMRLU3//0N5Gp5Fwr2EF4WM/GGXfyoF2GKrkO9b5p
         mwIjpAcw2fR8EzUi7OQSzKq/+TwZYAFW3UKX06nPlc9hPZlUQKxNnLc7JFpmUTQqu8bB
         xirb3wy7+UaxGdcLGiEc4vDklAp0BNo70YLOh+BIbJ9imm6pRAH5euIoutmuwwTmruqX
         UykOtfRhFEs7LEKe05MhiLcjBc3KMdAJrDhDzrnaLhyQE2yWsyEE+ZiDzaQY0XCTmaoH
         KVjEzMAi1hS3vdTOezIw/NaOjL3OJhflBxiMkLJfi5+nVHZ6/9LrhAGlRX8YFFBvmA/+
         F/dg==
X-Forwarded-Encrypted: i=1; AJvYcCVgmKoHef9s29GEvAQcQwpvwSrblRfS7W/fjtA2sImw6z/+lmjJK+JhQO4MNrUB4Tmd4fBpKagGz1tEyw5a@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kxVIJpTxBRgW+uVkSKeUgh3u5fP9vXeHa3Ab9yFojIaouEa1
	znGJ60q/J3DvJ0BMRQ727uaw4TenLQW8RpWrwMWETOqAeZmfURgvIiix1v3uOs3txhDogZAaUq/
	cNq572cGHmRcIPxzD6Rz8NWx8EJxtRqf9RC/yNjcB09TXhNgmc7DU3aed5L1s5YnET3Vf
X-Gm-Gg: ATEYQzxWbW2EH/yTL/3BPEmGcyKCOHN7A+/Yt7OF0ehxumeMp8P4/So3ugapMh8tFbc
	+2bGT/zeEqZe46SeJk4GId5eaNcMlXwITCfJB2eekvm316NjXkR2+owmJCc+s9dSmIX92DGDaPX
	r2Awz6AJDgdweAe+jMKWNdADrv1M2Sam6oJGciJYR2w00iZldf9/7nA80To9hhiK9jTyeIxUXoA
	vhTFRMh8Sd2UqbBt/npNw+sswyVerbWzca3S1AxKyUUpngJIdpNJhChftwITrKHiM5zck1Tz0wI
	9Tk0ZDywNfee9G7fxH7RiBdAR4bNwdMGpluchLUYeSne9UWMSNqlzYgVgYfCaRoN+BIR6AhxVob
	0nTmFixmMvW4WWE98i/7PuO6rCsQ/LdzJwjkUTx5jaXg+YYSptnE=
X-Received: by 2002:a17:903:1a67:b0:2b0:48ca:a641 with SMTP id d9443c01a7336-2b06e3c3abdmr57658575ad.25.1773901933472;
        Wed, 18 Mar 2026 23:32:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:48ca:a641 with SMTP id d9443c01a7336-2b06e3c3abdmr57658205ad.25.1773901932969;
        Wed, 18 Mar 2026 23:32:12 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:12 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:46 +0530
Subject: [PATCH v4 6/9] bus: mhi: Load DDR training data using per-device
 serial number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-6-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3154;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
 b=P/EiG/Ox8r4P5G4oR1MFzhur+NXMa2Gi7t1dDjAqXLD1FDiqn++C0jyKd+T01VGQHN0sFZPMr
 aMqQNJJLI4PDL60h+ifxRx6Hyyb0ReTpHexQOU9CjbMdJbAk1/mz+bD
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX+ON5d7aD3nWG
 1DmSH8XmKllw+bkp3C4t91vvVKkYm0cC/MjW+Gs/Z725aSfIlF5ENxnxMrOcVdpQqNQIsh/FqrE
 EpCw3XimLXyDk8DBMHj/dwsJHVXKcUWxIesfbddoBGMf7uSXpuK2oM/65fses1CohjcZIwVyiU9
 qxDFAqgw9xFT9VqfsvheX3wuoii6kpeWgcQ/GEdFo3XxTyaBMOdgLmnHLuFwS48M4xLllG6D7hi
 Bz/W2keS9M5BKGNYa3wL/aESp6balNuJrf+EQ+UIXHQZVSr9YJGRF9fAbQL7NKmfU0Z7PZYvrWJ
 BiDl2Eue7DU5NhNDntE1p49XEUJJSOn/2AQflgmZeLr5aqemiIKiElj+mFAmod4M2eIbvJAwt0G
 nmlrgFwBHkpodS0t/wf85Acp7HrJVa4ma7uUGjEGVgYlzRFnzvdahq9bW+t07gwGEd8NXCaQ092
 vHngzFWmtcG8HL0q/AA==
X-Proofpoint-ORIG-GUID: QWyNjZFHHouIRlktutiRQ7ANHT6Z3aR8
X-Proofpoint-GUID: QWyNjZFHHouIRlktutiRQ7ANHT6Z3aR8
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb986e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98646-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B8AD2C6D53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/bus/mhi/sahara/sahara.c | 47 ++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 4ea14c57774f51a778289d7409372a6ab21fea60..0a0f578aaa47ab2c4ca0765666b392fb9936ddd5 100644
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
@@ -365,16 +367,41 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
-	/*
-	 * This image might be optional. The device may continue without it.
-	 * Only the device knows. Suppress error messages that could suggest an
-	 * a problem when we were actually able to continue.
-	 */
-	ret = sahara_request_fw(context, context->image_table[image_id]);
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
+		ret = sahara_request_fw(context, fw_path);
+		kfree(fw_path);
+
+		if (ret) {
+			ret = sahara_request_fw(context, context->image_table[image_id]);
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
+		ret = sahara_request_fw(context, context->image_table[image_id]);
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


