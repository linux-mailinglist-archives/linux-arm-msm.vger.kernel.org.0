Return-Path: <linux-arm-msm+bounces-67615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D75B19970
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 02:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D6FB3BC006
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 00:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7751F3FDC;
	Mon,  4 Aug 2025 00:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGT8NtKU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3EC1FDD;
	Mon,  4 Aug 2025 00:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267986; cv=none; b=V6uNcbT0ztpgfgxozKvny1Atl7gffUXz7na46TwZ+D7lWCPyPpkvNuCmw559Fm8TlaHMiOSu3p96UUtYKGNU+H8bgCZcSg/RGHawOP7GvWLw75kNyMF7KekNDXCnVyxvpWJA5w6rA36Xxix4Al3DuxfKh9Bc04lzjRDMPKkbJfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267986; c=relaxed/simple;
	bh=XswF4KiZnHIP/qKJwVXchPkjCYY5DrFgTGwHm+gid6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PA9rkEbWvxX1u7Qi3fTm34u1jWXrn6KeIulCCydyoAN23ift2tVEa4EuuNDpd9sC9EjfKfDCkpmaaOLKDBXdm0+9QVHCz16zXEgzRJKvHSfhRuhD/+0exbUsRpkdJECyMqpPQn0vPsQzNDtmphwFHe6sa7QAvDIA0XEop5FK6k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGT8NtKU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B017EC4CEF8;
	Mon,  4 Aug 2025 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267986;
	bh=XswF4KiZnHIP/qKJwVXchPkjCYY5DrFgTGwHm+gid6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DGT8NtKUOyCXFFPkJyiqUxGcJpKi12oVr2s5Hu9oOBCKPN1rpo4d9n3rwuNRSW7NU
	 Khminiq8m3KzEzQWGlVFocs6DSS5LV/JUvKmSIRtJGs04Pj0IIb+YybGrll+7KbLkj
	 7y9NIWXGsDTGTqdbhPw0QV6epTw8EDdC2wCLKVwdGv8XESEP17vKQxuLdReNt6h1rG
	 VgNWHbHIs2cxzUWlzN5+/Lbd8HVkG0rHLMhm7ewOjmpg6aGua/GqvFalKaOkA5yyJj
	 wC2wCoi8SdFOV53lFLQVzZy46U5T/CuGYkJIZ2NeXlItrPTdamVThxoPpQw63giMTB
	 /w2EYCc35QdJg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sarthak Garg <quic_sartgarg@quicinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 25/44] mmc: sdhci-msm: Ensure SD card power isn't ON when card removed
Date: Sun,  3 Aug 2025 20:38:30 -0400
Message-Id: <20250804003849.3627024-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003849.3627024-1-sashal@kernel.org>
References: <20250804003849.3627024-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.189
Content-Transfer-Encoding: 8bit

From: Sarthak Garg <quic_sartgarg@quicinc.com>

[ Upstream commit db58532188ebf51d52b1d7693d9e94c76b926e9f ]

Many mobile phones feature multi-card tray designs, where the same
tray is used for both SD and SIM cards. If the SD card is placed
at the outermost location in the tray, the SIM card may come in
contact with SD card power-supply while removing the tray, possibly
resulting in SIM damage.

To prevent that, make sure the SD card is really inserted by reading
the Card Detect pin state. If it's not, turn off the power in
sdhci_msm_check_power_status() and also set the BUS_FAIL power state
on the controller as part of pwr_irq handling for BUS_ON request.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Link: https://lore.kernel.org/r/20250701100659.3310386-1-quic_sartgarg@quicinc.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Hardware Damage Prevention**: This is a critical safety fix that
   prevents potential hardware damage to SIM cards. The commit message
   clearly describes a real-world scenario where SD card power can
   damage SIM cards in multi-card tray designs when the tray is removed.
   This is a serious hardware safety issue that affects end users'
   devices.

2. **Bug Fix Nature**: The commit fixes a specific bug where SD card
   power remains ON even when the card is physically removed. The code
   changes show two key additions:
   - In `sdhci_msm_check_power_status()`: Added check at lines 1625-1629
     that turns off power (writes 0 to SDHCI_POWER_CONTROL) when card is
     not detected (`!mmc->ops->get_cd(mmc)`)
   - In `sdhci_msm_handle_pwr_irq()`: Added check at lines 1689-1694
     that sets BUS_FAIL state when attempting to power on the bus while
     card is not present

3. **Small and Contained Fix**: The changes are minimal and well-
   contained:
   - Only 13 lines of actual code changes
   - Changes are localized to the sdhci-msm driver
   - No architectural changes or new features
   - Simple logic additions that check card presence before power
     operations

4. **Low Risk of Regression**: The fix adds defensive checks that only
   activate when:
   - A card is physically not present (detected via get_cd)
   - Power operations are being performed
   - This doesn't affect normal operation when cards are properly
     inserted

5. **Platform-Specific Critical Fix**: This affects Qualcomm MSM-based
   devices which are widely used in mobile phones. The multi-card tray
   design mentioned is common in many smartphones, making this a
   widespread potential issue.

6. **Clear Problem and Solution**: The commit has a clear problem
   statement (SIM damage from SD power) and a straightforward solution
   (turn off power when card is removed). This makes it easy to verify
   the fix is correct.

The commit follows stable tree rules perfectly - it's a important bugfix
that prevents hardware damage, has minimal code changes, doesn't
introduce new features, and has very low regression risk. This is
exactly the type of safety-critical fix that stable kernels should
include.

 drivers/mmc/host/sdhci-msm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4b727754d8e3..8fb2ba20e221 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1560,6 +1560,7 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = host->mmc;
 	bool done = false;
 	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
 	const struct sdhci_msm_offset *msm_offset =
@@ -1617,6 +1618,12 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
 				 "%s: pwr_irq for req: (%d) timed out\n",
 				 mmc_hostname(host->mmc), req_type);
 	}
+
+	if ((req_type & REQ_BUS_ON) && mmc->card && !mmc->ops->get_cd(mmc)) {
+		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
+		host->pwr = 0;
+	}
+
 	pr_debug("%s: %s: request %d done\n", mmc_hostname(host->mmc),
 			__func__, req_type);
 }
@@ -1675,6 +1682,13 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 		udelay(10);
 	}
 
+	if ((irq_status & CORE_PWRCTL_BUS_ON) && mmc->card &&
+	    !mmc->ops->get_cd(mmc)) {
+		msm_host_writel(msm_host, CORE_PWRCTL_BUS_FAIL, host,
+				msm_offset->core_pwrctl_ctl);
+		return;
+	}
+
 	/* Handle BUS ON/OFF*/
 	if (irq_status & CORE_PWRCTL_BUS_ON) {
 		pwr_state = REQ_BUS_ON;
-- 
2.39.5


