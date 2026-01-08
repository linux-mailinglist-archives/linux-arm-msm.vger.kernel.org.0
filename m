Return-Path: <linux-arm-msm+bounces-88033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51620D02A9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 13:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCB2130118DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 12:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17EF37E304;
	Thu,  8 Jan 2026 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3c2MTur";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTax5pou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4581237F75B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862735; cv=none; b=Oskj0+8nEq7tw/CiOhfook9hBfAKKmjgxwrzn3kdurluNifr9Gys1lc6sfO2TxodYK7wn/5DnrdXSPf8Kf+eQCTkCcNJ1sV8NKRmwFnnaCa7mlrUrYbWKOo459GnxrcKImVkrgKatlJd4Cj7LA9yGHNvifi798lv7gv10A+uryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862735; c=relaxed/simple;
	bh=rndpZ6Ao8ViO/NVdv+UngU+zzZlHfMOV5xdQbbSt5pk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IrsfNDmYY72DX6ie23XmMi23Jb4KfIsle9zaG84rQhtbazA/Yh2igiLxRLBAkAI9jT5EZ7CVLgRgHhr+mnWoTzQIh2VtJov2SJbdImcKjIUqmGyynL4hcTysNs3jNali5tQKOMaP38UNqAFMbak2sAZKcF8SjDt9orIw7OhhO/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3c2MTur; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTax5pou; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608469uP2779133
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=spUvP9KtaKx
	puV9gvU3CBlEkc10n78zM/UgyhPno/GY=; b=T3c2MTurXhuBHk2gXAbpOXsTxac
	pELoWfDyoGXs9qi9S+rXeDic0kLxWJSYHSSoApGP6qqeNMt2pbsvtEE9UyNAm12U
	I+p6Hzwt9yq0m+Zf+FDIjM4ErlO8kGRbWjYPVpn+FdPFzh5cX8JQwBJ4Nja/pPL/
	860ab/IWS46VI18ILOzj+/Tn7Heakb6M+o69T+DbGjcZgkn08ZelX6YcIFHPlf8y
	cCDZv5Bdn2mR+ZTwedglm0j991O9+N6XyFt4eZFCtp2tocsKOQ+pI0eiNhwAio8V
	0fk9/32FN/UYVA3M9f7rFfeIKJRnEF39BwBSw6u2fhL1VufFuPzBcbKStJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj58ugt9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:58:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4fc0d0646f9so116020061cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862722; x=1768467522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spUvP9KtaKxpuV9gvU3CBlEkc10n78zM/UgyhPno/GY=;
        b=aTax5pouVNGZPIVEQCYW9f4bbC1r7AoDu6tzS3FK84yZkiFsK/6UXxcaaLPwN/zDUw
         00gAs0LeGbb4B6Ae7MmdTKt1JLdmIxSL7ip3Hd8JmOqKt1qFpC73Fd05JTPkl7na9P4B
         O31euBGqRt63zMYhRNyUTNEWy56rAzQpetDI637gjnapmVeXF46JHWGMCZekqCDc6QMP
         MLigHm8hWwF8/MpfcXzOJF5O1x1K/58W9bokxfAVKnxd1Dv2mIg3WLjZWrZZd7Cl9Yd0
         BVvdnDDSeRR2SHTZrtgOfczAmKD5KUhvVso1NIgQjJP63zH/dVfyw6dj8tW/3g0smQV6
         LfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862722; x=1768467522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=spUvP9KtaKxpuV9gvU3CBlEkc10n78zM/UgyhPno/GY=;
        b=qBwFKuQ8jGTkjyKhB+hWiz88/9JtY8ckmKsy9J02mgv03nqrr2dJCxJXKjlnNw0j4z
         qnGV95iFi3k4rUhctf2c1do6hARYbsG1odCfd5pwtaat45J3rjx1M2ID20CYFvh1nMOF
         fbeZsZZI4cloQWlNbHJwcfgXcThtNVZE44EJoXcssn6eny5A3++A48SOEb01hlTUm3rc
         Byo9/XepdxaLqTIl/S6JJyMeZvD5KGuRQFuVjUBiXQ5cmTnmXEgA+GEhlQXyam96cJpr
         X18J1CvYIwp76/cgCY/fh+JL7WHQBZ7z9dFPkcQAbAhdCnc5qWMocrAN3LgStC3NcMKS
         dk0w==
