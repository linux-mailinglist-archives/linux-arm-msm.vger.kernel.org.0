Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843131EE559
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 15:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbgFDNaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 09:30:20 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:53201 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728599AbgFDNaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 09:30:20 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2020 19:00:13 +0530
Received: from vbadigan-linux.qualcomm.com ([10.206.24.109])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2020 18:59:54 +0530
Received: by vbadigan-linux.qualcomm.com (Postfix, from userid 76677)
        id 1CBAE4C01; Thu,  4 Jun 2020 18:59:52 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Maya Erez <merez@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Ludovic Barre <ludovic.barre@st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bradley Bolen <bradleybolen@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [RFC V1] mmc: core: Add partial initialization support
Date:   Thu,  4 Jun 2020 18:59:37 +0530
Message-Id: <1591277381-7734-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Maya Erez <merez@codeaurora.org>

This change adds the ability to partially initialize
the MMC card by using card Sleep/Awake sequence (CMD5).
Card will be sent to Sleep state during runtime/system suspend
and will be woken up during runtime/system resume.
By using this sequence the card doesn't need full initialization
which gives time reduction in system/runtime resume path.

Signed-off-by: Maya Erez <merez@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/core/mmc.c   | 146 ++++++++++++++++++++++++++++++++++++++++++++---
 include/linux/mmc/card.h |   4 ++
 include/linux/mmc/host.h |   2 +
 3 files changed, 143 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index de94fbe629bd..5c6444113c92 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1892,7 +1892,13 @@ static int mmc_can_sleep(struct mmc_card *card)
 	return (card && card->ext_csd.rev >= 3);
 }
 
