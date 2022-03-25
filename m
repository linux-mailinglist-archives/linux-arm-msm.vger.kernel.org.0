Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1054E7D6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiCYXpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 19:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiCYXpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 19:45:25 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686CC117
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 16:43:48 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id o13so7629993pgc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 16:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FSWUNqTS/J7688At5bZOQtpG3+9Hz7weNAL/xXN4vlw=;
        b=Q3uuErJzFFUe83QDREvO9Nsf+uoPteWy3fC98dw6WwmBfoPKY1Qaaf+0YlxzKFGJZ+
         YExYnPANIW5BqYAlDfiEg3X+OaI9RyiP9vMkZXTj0TcsxRDwAajLwpa1lgBUmlsHMDTX
         mK1puREcHQxT9xgoA+cL5zPBpx/GCCBtcmYmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FSWUNqTS/J7688At5bZOQtpG3+9Hz7weNAL/xXN4vlw=;
        b=aECayVVsnfTRQewdV0dIQbj903yKhMtLMLK8RRHe60bqa1erXCxOW5JjogpGDaacp8
         EUjA2SPvK5nZ8OFHMNywc1XDiJGy7IQwLoeh56s47WFMM9PAz8khowcRSCibAhWehFvM
         zfATJijQhK9Ki0MgcHwcxCyIXXgxJbqCTrXnrLbsdeDsCeQaaZxAdYBIZwn36QZ7IA3a
         Qcn27sMO2nYilMRm9FPKEV++pQWuyRog0vMR7X69GSoe/Ht0FlF7PSrR0oOy7PmdDr3+
         9Z4YPH2P0SGn8mT5hf9Mzh05x2XZY9LcaWzo9cNMkaoU3v3Sbhx5WAxNJjlGndOR4RgB
         Bf5w==
X-Gm-Message-State: AOAM532GmqScAP8pgU5OXJWVb3TQ1gsiS9CnjG9E31TMP25+X2hBa3cH
        pAjLpHm0W/akPp+ccM4CFrtYeA==
X-Google-Smtp-Source: ABdhPJyjq+wtj3gMGv265JeGRq8z2mL+7OD4zA6obYgYBju68n4sA6WnryDMKOeSJEE4AYIFUFhgVg==
X-Received: by 2002:a05:6a00:14d5:b0:4fb:2adf:dcdd with SMTP id w21-20020a056a0014d500b004fb2adfdcddmr1086184pfu.72.1648251827775;
        Fri, 25 Mar 2022 16:43:47 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:5662:afcf:5e0a:c3a5])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000a9100b004e1b7cdb8fdsm8684525pfl.70.2022.03.25.16.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 16:43:47 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Joseph Barrera <joebar@google.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sc7180-trogdor: Simplify spi0/spi6 labeling
Date:   Fri, 25 Mar 2022 16:43:43 -0700
Message-Id: <20220325234344.199841-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
In-Reply-To: <20220325234344.199841-1-swboyd@chromium.org>
References: <20220325234344.199841-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We had to do this spi0/spi6 flip-flop on trogdor-r0 because the spi
buses got swizzled between r0 and r1. The swizzle stopped after r1, but
we kept this around to support either hardware possibility and to keep
trogdor-r0 working.

trogdor-r0 isn't supported upstream, so this swizzle is not doing
anything besides making a pattern that others try to copy for the EC and
H1 nodes. Let's remove it and simplify the dts files.

Cc: Joseph Barrera <joebar@google.com>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 5 -----
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 3 ---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 3 ---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 5 +++--
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 8da61a52f150..186be3f419d7 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -5,11 +5,6 @@
  * Copyright 2020 Google LLC.
  */
 
-#include "sc7180.dtsi"
-
-ap_ec_spi: &spi6 {};
-ap_h1_spi: &spi0 {};
-
 #include "sc7180-trogdor.dtsi"
 #include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index 532c7dcc3f73..9b3e3d13c165 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -5,9 +5,6 @@
  * Copyright 2021 Google LLC.
  */
 
-ap_ec_spi: &spi6 {};
-ap_h1_spi: &spi0 {};
-
 #include "sc7180-trogdor.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 75df5d1633b2..fe2369c29aad 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -5,9 +5,6 @@
  * Copyright 2020 Google LLC.
  */
 
-ap_ec_spi: &spi6 {};
-ap_h1_spi: &spi0 {};
-
 #include "sc7180-trogdor.dtsi"
 
 &ap_sar_sensor {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 3bf40b6abcba..3123665f6c3c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/sc7180-lpass.h>
 
+#include "sc7180.dtsi"
 /* PMICs depend on spmi_bus label and so must come after SoC */
 #include "pm6150.dtsi"
 #include "pm6150l.dtsi"
@@ -626,7 +627,7 @@ src_vreg_bob: bob {
 	};
 };
 
-&ap_ec_spi {
+ap_ec_spi: &spi6 {
 	status = "okay";
 	cros_ec: ec@0 {
 		compatible = "google,cros-ec-spi";
@@ -675,7 +676,7 @@ usb_c1: connector@1 {
 	};
 };
 
-&ap_h1_spi {
+ap_h1_spi: &spi0 {
 	status = "okay";
 	cr50: tpm@0 {
 		compatible = "google,cr50";
-- 
https://chromeos.dev

