Return-Path: <linux-arm-msm+bounces-79179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0DC1471D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08100198415E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2EF30F7E2;
	Tue, 28 Oct 2025 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="By1INTVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95AB30E83A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651997; cv=none; b=A28jr4ERnH/aVhiyVQnFYCeEiteLlZBMaxcFgWWkzIDp4elIt30ZmrFX4HCqH480FACu32P8c523GWnA4XasaXVJspXhQlqcst8qJu8CQ3Si0/S3Hy+qlD510BxVi842d7bnuRcv8BvnA9KigLmhra839bVjmsuaNADB89T+VTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651997; c=relaxed/simple;
	bh=d7tS2MJNUw2vaeE4fX6vM58/8/s2c7Y+VeVjXja5ONw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=reewdqW7c5u8PBB5G9L4fiTUp9FPu+sGdWYe3BfnidISEe3fqcMXhCCO0clLc5O8hfu3JwvEfj4Jan0Q5iTg5MKsYUJKv7vLGUP+6hUx/OxD3M3IQX4d7M2l4pDkOVKuMlPsZbuHAymLoqiZy9iiI92Frjd1nmVimH4RpfvSuTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=By1INTVp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SB4h0v573507
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bB/NX0q/X1FSXzM60MuDC41GFlTt7PcGM4q7Uucp49I=; b=By1INTVp8XzI2F4a
	5o164V5gM/daTgkrovf1FgPUh2hMcyo5W4xkEI5aDORVIRJdwlO8ItsysXQx3b0O
	KLKjBd9vj1uiY3pgl6d69GR1lmu3BMw/fILlQMc5XqV1cMsMZhimxgvbbeJyaPq0
	TRA6GGO/AdMTbXULT+AxTLfVuLAYZgx3RLQNVsV2vPReFbZFWBBw/It9pd1RLFVE
	D+XUqB6krTZ7GBDcSHyhBzhv2cpqeybemp6IG7L/OKmMcQufgtAGiia9V8EAg4Xf
	nhJicm6qonrFDSH8UtNUc7xfq4x8yr4zUAbk3VHJKO0fk6b2QQaG/8/zoU5YTnzn
	ARyLZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge99tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8a387d01bso268043881cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651993; x=1762256793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB/NX0q/X1FSXzM60MuDC41GFlTt7PcGM4q7Uucp49I=;
        b=XAS2n90IY9ggvJJctjtAgRibleYrdsUrBcd7IqrHzwWYPgvGh/Uouz41+htDNdIRlS
         ykpptIIdgsHeYgpK0rSoHSf1iqzuPcRyGj+uNzO2Gs5T1oEbW7Bz8m30hearv0Gj2zaj
         Ir5kQqfLFURjzVJMiT0mehApNFJufhM/nA21SchlX0YHFsxBnAONv8H7/q6PMIN/f/8L
         9AFVx3x+MYtUIYXtggVbAdTFCqHVrHtA/N+2lascT/APhB2qzaBvU/ejqyWurJfGDi77
         XlOkrKY9bttuqO0eExHv7T/4OATqjVhrm5RLDUi7MyMvBxS2Cnx3SFjNQytxQwSGsMZB
         J7bg==
X-Forwarded-Encrypted: i=1; AJvYcCWXniJNVHfLThKYPSuVbUuV73xuH6vRJTWiMjzb6kZbVBnsTlsMSdPsBR+By7d5m93AxpvjBpn+Ze91Q5cP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/kzB09dCjSYVIZin3IANAAas5ErNe/1PoRTfeGaI31MVfwMP
	/bvpC/omVTdCvQBNj/iG3f0ifalxYHJquj1bAgQE+VUkAGmObzXOhTywUmPP1SRsOegwCstet4s
	cqU+iAhvXu4pOsKQ9s1hQUPJia6Ve9wg8Rj/HsNOjb2Qa8Anm+D5vIp0DwyEl01Ob1Ej2
X-Gm-Gg: ASbGncuaxWvF3cUHdiYjfJGegkGNb2qJxNX6WtUDs5cIoTCl3OgtTBjjg74nGj362pm
	KNEz+EaQASzMorhAJ7RQt1mR00KuMgF7UgAd4jl5AcYPrcRHXwU9OIh8Jwi7dZi8GaDgKaAgOPB
	PqG0AthKz+nvTYz0a16s9o4QFj2P6Avl4ZyORREwIrTa61IrzyZumBm91TKA3zrDE7T392HCxSc
	K91B+06vGMe+aRj5Md/oU7kcquyb+TiC90A8PltmohkLe1k2Yuy5SvvdvQUrRzllRTx0+iE7Gjh
	e2egJrhxIrT7rOChW9jfCv8oRCAHOoZTv3Vw78BS9xfT9Thsd2p57Nv03lUTI1r1FXUv8QWp7qd
	WA0pZ9iI9/fjggzufUCUCHDryqHlmzMe6/m+wCXVhQM60lj59xLkRXYIvgpV3XkaZwaxzSixoGf
	FpyfyLgg7zBY+C
