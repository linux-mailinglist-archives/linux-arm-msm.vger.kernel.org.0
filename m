Return-Path: <linux-arm-msm+bounces-96513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM1JJtrGr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:23:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A497246421
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF525304F099
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7082D3E7179;
	Tue, 10 Mar 2026 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6/Hrakx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOLS7+av"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCC03D565D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127356; cv=none; b=mIgud+h0fsf4HsWijys+/UraKJ8ZDRWd5p8T9kTqNvOJ5RJEGI8vN/KBpAHqWOug2XfRGzz2hl6GDhURdIKyM5ebp78k5Igt+uRih9QYm42BY4yWDOy/GtWl6tfIeMibtI580LhIMmDEx62R2VB23mvNnIBrIQYstB+Rk9yWetk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127356; c=relaxed/simple;
	bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HyIVCDDH3UmY6A/7A6YmmcxR84dvbo2lGq25SaJ7AwoEYPIJdF17e6pxBn67oYBCgaJkHbKJKz0HyaJz2FEwFWyDmDnObC2Dc1ZrlIY7gjFF5HpqZnQ3Y517a4EvKzCeVEd5b4Wrbs7qeRh06OrspmNfz+08cp6YMPy0oULDNEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6/Hrakx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOLS7+av; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2Ehiw3087381
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=; b=D6/HrakxRUbaY0yc
	AiUzk5o3nE8Re/VbNXda+Hj6Kat8Bq2Ld9G3m7IASBI/HexLvJPNRla49BIA0jl1
	t4wgnGgAdaPuZatlUst1ra5G8RynhRmCzkKiVisIkaBAvKyEPm+1sIVFsi05xQj1
	W6UR0sdvuSa2mQE0VEWPHnqzLzp9/jpyyzvBPWamCqnaIJgve0rzF0JRFgl/y97E
	p4/nwLZ1Xrs2DjpdYg9g9TlyWK4hgYLtEB5YmEGymI4KRm8S2d+R+2tNptUgmOvu
	Gof4OMd8nomh8nJL8ugN9t6ssRHCg/IGmdVBkgF8dUBi4RCntL3401zQGWNT5WBs
	3EIxAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy8397u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae53ec06b0so449135975ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127353; x=1773732153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=MOLS7+av9SHxQ4BhOHbWQmKjNmszAl+ZSO6CfcJal4bdeYvX1NiPopNjfucxXxERNs
         tYxmCWFtTenmadOwsbyFzLHYGP/+hToWuXCzPH0aMXHxRkGT2WBljijINvYHzMg/99GB
         OUXeRlHhpeK7YyNV/iVgcpdYrYYsc5ScCdBWKvAhhM+q01Pi5QCMXrtAkmMlotfISlXi
         v6WlIby6PheTipiqpNf++CgKDFoO95/NAaSQQlOPen7+FlMqlkKa2s0cgXloVG+0vI5B
         M3vrIAbUx/1W1f15OwAN2iCyK8i1DcR2HcOlqixz8t3eGkrJwVOV2SZGBXWC1ine3OMI
         Z0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127353; x=1773732153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=TmC1OLWMH4LOY33Wll9vdj7scbI8y46JX60i/cocUBr6xqWQP6b0Ok+yg0ps2U3b77
         iHukmaJO7FaNpLKkbHBciKcPDTebcf2NXOZfD22X1ebCoix6aJRHQzl0UB485M+7Z+CX
         dLQrHuQ1/LKX6Z/V8+hCuiY3Y4cO2Q6B8ixVIYBKuzzVs/cAThfXilbq4OfjVUcrd7ry
         FzGcd9MJQVij5yhfb7Lh6ubi40ef3QjgB2FzO25VkWeXNxfkAjDC86YLkNYVQyUTcFIN
         AmWWbQRsHozqI44UXtWmN/bpQmDq8e+Ou0Qij6GxE680x6pj9ZpHn4pnIFxzPmgbdPF4
         Sfmw==
X-Forwarded-Encrypted: i=1; AJvYcCWqPiT5tcHnjuT233Xtf5APgP/kBHjHnDcCR+RyP6StKdtTWEEGAin18CH85rNMGNqEEdmO8BUo1HLK1IF6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi0XtMz1ffd5F5DXdW5fp0jk5qW8sO9K2VSVnyR/1O0qMnMpVc
	lD3JUGVjK4Z6wn1dc9BTh4XOWasipKrOtruA5k9mvUncuQF5E+OjQfDuzrMEN0smk9SWbCEJoRI
	SzLIO0XtGUCjS/JKX+kakeOEnxyZ/jvLEC7s1PqW952nRHOf/SVO5Zf66g8Rveqatw4sO
X-Gm-Gg: ATEYQzzaW2X2iX7eSWog6qyvA1lvw7vQg3+5qKlDA2ipKPR8QceKhf6Lgh+tZbemsuu
	+JIBT6+d7Dy0IOzMqJ8klK6pDWQdfu/FN+7kHf2GfU//XwZqDfM1Ryzx1cijf4xIAgS4FgBqe9w
	UaQsoFPMImlDa/qLSh+aJRnr+26cKSgJfD6o14QZ4DKR4VK70Vs2qvSljuWnAay4JasseepNQc0
	vSt5+YuIyXX/oo2RK87N716k1kbif4IR/FnuUcJDvlmGGAETMtPr6oPpxjzTsGrC5p9iC6k/RK2
	ld5HP9zOL8fOujK82ZFuHKTgnsYZFBMzpR1jMOYQSLdzgEKoFdSPm536iUuF862+yqz2ka3XId1
	DcoeaUYDa30QRikLmaF9qEet4EoKfvMsk7V2DyKqfHgIxAPd6Lho=
