Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94299510E59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 04:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357063AbiD0CHE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 22:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357053AbiD0CGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 22:06:55 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113464CD72
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 19:03:45 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so3799329pjq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 19:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IsZlbQsLWz0QOpEE8Q49QKK/xrVS19U6wy6L3ZRioo0=;
        b=PR6vJ1BFrsbzEIyCBU+Yaei+DFk23SdPZaWHZUdskP4Nn0HqSyd+uEDGScjf8Y174C
         mBrvEjdb1W9Pm/2uiqPF07JxuyxUI4ZnToANMUpW/aUioT3iIpHx0eLws4Z6pBq9Vvwf
         Al7gYm9GHmVyzvg66ZqFUxofNo0UsM/CmIvbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IsZlbQsLWz0QOpEE8Q49QKK/xrVS19U6wy6L3ZRioo0=;
        b=tvZ7bKrpFm0UdEnIf771QbDPHYHGs/lM65X5orvJdh/Fow6Z/begqm9hz5Y0T1rTR+
         gVMx+tBtjH+Bu6zrRzwcxPjhwI/4UDG09fDkKa7YE4NAEIQXF0BLEZJuuoZf1R3Q3O7B
         FnFjwl8maY88Thcv1/dbGozVhoCY42QcnkYk5PQswGSd4XVsq01Oo+xK6aHaONnny1h5
         zDCh8wFHUFMk1xa8G5v0f6HAPDEq2UB7yMV7+2mS/wEAtg1we/ZBOPZHnXA0KAkT/PX2
         xlHCXmGF+TYi51YcEBcWI71T7Kyf5kZ6nYfJ+W1ElqZa/tgydGJXsh1kYMt37aA0ob0u
         4kXA==
X-Gm-Message-State: AOAM530m71Evk5LEMuxQAjdjJQ0LqtqjPwTCWqx8P3o7648Vl7gBdVZV
        /MNNYzyMFwmNuK5XhRjYn6GFeQ==
X-Google-Smtp-Source: ABdhPJz0d+vYS+RNgyPxW7emSuqX0TIM5P7LtPrQRlY01RTKs1I5onV9ABIJ7MIl6S35/NISjwVBKg==
X-Received: by 2002:a17:90b:4f43:b0:1da:3cba:bd51 with SMTP id pj3-20020a17090b4f4300b001da3cbabd51mr201502pjb.246.1651025025217;
        Tue, 26 Apr 2022 19:03:45 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:482e:60bc:84d1:bf5c])
        by smtp.gmail.com with ESMTPSA id g15-20020a056a0023cf00b004e17e11cb17sm18324197pfc.111.2022.04.26.19.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 19:03:44 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sc7180-trogdor: Simplify spi0/spi6 labeling
Date:   Tue, 26 Apr 2022 19:03:38 -0700
Message-Id: <20220427020339.360855-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220427020339.360855-1-swboyd@chromium.org>
References: <20220427020339.360855-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
anything besides making a pattern that others tryt  to copy for the EC and
H1 nodes. Let's remove it and simplify the dts files.

Cc: "Joseph S. Barrera III" <joebar@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 6 +-----
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 3 ---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 3 ---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi   | 4 ----
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts        | 4 ----
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 4 ++--
 6 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 8da61a52f150..ac2279142a95 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -6,14 +6,10 @@
  */
 
 #include "sc7180.dtsi"
-
-ap_ec_spi: &spi6 {};
-ap_h1_spi: &spi0 {};
-
 #include "sc7180-trogdor.dtsi"
 #include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
-/* Deleted nodes from trogdor.dtsi */
+/* Deleted nodes from sc7180-trogdor.dtsi */
 
 /delete-node/ &alc5682;
 /delete-node/ &pp3300_codec;
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
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index 410ca2a76d81..3bca7545ffe5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -6,10 +6,6 @@
  */
 
 #include "sc7180.dtsi"
-
-ap_ec_spi: &spi6 {};
-ap_h1_spi: &spi0 {};
-
 #include "sc7180-trogdor.dtsi"
 #include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index 311c42a535ff..6c822c84112a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -8,10 +8,6 @@
 /dts-v1/;
 
 #include "sc7180.dtsi"
-
-ap_ec_spi: &spi6 {};
-ap_h1_spi: &spi0 {};
-
 #include "sc7180-trogdor.dtsi"
 #include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 7648be83f7e4..ea5bedc3d1cb 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -626,7 +626,7 @@ src_vreg_bob: bob {
 	};
 };
 
-&ap_ec_spi {
+ap_ec_spi: &spi6 {
 	status = "okay";
 	cros_ec: ec@0 {
 		compatible = "google,cros-ec-spi";
@@ -675,7 +675,7 @@ usb_c1: connector@1 {
 	};
 };
 
-&ap_h1_spi {
+ap_h1_spi: &spi0 {
 	status = "okay";
 	cr50: tpm@0 {
 		compatible = "google,cr50";
-- 
https://chromeos.dev

