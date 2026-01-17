Return-Path: <linux-arm-msm+bounces-89497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CCFD38CF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 07:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D39F0305D990
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 06:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E22C2FBE05;
	Sat, 17 Jan 2026 06:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alhhBRdd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGtptQiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D93314D25
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768631778; cv=none; b=dH2nK+L5ajtV35Amueo8x0RDX4pXCskRAiS49iZhZT3UEitq6UT28G77j51HugWXQvp0PwtCpKXBvnmVg9KbAjEhMFtl0hS6aClvNH2g7Q6mvYCPtewhSkoXc1FwVQMuiPp/PfccOTy1mqH3CvXSOmU4/LZpLah1PRw+c6R9gi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768631778; c=relaxed/simple;
	bh=Nivgddh/dUUg9vaUGrpQO4Ar4VNMexa7P2jWIqnrNXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VaBFy5TEZPNr1zJUb3ZfZD4+7eipGiccMlCudreiT1iBZoG3F8Hx6DOilsnynuZ63Cpoudiqfw6aGZ7jtNBNqvkDQ3sRlXh352FqBrJyiNHAYP21DwgZmyniJd2suDD+vW3TmXtasdm3YqMHYNS2tGBkQXuCzKxRGd/cttTx1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alhhBRdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGtptQiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H2Bh6I3743284
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDDelXBrEvb7s+N6wl54GgAwBWnoeXlC1C+qi++VsB8=; b=alhhBRddnYNXM3H2
	I2oLrclleXsei9fX4OGMXnR4JmGbg384oxIViAxFkdDy6TyQ7qjw5l1/1cxRCpZM
	DaigZhb1fVngZR5NutWaHgXrn2f69DH9gOLWh94Iwv5I0rofqf/QE9o7h7Pzwr9f
	yMp3HUCD5AiS1DPvyfuNLHD7sq981zQsFVT12ZlQuIIVf2yFtBy/okQxGeBFPA0n
	sqvdDb4rzhfN8Fr5tjU1x9/e+9W4wx327YN+uUhd3cGzkVo3ntZELPIWQohZu7vW
	BX863w6gmgkHDpG/LUZtG6dnCbEqNSDDpaaLlwwYCnd+Kn4iWVlEHVIfZkWByzhd
	P/+Ttg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5gfk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a2ef071dso755441985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 22:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768631770; x=1769236570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDDelXBrEvb7s+N6wl54GgAwBWnoeXlC1C+qi++VsB8=;
        b=bGtptQiyqxk13EgJJcH+CHUroXCyoTrAbV+/BG/oeHBihUElwiOc9MSVPRyKhbknJa
         /JBvFdcbYl/kd2gUqj7lFXQsm5U//U0couxNXLwJdsgwa1nieoBopM8l5JerhleoHm/I
         uazgLHi5AlWFqVrTWUiDog6y2/eE91GnQtT3rdvwuYASbFv0J8Yme7bTjDfWX/qOSVv+
         mliLuhp7CIjOh/F9nJXT/Hm2VOBc7inu0N1Cef4vJ8zFwCsL8xJOwaLChH4ycqyGM8NS
         9g29V6Us5vmBQK5JqfrbUZ9f7zlVxZW1Jg9omp3y9xTAbhjilwHzkcUTjOmUvxrCCZCu
         /STw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768631770; x=1769236570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDDelXBrEvb7s+N6wl54GgAwBWnoeXlC1C+qi++VsB8=;
        b=CYr45FsIHFvpuz9yO+0uvm9gqxpRgTqvJC+NFnMAsH0qN8jO8VF+dPSTLOgofA+s7I
         OirSrXHIYg//4emkfJs6Gy7/RoOFXSMRAPYtDDUkz57gAEisD2xDiDfIwPnkOVslc36A
         BZQB4OCzZdVv8K+TjJMpTzBrwpXkdREl+H26mGMS5wL5IjhjCU4cEpd+89CvetbaoBQO
         cHdTIjiMVFQR45ef4ohfyI9utQgSgmNfq3mh7oKOYaKQTTarqWOTzOyi9a7Rw3PlEZJ6
         8P/hSPUc8Q603W0WnhTfiqe83+8Ia/xA3E9OUr9JEjQcrB3EpZC00tsMhgTWm/D4VzoM
         v95A==
X-Gm-Message-State: AOJu0YwRlUVgVuDaAYwKTVwK/ylJ+y2FYFajmaAKj/ObnwBhgpGTxlQf
	eTpIjzHvq1qXzGrRs9ob8/xgJGEiNg6aezYycg2XR/h1ac3GcVnWZK1VMHYTB6a5+By7DMWsk3P
	upE0vJ7S/7NMLU/CdXiM1qbHay4AjGG4X8t29Pixo3PX9chnGj79fxSx3B0Kw9selhWL7
