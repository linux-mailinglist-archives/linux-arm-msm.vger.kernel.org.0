Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3487B60E949
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 21:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234580AbiJZTni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 15:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235109AbiJZTnN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 15:43:13 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E57D03B5
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 12:42:45 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso3151713pjc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi/ns2/+lR1+ddU/1Ugq5i2XZ8iCGI8EoPh2M4YhQ8o=;
        b=ne3Bjzj3/Xp33Sha2f/cKqGXdoH6Vyr5pOV6EuuqvioSpyWEaWuiHEeTUPPxMmITZy
         AjpY81WAkjUG4NkFO4CzRkknSFFYVH/HDZGTHQ2cTgwST8YhakPg/9CIkJjqjV7sWNZ6
         sRvl6FHFKEQGE626YqbWeD7+B8j5Ajygbqwxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi/ns2/+lR1+ddU/1Ugq5i2XZ8iCGI8EoPh2M4YhQ8o=;
        b=AwY9aSBwF0dzLmJUq15pswUAv2TN+bw2VtDU1owvBRp1LhXK/Mc92T3X4PkdYb3BcE
         HTyVuh7C6o12NrbtrmMfgLzaQg4ePSNNYQw1RV4W/2mAdqUWN6mLGLqPyn7MWdWdqWUz
         Pb+SU6JYGBV41RMBvtlS+0Ub/3aeissSjjqCdy/NfRQ02l9oXbOQvwDerk6fdKyDOYqw
         GOW47IpeO2xZyUXPwB2bNmsXP7K0W4GdxIppYiFzxZLKDB4dmqOTvS/yE2j0blMLSeRz
         IcVwEXBNLqUryTFdggxksRQrBboZqc1R4iKbXiPkpufPSJdO+3ILL93KJkTjcO/iDijk
         vGdg==
X-Gm-Message-State: ACrzQf1yGDyY14m1kG9OTRkfZDsKz1pGAnTxoooWGCHTmWEaR4FU7+ar
        /mt4wxRDJ7uOnI7TO5+VZA0vow==
X-Google-Smtp-Source: AMsMyM7hg0m4kzScSycnp+0BSaCf1uWcEtsyIxRBE+hmz2jWWj4BkNcDgMFKByjg4dC+wFw/YCfYnQ==
X-Received: by 2002:a17:902:da84:b0:186:dd94:bbed with SMTP id j4-20020a170902da8400b00186dd94bbedmr4430426plx.20.1666813365417;
        Wed, 26 Oct 2022 12:42:45 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:c9e3:74f3:6b2b:135])
        by smtp.gmail.com with UTF8SMTPSA id b3-20020a170903228300b00186b55e3cd6sm3293223plh.133.2022.10.26.12.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 12:42:45 -0700 (PDT)
From:   Brian Norris <briannorris@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Shawn Guo <shawnguo@kernel.org>, linux-mmc@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Al Cooper <alcooperx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Haibo Chen <haibo.chen@nxp.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Brian Norris <briannorris@chromium.org>
Subject: [PATCH v4 7/7] mmc: sdhci-*: Convert drivers to new sdhci_and_cqhci_reset()
Date:   Wed, 26 Oct 2022 12:42:09 -0700
Message-Id: <20221026124150.v4.7.Ia91f031f5f770af7bd2ff3e28b398f277606d970@changeid>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
In-Reply-To: <20221026194209.3758834-1-briannorris@chromium.org>
References: <20221026194209.3758834-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

An earlier patch ("mmc: cqhci: Provide helper for resetting both SDHCI
and CQHCI") does these operations for us.

I keep these as a separate patch, since the earlier patch is a
prerequisite to some important bugfixes that need to be backported via
linux-stable.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---

Changes in v4:
 - Add Adrian's Ack

Changes in v3:
 - Rewrite to new helper, patch sdhci-msm too

Changes in v2:
 - Factor out ->cqe_private helpers

 drivers/mmc/host/sdhci-msm.c      | 10 ++--------
 drivers/mmc/host/sdhci-pci-core.c | 11 ++---------
 drivers/mmc/host/sdhci-pci-gli.c  | 11 ++---------
 3 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3a091a387ecb..03f76384ab3f 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -19,6 +19,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
 
+#include "sdhci-cqhci.h"
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
 
@@ -2304,13 +2305,6 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
 	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
 }
 
