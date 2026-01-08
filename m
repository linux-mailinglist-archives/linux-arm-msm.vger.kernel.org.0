Return-Path: <linux-arm-msm+bounces-88102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6300FD03A90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E0253010FBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339C246AEFA;
	Thu,  8 Jan 2026 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcrLmkq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E046AECE;
	Thu,  8 Jan 2026 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882139; cv=none; b=UTJsJjgonBcZOLsu+Mj7/Wp5VRLNu3JzzMzNttblp6cVO3tTwADdVofwZbRQ942GbwEBUwz25JM37sEpeJlQLzz6WY+O9OKPmMFN/rVG3dbCobWfyubxS5oAJo23eW81lV8EMTWl1OVjgeyJzjA50IG2FI/W7MESPbJEPAP0OVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882139; c=relaxed/simple;
	bh=uDuRuz6holk0p1W5KjXd7ziv9LHNLbMpJvwufQS0xJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvbmLskT0p3fDdiMqaDMy6FpMoNQ10SYIOFs3iozaLMfcD+s1Lg8MPBR1yUoA4LhBS06mpuhLEfQePjEcPVuwq/6zp5fFM/RMnd4UWhGftWKPaad1bYuLtdeW/X7PARzfhI0vpKLuGEAMiT47dr5JA5WA2rRqSj9DSBbVZrr1kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcrLmkq9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE79C19422;
	Thu,  8 Jan 2026 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767882138;
	bh=uDuRuz6holk0p1W5KjXd7ziv9LHNLbMpJvwufQS0xJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RcrLmkq93kQ22yZ9KL0tLoCY85RZ5mb861YZWHp9bN/RkkydVX3ta9OkLr98YILsv
	 3elplbb62imu+1070aJRrAZxJhTiQp/2HFLzo8Fq32P4haBvIE8sNakstXPoBrQVvE
	 wvsqWdfUcYnOtl9+bjPN7zgyQ/Z3rIgZcnUNu/97/dKSR1x3+vKKo7zDe/MG352YLM
	 eh5mPiQzXY91FJv+ZIaHb7x5K//xv5me5mfxBHkLFnVFxfwILllRGiThqOS3Lc8Pgy
	 M6Lv3olL+rYlZ+EMX+lWOKWZcQVJdkg6FuRMhammC/Dw4GLqafKJrwWMpltXbAR+qk
	 IRE6ajaoclBiw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 Jan 2026 15:21:51 +0100
Subject: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
In-Reply-To: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767882123; l=9485;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=PNGfZ45coN1C/o+QL9ZexnumgXEWcaMR9QTIU53QLLI=;
 b=HIkBEggRFxaEVDk+SXDG8YmOReIY+FoLieMqX0aAIL8ImBlyKUPBmw/dPNneUFtXWfUt/K7zG
 8MsZqEIwSnYC/kv+n417iT/cgfrOMgDr2dua/tB9KaQu43py9AxKaF4
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

To make sure the correct settings for a given DRAM configuration get
applied, attempt to retrieve that data from SMEM (which happens to be
what the BSP kernel does, albeit with through convoluted means of the
bootloader altering the DT with this data).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
I'm not sure about this approach - perhaps a global variable storing
the selected config, which would then be non-const would be better?
---
 drivers/soc/qcom/ubwc_config.c | 69 ++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..21bb444dc27c 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -11,12 +11,13 @@
 #include <linux/platform_device.h>
 
 #include <linux/soc/qcom/ubwc.h>
+#include <linux/soc/qcom/smem.h>
 
-static const struct qcom_ubwc_cfg_data no_ubwc_data = {
+static struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
-static const struct qcom_ubwc_cfg_data kaanapali_data = {
+static struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_dec_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -26,7 +27,7 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data msm8937_data = {
+static struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
@@ -35,7 +36,7 @@ static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data msm8998_data = {
+static struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
@@ -44,12 +45,12 @@ static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data qcm2290_data = {
+static struct qcom_ubwc_cfg_data qcm2290_data = {
 	/* no UBWC */
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sa8775p_data = {
+static struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
@@ -58,7 +59,7 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sar2130p_data = {
+static struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -68,7 +69,7 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sc7180_data = {
+static struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -77,7 +78,7 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sc7280_data = {
+static struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -87,7 +88,7 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sc8180x_data = {
+static struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -96,7 +97,7 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sc8280xp_data = {
+static struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -106,7 +107,7 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sdm670_data = {
+static struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -114,7 +115,7 @@ static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sdm845_data = {
+static struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -122,7 +123,7 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm6115_data = {
+static struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
@@ -132,7 +133,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm6125_data = {
+static struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
@@ -141,7 +142,7 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm6150_data = {
+static struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -149,7 +150,7 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm6350_data = {
+static struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -158,7 +159,7 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm7150_data = {
+static struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -166,7 +167,7 @@ static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm8150_data = {
+static struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -174,7 +175,7 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm8250_data = {
+static struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -185,7 +186,7 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sm8350_data = {
+static struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -196,7 +197,7 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sm8550_data = {
+static struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -207,7 +208,7 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sm8750_data = {
+static struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
@@ -217,7 +218,7 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data x1e80100_data = {
+static struct qcom_ubwc_cfg_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -301,14 +302,30 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 {
-	const struct qcom_ubwc_cfg_data *data;
+	struct qcom_ubwc_cfg_data *data;
+	int hbb;
 
-	data = of_machine_get_match_data(qcom_ubwc_configs);
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/* Discard the const qualifier, but still return a const pointer to consumers */
+	data = (struct qcom_ubwc_cfg_data *)of_machine_get_match_data(qcom_ubwc_configs);
 	if (!data) {
 		pr_err("Couldn't find UBWC config data for this platform!\n");
 		return ERR_PTR(-EINVAL);
 	}
 
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb == -ENODATA) {
+		/* Lack of HBB data is OK - it was only introduced later */
+		return data;
+	} else if (hbb < 0) {
+		pr_err("Couldn't get HBB data from SMEM: %d\n", hbb);
+		return ERR_PTR(hbb);
+	}
+
+	data->highest_bank_bit = hbb;
+
 	return data;
 }
 EXPORT_SYMBOL_GPL(qcom_ubwc_config_get_data);

-- 
2.52.0


