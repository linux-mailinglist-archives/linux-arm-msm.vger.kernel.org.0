Return-Path: <linux-arm-msm+bounces-89496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A69D38CF2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 07:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F04B330443F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 06:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BF632C957;
	Sat, 17 Jan 2026 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2gYMz8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ov3BPqlM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300141DE894
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768631769; cv=none; b=Ys0GwUXuoGmvRPd0zR+L8Rkf/IJ+lz0Kp1hVEMf7bqeHWMgxh2MbaHwEKmh0T8uYB/H5rzQhCTN8wqJJLoWEuNKwkbm6UO5p+OcvKh9o+jkoDFKlRJhhibdlSVGkQ7NlHOnz1aBcrwQRCCMuCWtiT5C2BfyY+zhLy5F5IhEDQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768631769; c=relaxed/simple;
	bh=nlqM4pS5tehTmTBqQ+prrjj8JpfEcAuwIhsTGK973JQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZ+Im9kd6BN4oK1ntQCXUQGD9Qmex7LP6lI4CVm2IF5vx5ByCKyYLOoNTDKcOd0+8h/HXC1oR8sAGJ2e2CLn/sPu6pkaQjmP3gxic0ZndD8SMr/sCViV22CBsTuhXij41FdBf7Z2oVrLR5a93QboTILDy8mfxO1CmD/TE4qFKPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2gYMz8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ov3BPqlM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H3WM102926874
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=; b=T2gYMz8j2ONQNJ3o
	hWYBszQOTJd/zdTcGiIVqNeTY9BYcS8tQpzgJc8quajCh3nztuRGf51hcCQQMWYB
	dsmWdjOJjLCdIndAxduSTqHlQEj3KoDIKKuctKL03+Lmz+9cVtVyf7uvCw4lsTfW
	2lug7JVRp4opxaTQQEgddhUBX+NxuvHNvm5cRVrKZcgxfpanp2mC5l615suczTos
	His4Mtz+vt3dtsZ7vaJ+mSXhhUlRs1gomgLqBTYRe+uhqAEBR+pd7TEcMVrS6IMT
	HwsFYUFrS/3iYripUxZfzpcwYj6SEpyiZ4ffiqMnowPfEeHeYVGagtUG98ThGFJ6
	6rBn6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2ke0a6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52c67f65cso960781285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 22:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768631767; x=1769236567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
        b=Ov3BPqlMJDSXuKAs0/bRuaWH2MhegDt2Bd5cwdmccCOYpPTWI4J2qVW9WJUg8UnXh/
         AWQMwNXvlk14lMwQm4+d44QTvUXEpIp9pHAzUH37L2rkFST8c3OJN8XXlh7erACjHjFr
         CbX6eY1zNpGDg7xmu4awWsI/rYQzrb/O60paBCAJsiJkCoSuJ5YFzd2DgGGOSjXWCeNK
         bgi81L0IvvJgkWpX7sQEBC9EXb2sSoicgingNFTVcqplTFwM0HrmshQWS4ILRRNoCWoT
         ek57LwKNh28NswUoNn7BBL/i3s/ThMfxOCUImSEn+8N60fGkWuWYIXsskI9grM9VAryX
         Kcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768631767; x=1769236567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
        b=ZtqgYuTV9tmtJX7fBHrBCkeYOAuQf2RRcKn3DB1ZxbqFsthwd44rIc6FnacXAGBVT9
         F89HdJCItNzmGGHdWnNgSfdUViVX1swNz1ZuWRd3m0AoQK9sHOi3qZRPanpE3hihkxFI
         u1kWOaQ3y0f7XaZZ9ANQtDrpHQ345IkrC1AxGhlshzX9HKrMyCHG6a/gdsrp+3EeyYm0
         dwli6FjT4ta3pGXY1lTKC9I2xkPEmoB2v8HbCcSE/XZHFxaHSitgj2booAcc3gzO3iGw
         3N9VQGaKrWAc1Uds2HygxRWnobq0mgaQYMvnnK6YEvsbKzTZE2itOFqaDjVewxhXUOTL
         Mr5A==
X-Gm-Message-State: AOJu0YxE4hMJERLUgNtTyMRgsppZSAIE5SxJGfZSnSH1QossWCPZ6Gx7
	CG7M2tIFofw8RE6t9FvPMG/OuAC8z7Sc+Lsjx9EMjO2GGU40KU4dngJnt27BjaSiS8Jf/EqzFK8
	ggw6iugBH0VO+8YAu9wXBuYLNUhP9CU5w1LEuaQDKX6Wp9tOM2BLcU7JmL+XIK9q48FgW