X-Gm-Message-State: AOJu0Ywrv7GA/orMeYCMWJXBO7yiQWOT90NJBM3opL/xXWIYc4zbwHQc
	BnLsmju2rqSiYktiqwbbLaUpjHRIMTytRS0TOQz8dfYdDuKT+bJzbP8n2bWlqKhX0spcRTcBWYb
	EwDEUh0Njo+7VEJv6f3NA8KXkaWmlFK7xCnL+xYKLY+crNMqU47xaTVYBE057s/d9i1zF
X-Gm-Gg: AY/fxX6GSqNMhau4EtBA0SJj779rAD3vJXDpKT05G9xZ30YBkvkxxBR+Xp2ki27z/qc
	7wQLmMcDeeL/lxSwCVyybFeVgqqPlpkM6o5CS9jlY+IDLy1cRj4fgFzlMHHWktdS5xF/b+pAlcW
	UgktdS0DurZZrWKdhQ1J/kBeqxBq1KS+WpF0sBu5BdDW4edpCD8CeUmyY0sik17YHDWfOyQiYgz
	7kab3Quakm+hK8i3unz+4Z4L2UOmemZlwe4LrnXGMkQQD4ngcDb3nYgd8a8Cw1BA9ZE1ICi+i0X
	+3kpxv06wlBy3or8KpYO0V5LFmrUzQMLxodqP6pZJYqtR0Jc2eUGc/EkHZGWg1zarjXF+011vYB
	6nIgDSBkr7Yh8YR1l8A2mE5pmqgKTJzpcpC/nHXgDWxMrIkGmmhbSeW1EQRFMxN4ZdCs=
X-Received: by 2002:ac8:7d48:0:b0:4ff:9737:dd15 with SMTP id d75a77b69052e-4ffb49c6156mr78381731cf.60.1767862721549;
        Thu, 08 Jan 2026 00:58:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1h1UJUlyhZhZrTCku8ARy7se2OJDfzNtUl4xt73QUuwB1CAZY5wgP1b32MtfmrHfoqHfFJw==
X-Received: by 2002:ac8:7d48:0:b0:4ff:9737:dd15 with SMTP id d75a77b69052e-4ffb49c6156mr78381471cf.60.1767862721073;
        Thu, 08 Jan 2026 00:58:41 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:40 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 09/12] drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
Date: Thu,  8 Jan 2026 16:56:56 +0800
Message-Id: <20260108085659.790-10-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX63GUNnOdsv3F
 e5Q14PT038fI+Vtw1lo1Po9Pk/t8FydYBUmZ6yLLB9cTzBmXmsiDL5t8NMdm232Jw64TC3sjTKp
 mat+Jj2cQr+QEkUszVmO3o6SKvl7tNvqSgU/xcDGBq2P1NK2L5KirbhDNCmNJtD7EH26Xzn9NX7
 qmkxbktjoFGNn/G6bS+pP/wuqW5Hn5DBDGDwdmS3FFWsb9GEG1cgc5bgV8gMsdZrgexnUSMRlly
 35h50AT7BCy33vlMkJZ4QVKbUXSBgQs2Bdi3J6wAQuXlaZNRYqdDxcX1YR48QLWZ4+n+ng7MY8U
 Ek+FoE2inezLGgwKmvCgaBRsT7KkMBtvoDqlHMZCPPDLYfca5C+jfVKsUitDvVv7LhkNXW6kBzb
 ofmq4gUm+XLqu+8+4IOGvKXgOHjnHd1KVdwCWWlBr7bykfCzH+iZ3rLqhmxkHtzbzhfzAXQzwmP
 y0b1q/9Ag89Gzwm/+pw==
