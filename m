Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150CE391252
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 10:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhEZIan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 04:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbhEZIan (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 04:30:43 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668B8C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 01:29:12 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id h20-20020a17090aa894b029015db8f3969eso459151pjq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwaAsRaGDc+xiC4TWb/LXZJFMtg6HQDvxjDXok6GC+A=;
        b=ydR56fCW/6RBbz8ac7XivwlpSHoZPiHdcG1DUKhgmtqZkmr64H67FxVOhS7uoZ0GGQ
         O/U2ORpaJXJQA5ksQvEC415VMAMsARHiE0uPDpOfMJSN4ShfDBpz+9PRDEpm/lUwl1m8
         2Es7KFa0n8UP/fz5cO51WrO/9TfNY9O0FT6RLpkL11HSSSvd3+HluLE5zqIJu5SxeQTo
         02agk63DFjmA8J7yUtdJ4SJgUCuAIqqPmczLIuM4ATziM1e5Cz3RnFXlqV57X34xRlZA
         4TmWH23HQUQLKvzqkhzo7rDge/pIHwoOq5Ky2oE6bp+qWLRzC4bdFCBYAoUNF5weWedG
         Ro3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwaAsRaGDc+xiC4TWb/LXZJFMtg6HQDvxjDXok6GC+A=;
        b=qXwLZddnoUeXrFrFsXg9yTUTyd7eIcYiT1BLudTt64gI+hF/3FIpHEPQ7Or334jwJr
         gTimsTlzLI2DUenE+pxo5UTwNO23MtfyBx584ny5AgLUmHGxK/C8XYHCCtG7Vs1E5XTh
         Xt+9WLEjoyqLSBBk7olRJIIfgGCOW7piSxCjoE9AnV6bSXJWPCSwm6MLA8Hre27Lvm9s
         hBr11udKKXLZxZcO0xeXIOFEtWC/K+qG8IS7cHWjz+lva+tk73xhulXYz8aOoPoNwkoO
         1d5VAdcI7Th0ONvyL5hihm2c9TP+HG/ak+DxVZVUIX+jZdsDVQ5SfC5UMi55TxE/4VAT
         0ztg==
X-Gm-Message-State: AOAM532fKJoD8rj5u9GsVwqdl+hVZDL5EoQljMp2tVvEZn8H9ljWJmcs
        rZCyu1D4Li5VnPU033uP+Lor
X-Google-Smtp-Source: ABdhPJy5ey+0BNw8uJLeTvEUwOuOIUatQN/oTQDrXp2vGpFF11Y5EjIkxhvkRneQsjxtm/n96ZxtRw==
X-Received: by 2002:a17:902:7c81:b029:ef:b02d:f15a with SMTP id y1-20020a1709027c81b02900efb02df15amr34280298pll.34.1622017751859;
        Wed, 26 May 2021 01:29:11 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.4])
        by smtp.gmail.com with ESMTPSA id 23sm4256686pgd.71.2021.05.26.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 01:29:11 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc:     vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] pinctrl: qcom: Fix duplication in gpio_groups
Date:   Wed, 26 May 2021 13:58:57 +0530
Message-Id: <20210526082857.174682-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"gpio52" and "gpio53" are duplicated in gpio_groups, fix them!

Fixes: ac43c44a7a37 ("pinctrl: qcom: Add SDX55 pincontrol driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sdx55.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
index 5aaf57b40407..0bb4931cec59 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -410,15 +410,15 @@ static const char * const gpio_groups[] = {
 	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
 	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
 	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48", "gpio49",
-	"gpio50", "gpio51", "gpio52", "gpio52", "gpio53", "gpio53", "gpio54",
-	"gpio55", "gpio56", "gpio57", "gpio58", "gpio59", "gpio60", "gpio61",
-	"gpio62", "gpio63", "gpio64", "gpio65", "gpio66", "gpio67", "gpio68",
-	"gpio69", "gpio70", "gpio71", "gpio72", "gpio73", "gpio74", "gpio75",
-	"gpio76", "gpio77", "gpio78", "gpio79", "gpio80", "gpio81", "gpio82",
-	"gpio83", "gpio84", "gpio85", "gpio86", "gpio87", "gpio88", "gpio89",
-	"gpio90", "gpio91", "gpio92", "gpio93", "gpio94", "gpio95", "gpio96",
-	"gpio97", "gpio98", "gpio99", "gpio100", "gpio101", "gpio102",
-	"gpio103", "gpio104", "gpio105", "gpio106", "gpio107",
+	"gpio50", "gpio51", "gpio52", "gpio53", "gpio54", "gpio55", "gpio56",
+	"gpio57", "gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63",
+	"gpio64", "gpio65", "gpio66", "gpio67", "gpio68", "gpio69", "gpio70",
+	"gpio71", "gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
+	"gpio78", "gpio79", "gpio80", "gpio81", "gpio82", "gpio83", "gpio84",
+	"gpio85", "gpio86", "gpio87", "gpio88", "gpio89", "gpio90", "gpio91",
+	"gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97", "gpio98",
+	"gpio99", "gpio100", "gpio101", "gpio102", "gpio103", "gpio104",
+	"gpio105", "gpio106", "gpio107",
 };
 
 static const char * const qdss_stm_groups[] = {
-- 
2.25.1

