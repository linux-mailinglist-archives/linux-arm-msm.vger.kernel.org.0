Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326C12D7C9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 18:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394975AbgLKRQ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 12:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394959AbgLKRQB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 12:16:01 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9506FC0617B0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 09:14:40 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id b5so2675987pjl.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 09:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wUtmlJEBIq0uhPyguJ7qPFrT2WNfD/H+xrPqEI4pwGs=;
        b=ZHvUOLqsNTNw0JZDXwnzOaap67Czj7Hnks/XQPTrhkyKyxJ0D4iXnvb1T/tEkQj4iD
         DvMYK0E1BTGz6pxfLAG1+RTjgde4gBt5FASHNUI5oPHJYWIzNCpnctms6WCvKFC1Bzck
         0jKFk+UoaAsE9hsgNyotXZEY/EhOEvOcoZ2R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wUtmlJEBIq0uhPyguJ7qPFrT2WNfD/H+xrPqEI4pwGs=;
        b=XDTh54CJVGuLH5F/oVPxpSBsodKAoPBkmlztwdIH5nSqMg4K1XeJRrplwStaKFxy0w
         qy8Im2HM8ibe3YitTHK6B4TZC4i1uRaKgDe2A5NqomfUdwAFIfvkDe8XK62TFkIbW6Za
         zcdf1Op1htiOB/5cCvf7TzPlM3nF2TuDPyrdOAfE9Gr5yLMzhDNR6ryitzrIyz8c1uo8
         hxPH/7CPBZQByeHUsY9eq18a8tBX+ACZve1fGl7WCac56BFAikt/L0I51c3RQTOTkn8f
         9Bp/JxWjvAFG5muJrcJidxOl/W4ga37rHFjezd0ig2RD+x77tEZ1Cb7KkzKWPcpV6zIw
         AoQQ==
X-Gm-Message-State: AOAM531IEvKKPmm5cCY7gH5PceVIry70c7/fUgz90PPxhRSecICw0Crs
        74VzebB4xfI+sX9616CmO4jTNA==
X-Google-Smtp-Source: ABdhPJzV2xzxbWkOggNYmK1d6c9XtWif+h6BjcEUC1Cxvv/JjSXB/Rf3uToyrb4QZrOJFxpV8G/clA==
X-Received: by 2002:a17:90b:16cd:: with SMTP id iy13mr13868997pjb.182.1607706879204;
        Fri, 11 Dec 2020 09:14:39 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id w70sm11149737pfd.65.2020.12.11.09.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 09:14:38 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, vbadigan@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH v4 2/2] mmc: sdhci-msm: Actually set the actual clock
Date:   Fri, 11 Dec 2020 09:12:33 -0800
Message-Id: <20201211091150.v4.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201211091150.v4.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
References: <20201211091150.v4.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM SDHCI driver always set the "actual_clock" field to 0.  It had
a comment about it not being needed because we weren't using the
standard SDHCI divider mechanism and we'd just fallback to
"host->clock".  However, it's still better to provide the actual
clock.  Why?

1. It will make timeout calculations slightly better.  On one system I
   have, the eMMC requets 200 MHz (for HS400-ES) but actually gets 192
   MHz.  These are close, but why not get the more accurate one.

2. If things are seriously off in the clock driver and it's missing
   rates or picking the wrong rate (maybe it's rounding up instead of
   down), this will make it much more obvious what's going on.

NOTE: we have to be a little careful here because the "actual_clock"
field shouldn't include the multiplier that sdhci-msm needs
internally.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("mmc: sdhci-msm: Actually set the actual clock") new for v4.

 drivers/mmc/host/sdhci-msm.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 50beb407dbe9..08a3960001ad 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -328,7 +328,7 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
 	writel_relaxed(val, host->ioaddr + offset);
 }
 
-static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
+static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host,
 						    unsigned int clock)
 {
 	struct mmc_ios ios = host->mmc->ios;
@@ -342,8 +342,8 @@ static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
 	    ios.timing == MMC_TIMING_MMC_DDR52 ||
 	    ios.timing == MMC_TIMING_MMC_HS400 ||
 	    host->flags & SDHCI_HS400_TUNING)
-		clock *= 2;
-	return clock;
+		return 2;
+	return 1;
 }
 
 static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
@@ -354,14 +354,16 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 	struct mmc_ios curr_ios = host->mmc->ios;
 	struct clk *core_clk = msm_host->bulk_clks[0].clk;
 	unsigned long achieved_rate;
+	unsigned int desired_rate;
+	unsigned int mult;
 	int rc;
 
-	clock = msm_get_clock_rate_for_bus_mode(host, clock);
-	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
+	mult = msm_get_clock_mult_for_bus_mode(host, clock);
+	desired_rate = clock * mult;
+	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
 	if (rc) {
 		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
-		       mmc_hostname(host->mmc), clock,
-		       curr_ios.timing);
+		       mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
 		return;
 	}
 
@@ -371,11 +373,12 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 	 * encounter it.
 	 */
 	achieved_rate = clk_get_rate(core_clk);
-	if (achieved_rate > clock)
+	if (achieved_rate > desired_rate)
 		pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
-			mmc_hostname(host->mmc), clock, achieved_rate);
+			mmc_hostname(host->mmc), desired_rate, achieved_rate);
+	host->mmc->actual_clock = achieved_rate / mult;
 
-	msm_host->clk_rate = clock;
+	msm_host->clk_rate = desired_rate;
 	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
 		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
 }
@@ -1756,13 +1759,6 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
 static void __sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	u16 clk;
-	/*
-	 * Keep actual_clock as zero -
-	 * - since there is no divider used so no need of having actual_clock.
-	 * - MSM controller uses SDCLK for data timeout calculation. If
-	 *   actual_clock is zero, host->clock is taken for calculation.
-	 */
-	host->mmc->actual_clock = 0;
 
 	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
 
@@ -1785,7 +1781,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 
 	if (!clock) {
-		msm_host->clk_rate = clock;
+		host->mmc->actual_clock = msm_host->clk_rate = 0;
 		goto out;
 	}
 
-- 
2.29.2.576.ga3fc446d84-goog

