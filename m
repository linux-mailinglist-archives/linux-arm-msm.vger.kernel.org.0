Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C3425B767
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 01:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgIBXnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 19:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgIBXn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 19:43:27 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E466C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 16:43:27 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k15so657976pfc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 16:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PQLZP1Qz8JxBBrCvH3ODAjxLepZmxXcyVpXcrB89bk=;
        b=Si7LqGmssihn3d3s2I9Mo4GuAzBWNq77GAdmQUcK+JZNwW1IUQBFf3DntrMWGys0DA
         EJRmR/3bJ6BI5hyFGpR1ebZu6+Bqo+GgQEwf2kPNfGD7RJa+rshcYDBmXSUNL+9W9DX/
         w05LDlIC+77MlkeTr0iT2NnOzP9cQdv2T2+Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PQLZP1Qz8JxBBrCvH3ODAjxLepZmxXcyVpXcrB89bk=;
        b=U1pTtPpQVJD/7FkjqU1jNkJ13SWQnfzb/psXhSfmKFj2r+bcDlKbNKv6NgA4qsIRxZ
         Hc6Roaadvm74MHQPnOfqV0CLFQQyl4QLY5RaBw8Iu9REVR5dOfirVI/htnSPSsjuE0Xf
         Wb+Kz3WolaJM+yUYEg8ke2VVKLVxY8JYkdoJz5DZeTAbhUPtaY57FhuQx0HTeLyoB16g
         9H8recY3QBWMIcskYR5D4BtPOaH+SmbIQdIQ+AZAhMNxhTFx19wczwSZTArm+Ky3MKQx
         v1dzx8jf9vEOqHR9EYSbLBbWX0vczEJw8VgQAfiSou8qk+9nVn+BZuVmNpBFwbxInYCj
         Kh6g==
X-Gm-Message-State: AOAM533YMDmM1oWQRrPh4pj0Gdpj1rWiXh91+EJlyKCcH0Z+5Xe/41/g
        NkZIO7HLxN3SyuZu6SYwG3UMMw==
X-Google-Smtp-Source: ABdhPJyB+KmcwqeuAkYJZdNtmNa+iUiP8ezkepEkp25WOfYRYpBfVNpPZLgP0MZ78ERRcgKely0bxQ==
X-Received: by 2002:a62:cdc2:: with SMTP id o185mr809740pfg.170.1599090205522;
        Wed, 02 Sep 2020 16:43:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q2sm426284pgh.48.2020.09.02.16.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 16:43:24 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     vbadigan@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: sdhci-msm: Prefer asynchronous probe
Date:   Wed,  2 Sep 2020 16:43:15 -0700
Message-Id: <20200902164303.1.I5e598a25222b4534c0083b61dbfa4e0e76f66171@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Turning on initcall debug on one system showed this:
  initcall sdhci_msm_driver_init+0x0/0x28 returned 0 after 34782 usecs

The lion's share of this time (~33 ms) was in mmc_power_up().  This
shouldn't be terribly surprising since there are a few calls to delay
based on "power_delay_ms" and the default delay there is 10 ms.

Because we haven't specified that we'd prefer asynchronous probe for
this driver then we'll wait for this driver to finish before we start
probes for more drivers.  While 33 ms doesn't sound like tons, every
little bit counts.

There should be little problem with turning on asynchronous probe for
this driver.  It's already possible that previous drivers may have
turned on asynchronous probe so we might already have other things
(that probed before us) probing at the same time we are anyway.  This
driver isn't really providing resources (clocks, regulators, etc) that
other drivers need to probe and even if it was they should be handling
-EPROBE_DEFER.

Let's turn this on and get a bit of boot speed back.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/sdhci-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index d4c02884cca8..9dd0dbb65382 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2542,6 +2542,7 @@ static struct platform_driver sdhci_msm_driver = {
 		   .name = "sdhci_msm",
 		   .of_match_table = sdhci_msm_dt_match,
 		   .pm = &sdhci_msm_pm_ops,
+		   .probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.28.0.402.g5ffc5be6b7-goog

