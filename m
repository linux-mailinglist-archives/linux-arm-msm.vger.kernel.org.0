Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7162D699D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 22:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404781AbgLJVUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 16:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393970AbgLJVUR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:20:17 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D9FC061793
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:19:38 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 11so5339538pfu.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/9N8F/baelWHyQ98/UbLICQNRl8dd1pE69/xgFra+Y=;
        b=bHaFvEJRJ2xp9m8QIhD3LaubM3ulV/G1lYWzxS6grlaX6/0d9NZfDfWU/je5LgU762
         0LAC1KJ0Nhn3kpa/to64FRLMSm/n3DSLZGZlVf8GKI7A5D6IzkuSZH3ku8K5KrG1E/jg
         5/xz+96lU74ssKGoFzUUCCXmUZY4OsFOaKhSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/9N8F/baelWHyQ98/UbLICQNRl8dd1pE69/xgFra+Y=;
        b=BQ16JhVt1PxcpIhilUB968CcvURtWYOoex56XA/inIuz2AHTd+ffm7JLLYzFSeDpfH
         39mtQ1JavNk66jGv0/MYLnO7J7upQY4BJNHiKhilElPHJToTn58PSTtJ1IY948gZHPNu
         50wLKgMgAKQLEsGqjkt04ZoRnpKYOyIL9PQOaKTqWJ8PFmW7IUVdR31TFXYClwdNI/i/
         huzbGWnZ0Rtx8wJwDHiAk2KIY7FAKRfRlTWRniFjizrWDc9uBD2Q7YtbXJWvFUvz9Mhd
         /AOCg92c2KCCb7KwhVq+slokW4eQBSbTFpUqbuP95O7NatGjci1hvpC/Jp38lXYGNm5u
         yQfw==
X-Gm-Message-State: AOAM532n7/MEFIqK9LSZ0TLf9flmWl11WaNTZnfXeqRd7wC+QOhU0QW3
        G8qUkgGRh+k8Q6yIrjTbHDfAJA==
X-Google-Smtp-Source: ABdhPJydDS8laqjW9+fNySNIQRDJRGOzgGjaM1FkRZAbeypxJ7tUTCXTdqspyYmRVya9TKAE9thJ1Q==
X-Received: by 2002:a17:90a:4d84:: with SMTP id m4mr9680536pjh.145.1607635177687;
        Thu, 10 Dec 2020 13:19:37 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id a141sm7320800pfa.189.2020.12.10.13.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:19:37 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     vbadigan@codeaurora.org, Stephen Boyd <swboyd@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH v2] mmc: sdhci-msm: Warn about overclocking SD/MMC
Date:   Thu, 10 Dec 2020 13:19:28 -0800
Message-Id: <20201210131913.v2.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
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

Changes in v2:
- Store rate in unsigned long, not unsigned int.
- Reuse the clk_get_rate() in the later print.

 drivers/mmc/host/sdhci-msm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3451eb325513..52824c6b2073 100644
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
+		pr_warn("%s: Card appears overclocked; req %u Hz, actual %d Hz\n",
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

