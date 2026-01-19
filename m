Return-Path: <linux-arm-msm+bounces-89578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA412D3A127
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DDAA308458B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D84233B969;
	Mon, 19 Jan 2026 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHnZHS7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQlpK8Ca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13C33BBC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810494; cv=none; b=DdknyldzbdoJ8nAP4VZLAm9zNRIeCQa8Jm2QG0An65/hIx85cjCNXRjl4aKgbt0sjEiTPhZho38gs/YuKw20yhWKUQotv3LwwVnhgAQBhC6RtqZNNFe+b+Y/HfinMFye4hS2h/4pe5lZvtU8oMr0LHJe6d51OdwDhXD5hCWscrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810494; c=relaxed/simple;
	bh=Irf6GJDAnKdRVE5ZDTRsZj60m1BLdF1o4/Z3RDY3HSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKSiJm/Q5KSq51biNxq0ef0x9HNiiZhLpLjVgI8m9lkvF4tTAJ2TY2brubDwnhVQB0edF+KLoHyrDI+hr3BpfQNueYAZ93NJHLAp7C4ZXmBDkGVI59H9xQtrK4EwKbZRzbK4UN/U1FllPsLQzFcB2bLRgw8QqKfFdXBG7P25foI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHnZHS7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQlpK8Ca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J1djgv4134409
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yEA5A7r2kJllLC6PuaIA9vsYW7wCDvkUCbOlZOzUws4=; b=QHnZHS7ylljx+36j
	RJu3Ldx9sPlBb00YKfVCuwk0OLv7nFQSx+8oAz0LZZNjIUM2pALQzUwpaJkhyZx4
	IIiTMA2Ly1FA7Lmy+ktuGahnFRJhNYfGctlZ+1hCLDj7mrowv6e3ZUNWRuGmgfn3
	ETN8P00zeej8sXnabb3Q2N69w+11YhQJX2b8Zg+eFPClfI6ioLfwKb6Kyj3s64Yh
	+bC6vcGqhB67b2ZDBujLw0s7C3qxlL9bk/JM/ahahYsFiD/WrqcTZOhlaLNWohkM
	tQJx6QuE3e5tTRgXf0Dxk/e9Em757gUpqc8dGs6HM5rPERa2nGexvS6VjIvj5y0b
	lUMgCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4ys0b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8905883e793so120167406d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810486; x=1769415286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEA5A7r2kJllLC6PuaIA9vsYW7wCDvkUCbOlZOzUws4=;
        b=IQlpK8Ca7LR2bCsgdJtckBSD0BP/zhB80zhy9Eg561AA54L6/CDF+FOvTmwIu8H4n1
         gxlBSy0kfhS0SuqZWNccg+1WMqlHuHTzwz5li7pSm3vBXpfYOKpCnfKKiKPDSyMNg/EQ
         g0Y0BgjhtVnWCwOVmTxOUGOHI3PMRNr5gIxWx4O0jXSq4WjanpwD/02jl//UlU95Sp7Q
         c2ONsdU7bvXsguSewBpCpB43KcesUODyg/ns4bg3MRCNOcTf5M8BGiFxO4slZZ+614tX
         N3ZXkx1mjk/V8X/3T/dtuNyq6z2mjkPsCPmTXCRU89m8FDMbNVSuyqLwCr10IDpP/YFz
         ADoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810486; x=1769415286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yEA5A7r2kJllLC6PuaIA9vsYW7wCDvkUCbOlZOzUws4=;
        b=bgH8bZ+sCH31LJHzfJphuI8ki63xrB4GnKdqVobtIDFBrO3xCbjBvFQilihxet4tbn
         HitgQuILQx4CYqxguzYePuJitgtRVOHTbb9Qgl0U6E8WwbQ/+0ct/zUqh78xYOXBKgPm
         nUFONTYTD20NfRztSFP+HdZ1DW9H0Z9I1lhAl/c5xJ9C7E/4utr5Tvnk6abH47h6/pMG
         g95fHLNDat5dy4w846zn3ipA427feLw1S4SSKwPDT7Bbn4g549S8K+oKb7CZjJJ+Ms01
         AgB2+0oUTbON40tsZiQ0jF3tye18kxIjgOf092iaTvh5PNGQLQ78l1D7KsJ/HtoyNyVK
         p26Q==
X-Gm-Message-State: AOJu0YzvPTgsF/mI94zCBpDHogubgJ8RALv1I2wm3IF14UsPT2X6Zv4k
	9rAWzpSv3rFNcrGNfaQwCekeJ9JF9FVsdaYUyBfj2+ssWvgVu+RZOveoqjgGWreVjk4VcSiR2a3
	GUH5qPQD3VhTibf3x/d+DAl1Ag/sxUOwsmeb+/adHY5ECEfbPYfQXx5rnQy/Sgbj+oQSt4KwjQL
	VD
