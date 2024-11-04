Return-Path: <linux-arm-msm+bounces-36963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A12F9BB8A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 16:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258AB1F21F7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 15:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CBA1B21B7;
	Mon,  4 Nov 2024 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmkuydGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC034A08;
	Mon,  4 Nov 2024 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730733061; cv=none; b=GaAsv9wYP32vaH+NyZA22JkWUTa7I9Js3F1RCiI9/LJkeUzX1i31LrLFqw6Ta/qkDmSVfyvueH4G3r95An3QMiM9NoEJINGXezE+RLp1oMthcQTpwxBJLNhOmUpcU5dT20LTy2+s3gxgtz9q1eYolmFohjaZDrzaindkF4LLve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730733061; c=relaxed/simple;
	bh=bbxL55ej1fJpzc5IyybWkBIoqYVKwxL4tVm6wKg2dIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kcF5ZPfZnLn7Lbw9Oae8nv1C6EQ67jYfgqA9LsAuSMCEqTbaq3MGLYhmiAOA2M1qB7oJXWY5dimI2L5IxzuqGR7fnRpj5MQdzxmhYGb3N4YdErrWStxhBeyB7r6FcmnVqeuuj5cL2BWeOySqN8QKBJRSjcJYF1jnO6yVo9+Z2Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmkuydGB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FC5C4CED1;
	Mon,  4 Nov 2024 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730733059;
	bh=bbxL55ej1fJpzc5IyybWkBIoqYVKwxL4tVm6wKg2dIM=;
	h=From:Date:Subject:To:Cc:From;
	b=pmkuydGBlpLuaueHhAaRhlDARdbZx7m6D6suikrwWAtMVYWbAEolrHUfLHTBDUjkk
	 w4u4HmLhWxdAD+J1fMYvjCj73ICJyxHBzOByZfEbhJL9PQyWBkv7SuLl8UcrmZqzYk
	 nhzHiKQISaQgUDt6ehLVG9h2JmF14tLwqKdFvRxR/SC/3AmgdH27rIzo5KPG8z+WS+
	 2ZMxlZYGg+DKbQiJQ6paYv6nPJ2X/KD7JgKU0mJnm8BYoSdYBpzBqgbgGop/7+KVmB
	 u0jWPVwcvoXXrWxI/bkgeRpMCotE3M8dphIVBY2sPI3wPqIF1LfpbtkI86U7X5rmBA
	 10+LlnoTYt2ww==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 04 Nov 2024 16:10:53 +0100
Subject: [PATCH] soc: qcom: llcc: Flip the manual slice configuration
 condition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-topic-llcc_flip-v1-1-3003c846d131@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPzjKGcC/x3MQQqAIBBA0avErBNULKOrRERNYw2IiUYE0d2Tl
 m/x/wOZElOGvnog0cWZj1Cg6gpwn8NGgtdi0FIbpaQR5xEZhfeIk/McBXZWS2zaxToNpYqJHN/
 /cRjf9wMCbrMSYQAAAA==
