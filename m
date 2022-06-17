Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEED54FCC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 20:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383081AbiFQSMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 14:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383565AbiFQSM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 14:12:29 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2005E53B49
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 11:12:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so4827371pjz.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DpZY8rGvI2vk52QK3a3PpGqnbUnWe14CMVh2WjPF3f4=;
        b=jp8fEEgEtjB2UpHcxYU8SEmnZCyOg8aBH74AVmhtMXOAgmlykM2IGqcKGoIFwVGhYG
         Nm5Wwjzwi3CO/vBi4Tjuc85NMECmjfzfOHiT++T8k1X4TuBirZN3QQQjPanM8PjAfRw+
         AKzA1ghtuPBOaQRMeNgpeLrut4VYnRV8NHrSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DpZY8rGvI2vk52QK3a3PpGqnbUnWe14CMVh2WjPF3f4=;
        b=cp4AnEh/y8cddViHR6uB4+iFxlW0ptxkS5l5UUdXmiy1nQfWT2SaD8q5YBoEN6DYIT
         4NMWu28qFJH3+Q9w72S2/qIMA1yVdr8G1Q0HJ8ZbQ1AvWGBxX1EhU1jBM5xZg+mvgTY+
         wF/vNaEqfas/6ieWHZtILZavVOjWQl3FtMruFey3hCjqGyocaDRxyjsza4/FC9ZY5Z9Y
         8ZmaExPy/AcF8klBf5277sDmUrZaFhVr5RsOKjXoLfpdZeMPKDXZtNxPaBqrcbOWgOod
         jkgeqaMazI2lIwf+KE+c5GFprN1HPavMloVdfmfHlcT8EMC2KrRn3ATZgJBIHWSv0dFb
         mKUA==
X-Gm-Message-State: AJIora9tiafW4f7WvVbURlR6+a/FeMwDBxpHM5Rng1y79saQ6aog/9aA
        mG0yh4Zb6kZyE32byqTapwkV0Q==
X-Google-Smtp-Source: AGRyM1uBM5RHyObdSi9ULsnPZZXSzl1rByF1g/Aa6wsbCNt/goOXKEaGeWwtgRbU6+zshLhe8y2eIg==
X-Received: by 2002:a17:902:700b:b0:167:736e:cfb1 with SMTP id y11-20020a170902700b00b00167736ecfb1mr10790531plk.36.1655489540547;
        Fri, 17 Jun 2022 11:12:20 -0700 (PDT)
Received: from joebar-glaptop.lan (c-71-202-34-56.hsd1.ca.comcast.net. [71.202.34.56])
        by smtp.gmail.com with ESMTPSA id o1-20020a62f901000000b0052285857864sm4121930pfh.97.2022.06.17.11.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 11:12:20 -0700 (PDT)
From:   "Joseph S. Barrera III" <joebar@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 6/6] arm64: dts: qcom: Remove duplicate sc7180-trogdor include on lazor/homestar
Date:   Fri, 17 Jun 2022 11:10:41 -0700
Message-Id: <20220617111021.v6.6.I423a007e8c4451bd1d091fcb65d035e5dcfc9a9d@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220617111021.v6.1.I9e299d3fa6fbf50df6fc7207050bf5c3a7bf4c61@changeid>
References: <20220617111021.v6.1.I9e299d3fa6fbf50df6fc7207050bf5c3a7bf4c61@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

The sc7180-trogdor-{lazor,homestar}-*.dtsi files all include
sc7180-trogdor.dtsi and sc7180-trogdor-lazor.dtsi or
sc7180-trogdor-homestar.dtsi, so including it here in the
sc7180-trogdor-{lazor,homestar}.dtsi file means we have a duplicate
include after commit 19794489fa24 ("arm64: dts: qcom: Only include
sc7180.dtsi in sc7180-trogdor.dtsi"). We include the sc7180-trogdor.dtsi
file in a board like sc7180-trogdor-lazor-r1.dts so that we can include
the display bridge snippet (e.g. sc7180-trogdor-ti-sn65dsi86.dtsi)
instead of making ever increasing variants like
sc7180-trogdor-lazor-ti-sn65dsi86.dtsi.

Unfortunately, having the double include like this means the display
bridge's i2c bus is left disabled instead of enabled by the bridge
snippet. Any boards that use the i2c bus for the display bridge will
have the bus disabled when we include sc7180-trogdor.dtsi the second
time, which picks up the i2c status="disabled" line from sc7180.dtsi.
This leads to the display not turning on and black screens at boot on
lazor and homestar devices.

Fix this by dropping the include and making a note that the
sc7180-trogdor-{lazor,homestar}.dtsi file must be included after
sc7180-trogdor.dtsi

Reported-by: Douglas Anderson <dianders@chromium.org>
Cc: "Joseph S. Barrera III" <joebar@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Fixes: 19794489fa24 ("arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
---

Changes in v6:
 - First inclusion of this patch.

 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index 5074014d5269..1bd6c7dcd9e9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -5,7 +5,7 @@
  * Copyright 2021 Google LLC.
  */
 
-#include "sc7180-trogdor.dtsi"
+/* This file must be included after sc7180-trogdor.dtsi */
 
 / {
 	/* BOARD-SPECIFIC TOP LEVEL NODES */
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index d8839ccdcf09..f65c488dcf9d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -5,8 +5,12 @@
  * Copyright 2020 Google LLC.
  */
 
-#include "sc7180-trogdor.dtsi"
-/* Must come after sc7180-trogdor.dtsi to modify cros_ec */
+ap_ec_spi: &spi6 {};
+ap_h1_spi: &spi0 {};
+
+/* This file must be included after sc7180-trogdor.dtsi */
+
+/* This include must come after sc7180-trogdor.dtsi to modify cros_ec */
 #include <arm/cros-ec-keyboard.dtsi>
 
 &ap_sar_sensor {
-- 
2.31.0