X-Gm-Gg: AY/fxX54c1ay9n6Yg+U1nmGf9U4pUoJ8ptT3beRxqC+uoWiR7W1wyhd4f77kwNK6F00
	9tHHD4js4OgO+5ltDeQXe3S9/IsK7QJy6RsT21J6AoYPph1HXRXfrdrOQ0UWpFSpy+nmPS7W5/V
	ZCKxht3TnAMxLIMlTud9LiZDUN6V2DKoKetlzucQfHwo1hehF+a9Tog0nhuvR+piJ8muTy3Few5
	2vaL8NnHS+yE3O6So/RvbegFrXg7t80kFEjAuOSPX+M7p0c+g1hDEi0vHsEKm1EuQtilKqRR30h
	t5cfZafAdSK5a+7gItt/sz0LEyne/yc/CPHs7sDp7sQYZZS9jM1PwxLwDFQL/2REWN7V1a2XOQf
	x49nYjJmy7Ye7g9Mn3+aIrD0revLtvQwoy1nhtT3rwL2KRyjwIhfcm9D0+D5X3ILR3uzGOd01oW
	uD82NsQAnM7pLpR5HXugC8K9E=
X-Received: by 2002:ad4:574e:0:b0:892:7075:5743 with SMTP id 6a1803df08f44-8942ddbbaa2mr140094936d6.45.1768810486575;
        Mon, 19 Jan 2026 00:14:46 -0800 (PST)
X-Received: by 2002:ad4:574e:0:b0:892:7075:5743 with SMTP id 6a1803df08f44-8942ddbbaa2mr140094746d6.45.1768810486138;
        Mon, 19 Jan 2026 00:14:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:14:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:40 +0200
Subject: [PATCH v2 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-4-e0c8c630fdd3@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Irf6GJDAnKdRVE5ZDTRsZj60m1BLdF1o4/Z3RDY3HSM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bu8/ca+i8f2sd4NaovzTpgGcpeVn9k/lIfT1v9BG3N4
 C+31Z06GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRJWLsfwU7eqScwlR21Xbr
 vmDR+l0tuTa063IDw+2v2U26IRMnCe7cNm1646kbt+JOLdTdHDv/5pvdt6o9puw9vi64jP/2r5d
 lZttfTWaWlPiy5qCkzxVH2Z2MTTEOE58WCLrWXk8Oi2kOOSllo7Pj9+RbHImGC/Ijmm24WTSdtl
 zwCd+4nk1IKnO689On/FnG3VtY5tckHpTp1eFeUrY6U+5yjbPuXsO8A+/zXD/dm7RKsPaij9eCp
 zKtEodVU2p2LpwTefa5H+e2wzZrb+0u41nZePj15Abdv967PliqG6kdC0pzU3vFU/JwsZWT04/D
 z+dOVvhwPilRQNisy7ROIZDHJlDD65doXaawRfKtTcfLAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696de7f7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX1DlWzBVDl6qH
 kqGiIghIoWwIK6kM4WLLxFF7dGxmd8M8i6v4l01YOdUMLGa2nlpJjIgrfEl3xjmvKGuz+3yRUpo
 FddRI+hczyDxklk0QC8UoWn0c6Z3Rkth0UDE1K0BqvHEHi5Es3gC7xtYwm2uIC7SU7DmQ1AQQBR
 U/RgjbMZPbTk/egBllDNVMKIcAaWgNLo19PfcvQq26Yak1RDc1jI11EvvaopprN9wSZBgEG8Y60
 5hwG2p9aE/KBLSfXMKRmgUxAnRJxClT2QsndNnILDeGVYk3YINML6qVdfX0sgd7jIgwCEJWP6B/
 jFGouvjEg7lmi/SjC9nGma5QblN0WUn/J6GPd2BiOUIwOo4VhVbqPI1ew2NDHA4USGTDVmxv79h
 uaSGaYV44tox1H8FENeaGy+Idk3n5Ehlz/aod7OwYUZlVtFEH/7xTGIC4cPhOM1yTW3Dh5sE8Gz
 fzF3po9tVKUEPikfT4A==
X-Proofpoint-ORIG-GUID: THHAqzn6l9T_GzRsN1tMd__L-0giz4Rq
X-Proofpoint-GUID: THHAqzn6l9T_GzRsN1tMd__L-0giz4Rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190066

Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
than 4.0. Replace switch-case with if-else checks, making sure that the
register is initialized on UBWC 5.x (and later) hosts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 44 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a99e33230514..80a9fb76b139 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -286,30 +287,31 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
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
+		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
+		} else {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+			ctrl_val = 0;
 		}
+
+		DPU_REG_WRITE(c, ubwc_static_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3