X-Gm-Gg: AY/fxX5O4HXCbC4PcRv3hBxc9mA+ylvlBlEuF14YmMw7C1Apnl9fkwOzRm3+gZXrCVK
	oMv138IqJFtIiECbeiIa9YERmvEYWn8uwO8Hv1Kp7VQFoHivWKHEo40KPw8jpEERA6YLegsCnd2
	4xJjMpE+VzkMGV5QmXbP1x+s6byrcT6f32lHq0GYY1mVu+XqBGuFTXxLS2CZS6l7XJNEAoLNBwM
	rGzW5+ZCmDORU20TOF0VMc7K5KE6e3FkgwTFfYO2IK+nouv9wVvXXpmZaEWgZJXYu70wPLU5Cjd
	69ejlskhdDdGZ4I0T4qzn7Zk909hHtb9h/q4RxNaswYoCG8+yHtQLwhSN/1gKLsbeVr2zkq8DaP
	TBje13TZsmA0H0Bi4THCCmZk4xSSXCKGbunOo+/VCecWdTMCO2N37rnosnwsr1IG+HowVzpLW3n
	I+pNrJB/gAk1AD5IbDRdNa7tI=
X-Received: by 2002:a05:620a:199d:b0:8b0:f04c:9f0f with SMTP id af79cd13be357-8c6a69633c0mr674357585a.63.1768631770254;
        Fri, 16 Jan 2026 22:36:10 -0800 (PST)
X-Received: by 2002:a05:620a:199d:b0:8b0:f04c:9f0f with SMTP id af79cd13be357-8c6a69633c0mr674356085a.63.1768631769829;
        Fri, 16 Jan 2026 22:36:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:36:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:57 +0200
Subject: [PATCH 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on
 UBWC 5.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-4-d5c65ea552c7@oss.qualcomm.com>
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2678;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nivgddh/dUUg9vaUGrpQO4Ar4VNMexa7P2jWIqnrNXA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3M9+mHB6GMiAL1TbuPcebrQTrgtuwmLGi4D
 GiKsoP1qW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstzAAKCRCLPIo+Aiko
 1TMgB/4jx9mONQw02I/OWAPUriWFeBex6wD887DlDc6s0+G9WkEZkdTH9Wu+/UBsAcvhtSvJpzG
 /90E5DUuS0HbdWP6sO9qw1nn8idesZSermRuXFGbHUpdzQ6u9kDt3bM9yliVOW0Jy3yyAgqk6v9
 veL16e6sq5TuoT1fLiAKNkr7qbdvK+bFjAkaw4RGCHkcAeXDWnkG+ioFavRYRTSD7pIn2XcaiFb
 jpupZkvbREab3jYC1aByrUt5V+yGDQaMFlWhXRh/uzFkK7oAl3wbQF5y718Ces3iB72USL3S9Av
 KELU4umFJl1Xp9wBdcAvJ82rn5z5wAsOC14IjbJRHjnz5z75
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MSBTYWx0ZWRfX9YPzxT/luTrC
 u6IszMGzI9t6xq2myFlLOQZv1PtWboS4dHBMeDKydys4QPnQWHL+Whk55ki13JVU97crQfzLK0k
 IEZCc3aFo+aQnpukUEwK4D2z0obfu0Csm+G7mHUWkR1nEoQPFYk4rR4aEf6QCZKK8IKGhrEhk++
 o9v5eHvxTHRUG6FVbkEYlKOmcZwVFyvS3ySvCX0lzfKAXaMwRRFYFDpI3GzwQH0s2v1r3zchjkN
 Z7If3J16w6HTjb3nuX10VDHRdt3F72OljD/VoXRrnNKZVpZ+v78COy10ACt3HCO9t677NtntFWi
 wlt/5o6mIiINC6uxpbbWT4vWZm13CjiuBrRrvNY6zeZo+66JcME6uD531uEYRXqmtOha1gyTDiD
 v5XgKNMpjd/6nEYMaKVa+Zupw5olQBHzTd6PCLdcw5pd45higM0ONk4rcyBBL8aruLfhwOU4Cwe
 nnEtzl/tf7K5wBHfC6A==
X-Proofpoint-GUID: xhlh-vJ-l8yMCwq5bHDVtIW0dQ-ztbGq
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696b2dda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xhlh-vJ-l8yMCwq5bHDVtIW0dQ-ztbGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601170051

Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
than 4.0. Replace switch-case with if-else checks, making sure that the
register is initialized on UBWC 5.x (and later) hosts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 41 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a99e33230514..b0c97f5e47ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -286,30 +287,28 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			hbb << 18);
-		switch (ctx->ubwc->ubwc_enc_version) {
-		case UBWC_1_0:
+
+		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(hbb << 4));
-			break;
-		case UBWC_2_0:
+			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				BIT(8) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_3_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_4_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
-			break;
+			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else { /* UBWC 5.0+ */
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
 		}
+
+		DPU_REG_WRITE(c, ubwc_static_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3


