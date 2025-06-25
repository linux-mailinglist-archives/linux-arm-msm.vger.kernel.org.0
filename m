Return-Path: <linux-arm-msm+bounces-62465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF51AE841E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7CEF188E550
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C50263F27;
	Wed, 25 Jun 2025 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruqvgjdB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79C263899;
	Wed, 25 Jun 2025 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857080; cv=none; b=b0eThnQiPWYn1C/kUMbHFCT5NbkD7P9ru6iVybylR0bqk1HT4QdSXuRT0wju1n81UQ8ahRCNN/m1zRmofB3CfsAfUitW1jzUksnQ/ybuGqLT69H+jXpjfGEAyxCkJpuUtk9N7jIEqS2ePgv8MxorrD9wQQHXe075bTqLN2/0RlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857080; c=relaxed/simple;
	bh=MkfZzfoVVNA3pxZuMdbFXVp7BKdKAuZdCsoqILxRvRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qf28Z5VB5SgCfSyZc35i0aEEwh1jNsBcVsaJg6Wzk/MzPMlfU8rVNYRXkfKXaxkogqel4hYnG6qOZzeRugOqtqrbjCBeehmWUmeevv51t9vYK4bLdffzqrA/ofvrk8w5XaXZa+9+Lv4TU+lSp/pJk4Wws2LmCj0x8HR7rKP4uds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruqvgjdB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CE5C4CEEA;
	Wed, 25 Jun 2025 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857080;
	bh=MkfZzfoVVNA3pxZuMdbFXVp7BKdKAuZdCsoqILxRvRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ruqvgjdBnqjzAwiksbIIjr7WLNzs0VwEjeUSSyTkcc+5z0EmmxbxbeX8pEsHRMh2a
	 3Xa7rEBHaGGlaxSFkxWVU6b4OvaUI3BsI9cEh1KHHKxa1w1ScGyPTqzM1qWQ41HbRm
	 VvIlHWt+bvSQE/+WIHGX/U+7/m499veFYErH3Vvso0O0Vlpf0kL+z8HntGQn6n/QOa
	 ICq0V+IUQ0HSHhLp1dS8xiunq09PGyPSY3Tt/QmpFEIRoQgvPSRL/dbdqBAd2L/eLn
	 rjMQ13AQG/+wDr+qFNCU4D5788ap/AePqLhXnitZEq0ny7QNwojMWobSPCLnxmRmS3
	 2Icvo/6rMHO3A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:21 +0200
Subject: [PATCH v5 13/14] soc: qcom: ubwc: Fill in UBWC swizzle cfg for
 platforms that lack one
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-13-e256d18219e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=2912;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=BYjEaeP46UE0oO20FwMEmnGxDtZiOlg0yWNCSte8Gao=;
 b=CkayZoiAePy0yJDF0unY93ZXDyCSxISrgOG2Kj0wWQkP3zr6T2/4Y+sZP80SyxtX+7TYxHjQ4
 aWKedzK/nP5BFNnakHyH8WJGvuPOap9xekZ3/QaNC//cpHkOxmMuXUj
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The UBWC 1.0 case is easy - it must be all 3 enabled.
UBWC2.0 and 3.x require that level1 is removed, follow suit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 7fb18ab067e60a8443d73d31886acc344c11d3b1..dd616342acbe67a76257bbe8b719cc5d18a85f9f 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -15,12 +15,18 @@
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
+			UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
+			UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -70,6 +76,8 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -87,12 +95,16 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -118,6 +130,8 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
@@ -133,12 +147,16 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 

-- 
2.50.0


