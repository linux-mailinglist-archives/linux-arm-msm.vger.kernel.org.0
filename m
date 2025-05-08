Return-Path: <linux-arm-msm+bounces-57307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7286AB0259
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33CD11893EEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CB3288507;
	Thu,  8 May 2025 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wa1puvwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2B62882DA;
	Thu,  8 May 2025 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728028; cv=none; b=Qp4DEw5qqq5p0Ze4puxxzs+2Sedwm+vpTuSjteTfJ5ZpZXhehtB05RUBjJ/PrYUIwzCFeQ4v8OIfCOkXdhf6+OVZzhzQSsKCr9VZZAtYQz3udeKoR/pBf8XQBqFMnUWfPvDsY6pEXCYXPq4U/8xefjXuXvlVRHn2wMb7YuKcWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728028; c=relaxed/simple;
	bh=2n7Xb2GJXoTNjWVaIHHp40CW/ySKabjkTPPfcRdF8Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dd5wTIEUTRxg6T8AxOkIFPeGapikbXTQBUXjL1Taw6F5qzIRsUpfbikM+LrxfaZF0PfgGYs8juDXRanFnF6uKeSdsGTO9ZG2Az6OLDLDW+I/WcvD83Kzg7jltNqdUspFFx6qtD/LVeNxrE6T6E9SqcIxoTxGwyNXF5EVuQ+HiZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wa1puvwD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AB7C4CEEE;
	Thu,  8 May 2025 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728028;
	bh=2n7Xb2GJXoTNjWVaIHHp40CW/ySKabjkTPPfcRdF8Bo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wa1puvwDmCcCVzB2Q7vCb9WwMlWHqsSEuRptmbcyVSDOG64qBwKV/w/wRKnPahAog
	 YobzLJGDsJ8lDpKsqu6z6/x0p2soWZ4xGrPfV+eSOgRMlOo1fd7PYeV+/c18HxXvew
	 EhdABdbS+7O3FFyXrQAf0IJ3VGJ5Ta9mtXdbBHmw5wP7jGD2qBkR0JfWhwezSr10aH
	 XJMdsrSbocJ+xKvL0n2lNKOK/ZWuNvysLGBj2Del3RON8WKjmS2UHGZQxDtZrJ36QT
	 AFkb8O5rBVn3SvVoQBdl/+PQrNdv+eWwkWgokO+V69OkhZeIkNnYOOLIjDnEcsy/q/
	 W3VsXdiaag/xg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:37 +0200
Subject: [PATCH RFT 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=3021;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=lOOhIGMEMtxwXLn8PJZj5/WHTRWR+s+rfoTJ83oqth0=;
 b=BvSt6fXsK771Xd7IXiSXaieaVN4W8J7zyUFJ7ELrDpEtPQXG/z8WZoKKlFyrGrtiG7vAZCyKP
 0BlH8exCmp4CcuzaAVXNOfAy8gNQ0T5JBVQyhtgSzFQuLRah+Z3w1wT
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
as a separate field.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 89eb725f0950f3679d6214366cfbd22d5bcf4bc7..5fe0e8e72930320282a856e1ff77994865360854 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -617,21 +617,16 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a621(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 	}
 
 	if (adreno_is_a623(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 3;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
-	if (adreno_is_a640_family(gpu))
-		gpu->ubwc_config.amsbc = 1;
-
 	if (adreno_is_a680(gpu))
 		gpu->ubwc_config.macrotile_mode = 1;
 
@@ -642,7 +637,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 3;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
@@ -650,7 +644,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
@@ -659,7 +652,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_7c3(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 1;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
@@ -675,7 +667,9 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit;
+	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
 	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
@@ -684,7 +678,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
 		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
-		  hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
+		  hbb_hi << 10 | amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 

-- 
2.49.0