X-Proofpoint-GUID: G5GtKihI7GMd9s9-xLB1hRGJV3JjFb0y
X-Proofpoint-ORIG-GUID: G5GtKihI7GMd9s9-xLB1hRGJV3JjFb0y
X-Authority-Analysis: v=2.4 cv=CMgnnBrD c=1 sm=1 tr=0 ts=695f71c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qg1eW3vjq6ATntrd7kwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces structural changes including
register additions, removals, and relocations.

Refactor SSPP-related code to be compatible with DPU 13.0.0
modifications.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 110 ++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  52 +++++++++
 2 files changed, 116 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..197a2c584c73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -145,11 +145,18 @@
 static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	u32 mode_mask;
 
 	if (!ctx)
 		return;
 
+	dpu_hw_setup_multirect_impl(pipe, ctx, SSPP_MULTIRECT_OPMODE);
+}
+
+void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
+				 struct dpu_hw_sspp *ctx, u32 op_mode_off)
+{
+	u32 mode_mask;
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		/**
 		 * if rect index is RECT_SOLO, we cannot expect a
@@ -158,7 +165,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 		 */
 		mode_mask = 0;
 	} else {
-		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE);
+		mode_mask = DPU_REG_READ(&ctx->hw, op_mode_off);
 		mode_mask |= pipe->multirect_index;
 		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
 			mode_mask |= BIT(2);
@@ -166,10 +173,10 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 			mode_mask &= ~BIT(2);
 	}
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
+	DPU_REG_WRITE(&ctx->hw, op_mode_off, mode_mask);
 }
 
-static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
+void dpu_hw_sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
 	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
@@ -189,7 +196,7 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
 }
 
-static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
+void dpu_hw_sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
 	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
@@ -211,10 +218,6 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		const struct msm_format *fmt, u32 flags)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_blk_reg_map *c;
-	u32 chroma_samp, unpack, src_format;
-	u32 opmode = 0;
-	u32 fast_clear = 0;
 	u32 op_mode_off, unpack_pat_off, format_off;
 
 	if (!ctx || !fmt)
@@ -231,6 +234,21 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		format_off = SSPP_SRC_FORMAT_REC1;
 	}
 
+	dpu_hw_setup_format_impl(pipe, fmt, flags, ctx, op_mode_off,
+				 unpack_pat_off, format_off,
+				 SSPP_UBWC_STATIC_CTRL, SSPP_UBWC_ERROR_STATUS);
+}
+
+void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
+			      u32 flags, struct dpu_hw_sspp *ctx, u32 op_mode_off,
+			      u32 unpack_pat_off, u32 format_off, u32 ubwc_ctrl_off,
+			      u32 ubwc_err_off)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 chroma_samp, unpack, src_format;
+	u32 opmode;
+	u32 fast_clear;
+
 	c = &ctx->hw;
 	opmode = DPU_REG_READ(c, op_mode_off);
 	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
@@ -279,24 +297,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}
@@ -313,10 +331,10 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	/* update scaler opmode, if appropriate */
 	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
-		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
+		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
 			MSM_FORMAT_IS_YUV(fmt));
 	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
-		_sspp_setup_csc10_opmode(ctx,
+		dpu_hw_sspp_setup_csc10_opmode(ctx,
 			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
 			MSM_FORMAT_IS_YUV(fmt));
 
@@ -325,7 +343,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(c, op_mode_off, opmode);
 
 	/* clear previous UBWC error */
-	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
+	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
 }
 
 static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
@@ -385,7 +403,7 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 			tot_req_pixels[3]);
 }
 
-static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
+void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct msm_format *format)
 {
@@ -405,15 +423,11 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *cfg)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_blk_reg_map *c;
-	u32 src_size, src_xy, dst_size, dst_xy;
 	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
 
 	if (!ctx || !cfg)
 		return;
 
-	c = &ctx->hw;
-
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0) {
 		src_size_off = SSPP_SRC_SIZE;
@@ -427,20 +441,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 		out_xy_off = SSPP_OUT_XY_REC1;
 	}
 
