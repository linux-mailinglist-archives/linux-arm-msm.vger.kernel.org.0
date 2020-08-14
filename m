Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C67244BDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 17:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgHNPWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 11:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgHNPWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 11:22:06 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F0CC061384;
        Fri, 14 Aug 2020 08:22:06 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id i6so7096488edy.5;
        Fri, 14 Aug 2020 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQmCXjIJLm4FOxf1HtQwARu0AkrMVdJ4Csr5yAIm0vc=;
        b=E/t/2SEODb0FlrlwFdSy8mvqOSQ+hxjDltw15BEagw1Pc5SFcB3E5mKO32U9sQ/SMA
         OGh5sBaVu4MVPBSD0qcSxykJDVd2KOoMKD+v6zw5Ct3sbclbEiMUK2Yq3d/ovECIp/76
         JZsf4kFkoF7pgwtE6/HTJOffvD/8S4uKB24wSIJggfnuoKxiXOt16mWNUKYYBrNJCm+A
         5kuUXMdsIS72j/MqkfkBzCUQsp9BZvI90MV5CkABPE4jXRecOzc5pat5o8cN/ilgMl3q
         f+gY5nmc6Khm/FcmvRk1n7Yrx2vOO6lVGBbhLD0wVnKP8Y0faITGnAXnbhE6wZXn3z25
         rqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQmCXjIJLm4FOxf1HtQwARu0AkrMVdJ4Csr5yAIm0vc=;
        b=i2l8H0+2M8wQPD0s4Rcc1O2xIuMkmLDJQ6IBqB6L9jyUyIM446e8mXqUTa1gTECmTk
         FblWqMo7XOb9zVz70paTTnpK4pXe2xVPn+EfxQ5xpc07Pi8bDz+C4r1D96QZSQGIP3x6
         8PKiYfx51kD8g54CF5Vpd+WUGRQp5H3urlpEVU+21zIKvsjRxAdFl1JkhHVDbVG8hG+w
         IuOyVYof965mavQQXpO5Sc+14D6MHj6WlhBY721+1LrZAo4hFQ+fgqHSeL+L2s8G6ZIu
         dMAXkSoIlqdXCFE58Cd6bcVEnfsBSuR9ybcwHQfSQXO6IbCvt8yxY74YZvZv52x5rdNW
         RxvQ==
X-Gm-Message-State: AOAM532f71dn7OPxtUgBN9uRMOUByrkSr5VB9BED/BNiHgDdzJGhmUCG
        hsYG3/Bs9J82Ez0Xw1JVOmg=
X-Google-Smtp-Source: ABdhPJyIyTb9/qHX42b92RxbUctP0qmUWK2msIV5OUMivkT40jOjszH4t2eA5MNELxhzAmTXQbDFCw==
X-Received: by 2002:a05:6402:1282:: with SMTP id w2mr2593059edv.183.1597418525094;
        Fri, 14 Aug 2020 08:22:05 -0700 (PDT)
Received: from localhost.localdomain (abag79.neoplus.adsl.tpnet.pl. [83.6.170.79])
        by smtp.googlemail.com with ESMTPSA id e8sm6087974edy.68.2020.08.14.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 08:22:04 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] [-next] mmc: host: msm: Add optional full power cycle property.
Date:   Fri, 14 Aug 2020 17:21:59 +0200
Message-Id: <20200814152201.254010-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some eMMCs (at least the ones used on Sony msm8994 boards)
enabling full power cycle is required to prevent permanent damage
to the flash memory, whereas on others it results in better performance.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 4 ++++
 drivers/mmc/host/sdhci-msm.c                        | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 3b602fd6180b..939c8df2a25c 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -54,6 +54,10 @@ Required properties:
 - qcom,dll-config: Chipset and Platform specific value. Use this field to
 	specify the DLL_CONFIG register value as per Hardware Programming Guide.
 
+- qcom,full-pwr-cycle: Enable full power cycle CAP2. This is required for optimal
+	performance on some eMMCs, whereas others need it to prevent permanent
+	damage to the flash memory.
+
 Optional Properties:
 * Following bus parameters are required for interconnect bandwidth scaling:
 - interconnects: Pairs of phandles and interconnect provider specifier
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 5a33389037cd..8d5c65e13dca 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2242,6 +2242,12 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
 
+	if (of_find_property(pdev->dev.of_node, "qcom,full-pwr-cycle", NULL))
+		msm_host->mmc->caps2 |= MMC_CAP2_FULL_PWR_CYCLE;
+
+	else
+		dev_info(&pdev->dev, "MMC full power cycle is not enabled. This might result in subpar performance or permanent damage on some devices.\n");
+
 	/* Setup SDCC bus voter clock. */
 	msm_host->bus_clk = devm_clk_get(&pdev->dev, "bus");
 	if (!IS_ERR(msm_host->bus_clk)) {
-- 
2.28.0

