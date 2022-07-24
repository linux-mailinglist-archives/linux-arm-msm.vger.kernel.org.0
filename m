Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F2D57F560
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 16:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbiGXOEd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 10:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbiGXOEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 10:04:30 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97191274A
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id d17so12309949lfa.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59sAl4bh1sT2A60i18qgY9VCGua4H6B8ILlg/stA2Ho=;
        b=v0x+9Hjpvrtf0kdC0YTOspjHKq2yrjMSHshAHc9/4bXvCXSX1D3A4jH6njI+VLTtb8
         EKLXIgUdF6oHEadIKI1nwOjo4XylfwAHfTLUKdV6GO6kHcTXdVUJbWNGki3i9lUPt8ja
         uT380kjUKEslqX1i/XP0Xx1gNGcrnrx70tzt1YcfLoSHlZYW4sCej/pK+1u8ovVXNKXN
         ++C9WIX4KYLCAj0e16p1qPYiVdqVPOlmDzdaY0AmmDE56b96WqL6qsQsni8FCQgM2vif
         yAmyjrvWohaOrjyOXN3s7kO0CNSGyk2C+Cz/XXfoIPAAcwwr5LTe0cfwv7iSTLyjJUP1
         Gxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59sAl4bh1sT2A60i18qgY9VCGua4H6B8ILlg/stA2Ho=;
        b=EsoTbZ3zLhLypDjERIZRqDSDOqI/T5hGn700C7tRYYVSfzEwUfuvu+ozGSVtVIea+/
         usUL1TI6SICFlRN3n5MPi40FjxfdZFNI0HED5QdOPNV//YBIqylZnzxDME08P09b2yAU
         m0UO8xNnHlkwYzLDoV2kV0L3zw7e1DVPRSYzYfsnx/FuRffHRljk4mZDIjQgGTqN945Y
         2TmohVFbJxVHw8jKMPijfiXJK9N5VAh9AeY4K/s02P16ZdhZLeDa+WtfGZsL8eB1JIFl
         EycXkLGadAQRlVEwquqigm5zu/sUOsYEikEr4/PTQk9gJzcmG1PT340vK7LaVxXkAw4l
         +HvQ==
X-Gm-Message-State: AJIora/+nPAAJm4PY8UOgOe6BifTo2xYZSe+OUv+4GaeMsAks2IltBu+
        v0UzccnGxV7hU5QZIDlbNqcvUw==
X-Google-Smtp-Source: AGRyM1uYv4TiL7wX2ixKN5o4TFbD80CO2U2Dge85gfade3KlbALCsJqDjPY6zc1YkviAt6/+bYYh9Q==
X-Received: by 2002:ac2:5084:0:b0:48a:6e29:bf8 with SMTP id f4-20020ac25084000000b0048a6e290bf8mr3188345lfm.572.1658671465975;
        Sun, 24 Jul 2022 07:04:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512202d00b00489dedf1dcfsm2192622lfs.289.2022.07.24.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 07:04:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 3/7] arm64: dts: qcom: msm8996-xiaomi-scorpio, natrium: Use MSM8996 Pro
Date:   Sun, 24 Jul 2022 17:04:17 +0300
Message-Id: <20220724140421.1933004-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Yassine Oudjana <yassine.oudjana@gmail.com>

The Xiaomi Mi Note 2 has the MSM8996 Pro SoC. Rename the dts
to match, include msm8996pro.dtsi, and add the qcom,msm8996pro
compatible. To do that, the msm8996.dtsi include in msm8996-xiaomi-common
has to be moved to msm8996-xiaomi-gemini, the only device that needs it
included after this change.

Since MSM8996Pro is largely compatible with MSM8996, keep old compatible
too rather than insiting on qcom,msm8996pro only. This allows the code
that doesn't yet know about msm8996pro to continue supporting these
devices.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
[DB: Applied the same change to Xiaomi Mi 5s Plus (natrium).]
[DB: Dropped msm-id changes.]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                             | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi           | 3 ---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts            | 1 +
 ...m8996-xiaomi-natrium.dts => msm8996pro-xiaomi-natrium.dts} | 3 ++-
 ...m8996-xiaomi-scorpio.dts => msm8996pro-xiaomi-scorpio.dts} | 3 ++-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename arch/arm64/boot/dts/qcom/{msm8996-xiaomi-natrium.dts => msm8996pro-xiaomi-natrium.dts} (99%)
 rename arch/arm64/boot/dts/qcom/{msm8996-xiaomi-scorpio.dts => msm8996pro-xiaomi-scorpio.dts} (99%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1d86a33de528..78534c33a61e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -34,8 +34,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-dora.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-kagura.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-keyaki.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-xiaomi-gemini.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-xiaomi-natrium.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-xiaomi-scorpio.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8996pro-xiaomi-natrium.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8996pro-xiaomi-scorpio.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-fxtec-pro1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 627649979891..90e40fd57f4c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -3,9 +3,6 @@
  * Copyright (c) 2020, Yassine Oudjana <y.oudjana@protonmail.com>
  */
 
-/dts-v1/;
-
-#include "msm8996.dtsi"
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index 25f30ec277c1..cc76b2210466 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include "msm8996.dtsi"
 #include "msm8996-xiaomi-common.dtsi"
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
similarity index 99%
rename from arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dts
rename to arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
index ff4673ee9e81..368e9d837dfa 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include "msm8996pro.dtsi"
 #include "msm8996-xiaomi-common.dtsi"
 #include "pmi8996.dtsi"
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -12,7 +13,7 @@
 
 / {
 	model = "Xiaomi Mi 5s Plus";
-	compatible = "xiaomi,natrium", "qcom,msm8996";
+	compatible = "xiaomi,natrium", "qcom,msm8996pro", "qcom,msm8996";
 	chassis-type = "handset";
 	qcom,msm-id = <305 0x10000>;
 	qcom,board-id = <47 0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
similarity index 99%
rename from arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
rename to arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
index 30a9e4bed4af..54a0854faf5b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include "msm8996pro.dtsi"
 #include "msm8996-xiaomi-common.dtsi"
 #include "pmi8996.dtsi"
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -12,7 +13,7 @@
 
 / {
 	model = "Xiaomi Mi Note 2";
-	compatible = "xiaomi,scorpio", "qcom,msm8996";
+	compatible = "xiaomi,scorpio", "qcom,msm8996pro", "qcom,msm8996";
 	chassis-type = "handset";
 	qcom,msm-id = <305 0x10000>;
 	qcom,board-id = <34 0>;
-- 
2.35.1

