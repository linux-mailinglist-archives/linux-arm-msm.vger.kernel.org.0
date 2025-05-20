Return-Path: <linux-arm-msm+bounces-58705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F4ABD638
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06E03B3346
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43B0281363;
	Tue, 20 May 2025 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAjht5cg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC49B27AC4E;
	Tue, 20 May 2025 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739281; cv=none; b=L/xyKAYUwWA/g0V88QAMLriR/1Iv2D25dTKU7wa0As1WYdkL4gyHrajfFfyi/v7w9HYgXOqoTwol5GDh/F0EfHKEQnMphCC761H3+tD2bc2F+9mvsi+ixEp6RVO2VeWoJM6G/XlJDc5Z//lHB25ag0mCFFpiM3QiBzUuoLtmNPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739281; c=relaxed/simple;
	bh=mo2B8wqbLHzlavjI1hMmTRp4FjFgOMx2CDKlD9i7lSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+2vZ98R9onsjJUGOeBRp9ZhV/kmJLHkmjVDIlHU9aIOK2vs4eGpVVjtmWIQHk3ix6m63i5ViQawhgezhsryqAhiJ3udwrWnRrwf/hxCP+S86AtMLUhq9DBpJ/ZbU0Bz+wgyJeKHec3cC1O2bSdSalH/z5+IXgxeyfeTC66F/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAjht5cg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE92C4CEEF;
	Tue, 20 May 2025 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747739281;
	bh=mo2B8wqbLHzlavjI1hMmTRp4FjFgOMx2CDKlD9i7lSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tAjht5cgZQk2OU6i9Mglh7huwPwN38jbFMearaOiPxcHQ5R+nUM15K6IpNxiip65q
	 goFo4/I48joSDVpywb+DcpfZyMnGT2Dp8wpZZsM/3gPebDl4H5rlY13ZYVBttIcE0T
	 HbFpoVL2LybGVOY53B6U8KPFohnI/FoVCpHAnJX1dVWgm7qZkPbd7FEYHMCGF0lX7q
	 UzVD6P/4TbHI01JSWKt13QO578ejhtOzp3Y35vTGo2j2zki7QTsvT0yOaiJEwfJXJr
	 Iu02eZr5Lu447ESlTS8mfOYE5X+Av6ZfGOd8IKUUi/xhkoUhtyE1eaeH+ZQQPEZwpn
	 EYl9lORabzMQA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 May 2025 13:07:14 +0200
Subject: [PATCH RFT v4 09/14] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-topic-ubwc_central-v4-9-2a461d32234a@oss.qualcomm.com>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
In-Reply-To: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747739236; l=2509;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=LM8XOzIpH3B+9dq4NSKSwYvOZlxavFkBCeWxr2TGXoc=;
 b=X8qj0qRNxZH9cO6kwCvG2WTHTp9IROz0X0ySV/7wYiTIkOMCXbRg9WZfMgl8m36krEBjpFSwk
 LQBmvMORtNGAElWLtkFGFpGK0u2l99F5u8LTmhAFbMbUrsSk2qkl5Ee
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It's supposed to be on when the UBWC encoder version is >= 4.0.
Drop the per-GPU assignments.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a20b57e964d31adb22f0b79a5178b45f0f5ec5d5..32017e2730a9059a16ef551363660b72d7f991c8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -592,7 +592,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (IS_ERR(gpu->common_ubwc_cfg))
 		return PTR_ERR(gpu->common_ubwc_cfg);
 
-	gpu->ubwc_config.rgb565_predicator = 0;
 	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
 	gpu->ubwc_config.macrotile_mode = 0;
@@ -619,7 +618,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a623(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
@@ -633,13 +631,11 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x4;
 	}
@@ -668,6 +664,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
@@ -680,7 +677,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
-		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
+		  rgb565_predicator << 11 |
 		  hbb_hi << 10 | amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);

-- 
2.49.0