X-Change-ID: 20241104-topic-llcc_flip-c8720c56b7f2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730733057; l=6838;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=F+Rslf0SZN+x3vFZjIvMAPqOTSQCYVtS+KPD8ujn5bs=;
 b=iy6Qp9kzOWDOArZ1GA3bIgkZlPoyycq64a5hc7PPlUP9qP7KrSH5pmQmw5YEXGIlAEwnbk9bw
 0vOm57cCf4lDIrl5hGC9l6d3Q7gnqqooxRuR5AnVeip98uCIOj6a3lW
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit c14e64b46944 ("soc: qcom: llcc: Support chipsets that can write
to llcc") made the code not configure certain registers on SDM845 due
to firmware security policies. That turned out only to concern SDM845,
but the condition was chosen such that all other entries (for SoCs that
didnot need it) were required to set .need_llcc_cfg = true.

Flip the condition, so the default is "doesn't need the workaround".

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a470285f54a875bf2262aac7b0f84ed8fd028ef1..560c2e5d0b6bbaca32a7cc54fd086b22017be22a 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -137,7 +137,7 @@ struct qcom_llcc_config {
 	const u32 *reg_offset;
 	const struct llcc_edac_reg_offset *edac_reg_offset;
 	int size;
-	bool need_llcc_cfg;
+	bool skip_llcc_cfg;
 	bool no_edac;
 	bool irq_configured;
 };
@@ -2650,28 +2650,24 @@ static const struct qcom_llcc_config qdu1000_cfg[] = {
 	{
 		.sct_data       = qdu1000_data_8ch,
 		.size		= ARRAY_SIZE(qdu1000_data_8ch),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 	},
 	{
 		.sct_data       = qdu1000_data_4ch,
 		.size           = ARRAY_SIZE(qdu1000_data_4ch),
-		.need_llcc_cfg  = true,
 		.reg_offset     = llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 	},
 	{
 		.sct_data       = qdu1000_data_4ch,
 		.size           = ARRAY_SIZE(qdu1000_data_4ch),
-		.need_llcc_cfg  = true,
 		.reg_offset     = llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 	},
 	{
 		.sct_data       = qdu1000_data_2ch,
 		.size           = ARRAY_SIZE(qdu1000_data_2ch),
-		.need_llcc_cfg  = true,
 		.reg_offset     = llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 	},
@@ -2681,7 +2677,6 @@ static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
 		.size		= ARRAY_SIZE(sa8775p_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 	},
@@ -2691,7 +2686,6 @@ static const struct qcom_llcc_config sc7180_cfg[] = {
 	{
 		.sct_data	= sc7180_data,
 		.size		= ARRAY_SIZE(sc7180_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2701,7 +2695,6 @@ static const struct qcom_llcc_config sc7280_cfg[] = {
 	{
 		.sct_data	= sc7280_data,
 		.size		= ARRAY_SIZE(sc7280_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2711,7 +2704,6 @@ static const struct qcom_llcc_config sc8180x_cfg[] = {
 	{
 		.sct_data	= sc8180x_data,
 		.size		= ARRAY_SIZE(sc8180x_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2721,7 +2713,6 @@ static const struct qcom_llcc_config sc8280xp_cfg[] = {
 	{
 		.sct_data	= sc8280xp_data,
 		.size		= ARRAY_SIZE(sc8280xp_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2731,7 +2722,7 @@ static const struct qcom_llcc_config sdm845_cfg[] = {
 	{
 		.sct_data	= sdm845_data,
 		.size		= ARRAY_SIZE(sdm845_data),
-		.need_llcc_cfg	= false,
+		.skip_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 		.no_edac	= true,
@@ -2742,7 +2733,6 @@ static const struct qcom_llcc_config sm6350_cfg[] = {
 	{
 		.sct_data	= sm6350_data,
 		.size		= ARRAY_SIZE(sm6350_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2752,7 +2742,6 @@ static const struct qcom_llcc_config sm7150_cfg[] = {
 	{
 		.sct_data       = sm7150_data,
 		.size           = ARRAY_SIZE(sm7150_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2762,7 +2751,6 @@ static const struct qcom_llcc_config sm8150_cfg[] = {
 	{
 		.sct_data       = sm8150_data,
 		.size           = ARRAY_SIZE(sm8150_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2772,7 +2760,6 @@ static const struct qcom_llcc_config sm8250_cfg[] = {
 	{
 		.sct_data       = sm8250_data,
 		.size           = ARRAY_SIZE(sm8250_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2782,7 +2769,6 @@ static const struct qcom_llcc_config sm8350_cfg[] = {
 	{
 		.sct_data       = sm8350_data,
 		.size           = ARRAY_SIZE(sm8350_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v1_reg_offset,
 		.edac_reg_offset = &llcc_v1_edac_reg_offset,
 	},
@@ -2792,7 +2778,6 @@ static const struct qcom_llcc_config sm8450_cfg[] = {
 	{
 		.sct_data       = sm8450_data,
 		.size           = ARRAY_SIZE(sm8450_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 	},
@@ -2802,7 +2787,6 @@ static const struct qcom_llcc_config sm8550_cfg[] = {
 	{
 		.sct_data       = sm8550_data,
 		.size           = ARRAY_SIZE(sm8550_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 	},
@@ -2812,7 +2796,6 @@ static const struct qcom_llcc_config sm8650_cfg[] = {
 	{
 		.sct_data       = sm8650_data,
 		.size           = ARRAY_SIZE(sm8650_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 	},
@@ -2822,7 +2805,6 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
 	{
 		.sct_data	= x1e80100_data,
 		.size		= ARRAY_SIZE(x1e80100_data),
-		.need_llcc_cfg	= true,
 		.reg_offset	= llcc_v2_1_reg_offset,
 		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 		.irq_configured = true,
@@ -3175,7 +3157,8 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 			return ret;
 	}
 
-	if (cfg->need_llcc_cfg) {
+	/* At least SDM845 disallows non-secure writes to these registers */
+	if (!cfg->skip_llcc_cfg) {
 		u32 disable_cap_alloc, retain_pc;
 
 		disable_cap_alloc = config->dis_cap_alloc << config->slice_id;

---
base-commit: 1ffec08567f426a1c593e038cadc61bdc38cb467
change-id: 20241104-topic-llcc_flip-c8720c56b7f2

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