-
-	/* src and dest rect programming */
-	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
-	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
-		   drm_rect_width(&cfg->src_rect);
-	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
-	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
-		drm_rect_width(&cfg->dst_rect);
-
-	/* rectangle register programming */
-	DPU_REG_WRITE(c, src_size_off, src_size);
-	DPU_REG_WRITE(c, src_xy_off, src_xy);
-	DPU_REG_WRITE(c, out_size_off, dst_size);
-	DPU_REG_WRITE(c, out_xy_off, dst_xy);
+	dpu_hw_setup_rects_impl(pipe, cfg, ctx, src_size_off,
+				src_xy_off, out_size_off, out_xy_off);
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
@@ -497,7 +499,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
 }
 
-static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
+void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 		const struct dpu_csc_cfg *data)
 {
 	u32 offset;
@@ -519,21 +521,31 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_fmt_layout cfg;
+	u32 const_clr_off;
 
 	if (!ctx)
 		return;
 
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0)
+		const_clr_off = SSPP_SRC_CONSTANT_COLOR;
+	else
+		const_clr_off = SSPP_SRC_CONSTANT_COLOR_REC1;
+
+	dpu_hw_setup_solidfill_impl(pipe, color, ctx, const_clr_off);
+}
+
+void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
+				 u32 color, struct dpu_hw_sspp *ctx,
+				 u32 const_clr_off)
+{
+	struct dpu_hw_fmt_layout cfg;
+
 	/* cleanup source addresses */
 	memset(&cfg, 0, sizeof(cfg));
 	ctx->ops.setup_sourceaddress(pipe, &cfg);
 
-	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
-	    pipe->multirect_index == DPU_SSPP_RECT_0)
-		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR, color);
-	else
-		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1,
-				color);
+	DPU_REG_WRITE(&ctx->hw, const_clr_off, color);
 }
 
 static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
@@ -547,14 +559,20 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 			      cfg);
 }
 
+void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
+				     bool danger_safe_en, u32 ctrl_off)
+{
+	DPU_REG_WRITE(&ctx->hw, ctrl_off,
+		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
+}
+
 static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 				       bool danger_safe_en)
 {
 	if (!ctx)
 		return;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL,
-		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
+	dpu_hw_sspp_setup_qos_ctrl_impl(ctx, danger_safe_en, SSPP_QOS_CTRL);
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
@@ -609,7 +627,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
-		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
+		c->ops.setup_scaler = dpu_hw_sspp_setup_scaler3;
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 3822094f85bc..df3a320a9151 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -332,5 +332,57 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			      struct dentry *entry);
 
+void dpu_hw_sspp_setup_opmode(struct dpu_hw_sspp *ctx,
+			      u32 mask, u8 en);
+
+void dpu_hw_sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
+				    u32 mask, u8 en);
+
+void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
+			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
+			       const struct msm_format *format);
+
+void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
+			   const struct dpu_csc_cfg *data);
+
+void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
+				 struct dpu_hw_sspp *ctx,
+				 u32 op_mode_off);
+
+void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
+			      u32 flags, struct dpu_hw_sspp *ctx,
+			      u32 op_mode_off, u32 unpack_pat_off, u32 format_off,
+			      u32 ubwc_ctrl_off, u32 ubwc_err_off);
+
+static inline void dpu_hw_setup_rects_impl(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *cfg,
+					   struct dpu_hw_sspp *ctx, u32 src_size_off,
+					   u32 src_xy_off, u32 out_size_off, u32 out_xy_off)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 src_size, src_xy, dst_size, dst_xy;
+
+	c = &ctx->hw;
+
+	/* src and dest rect programming */
+	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
+	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
+		   drm_rect_width(&cfg->src_rect);
+	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
+	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
+		drm_rect_width(&cfg->dst_rect);
+
+	/* rectangle register programming */
+	DPU_REG_WRITE(c, src_size_off, src_size);
+	DPU_REG_WRITE(c, src_xy_off, src_xy);
+	DPU_REG_WRITE(c, out_size_off, dst_size);
+	DPU_REG_WRITE(c, out_xy_off, dst_xy);
+}
+
+void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
+				 u32 color, struct dpu_hw_sspp *ctx, u32 const_clr_off);
+
+void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
+				     bool danger_safe_en, u32 ctrl_off);
+
 #endif /*_DPU_HW_SSPP_H */
 
-- 
2.34.1


