Return-Path: <linux-arm-msm+bounces-46148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A80F4A1CB8E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6DB716707F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 15:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C961A841B;
	Sun, 26 Jan 2025 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNThPjkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73091226541;
	Sun, 26 Jan 2025 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903866; cv=none; b=S5NyMyL/2tveHGmasp14HvCRKs19olQex1Vwxh1cv9qi4Yjb+SStTyS3/S3RUT/+3tB4d/52o505CvonwroylP0LdPqxpaaajS2qlLf9zBtR+i+vbcLwJw4UXBGTND+AxCZygeq2F/lA7TlJ5Fyjqg2NcwLEvPP+YSld8rGsYnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903866; c=relaxed/simple;
	bh=2Ley+af4B/KQv01rWzdXRMK+vVNOr7Myc+GRY1o6EKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I3mWhuQ5Vwga0M6sccOKeGpuhs5WuHHg8xPiTkGxT8xpZS1kR2bCgtx5+9J5SloVYlZuY6FWSYs+ulzgimsGFS/MR7RIxminTGw7U+WsBlA64ZlwW9g5GrSaTgkQxRQixZSwAHmBQ1CVJOIvEaunWVuJvslEGMl9SblPTo7bDQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNThPjkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDC9C4CED3;
	Sun, 26 Jan 2025 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903866;
	bh=2Ley+af4B/KQv01rWzdXRMK+vVNOr7Myc+GRY1o6EKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNThPjkGQBf1UVHXvgNvvv5NtobU60R3ddQ9RZs/HH0zLwloyaphGqPAPMpQqFg1Q
	 5vjrVuGbMh7MnQ9dmFN+wvXZ+r96le85FO3sLE1RB0yQCcZc2+sfCiZcATsnn3xYlr
	 T5AmcMnTk08c3hq2c3jd3yTTzrJLeczb/dRIJ8M98G9mBLUXYDOsDTibaM9gjaY6PX
	 SqNCiMjCd/JierE0l8FEtoNldDRei5JORMdK7ks/MVFFf05KyYNETGSMHNQnVQbdB9
	 JrM7AaIPEtJePg140VxXDeWgE2Fs6ZYDKSbLF7PCt/Xm9t8tcHycNKXL3dNhAoSaXL
	 U/Nd7vFm74JwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yuanjie Yang <quic_yuanjiey@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	adrian.hunter@intel.com,
	linux-mmc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 15/17] mmc: sdhci-msm: Correctly set the load for the regulator
Date: Sun, 26 Jan 2025 10:03:51 -0500
Message-Id: <20250126150353.957794-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150353.957794-1-sashal@kernel.org>
References: <20250126150353.957794-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.127
Content-Transfer-Encoding: 8bit

From: Yuanjie Yang <quic_yuanjiey@quicinc.com>

[ Upstream commit 20a0c37e44063997391430c4ae09973e9cbc3911 ]

Qualcomm regulator supports two power supply modes: HPM and LPM.
Currently, the sdhci-msm.c driver does not set the load to adjust
the current for eMMC and SD. If the regulator dont't set correct
load in LPM state, it will lead to the inability to properly
initialize eMMC and SD.

Set the correct regulator current for eMMC and SD to ensure that the
device can work normally even when the regulator is in LPM.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20250114083514.258379-1-quic_yuanjiey@quicinc.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mmc/host/sdhci-msm.c | 53 ++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 28bd562c439ef..c8488b8e20734 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -132,9 +132,18 @@
 /* Timeout value to avoid infinite waiting for pwr_irq */
 #define MSM_PWR_IRQ_TIMEOUT_MS 5000
 
+/* Max load for eMMC Vdd supply */
+#define MMC_VMMC_MAX_LOAD_UA	570000
+
 /* Max load for eMMC Vdd-io supply */
 #define MMC_VQMMC_MAX_LOAD_UA	325000
 
+/* Max load for SD Vdd supply */
+#define SD_VMMC_MAX_LOAD_UA	800000
+
+/* Max load for SD Vdd-io supply */
+#define SD_VQMMC_MAX_LOAD_UA	22000
+
 #define msm_host_readl(msm_host, host, offset) \
 	msm_host->var_ops->msm_readl_relaxed(host, offset)
 
@@ -1399,11 +1408,48 @@ static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
 	return ret;
 }
 
-static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
+static void msm_config_vmmc_regulator(struct mmc_host *mmc, bool hpm)
+{
+	int load;
+
+	if (!hpm)
+		load = 0;
+	else if (!mmc->card)
+		load = max(MMC_VMMC_MAX_LOAD_UA, SD_VMMC_MAX_LOAD_UA);
+	else if (mmc_card_mmc(mmc->card))
+		load = MMC_VMMC_MAX_LOAD_UA;
+	else if (mmc_card_sd(mmc->card))
+		load = SD_VMMC_MAX_LOAD_UA;
+	else
+		return;
+
+	regulator_set_load(mmc->supply.vmmc, load);
+}
+
+static void msm_config_vqmmc_regulator(struct mmc_host *mmc, bool hpm)
+{
+	int load;
+
+	if (!hpm)
+		load = 0;
+	else if (!mmc->card)
+		load = max(MMC_VQMMC_MAX_LOAD_UA, SD_VQMMC_MAX_LOAD_UA);
+	else if (mmc_card_sd(mmc->card))
+		load = SD_VQMMC_MAX_LOAD_UA;
+	else
+		return;
+
+	regulator_set_load(mmc->supply.vqmmc, load);
+}
+
+static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, bool hpm)
 {
 	if (IS_ERR(mmc->supply.vmmc))
 		return 0;
 
+	msm_config_vmmc_regulator(mmc, hpm);
+
 	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
 }
 
@@ -1416,6 +1462,8 @@ static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
 	if (msm_host->vqmmc_enabled == level)
 		return 0;
 
+	msm_config_vqmmc_regulator(mmc, level);
+
 	if (level) {
 		/* Set the IO voltage regulator to default voltage level */
 		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
@@ -1638,7 +1686,8 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 	}
 
 	if (pwr_state) {
-		ret = sdhci_msm_set_vmmc(mmc);
+		ret = sdhci_msm_set_vmmc(msm_host, mmc,
+					 pwr_state & REQ_BUS_ON);
 		if (!ret)
 			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
 					pwr_state & REQ_BUS_ON);
-- 
2.39.5