-static int mmc_sleep(struct mmc_host *host)
+static int mmc_can_sleepawake(struct mmc_host *host)
+{
+	return host && (host->caps2 & MMC_CAP2_SLEEP_AWAKE) && host->card &&
+		(host->card->ext_csd.rev >= 3);
+}
+
+static int mmc_sleepawake(struct mmc_host *host, bool sleep)
 {
 	struct mmc_command cmd = {};
 	struct mmc_card *card = host->card;
@@ -1902,13 +1908,16 @@ static int mmc_sleep(struct mmc_host *host)
 	/* Re-tuning can't be done once the card is deselected */
 	mmc_retune_hold(host);
 
-	err = mmc_deselect_cards(host);
-	if (err)
-		goto out_release;
+	if (sleep) {
+		err = mmc_deselect_cards(host);
+		if (err)
+			goto out_release;
+	}
 
 	cmd.opcode = MMC_SLEEP_AWAKE;
 	cmd.arg = card->rca << 16;
-	cmd.arg |= 1 << 15;
+	if (sleep)
+		cmd.arg |= 1 << 15;
 
 	/*
 	 * If the max_busy_timeout of the host is specified, validate it against
@@ -1939,6 +1948,9 @@ static int mmc_sleep(struct mmc_host *host)
 	if (!cmd.busy_timeout || !(host->caps & MMC_CAP_WAIT_WHILE_BUSY))
 		mmc_delay(timeout_ms);
 
+	if (!sleep)
+		err = mmc_select_card(card);
+
 out_release:
 	mmc_retune_release(host);
 	return err;
@@ -2016,6 +2028,69 @@ static void mmc_detect(struct mmc_host *host)
 	}
 }
 
+static int mmc_cache_card_ext_csd(struct mmc_host *host)
+{
+	int err;
+	u8 *ext_csd;
+	struct mmc_card *card = host->card;
+
+	err = mmc_get_ext_csd(card, &ext_csd);
+	if (err || !ext_csd) {
+		pr_err("%s: %s: mmc_get_ext_csd failed (%d)\n",
+			mmc_hostname(host), __func__, err);
+		return err;
+	}
+
+	/* only cache read/write fields that the sw changes */
+	card->ext_csd.raw_ext_csd_cmdq = ext_csd[EXT_CSD_CMDQ_MODE_EN];
+	card->ext_csd.raw_ext_csd_cache_ctrl = ext_csd[EXT_CSD_CACHE_CTRL];
+	card->ext_csd.raw_ext_csd_bus_width = ext_csd[EXT_CSD_BUS_WIDTH];
+	card->ext_csd.raw_ext_csd_hs_timing = ext_csd[EXT_CSD_HS_TIMING];
+
+	kfree(ext_csd);
+
+	return 0;
+}
+
+static int mmc_test_awake_ext_csd(struct mmc_host *host)
+{
+	int err;
+	u8 *ext_csd;
+	struct mmc_card *card = host->card;
+
+	err = mmc_get_ext_csd(card, &ext_csd);
+	if (err) {
+		pr_err("%s: %s: mmc_get_ext_csd failed (%d)\n",
+			mmc_hostname(host), __func__, err);
+		return err;
+	}
+
+	/* only compare read/write fields that the sw changes */
+	pr_debug("%s: %s: type(cached:current) cmdq(%d:%d) cache_ctrl(%d:%d) bus_width (%d:%d) timing(%d:%d)\n",
+		mmc_hostname(host), __func__,
+		card->ext_csd.raw_ext_csd_cmdq,
+		ext_csd[EXT_CSD_CMDQ_MODE_EN],
+		card->ext_csd.raw_ext_csd_cache_ctrl,
+		ext_csd[EXT_CSD_CACHE_CTRL],
+		card->ext_csd.raw_ext_csd_bus_width,
+		ext_csd[EXT_CSD_BUS_WIDTH],
+		card->ext_csd.raw_ext_csd_hs_timing,
+		ext_csd[EXT_CSD_HS_TIMING]);
+
+	err = !((card->ext_csd.raw_ext_csd_cmdq ==
+			ext_csd[EXT_CSD_CMDQ_MODE_EN]) &&
+		(card->ext_csd.raw_ext_csd_cache_ctrl ==
+			ext_csd[EXT_CSD_CACHE_CTRL]) &&
+		(card->ext_csd.raw_ext_csd_bus_width ==
+			ext_csd[EXT_CSD_BUS_WIDTH]) &&
+		(card->ext_csd.raw_ext_csd_hs_timing ==
+			ext_csd[EXT_CSD_HS_TIMING]));
+
+	kfree(ext_csd);
+
+	return err;
+}
+
 static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 {
 	int err = 0;
@@ -2034,8 +2109,12 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 	if (mmc_can_poweroff_notify(host->card) &&
 		((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend))
 		err = mmc_poweroff_notify(host->card, notify_type);
-	else if (mmc_can_sleep(host->card))
-		err = mmc_sleep(host);
+	if (mmc_can_sleepawake(host)) {
+		memcpy(&host->cached_ios, &host->ios, sizeof(host->cached_ios));
+		mmc_cache_card_ext_csd(host);
+	}
+	if (mmc_can_sleep(host->card))
+		err = mmc_sleepawake(host, true);
 	else if (!mmc_host_is_spi(host))
 		err = mmc_deselect_cards(host);
 
@@ -2048,6 +2127,43 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 	return err;
 }
 
+static int mmc_partial_init(struct mmc_host *host)
+{
+	int err = 0;
+	struct mmc_card *card = host->card;
+
+	mmc_set_bus_width(host, host->cached_ios.bus_width);
+	mmc_set_timing(host, host->cached_ios.timing);
+	if (host->cached_ios.enhanced_strobe) {
+		host->ios.enhanced_strobe = true;
+		if (host->ops->hs400_enhanced_strobe)
+			host->ops->hs400_enhanced_strobe(host, &host->ios);
+	}
+	mmc_set_clock(host, host->cached_ios.clock);
+	mmc_set_bus_mode(host, host->cached_ios.bus_mode);
+
+	if (!mmc_card_hs400es(card) &&
+			(mmc_card_hs200(card) || mmc_card_hs400(card)))
+		err = mmc_execute_tuning(card);
+
+	/*
+	 * The ext_csd is read to make sure the card did not went through
+	 * Power-failure during sleep period.
+	 * A subset of the W/E_P, W/C_P register will be tested. In case
+	 * these registers values are different from the values that were
+	 * cached during suspend, we will conclude that a Power-failure occurred
+	 * and will do full initialization sequence.
+	 */
+	err = mmc_test_awake_ext_csd(host);
+	if (err) {
+		pr_debug("%s: %s: fail on ext_csd read (%d)\n",
+			mmc_hostname(host), __func__, err);
+		goto out;
+	}
+out:
+	return err;
+}
+
 /*
  * Suspend callback
  */
@@ -2070,7 +2186,7 @@ static int mmc_suspend(struct mmc_host *host)
  */
 static int _mmc_resume(struct mmc_host *host)
 {
-	int err = 0;
+	int err = -EINVAL;
 
 	mmc_claim_host(host);
 
@@ -2078,7 +2194,19 @@ static int _mmc_resume(struct mmc_host *host)
 		goto out;
 
 	mmc_power_up(host, host->card->ocr);
-	err = mmc_init_card(host, host->card->ocr, host->card);
+
+	if (mmc_can_sleepawake(host)) {
+		err = mmc_sleepawake(host, false);
+		if (!err)
+			err = mmc_partial_init(host);
+		else
+			pr_err("%s: %s: awake failed (%d), fallback to full init\n",
+				mmc_hostname(host), __func__, err);
+	}
+
+	if (err)
+		err = mmc_init_card(host, host->card->ocr, host->card);
+
 	mmc_card_clr_suspended(host->card);
 
 out:
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index cf3780a6ccc4..2f4c8d3d5763 100644
--- a/include/linux/mmc/card.h
+++ b/include/linux/mmc/card.h
@@ -85,6 +85,8 @@ struct mmc_ext_csd {
 	unsigned int            data_tag_unit_size;     /* DATA TAG UNIT size */
 	unsigned int		boot_ro_lock;		/* ro lock support */
 	bool			boot_ro_lockable;
+	u8			raw_ext_csd_cmdq;	/* 15 */
+	u8			raw_ext_csd_cache_ctrl;	/* 33 */
 	bool			ffu_capable;	/* Firmware upgrade support */
 	bool			cmdq_en;	/* Command Queue enabled */
 	bool			cmdq_support;	/* Command Queue supported */
@@ -95,7 +97,9 @@ struct mmc_ext_csd {
 	u8			raw_partition_support;	/* 160 */
 	u8			raw_rpmb_size_mult;	/* 168 */
 	u8			raw_erased_mem_count;	/* 181 */
+	u8			raw_ext_csd_bus_width;	/* 183 */
 	u8			strobe_support;		/* 184 */
+	u8			raw_ext_csd_hs_timing;	/* 185 */
 	u8			raw_ext_csd_structure;	/* 194 */
 	u8			raw_card_type;		/* 196 */
 	u8			raw_driver_strength;	/* 197 */
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index d4a50e5dc111..a69abe9f032b 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -375,6 +375,7 @@ struct mmc_host {
 #define MMC_CAP2_CQE_DCMD	(1 << 24)	/* CQE can issue a direct command */
 #define MMC_CAP2_AVOID_3_3V	(1 << 25)	/* Host must negotiate down from 3.3V */
 #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
+#define MMC_CAP2_SLEEP_AWAKE	(1 << 27)	/* Use Sleep/Awake (CMD5) */
 
 	int			fixed_drv_type;	/* fixed driver type for non-removable media */
 
@@ -393,6 +394,7 @@ struct mmc_host {
 	spinlock_t		lock;		/* lock for claim and bus ops */
 
 	struct mmc_ios		ios;		/* current io bus settings */
+	struct mmc_ios		cached_ios;
 
 	/* group bitfields together to minimize padding */
 	unsigned int		use_spi_crc:1;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