X-Received: by 2002:a05:622a:5506:b0:4ec:a568:7b2d with SMTP id d75a77b69052e-4ed0753d986mr40795491cf.34.1761651993032;
        Tue, 28 Oct 2025 04:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVH84JiStHmZAtytaZOmRVnn9IundQ/H4EFPLOZFWd8qguegxFZk6jtYAIAnhcb63GF2fEpQ==
X-Received: by 2002:a05:622a:5506:b0:4ec:a568:7b2d with SMTP id d75a77b69052e-4ed0753d986mr40795101cf.34.1761651992416;
        Tue, 28 Oct 2025 04:46:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3096564e87.6.2025.10.28.04.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:46:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:46:23 +0200
Subject: [PATCH v6 4/6] media: iris: remove duplication between generic
 gen2 data and qcs8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iris-sc7280-v6-4-48b1ea9169f6@oss.qualcomm.com>
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=d7tS2MJNUw2vaeE4fX6vM58/8/s2c7Y+VeVjXja5ONw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAK0RgQH2F8yIU2B8hp/SCFvc613r9h/dOTExQ
 C76XfdeZ9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQCtEQAKCRCLPIo+Aiko
 1ZeRB/9X0IHIbGXJnZawsdDbEkdAecre0UIh80PvJSFGygabGo3xstG+3wcJIlWcD0rJ1b6mN26
 hanjHLZh+odDWH23hdoSfhqSbcGmvMQ7bMPE0tyVsDC91/njX7SwaveYfnDhyVs3Ap72JaNKO9i
 i7HS7OMjNYQ6Y0KSlA8IFVuohAIlkUpJApHBVK8g+H++yXS6N+v9/Dh5qAICHw+/6vy65Y244nU
 fwPMrcsZTM2CCZVVRHEU12k0L8tKO/gllS/nWfIIlbO4u0qB3tvu5aS8IvZzUjhWN12yfpcZam0
 0W32e+ozf3iXeqFLu8X5+ctirhyGDV765KJuj1Q3mLCj/Ra5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: mW_FlHWcwfw0f9Y_TQmkU08Z3fn2mLiC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5OSBTYWx0ZWRfXwR4NW4mB+6pH
 4Ty1SLVTFa1QwQD15GmiNYR8mpMxh9sw4n5Q2AS8AyiG3uz84hRyigrPALtjwBMiZ+E++Dp5gha
 Hlu2Ztm1qXX4tFmN+fCb+uPq4mUmdkvsx94KndoKeq2RZu7tGap7/bza+ltnuIHUpcK8wHds7qg
 81XXntmefZyw8ODXxD8B/trIq58G1SY0TwxyaioqbpUjuoZOjOd0K/cyeAak4WrC5MrJsc4fhn1
 aAOS/1P1LBw1ZSVhETMintIY6JbVdQ9dryMiyJJM23l5gLiERyGbJdY6TWJEMK3Ck3C7QQw9wua
 JTQy+p2i0l3G5Dwti6PtxepydvCwfMqGnePvT/Z+Zl0pHwTyLJ/8AxU6phfe3LpeBaioUQZZN6H
 NkI23lxCK+Zz6+UrT9tF/kD7Pij5EQ==
X-Proofpoint-GUID: mW_FlHWcwfw0f9Y_TQmkU08Z3fn2mLiC
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=6900ad1a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=8lhtx-rUCDsU0NfLSlYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280099

Now as we have removed PIPE value from inst_fw_caps_dec there should be
no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
QCS8300-specific tables and use generic one instead.