X-Received: by 2002:a17:903:234a:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2ae82366c40mr129418165ad.12.1773127353263;
        Tue, 10 Mar 2026 00:22:33 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2ae82366c40mr129417885ad.12.1773127352754;
        Tue, 10 Mar 2026 00:22:32 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:32 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:02 +0530
Subject: [PATCH v3 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-5-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=5038;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
 b=HnrMHtkX8FIsJClYbn+h4QhrfuuSrzMST560LuFe5QBkSaiJ1edFD/28P0xY66nkAjHpU98kf
 ojhe/Omotw7B23lcSMYYNgqORG9DgEW2TZwFCOw/x/hKHwO6FM1VR1m
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69afc6ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=g53SEPjKJ_zQRiRrflAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: S4nt1JXxRdh7f9L7zMhGIL_YEZcuF9Js
X-Proofpoint-ORIG-GUID: S4nt1JXxRdh7f9L7zMhGIL_YEZcuF9Js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX6GFt5eNWDzyT
 eBsm/wTHBZDtiiGY/4MqHrcHPX+Edhp6zLzOSNN4VOH1IPc8CpyIWjRb72S19/FeJ9fGm/HBCpT
 iBuZbz3tNVG6dnJb8Fdh0aMy66iKKjJzDFXNHTWw8yzmiUuqMfomuJJKjBV1/v700l0ZxATXRKQ
 ELgklY5O+CGHnh+ET/9SHqqA355zoBrhD9R+4rK8SRq6BL7eyyDb4ZTi4guwHA7SBk4Fu1Bb8Lu
 E7hk2PNkfe4BgjPH21OSUxcZiPPMeoxtNfhwbgS0djvTw94zHipGkmwaK7ew6qaIw0kbUwnC6O5
 9u8mW7nHiN4bqx6BTXRENR4OA8+DTupFo52pDlt0iH2b8km1F4KZ7TfHkok3GexEic975gJEBGm
 sE/NpuxW7H0oMUEg0g25YGiuHuQAz/iA5XpKzcQqDnXH/OJlXLjpmBPCYF5NSsNP6Rydl+ura6c
 bNHnBPuja86PoKcapDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061
X-Rspamd-Queue-Id: 5A497246421
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
	TAGGED_FROM(0.00)[bounces-96513-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe-time variant selection to match the SAHARA MHI channel
and associate it with the QDU100 firmware folder. Add an image_id based
firmware lookup fallback for cases where an image does not have an explicit
table entry. This allows required images to be provisioned by the platform
without requiring device specific client drivers or additional registration
mechanisms.

This change only affects devices matched on the SAHARA channel and does not
change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
 static const struct sahara_variant sahara_variants[] = {
 	{
 		.match = "AIC100",
@@ -250,6 +280,14 @@ static const struct sahara_variant sahara_variants[] = {
 		.table_size = ARRAY_SIZE(aic200_image_table),
 		.fw_folder = "aic200",
 		.non_streaming = false,
+	},
+	{
+		.match = "SAHARA",
+		.match_is_chan = true,
+		.image_table = qdu100_image_table,
+		.table_size = ARRAY_SIZE(qdu100_image_table),
+		.fw_folder = "qdu100",
+		.non_streaming = false,
 	}
 };
 
@@ -278,8 +316,21 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
 	return NULL;
 }
 
+static int sahara_request_fw(struct sahara_context *context, const char *path)
+{
+	int ret;
+
+	ret = firmware_request_nowarn(&context->firmware, path,
+				      &context->mhi_dev->dev);
+	if (ret)
+		dev_dbg(&context->mhi_dev->dev,
+			"Request for file %s failed %d\n", path, ret);
+	return ret;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -292,8 +343,26 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	if (image_id >= context->table_size || !context->image_table[image_id]) {
-		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
-		return -EINVAL;
+		if (!context->fw_folder) {
+			dev_err(&context->mhi_dev->dev,
+				"Request for unknown image: %u (no fw folder)\n", image_id);
+			return -EINVAL;
+		}
+
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/image_%u.elf",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = sahara_request_fw(context, fw_path);
+		kfree(fw_path);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev,
+				"request for unknown image: %d\n", image_id);
+			return -EINVAL;
+		}
+		context->active_image_id = image_id;
+		return 0;
 	}
 
 	/*
@@ -301,9 +370,7 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	 * Only the device knows. Suppress error messages that could suggest an
 	 * a problem when we were actually able to continue.
 	 */
-	ret = firmware_request_nowarn(&context->firmware,
-				      context->image_table[image_id],
-				      &context->mhi_dev->dev);
+	ret = sahara_request_fw(context, context->image_table[image_id]);
 	if (ret) {
 		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
 			image_id, context->image_table[image_id], ret);

-- 
2.34.1


