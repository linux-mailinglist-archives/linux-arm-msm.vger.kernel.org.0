Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61572D69E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 22:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392618AbgLJV3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 16:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405010AbgLJV2l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:28:41 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D306C061793
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:28:01 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q22so5341297pfk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FbWegn4ZcYaOlGOVRUV3EeXBEpEFCkkB7Ag5Ofeu968=;
        b=SOzaztliM9aHIQCbuNc7tHYRK9V3tX/XLLl1LEJ4fIxE7wPsAS8CsdXJYlh0S13KWQ
         8KisfIcHujOla0iGv0LAFHNCNwxM/Ws/De86QeLZGN+wucsFQgDLoIk3YHIm41TKmu0C
         BqMiTBQsX7SKnFeqF+FcmlUUph401+ogRljFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FbWegn4ZcYaOlGOVRUV3EeXBEpEFCkkB7Ag5Ofeu968=;
        b=M7vkcW4IZs3NhsxMJkXe0T/3yXsUuv/5g/Od11pRipupDID0ATXSpeOz821jFbbH6P
         Dn01HtSeOIkJ2fN+R/s/2H6X00XlU70WQdvM7Uc4lBNuIWbE/hQQ6KZkCIfo2+TXr4zj
         L+ZWdpcZBMwQ/qocgW36QvzLNAKReJy+fB/XFFYxuvhzWZM6lWzEwLnYtRfUNsCe/7w6
         sAx6eNa7aL16ZhUP6R2U5eVRV6BffPINumxEfLgDbWmCql5kN9u5RlIkwS2ILOQS0RJK
         RaIVxqui6lbrw7yr0Qxsl75ruUjngRzj8ceXR2hfotBTG5A6aDoacmpY6u64lrjedtvF
         lDgA==
X-Gm-Message-State: AOAM533pGJUjQcmGVM5cuZKZ3X4QayYWSBOfvrutGhnitxUAdsGJIB8i
        SDfDrRQyZyWG390xYQ68Og4uVw==
X-Google-Smtp-Source: ABdhPJx0GJXBr9wuxbpn/W7p5P5fmbFCWAp+gJEv/NSPZ3pFUeZWY5JQNddQzAXwm6eheATdbJV2Jg==
X-Received: by 2002:a17:90a:fb97:: with SMTP id cp23mr9796208pjb.215.1607635681045;
        Thu, 10 Dec 2020 13:28:01 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id t19sm7901664pgk.86.2020.12.10.13.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:28:00 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     Stephen Boyd <swboyd@chromium.org>, vbadigan@codeaurora.org,
        Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH v3] mmc: sdhci-msm: Warn about overclocking SD/MMC
Date:   Thu, 10 Dec 2020 13:27:52 -0800
Message-Id: <20201210132745.v3.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As talked about in commit 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use
floor ops for sdcc clks"), most clocks handled by the Qualcomm clock
drivers are rounded _up_ by default instead of down.  We should make
sure SD/MMC clocks are always rounded down in the clock drivers.
Let's add a warning in the Qualcomm SDHCI driver to help catch the
problem.

This would have saved a bunch of time [1].

[1] http://lore.kernel.org/r/20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Proper printf format code.

Changes in v2:
- Store rate in unsigned long, not unsigned int.
- Reuse the clk_get_rate() in the later print.

 drivers/mmc/host/sdhci-msm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3451eb325513..50beb407dbe9 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -353,6 +353,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 	struct mmc_ios curr_ios = host->mmc->ios;
 	struct clk *core_clk = msm_host->bulk_clks[0].clk;
+	unsigned long achieved_rate;
 	int rc;
 
 	clock = msm_get_clock_rate_for_bus_mode(host, clock);
@@ -363,10 +364,20 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 		       curr_ios.timing);
 		return;
 	}
+
+	/*
+	 * Qualcomm clock drivers by default round clock _up_ if they can't
+	 * make the requested rate.  This is not good for SD.  Yell if we
+	 * encounter it.
+	 */
+	achieved_rate = clk_get_rate(core_clk);
+	if (achieved_rate > clock)
+		pr_warn("%s: Card appears overclocked; req %u Hz, actual %lu Hz\n",
+			mmc_hostname(host->mmc), clock, achieved_rate);
+
 	msm_host->clk_rate = clock;
 	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
-		 mmc_hostname(host->mmc), clk_get_rate(core_clk),
-		 curr_ios.timing);
+		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
 }
 
 /* Platform specific tuning */
-- 
2.29.2.576.ga3fc446d84-goog