The differences between QCS8300 and SM8550 data comes from a
non-conflict merge of commit d22037f3fd33 ("media: iris: Set platform
capabilities to firmware for encoder video device") (which added .set
callbacks), and commit 6bdfa3f947a7 ("media: iris: Add platform-specific
capabilities for encoder video device") (which added QCS8300 data, but
not the callbacks).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   9 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 533 +--------------------
 2 files changed, 8 insertions(+), 534 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index fb3fa1665c523fbe01df590f14d8012da3a8dd09..2631b7317e086084e5be95e2e0370c44ea255df7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -994,7 +994,6 @@ const struct iris_platform_data sm8750_data = {
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
- * - inst_fw_caps to inst_fw_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
@@ -1020,10 +1019,10 @@ const struct iris_platform_data qcs8300_data = {
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_qcs8300,
-	.inst_fw_caps_dec = inst_fw_cap_qcs8300_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
-	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 7ae50ab22f8c577675a10b767e1d5f3cfe16d439..61025f1e965b802cba939fda74c01ea33b95648d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -3,535 +3,8 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#define BITRATE_MAX				245000000
-
-static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
-	{
-		.cap_id = PROFILE_H264,
-		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
-		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = PROFILE_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
-		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = PROFILE_VP9,
-		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
-		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_H264,
-		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
-		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_VP9,
-		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
-		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = TIER,
-		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
-		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
-		.hfi_id = HFI_PROP_TIER,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
-		.min = DEFAULT_MAX_HOST_BUF_COUNT,
-		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
-		.step_or_mask = 1,
-		.value = DEFAULT_MAX_HOST_BUF_COUNT,
-		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
-	{
-		.cap_id = STAGE,
-		.min = STAGE_1,
-		.max = STAGE_2,
-		.step_or_mask = 1,
-		.value = STAGE_2,
-		.hfi_id = HFI_PROP_STAGE,
-		.set = iris_set_stage,
-	},
-	{
-		.cap_id = PIPE,
-		/* .max, .min and .value are set via platform data */
-		.step_or_mask = 1,
-		.hfi_id = HFI_PROP_PIPE,
-		.set = iris_set_pipe,
-	},
-	{
-		.cap_id = POC,
-		.min = 0,
-		.max = 2,
-		.step_or_mask = 1,
-		.value = 1,
-		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
-	},
-	{
-		.cap_id = CODED_FRAMES,
-		.min = CODED_FRAMES_PROGRESSIVE,
-		.max = CODED_FRAMES_PROGRESSIVE,
-		.step_or_mask = 0,
-		.value = CODED_FRAMES_PROGRESSIVE,
-		.hfi_id = HFI_PROP_CODED_FRAMES,
-	},
-	{
-		.cap_id = BIT_DEPTH,
-		.min = BIT_DEPTH_8,
-		.max = BIT_DEPTH_8,
-		.step_or_mask = 1,
-		.value = BIT_DEPTH_8,
-		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	},
-	{
-		.cap_id = RAP_FRAME,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 1,
-		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
-};
-
-static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
-	{
-		.cap_id = PROFILE_H264,
-		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
-		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = PROFILE_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
-		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = LEVEL_H264,
-		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0),
-		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = LEVEL_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
-		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = STAGE,
-		.min = STAGE_1,
-		.max = STAGE_2,
-		.step_or_mask = 1,
-		.value = STAGE_2,
-		.hfi_id = HFI_PROP_STAGE,
-	},
-	{
-		.cap_id = HEADER_MODE,
-		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
-		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
-				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
-		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = PREPEND_SPSPPS_TO_IDR,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-	},
-	{
-		.cap_id = BITRATE,
-		.min = 1,
-		.max = BITRATE_MAX,
-		.step_or_mask = 1,
-		.value = BITRATE_DEFAULT,
-		.hfi_id = HFI_PROP_TOTAL_BITRATE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = BITRATE_PEAK,
-		.min = 1,
-		.max = BITRATE_MAX,
-		.step_or_mask = 1,
-		.value = BITRATE_DEFAULT,
-		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = BITRATE_MODE,
-		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
-		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
-				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
-		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
-		.hfi_id = HFI_PROP_RATE_CONTROL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = FRAME_SKIP_MODE,
-		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
-		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
-				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
-				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
-		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = FRAME_RC_ENABLE,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 1,
-	},
-	{
-		.cap_id = GOP_SIZE,
-		.min = 0,
-		.max = INT_MAX,
-		.step_or_mask = 1,
-		.value = 2 * DEFAULT_FPS - 1,
-		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = ENTROPY_MODE,
-		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
-		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
-				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
-		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
-		.hfi_id = HFI_PROP_CABAC_SESSION,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = MIN_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-		.hfi_id = HFI_PROP_MIN_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MIN_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-		.hfi_id = HFI_PROP_MIN_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MAX_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-		.hfi_id = HFI_PROP_MAX_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MAX_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-		.hfi_id = HFI_PROP_MAX_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = I_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = I_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = P_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = P_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = B_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = B_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = I_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = I_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = P_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = P_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = B_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = B_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = I_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = I_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = P_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = P_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = B_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = B_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-};
+#ifndef __IRIS_PLATFORM_QCS8300_H__
+#define __IRIS_PLATFORM_QCS8300_H__
 
 static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.min_frame_width = 96,
@@ -546,3 +19,5 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
 };
+
+#endif

-- 
2.47.3


