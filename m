Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3935B2D9D93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 18:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408522AbgLNRYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 12:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408523AbgLNRYh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 12:24:37 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691EDC0617B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 09:23:20 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id g20so8147188plo.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 09:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cg6Bq8u6T5dLgFu86otlHuVnE4BbKztYZ9gDn/MmCXc=;
        b=M/f24FvBVPavu1tTNzezOto0bS8sgtxaEDsDYCm3yKXZOjBEHMug6ph2ZN2jp/rAcQ
         0uAAjoQGoGvG7mlHkdqoJ20q2OX/rgkx+RcG5KYoh4rUtzgAksgNRx/HGWTLPeykoeUM
         HNsvLfjZYGAaPTkJbX+yPO2qkw6UuG/pRLBPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cg6Bq8u6T5dLgFu86otlHuVnE4BbKztYZ9gDn/MmCXc=;
        b=CQU5KSXMhmDHUDzXMmTRCkHk92hQMpIYxRFKcrRaqca26tbtowcJuHkDNloDZp4oxe
         wr5NPkDbPI/Ur2j88bsdAemAXc2Q8seovXZYouTBxy7M/QjNCxlyDBWQ+L9SF061fIKH
         tn7Eufgj24X5a50yW/CLdXnYY3mkvrQhzI0eGpJ3Kz4CmAu6qF8UIM3SepZXMfbWsrOJ
         xI9KXLE93o8midJraXaKdYMm5knKAelmfcdCFgZG9AdEAuhOinMC09BwvdVNMy9m5azU
         Uhg0GZ3EwxXncsIpyYJKpj9+Wf+NtCsR6PjmHth99ixhj3cIaSO5s/ZKk5jLZugoKmLY
         vi3Q==
X-Gm-Message-State: AOAM530jJCifU4PAbAGyhhEaM5UYdEJ4yODlNn2hR8ZUVUbJMLYBWFcp
        yVLVKvtrYnl7N1stHDg5USEJOA==
X-Google-Smtp-Source: ABdhPJzBFDAtXnY4SIfO2hMauHJDz6Ubh83KhYpJyoVJiaqsTbdWhwA9llolIS2fzSFnfZcuHDq/2A==
X-Received: by 2002:a17:90b:50a:: with SMTP id r10mr26452721pjz.103.1607966599913;
        Mon, 14 Dec 2020 09:23:19 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id 7sm16013498pfh.142.2020.12.14.09.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 09:23:18 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     Taniya Das <tdas@codeaurora.org>, vbadigan@codeaurora.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: [PATCH v5 2/2] mmc: sdhci-msm: Actually set the actual clock
Date:   Mon, 14 Dec 2020 09:21:15 -0800
Message-Id: <20201214092048.v5.2.I7564620993acd4baa63fa0e3925ca879a86d3ee3@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
References: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
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

Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes in v5:
- Remove unused clock parameter.
- Add a comment that we're stashing the requested rate.

Changes in v4:
- ("mmc: sdhci-msm: Actually set the actual clock") new for v4.

 drivers/mmc/host/sdhci-msm.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 50beb407dbe9..f5669dc858d0 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -328,8 +328,7 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
 	writel_relaxed(val, host->ioaddr + offset);
 }
 
-static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
-						    unsigned int clock)
+static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
 {
 	struct mmc_ios ios = host->mmc->ios;
 	/*
@@ -342,8 +341,8 @@ static unsigned int msm_get_clock_rate_for_bus_mode(struct sdhci_host *host,
 	    ios.timing == MMC_TIMING_MMC_DDR52 ||
 	    ios.timing == MMC_TIMING_MMC_HS400 ||
 	    host->flags & SDHCI_HS400_TUNING)
-		clock *= 2;
-	return clock;
+		return 2;
+	return 1;
 }
 
 static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
@@ -354,14 +353,16 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 	struct mmc_ios curr_ios = host->mmc->ios;
 	struct clk *core_clk = msm_host->bulk_clks[0].clk;
 	unsigned long achieved_rate;
+	unsigned int desired_rate;
+	unsigned int mult;
 	int rc;
 
-	clock = msm_get_clock_rate_for_bus_mode(host, clock);
-	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
+	mult = msm_get_clock_mult_for_bus_mode(host);
+	desired_rate = clock * mult;
+	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
 	if (rc) {
 		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
-		       mmc_hostname(host->mmc), clock,
-		       curr_ios.timing);
+		       mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
 		return;
 	}
 
@@ -371,11 +372,14 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 	 * encounter it.
 	 */
 	achieved_rate = clk_get_rate(core_clk);
-	if (achieved_rate > clock)
+	if (achieved_rate > desired_rate)
 		pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
-			mmc_hostname(host->mmc), clock, achieved_rate);
+			mmc_hostname(host->mmc), desired_rate, achieved_rate);
+	host->mmc->actual_clock = achieved_rate / mult;
+
+	/* Stash the rate we requested to use in sdhci_msm_runtime_resume() */
+	msm_host->clk_rate = desired_rate;
 
-	msm_host->clk_rate = clock;
 	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
 		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
 }
@@ -1756,13 +1760,6 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
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
 
@@ -1785,7 +1782,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 
 	if (!clock) {
-		msm_host->clk_rate = clock;
+		host->mmc->actual_clock = msm_host->clk_rate = 0;
 		goto out;
 	}
 
-- 
2.29.2.576.ga3fc446d84-goog

