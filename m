Return-Path: <linux-arm-msm+bounces-76717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B91BCA1A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E0204FC077
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C47C2F5A28;
	Thu,  9 Oct 2025 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ/2KquR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62DC2F5A25;
	Thu,  9 Oct 2025 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025674; cv=none; b=S37gUuDUjAT82k04cj77ByTFcc3ZwhhfxUCVeM7xx9aAFMzfTVR3Kx+x2WDrv3K08Iq06JKAeW4+ejmJ8NNgLk+tUcW9frWr/ksc7dB8E1f8x9LX2STMtf7+olVIyVyixU809t/1WeJXv0B9aqz8P4Ib3XRqFQm+WX9WT+aP0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025674; c=relaxed/simple;
	bh=9cXL50M/jYGovCmqSCzwi1/+3ZyxmLckljO6XvLFzMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQW96M5SBipEPhC7ClyGLZpvl16JBu12xGWdONjGcaHbjaB6+95SwfZRacPJ2OmapTJ+dDNCdT22UlnqSUynI91+c0pEKYzgF6S5dZpQREHELui652SpV9ukdf+EyuiEkQXKC7pbPLv7FTFsd+VZgP6Ur7MKjVYXAoyyCy+tlz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQ/2KquR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17A7C4CEF8;
	Thu,  9 Oct 2025 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025674;
	bh=9cXL50M/jYGovCmqSCzwi1/+3ZyxmLckljO6XvLFzMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQ/2KquR43ivIk61Q6H0yKjEYksWcua8/g2+P0uN/tzOjggSOvI5QsMXziERjqmF+
	 SgMcsFiPRhGG9HAcxxZsV5QEjB+OnaFXYf3FyvfOAAl+2wcOZw/VLTT+u2lkSGGRD0
	 i8BDI/gpUz25UiR2qTK83J128+yLOlxYs/LVofZpGa3YMxTRHOGPzfA1M0M64hludo
	 XxzLHUQxUC5pRhhu+/lirhP3vZp8iIZkljcDxjWlfgb5inIr+lzUjrfbGYnlGjMwwJ
	 nZY2i7S14LPa7dG6i3cbR4aTyyJ1j33H+ThfSAv1jq2UyUnvMKJxc2UK9JxOLA4mdJ
	 G2tUyIrtFY0Dg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sarthak Garg <quic_sartgarg@quicinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
Date: Thu,  9 Oct 2025 11:56:14 -0400
Message-ID: <20251009155752.773732-108-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sarthak Garg <quic_sartgarg@quicinc.com>

[ Upstream commit 08b68ca543ee9d5a8d2dc406165e4887dd8f170b ]

For Qualcomm SoCs which needs level shifter for SD card, extra delay is
seen on receiver data path.

To compensate this delay enable tuning for SDR50 mode for targets which
has level shifter. SDHCI_SDR50_NEEDS_TUNING caps will be set for targets
with level shifter on Qualcomm SOC's.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES. Enabling SDR50 tuning fixes a real bug that hits Qualcomm boards
using SD card level shifters, where the RX delay makes SDR50 unreliable
unless the DLL is tuned. Today `sdhci_msm_is_tuning_needed()` returns
false for SDR50 because of the existing `CORE_FREQ_100MHZ` check, so the
controller never tunes even when hardware advertises
`SDHCI_SDR50_NEEDS_TUNING`; this means the extra propagation delay is
never compensated. The patch adds an early SDR50+flag check
(`drivers/mmc/host/sdhci-msm.c:1119`) so tuning runs whenever firmware
sets that capability, and it programs the vendor “HC_SELECT_IN” field to
the new SDR50 selector before the tuning loop (`drivers/mmc/host/sdhci-
msm.c:1210` together with the new `CORE_HC_SELECT_IN_SDR50` definition
at `drivers/mmc/host/sdhci-msm.c:82`). That matches how HS400 is already
handled and lets the DLL pick the correct sampling point. The change is
tiny, self-contained to the Qualcomm host driver, and only engages when
hardware already flagged that SDR50 needs tuning, so it shouldn’t
regress other users. No new APIs or structural work are introduced,
making this an appropriate, low-risk stable backport that restores
reliable SDR50 operation on the affected systems.

 drivers/mmc/host/sdhci-msm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 9d8e20dc8ca11..e7df864bdcaf6 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -81,6 +81,7 @@
 #define CORE_IO_PAD_PWR_SWITCH_EN	BIT(15)
 #define CORE_IO_PAD_PWR_SWITCH	BIT(16)
 #define CORE_HC_SELECT_IN_EN	BIT(18)
+#define CORE_HC_SELECT_IN_SDR50	(4 << 19)
 #define CORE_HC_SELECT_IN_HS400	(6 << 19)
 #define CORE_HC_SELECT_IN_MASK	(7 << 19)
 
@@ -1133,6 +1134,10 @@ static bool sdhci_msm_is_tuning_needed(struct sdhci_host *host)
 {
 	struct mmc_ios *ios = &host->mmc->ios;
 
+	if (ios->timing == MMC_TIMING_UHS_SDR50 &&
+	    host->flags & SDHCI_SDR50_NEEDS_TUNING)
+		return true;
+
 	/*
 	 * Tuning is required for SDR104, HS200 and HS400 cards and
 	 * if clock frequency is greater than 100MHz in these modes.
@@ -1201,6 +1206,8 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	struct mmc_ios ios = host->mmc->ios;
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
+	u32 config;
 
 	if (!sdhci_msm_is_tuning_needed(host)) {
 		msm_host->use_cdr = false;
@@ -1217,6 +1224,14 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	 */
 	msm_host->tuning_done = 0;
 
+	if (ios.timing == MMC_TIMING_UHS_SDR50 &&
+	    host->flags & SDHCI_SDR50_NEEDS_TUNING) {
+		config = readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec);
+		config &= ~CORE_HC_SELECT_IN_MASK;
+		config |= CORE_HC_SELECT_IN_EN | CORE_HC_SELECT_IN_SDR50;
+		writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec);
+	}
+
 	/*
 	 * For HS400 tuning in HS200 timing requires:
 	 * - select MCLK/2 in VENDOR_SPEC
-- 
2.51.0


