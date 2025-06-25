Return-Path: <linux-arm-msm+bounces-62454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0644AE83FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44B0C6A4DEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9274B265282;
	Wed, 25 Jun 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFGFEVs1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896A263F28;
	Wed, 25 Jun 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857028; cv=none; b=AC/j8uujKtniHTCI85nnEO4MhAw+qDKBBe4MdG5ZU2gAGL44QHFbRoeTM0HE4ZbzkUdeXj6nOB8ATsZsVZe2QPLFo10ItoyZCFWpGyabw7YonedSOvBxVYAbMg7J07Qui20dAV+JNenPHSLQoRvrsQlvqV8ixs1owALwSCrIUIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857028; c=relaxed/simple;
	bh=bFXCEdgVhfDMEoqkGoje5SoT0Fo4NnjqAhltzIwdUUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZzLB4BNe1zDWeYjeHIlihiC5iMxFaef58I2RaKKJowZgFxkm3si9diSc/COamz2wmxHZrMXvxPHWwVQoRv2LHK1QTNpySqxjeJGRPIFpjX9N5901XpDx8xrapRXKZDF1W3chd/Pzxuy16iGR5kA8VxL6a3r/vvbpvGWGwiOHds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFGFEVs1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686D2C4CEEA;
	Wed, 25 Jun 2025 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857028;
	bh=bFXCEdgVhfDMEoqkGoje5SoT0Fo4NnjqAhltzIwdUUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TFGFEVs1itA8cp1o1GEbTnFCKfPv0xd+tYKJ5h86MYTxGlyUyN4Idtwk+T3bVHyFU
	 nEU2lfDuUU4+sdETou3Vq0KGq95MRocUHXuAMebWtfhKY8CpjBaE1WsOnR46akJund
	 M3PanMkdY04vMDRSkA4YFwSFIvXK5+y/xF5TjCoEpz/NTihEBnBxgK+j/BlcYlfBVy
	 KCnY4x6VIUcF0wc7wqvrPuMYsPdkRRvz3paxaa3mojSd0dVgr6SEQvi58a9hpWD1o9
	 4cdtxfqlqVPlbapJHb6SsQIjL6hPeMaEicWiHDYGE36r2d6/ZSZwjxFI15ySTJk+rp
	 /y9B+GQBZddfg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:10 +0200
Subject: [PATCH v5 02/14] drm/msm: Offset MDSS HBB value by 13
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-2-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=7622;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=T2FBWroU738HI/Pia2RKVHq+4tLpLcX1tOA/9NV0Bxg=;
 b=30+gbFk908d/HvMplBO4zGFPIgkGxPk+6x6LkyzVwaqJI/EtPWIEP4LLiLqnh4D8yVecIZOzy
 ZDulj8KOxDYCUiRnxehvrVB7bo5SbbtLsa6YVuo1QqctfgzaxX2m+Ku
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Adreno part of the driver exposes this value to userspace, and the
SMEM data source also presents a x+13 value. Keep things coherent and
make the value uniform across them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 52 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 422da5ebf802676afbfc5f242a5a84e6d488dda1..597c8e64985316763d7ced763c4c6fdb5da9fb90 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -167,7 +167,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -182,7 +182,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
@@ -200,7 +200,7 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -277,9 +277,9 @@ static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_m
 
 	if (hw_rev == MDSS_HW_MSM8996 ||
 	    hw_rev == MDSS_HW_MSM8998)
-		data->highest_bank_bit = 2;
+		data->highest_bank_bit = 15;
 	else
-		data->highest_bank_bit = 1;
+		data->highest_bank_bit = 14;
 
 	return data;
 }
@@ -593,13 +593,13 @@ static void mdss_remove(struct platform_device *pdev)
 static const struct msm_mdss_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
-	.highest_bank_bit = 2,
+	.highest_bank_bit = 15,
 	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data qcm2290_data = {
 	/* no UBWC */
-	.highest_bank_bit = 0x2,
+	.highest_bank_bit = 15,
 	.reg_bus_bw = 76800,
 };
 
@@ -608,7 +608,7 @@ static const struct msm_mdss_data sa8775p_data = {
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 4,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0,
+	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
@@ -618,7 +618,7 @@ static const struct msm_mdss_data sar2130p_data = {
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0,
+	.highest_bank_bit = 13,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 74000,
 };
@@ -628,7 +628,7 @@ static const struct msm_mdss_data sc7180_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0x1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
@@ -637,7 +637,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
@@ -645,7 +645,7 @@ static const struct msm_mdss_data sc7280_data = {
 static const struct msm_mdss_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
@@ -655,7 +655,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
@@ -663,14 +663,14 @@ static const struct msm_mdss_data sc8280xp_data = {
 static const struct msm_mdss_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 2,
+	.highest_bank_bit = 15,
 	.reg_bus_bw = 76800,
 };
 
@@ -679,21 +679,21 @@ static const struct msm_mdss_data sm6350_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.highest_bank_bit = 2,
+	.highest_bank_bit = 15,
 	.reg_bus_bw = 76800,
 };
 
@@ -702,7 +702,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0x1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
@@ -710,13 +710,13 @@ static const struct msm_mdss_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = 1,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 };
 
 static const struct msm_mdss_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
@@ -726,7 +726,7 @@ static const struct msm_mdss_data sm8250_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
@@ -737,7 +737,7 @@ static const struct msm_mdss_data sm8350_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
@@ -748,7 +748,7 @@ static const struct msm_mdss_data sm8550_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 57000,
 };
@@ -759,7 +759,7 @@ static const struct msm_mdss_data sm8750_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 57000,
 };
@@ -770,7 +770,7 @@ static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	/* TODO: Add reg_bus_bw with real value */
 };

-- 
2.50.0


