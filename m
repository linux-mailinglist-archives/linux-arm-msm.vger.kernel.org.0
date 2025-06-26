Return-Path: <linux-arm-msm+bounces-62604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC6AE9993
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C6D87B30E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7496F2DBF46;
	Thu, 26 Jun 2025 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP/S1L77"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC6F2C3257;
	Thu, 26 Jun 2025 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928622; cv=none; b=mm6kZQvAf5WnvRUR8jw+zlmNwRP7bg2nL7tH0bZ8C03pW3tnWZkC3JbwMWRXPQPHmQYnsGlW5aZizyjIan2uAhTuU2YwjpQVAM6lSQPulcQdQsXB8Js0DKvn2pv2YqyceXgQ2oWm00q2M5PJ5TtmW/Ort9O2s4vpVZPc9V6Cd4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928622; c=relaxed/simple;
	bh=oaU0R3iKwphSNuRSAAGffDiChGd+4zUCEL7mWYBnsNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FU7WsRS0YVubyGZsNsT1v7fNL6vzwzN0XuD0XjjBn2Bp+XPLo5SAbp0GdEZDZ5x6DXn5R2b1opBZr20tGG6Jj9NUgnNEB2SmHXQpIewy6BLtAv2cLZjlJfLxo4g1FzYTPbkEiJ4BmBYzwzEFb7zv+Fa7wo+5pNwdufEJcpemF2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP/S1L77; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDBFC4CEEE;
	Thu, 26 Jun 2025 09:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928622;
	bh=oaU0R3iKwphSNuRSAAGffDiChGd+4zUCEL7mWYBnsNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dP/S1L77d2Mhy1/RyxGigB93MGBKrkOZZ6nEyRRm0Xja/Sfnb/o6pZXOhMG0KZZOO
	 PNrxpqB0RBfCK5l/n5/fKEcX7qk0PCkF4G4FcpF/r9ES1bCD7cnR0Q26XYBjUGVn7g
	 jeTsLrrMgWq0/lT/WKcVdO1UiEUdMmo2pbc0mxNUV0omE3DNofbMjMCnp3K7bP3OWH
	 Qh6Xl1zqu2B6Od1lbHAbKEcPXmgjOPovKMakN5sg+D2cmzG5+2VnBIJcbiTrbA/8BY
	 XIQdcw9p55gwMIlhDLpj63YjMTkQbRrUnuyjq5SIMD0viFhHuBygcZJGgPVuDBRKS7
	 am/4zHs1UKcEQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Jun 2025 11:02:40 +0200
Subject: [PATCH v6 13/14] soc: qcom: ubwc: Fill in UBWC swizzle cfg for
 platforms that lack one
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-topic-ubwc_central-v6-13-c94fa9d12040@oss.qualcomm.com>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
In-Reply-To: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928557; l=2912;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QT6oKETVTxmrbmRgQZlKzmJjSDEXKYrMWVBeSgQJSGg=;
 b=yV4/qNS4Yp/CZ5/zoCdrDGZ9YFeAKB/tQkBcyocsIO2DAZMBUnZIs3vF0YYuaCdWbCRc+3FGx
 VyaovJPOTK+DjRTKywiBAHk7GHHp+aq8Qv7d0YcPbaU1/bbi2mmt609
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
index 816bad6674ab6fc61ba0d9ca5d8581f2b61e53a6..bd0a98aad9f3b222abcf0a7af85a318caffa9841 100644
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


