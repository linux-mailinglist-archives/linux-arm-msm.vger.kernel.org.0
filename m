Return-Path: <linux-arm-msm+bounces-89648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF0AD3A883
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5822E3063E6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674DA324B28;
	Mon, 19 Jan 2026 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7zxh3D5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwYe4Ns2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9013254AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825054; cv=none; b=cipZpc+W3tCsl0eXYXpa2OxIRdTRMYrB2mGfGBBtlM3DH4y3f9HefMJ1LdSgVp/1v2whRTsYARzunp+B6Dr+x5ZY7ut+Xlykg1BIW+ujai9kJtI0cUYB4tX2PlzxeCIwwImjQzbcbydb5o4NBR1czARDKjfMp0wJsvsiFU43C9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825054; c=relaxed/simple;
	bh=hK4mO/cagHj3HVYjVR3i3QZO8ZbZgg9vO0ANe18SGRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVJaZyaShIxhVuG9j2Cp6OH6o8PIuDucAwcYTme3sOeh6kO33WDkVNlWnm0XE3toQ4cwqHEHLInG9rsxqtJznW9x1bdU9AVwi6tNMW7TtDUXc0KbLZ8wTA+7Fr/ooAsTFYf3ZR87nJX/Vk/ptJnAmL0Xyok5BvGaE8o1CDLWSds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7zxh3D5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwYe4Ns2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7uXZ599097
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=; b=C7zxh3D5av3+lFSy
	TDVSFodXBe0LK+CdMRyvl+zIIZSy79R6llY5l4BiNEFbe/bJnLOukNGaQxj130xt
	9tymzsvPWCY+NVGZtW07cPhPfq+dklHbkGfKIWNjGDK7WkYvXD/+aE85/kKBXtmb
	hwtEkcyL1gaKRCH9KOV+64q5cl3sILjgGtV4+/a3Vxsjeyl1DGVHi5cZu6kaBEeb
	KfsucreD55oUBkp2U6T7kFQ0HQnipAdZaUTyJ7BVVR/73Lj5xnNDCuaxW/oFsd81
	tB69RpSQiTWOi1MnUAGZBTuuaeQbEvMg7ptXR1tIv2ZHfv7JH998pzkmsusAD1tU
	2z2kfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7gca2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5296c7e57so1539466085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768825045; x=1769429845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=;
        b=AwYe4Ns20XnFf4Is+2cKxrF3a1Eorm1VcfngrEfFH803AbQz9VIvwZs+Vcomvc7b0R
         xxqkFwYi2ua8ip9LRHvgK/rFCnfhWeEzCpYu+Jx1aT+WVRIHp1G8UVTHWsHRSDMmXUYx
         BN8AkOEB1H/sL3qN/Oq2AfyOGgF+Qjc/7H8IzkYQaueAPmagY++50BEeGoqERU95VLOQ
         VN0cprnaOEBYrSEPQk8rNGrq4NG+KUYC8dm16GwNuDkuE6XFf0zhXTzcgoDJ5stSLD1A
         o4HjhB4w2xX/GIfuMdnVnZFrRFjN4V6+1+qoevztM4WLX472lE8UfU1r5060NSzGJxSg
         D7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825045; x=1769429845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=;
        b=qqTimVkty0d/nXAeq9ZdnCNSFcZeW4KWEWc9AhGcTvyoDLAJUAyuwKfIjwmEaJD9yX
         rAKkdQrsuzOzitGvFtXud4T75mo0wh/sTuCnCBFTvj2dunckRmHfe5GTItYz1xO++vRw
         vbAWOy8r60QQEqbTkbnziAmU8HqXu2bTUq/A7mvAGDyrr9KqS8ne8k4CXnSlawV0kFy3
         No9VEZhcFZM54ESIHkCFpr7kIfNRmcWwJiI/p0u3Ofy6MASDMcmu5XCgARJhdkMau9rM
         UEbHqrGye9iGnwQsW8VCHDB55H/2eMHES8KcaLpE5iXqoub1aVqDGCU4PJd7hu0AYeSA
         dMGw==
X-Gm-Message-State: AOJu0YwmDmpGHKUQYblJ/UO2nSO6KNhvtuliGdbXnkSGxaGY+vuOQLXe
	+VYPSWxMJ0HaaLdQFB31l84hjzIUOTMCmLkBe9JUoCPJPN+XsOrzDJrRsoVbSmJUfxbNAZciv02
	8RdSeSMS+SId1ZmDkIxum9AytU0UQwB604pVttB8/WDYT5iqcIENdH0fpiNwQ0ltHJMUa
