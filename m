Return-Path: <linux-arm-msm+bounces-57864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3E3AB6F70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C15EE165FA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A757270ED7;
	Wed, 14 May 2025 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZq886+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519622701C5;
	Wed, 14 May 2025 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235515; cv=none; b=j/l2FDjgD4ZjrNzhlVOQfc0WXbRLaBxmWjIuColC/3mzQ4t9Fs1rDgKCXx8gewEOEw4Mb823duCQpuNHTG8oIG4X+pJ84yQ9BhT9NZDwlEgC2WfAdZYCrYLs0NR5QFG7BmmO7t39LbvVI7xtw8c91pKDii1PtSjYEM06d4GzqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235515; c=relaxed/simple;
	bh=I5INupvxZovL47SmzAQjAmdQlOM2NhepqdTC7MSAgu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNmxY+R04HZlyxQ7KfrUWaCsWn3VliwMqTRDKsgprKxVn73I0vqpGCwrm2ve1KfpfZwJoIOmfXWGnTmvPv8eJmmW60nGsXAzVcwwAfDHuv464ztofALBDgv8Hy9P9Aun4CQdUhkrdHMa9GMUXhjhhHQ/WYDhm92f+K/dvkFeSVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZq886+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA04C4CEE9;
	Wed, 14 May 2025 15:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235514;
	bh=I5INupvxZovL47SmzAQjAmdQlOM2NhepqdTC7MSAgu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KZq886+vVCPM3rUYOD0xEfvuv2v4I3Hpc++mgTtfrK09PySBX7XANsXurVCJ8DnPm
	 hxpgFNRHK/t3yyLybCQQGcz0+sMItqDKGwO3OKVfHdsfsfemXGVHU0X2Uy7ZzF+Z9k
	 6vfs+uh6Y60P6knw4/Cg6kJALG8mpuDJmbhYT6lIFfP8NKA/deExm35bsmvxpu3Za9
	 KI1RIuhaZ12EsmztIDYUH1mKX1apyVFRbH5RgSeQmlF4Q1y1o3w1bhTnxQpgweQeBV
	 saWHWRY60NkTnZ1Xw+85MrlzPTFUEYHF23fyqdwKFkROOMDYTZIcz/bCxn8I8VucNz
	 /JTuZuNFNVlzw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:34 +0200
Subject: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=5575;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=eJVjVlPJmOSKBeEC55UDPEfsFOdqp+eldoqACi9JHOw=;
 b=e2sUZ2vfCD6EdTUGCZsbJsTejI0ofaYCC3XTzTAIaJJ/vouka39pG8WRk08Pc58RPgUYpFZEh
 T07oz039+u5Br19zUsv4n8lwo/Yb8JwwFlPK6VtiTzfA/dPn9HHDc3s
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Make the values a bit more meaningful.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 33 +++++++++++++++++++++------------
 include/linux/soc/qcom/ubwc.h  |  2 ++
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 96b94cf01218cce2dacdba22c7573ba6148fcdd1..06ddf78eb08d31bcdd11f23dcf9ff32e390d2eff 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -32,7 +32,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 4,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
@@ -41,7 +41,8 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
 	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
@@ -50,7 +51,8 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
@@ -58,7 +60,8 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 	.macrotile_mode = true,
@@ -74,7 +77,8 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -95,7 +99,7 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 7,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_ALL,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
@@ -103,7 +107,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.ubwc_swizzle = 7,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_ALL,
 	.highest_bank_bit = 14,
 };
 
@@ -116,7 +120,8 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
@@ -136,7 +141,8 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
@@ -146,7 +152,8 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
@@ -156,7 +163,8 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
@@ -166,7 +174,8 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 static const struct qcom_ubwc_cfg_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = 6,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
+			UBWC_SWIZZLE_ENABLE_LVL(3),
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 30d9744c5d2e06d4aa93b64f7d2bc0e855c7a10b..2a12e054ec62ae7e76c3f3291d6963da726eee4f 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -26,6 +26,8 @@ struct qcom_ubwc_cfg_data {
 	 * controls level 2, and BIT(2) enables level 3.
 	 */
 	u32 ubwc_swizzle;
+#define UBWC_SWIZZLE_ENABLE_ALL		GENMASK(2, 0)
+#define UBWC_SWIZZLE_ENABLE_LVL(n)	BIT(((n) - 1))
 
 	/**
 	 * @highest_bank_bit: Highest Bank Bit

-- 
2.49.0