-static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
-{
-	if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL))
-		cqhci_deactivate(host->mmc);
-	sdhci_reset(host, mask);
-}
-
 static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
 {
 	int ret;
@@ -2450,7 +2444,7 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
 
 static const struct sdhci_ops sdhci_msm_ops = {
-	.reset = sdhci_msm_reset,
+	.reset = sdhci_and_cqhci_reset,
 	.set_clock = sdhci_msm_set_clock,
 	.get_min_clock = sdhci_msm_get_min_clock,
 	.get_max_clock = sdhci_msm_get_max_clock,
diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
index 169b84761041..cc039155b5c7 100644
--- a/drivers/mmc/host/sdhci-pci-core.c
+++ b/drivers/mmc/host/sdhci-pci-core.c
@@ -38,6 +38,7 @@
 #include "cqhci.h"
 
 #include "sdhci.h"
+#include "sdhci-cqhci.h"
 #include "sdhci-pci.h"
 
 static void sdhci_pci_hw_reset(struct sdhci_host *host);
@@ -234,14 +235,6 @@ static void sdhci_pci_dumpregs(struct mmc_host *mmc)
 	sdhci_dumpregs(mmc_priv(mmc));
 }
 
-static void sdhci_cqhci_reset(struct sdhci_host *host, u8 mask)
-{
-	if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL) &&
-	    host->mmc->cqe_private)
-		cqhci_deactivate(host->mmc);
-	sdhci_reset(host, mask);
-}
-
 /*****************************************************************************\
  *                                                                           *
  * Hardware specific quirk handling                                          *
@@ -703,7 +696,7 @@ static const struct sdhci_ops sdhci_intel_glk_ops = {
 	.set_power		= sdhci_intel_set_power,
 	.enable_dma		= sdhci_pci_enable_dma,
 	.set_bus_width		= sdhci_set_bus_width,
-	.reset			= sdhci_cqhci_reset,
+	.reset			= sdhci_and_cqhci_reset,
 	.set_uhs_signaling	= sdhci_intel_set_uhs_signaling,
 	.hw_reset		= sdhci_pci_hw_reset,
 	.irq			= sdhci_cqhci_irq,
diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pci-gli.c
index 4d509f656188..633a8ee8f8c5 100644
--- a/drivers/mmc/host/sdhci-pci-gli.c
+++ b/drivers/mmc/host/sdhci-pci-gli.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/iopoll.h>
 #include "sdhci.h"
+#include "sdhci-cqhci.h"
 #include "sdhci-pci.h"
 #include "cqhci.h"
 
@@ -922,14 +923,6 @@ static int gl9763e_add_host(struct sdhci_pci_slot *slot)
 	return ret;
 }
 
-static void sdhci_gl9763e_reset(struct sdhci_host *host, u8 mask)
-{
-	if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL) &&
-	    host->mmc->cqe_private)
-		cqhci_deactivate(host->mmc);
-	sdhci_reset(host, mask);
-}
-
 static void gli_set_gl9763e(struct sdhci_pci_slot *slot)
 {
 	struct pci_dev *pdev = slot->chip->pdev;
@@ -1136,7 +1129,7 @@ static const struct sdhci_ops sdhci_gl9763e_ops = {
 	.set_clock		= sdhci_set_clock,
 	.enable_dma		= sdhci_pci_enable_dma,
 	.set_bus_width		= sdhci_set_bus_width,
-	.reset			= sdhci_gl9763e_reset,
+	.reset			= sdhci_and_cqhci_reset,
 	.set_uhs_signaling	= sdhci_set_gl9763e_signaling,
 	.voltage_switch		= sdhci_gli_voltage_switch,
 	.irq                    = sdhci_gl9763e_cqhci_irq,
-- 
2.38.0.135.g90850a2211-goog