X-Gm-Gg: AY/fxX7awerFqKRZ2cfBqa8X8enUDm5fvSpE0ocrvzre4lVf/BdS6K/iGqW8XB6Cc+D
	uT6G2U989KjZofzKNxfVuj5aiGKOgmCgGathJ8oluvG/oNiGOj/kiwI9S9y+W6ravmq2xTAW2mm
	rL6S9a34wlFVnfNRyfaYhXQA7Oq+FR4ByHSEr4KjVPcjRrn0H1pO4yStEZWYFeyVMz+hx2JCx4T
	i0GorZK/dqCGqUA0p6sQI5Ku1GqMmxP1eVLfO7TIWOUbCVQDbdsLgCZq/NBqQFfA0Jl/wse1XrE
	MVesaR+bHPvTBx34kGoZ8fXOdTQe7CAlHU6xOd0HCU7oxEqXFyDGRqRZC34nIWhAi4HaXy8IllA
	j9gQtnfn+qr6msgNx1/3PsBnnOdgQB03o/fw0VrQtvBNrxZ5BekStyICg/TkEEhLH3+VGG8aod7
	9u2rBo3mvev3dOwkdf3P9TC5g=
X-Received: by 2002:a05:620a:3947:b0:8c5:3495:87df with SMTP id af79cd13be357-8c6a691f35emr1541595685a.38.1768825044788;
        Mon, 19 Jan 2026 04:17:24 -0800 (PST)
X-Received: by 2002:a05:620a:3947:b0:8c5:3495:87df with SMTP id af79cd13be357-8c6a691f35emr1541590685a.38.1768825044215;
        Mon, 19 Jan 2026 04:17:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:17:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:40 +0200
Subject: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2999;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hK4mO/cagHj3HVYjVR3i3QZO8ZbZgg9vO0ANe18SGRw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbiDLpqeQzOXgyf3tXynVkxvGog9EgSHQgbY48
 /KeMdsJMhKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW4gywAKCRCLPIo+Aiko
 1e/2CACcDaJ6s6kfm+vHnD/D6JZRlYJKgJpb6vVJ+CubGxlksC2JZK/iBXaKvdU435oeEqvlR+A
 Yt+GmgPjHbmDSGXVLx8gj8/vu6AtqxKz3yRy/WpPcEgOI9N2Yap9grQHG4IC1C4UPJwFHtUELzK
 CLmBgwHX8VLI/U9iqp34YeYlZLjAvpNqya8tAxv5zaoHoR+3mx7N0i1XzUmgK5OgtWFa9LYwFea
 XZLzz6LRRZH74S26+h7Ue79tjdrJ58maQ1Ic/d1syDvrKPI2ksCHPBPrPaIEoo6MhwayjVDqXhd
 gkNlqZWnjhlKc8SR1SOCwK/TmDh9XJ4m2GldNLuMdoY8AQW+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX4NbrvwCtFByX
 96+poI1NyPMfDgjsT51uqxcaP2Y7pHOdH82XBhvrn3U2w0/Z+LM3mHHR6FFqjS9yPAutjejuGCS
 vAbVELdO0C1PDEc90vGxOvyBzlAMWQLIVMX0Iww2pvjpd85nFoJBehzDLlzX5Mq0G4VwykKCOZA
 En5yAMede9uOI8wbvoN7JWOAjBrLu0K167v3F+uquwvjLKHxVQmEqzcx3PexSskjCEQ5yqI6f7H
 6v5WtkEFwaxGxjSTp9hOL75gKLcq6ILSpXrvBuyJfsf4CC/pKu5ez2fqWJZ3/Nv3iCxhJV/sc75
 pgaV2s7kPNeO/+FMqX0I4FCVaK5W8XfoDjP3B5/865i80+UknC2c2Hz8I5pYWfvZ/bgB1vZDEio
 7rc9LTafXSCwP5B+hkkYK+WO7JAwdpRrBVpp+WZUH3AtliX2g6Ozz8a4pfYa/fFm3Db4y6MTil3
 9BIer83PaorK8UdgyvQ==
X-Proofpoint-ORIG-GUID: hvu_sXdKWDrV1TwSpICIm1C3l-aloAfV
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e20d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hvu_sXdKWDrV1TwSpICIm1C3l-aloAfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102

Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
than 4.0. Replace switch-case with if-else checks, making sure that the
register is initialized on UBWC 5.x (and later) hosts.

Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 45 +++++++++++++++--------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6ff4902fce08..f275b14da4ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -284,6 +284,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -291,30 +292,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			hbb << 18);
-		switch (ctx->ubwc->ubwc_enc_version) {
-		case UBWC_1_0:
+
+		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(hbb << 4));
-			break;
-		case UBWC_2_0:
+			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				BIT(8) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_3_0:
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_4_0:
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
-			break;
+			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
+			/* SDE also sets bits for lossy formats, but we don't support them yet */
+		} else {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+			ctrl_val = 0;
 		}
+
+		DPU_REG_WRITE(c, ubwc_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3


