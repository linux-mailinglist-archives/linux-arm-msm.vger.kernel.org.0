Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FD42505B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 19:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgHXRUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 13:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgHXRT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 13:19:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21532C061573;
        Mon, 24 Aug 2020 10:19:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a15so9565131wrh.10;
        Mon, 24 Aug 2020 10:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C9X1p42aeOOnW2Usd4grmmLfZACML23BtfSp9MKN9X8=;
        b=K/P3RmYUo5M0PigfEr5MeDR0KxyYFSproCWapVlhHNqF/tlTG6w4xeXrk473fq+uAx
         Ste+BkO048YYiVlsDydn7mD5HNNuRjvm6dPhQeC2O5z6LHAQfWiKu/fZba0UofNmRQvW
         qFa2WXxyPNHXQNKH/T4Gtw+SFEV6FpcobhL+tuJIwpOhJHBe8r2RVF6NyNvT5VNcjrKB
         VQ+Xgq/xIeyA6IZiZaFnOtG/KMBTlCPTg3pscPxjqS4RpsH67POV7VzgNofx+/KSX5UG
         8AefmnQSJvKK88pRJBM7J/N+lri9hrYwgVHLezFn8ylMd9hW1APwgo7UwUqb4RMywKwG
         mxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C9X1p42aeOOnW2Usd4grmmLfZACML23BtfSp9MKN9X8=;
        b=IH9pL+4EAYw23HuctqZmNoWGfCGtSXDHLaxywhEWxCaex0HTcpplboNC+0aG9T2FqM
         pFwhpHkh6D1KnI4XNaDRE+tpPWe+xP7bQb17cRkjvQYSI7lWBXTsqsHnbWg5zNdgSl/k
         0VL4XWL/O9w1ntPA1HnUPO05h9P+cssXmHLveQ6pE+yzhHwD3MR1aygEVmopUwFhI0m+
         zcffodtcZ5pEEO2d3djf6RpEY+0rcxhuZ027bg60upWXwyUynN+TkIhod+VD5wXkv3Yo
         kSKa3UTbb6OpfFRB4LzRXuWGyyMNrXxXdvtzoZIAh6YHpc+rxBVDFczefqcNyZGbL2KR
         LgZQ==
X-Gm-Message-State: AOAM532hnE5BdzhIwA5YlbNKNx1+zYPJW0ywuOhhyfvc5pTvu8KWZJd9
        y+1ff0cQEF+g1Pn9GOsEmAo=
X-Google-Smtp-Source: ABdhPJwXB1OIoowFML/EZ4S8k9SRROgikI9djZS4/ZaH2yeIC92J7KCq2VO+vFenHbDB14vxwYHnqA==
X-Received: by 2002:adf:83c5:: with SMTP id 63mr6659666wre.321.1598289595855;
        Mon, 24 Aug 2020 10:19:55 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id f125sm309887wmf.48.2020.08.24.10.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 10:19:55 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Jeffery <andrew@aj.id.au>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        Takao Orito <orito.takao@socionext.com>,
        Guo Ren <guoren@linux.alibaba.com>,
        Alex Dewar <alex.dewar90@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH RFC] mmc: sdhci-msm: enable compile-testing on !ARM
Date:   Mon, 24 Aug 2020 18:18:50 +0100
Message-Id: <20200824171854.406157-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There seems to be no particular reason to only test for ARM, so allow
for build-testing on other platforms to increase coverage.

Build-tested on x86 with allyesconfig.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
Let me know if there is some extra dependency needed for COMPILE_TEST! I
don't want to break anything.
---
 drivers/mmc/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index f6c6eed5227a..7707f7385b5b 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -525,7 +525,7 @@ config MMC_ATMELMCI
 
 config MMC_SDHCI_MSM
 	tristate "Qualcomm SDHCI Controller Support"
-	depends on ARCH_QCOM || (ARM && COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_CQHCI
-- 
2.28.0