X-Gm-Gg: AY/fxX5JEBdP7qmbPCWDs2q4hQf1ZGRtVaA4CUseRjFRI73gb1FR5Fk1bjBtuiRZJjO
	XFJDon7uI5rSodauWbYl24X3vowCoqROr6pFIydpQYrBVB4AuBtYAb1WhZrVM23NyWMdnIVMLOK
	2QjwL9Orh1T8w9F/BHIYXOff+SPrtMS3G+B+IL/PEGAd6mG63SO4W+g7cOHfanAaChruwW8hOYn
	fwNWITWYeogmI4PKZhhv1Y4gttWWLv9e3Xd89cuB60iE6Q2D0TK9GMKpz9Wf7Tt6OUmhRXncBHz
	a39FvkTg2cpgaMYwv23sqEYATrOibLqvQHs6wTWxl+WpobwGTiMC0x9ZUcovfLjYl9f3FgJofkF
	lekOPC4uGtJFdtHslVh5pw9F+BsLxE7H/vSQ9hlIVujGw/5/IpLLMUAXe0smzZkRNhi5Gwh93MB
	zIMyr/v/dtASxUm9eR/Wm0MRM=
X-Received: by 2002:a05:620a:178d:b0:8c6:a67e:61bf with SMTP id af79cd13be357-8c6a68febfemr761758585a.35.1768631766667;
        Fri, 16 Jan 2026 22:36:06 -0800 (PST)
X-Received: by 2002:a05:620a:178d:b0:8c6:a67e:61bf with SMTP id af79cd13be357-8c6a68febfemr761755485a.35.1768631765900;
        Fri, 16 Jan 2026 22:36:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:36:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:56 +0200
Subject: [PATCH 3/4] drm/msm/dpu: program correct register for UBWC config
 on DPU 8.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-3-d5c65ea552c7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2979;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nlqM4pS5tehTmTBqQ+prrjj8JpfEcAuwIhsTGK973JQ=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlrLcuiL8MkgPFSm3o4qmPlZP11oUebtpgD/SJwLhgu7To09
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpay3LAAoJEIs8ij4CKSjVQw4IAInW
 3Ud8Kly5piacDGSG67f1XD8kBrTVNYzH+daL0OOoid1NYcYu+6e04YS1FRmgxV9A4EMbieuVUiJ
 5JTH55BdEJNXMZCNGe6+hk/brfvRNlpgP2YiM2Xda6EFSBqxHPQj6Bgs9FjphEdFveUDbAAf8HO
 lDXWEnWNQX48uXCcghWrquoJfmfNNyVDu8h9H3wZcfFiTpYMyerxioJDhkYc+DMAaa4pXp8vyWC
 A+NcwUIrQFBaQyBvebJrJ0fP27Bum4GSHFf+c7iwbMU/0mXF0cBaOrdiu7Mo4KZTlWKOGjGZptO
 LibpxAowXKlxsSSbSIwY8e5G7cxM1YMFJDuD9Ys=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX/Gkj1C2DUSAu
 OmP43LlToCgtHtWrJRK9ZeDU0rbk/JHKy7F8OtVWcYm/xuUcMn5p+i6OCdnqoRMKTd3LkYI5/WN
 BTe+ZhI8/Cue+5q98x31p8Mx0FnbfzqK263MqxPwefb8OQtqWSH582LdFo58Y/1Ylq7f2sC8SuE
 GYp9nlWiJWlb0LU4o7fOITwQwyFHQr7qN9sU1r6brOvV32EERkr6Pe7LRWyiFN3hUCT0eWrbaam
 EziYqxPcmDyaAvrX4GLCx4qTcr9pF4EKPvkc5ZwkXusrUU71W610CRDlXX520DcL9P5/RFj8M2C
 +iOxRHvaStaSdDX4uf6T/tQLDOWfXeZrQCoeOFC9nUrZPanmfe7wE8Xo6sXpfWdZ5xAnx6A3aXl
 lvtYPZS91rn13HGUgd8wuxOW5fR4oBTezFI5lYGbOH1g3g/qGm6BFaClNZI9QMgLF+4vBfBX0Jq
 dakY2PGnLnJD+V5q2Ww==
X-Proofpoint-GUID: erkwVvtaodDdU1D999vB0E6DGYgk3WzJ
X-Authority-Analysis: v=2.4 cv=EJgLElZC c=1 sm=1 tr=0 ts=696b2dd7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7tap2HhiP8zdS8EL3YEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: erkwVvtaodDdU1D999vB0E6DGYgk3WzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170052

Since DPU 8.0 there is a separate register for the second rectangle,
which needs to be programmed with the UBWC config if multirect is being
used. Write pipe's UBWC configuration to the correct register.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b66c4cb5760c..a99e33230514 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -72,6 +72,7 @@
 #define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
+#define SSPP_UBWC_STATIC_CTRL_REC1         0x1c0
 #define SSPP_CLK_CTRL                      0x330
 
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
@@ -215,7 +216,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
 	u32 fast_clear = 0;
-	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 op_mode_off, unpack_pat_off, format_off, ubwc_static_ctrl_off;
 
 	if (!ctx || !fmt)
 		return;
@@ -225,10 +226,17 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
+		ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	} else {
 		op_mode_off = SSPP_SRC_OP_MODE_REC1;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN_REC1;
 		format_off = SSPP_SRC_FORMAT_REC1;
+
+		/* reg wasn't present before DPU 8.0 */
+		if (ctx->mdss_ver->core_major_ver >= 8)
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL_REC1;
+		else
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	}
 
 	c = &ctx->hw;
@@ -281,24 +289,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}

-- 
2.47.3


