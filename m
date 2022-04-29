Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51AE05156E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237967AbiD2VeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238113AbiD2VeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:34:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198039F3B8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:30:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu29so16263696lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eDT9kSu3JZdpsuMm2x+UDGGY32H0TbkhH7Wl08ke45c=;
        b=isjrSbbohByErGt/Vlo4XlV5SxZu99kxeUjR3F6/1Ldqa9sPQMn9vcE/5PG+Lt8rkZ
         3YeB/LVGrtxC99tGuD7nF+sRwaRmpUKl3E4jsbtZVnpLsrmlFhNMNrDShGYEIuiZVzmY
         k5l5q3HbPM2To5azZpIPriNlEk6ZJ25e7SDVb51Ofe87hqH/NaSUKtoYQO3nC41PpO7x
         lqJFO1ssM94op4Mt2B/CSKpvGIzzub2sGEd1PEXU9XF3A9vXbZ3iimP4a6mjNbvupAdb
         L09Hlt+J/t5vH+/5a5umDcymgQuWNlKtJUGxQwje/caJ8Tc8COdYICyC3ik4HNcy1EoW
         GnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eDT9kSu3JZdpsuMm2x+UDGGY32H0TbkhH7Wl08ke45c=;
        b=e8LuPVUzf2zjf9vJD/78KERZU5am900dBOYtX3/BzvWoLmpXkbrkkTxI6p+Al75um8
         t3GDw8GrsgbbVVbpQ/D8MNOFiXnW/+CGOHtFUHqvBmg7/wp/pIh1FDBQN0RGmqXoOGzD
         bRXGDKeGnfmoOvOXo9xsXjtWITRdhB/HN2Cj3VVC1+gLjbZJnddnn09+Q7ZXcoy8ul+h
         D6Lv4L1smiC76iCFnM/7ZrgR6l14veYOZOZyySKpgcjYgcio73NWyJemb9WA7va7I/zA
         /vtyayotWXJ2pDNvhdPygHP9kwV2+yRbHzPEE0yhSuwpFdTO5tgiwOre1UGIYRRB/J1+
         LP9Q==
X-Gm-Message-State: AOAM530uRu8g+zbm6jQD7d8cREhXJ8nW4xr9htSjiS4DJl1L6t9/3rUe
        9U6A3jtXeOdyKC40LL/13NQM1w==
X-Google-Smtp-Source: ABdhPJx8dwuGwRqFQ7x32uquivxn8M6muwn1pHxca+oC/B1h7wDdC9svDODc9vZWozRTYqgf9yF6Cg==
X-Received: by 2002:a05:6512:3049:b0:472:3aef:321b with SMTP id b9-20020a056512304900b004723aef321bmr884577lfb.246.1651267838466;
        Fri, 29 Apr 2022 14:30:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 11-20020ac2568b000000b0047255d21182sm28589lfr.177.2022.04.29.14.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 14:30:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 7/8] arm: dts: qcom-*: replace deprecated perst-gpio with perst-gpios
Date:   Sat, 30 Apr 2022 00:30:31 +0300
Message-Id: <20220429213032.3724066-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429213032.3724066-1-dmitry.baryshkov@linaro.org>
References: <20220429213032.3724066-1-dmitry.baryshkov@linaro.org>
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

Replace deprecated perst-gpio properties with up-to-date perst-gpios
in the arm32 Qualcomm Snapdragon device trees.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts     | 2 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts      | 2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi   | 2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts | 2 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi             | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index e068a8d0adf0..160291c5ebeb 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -215,7 +215,7 @@ pci@1b500000 {
 			vdda_refclk-supply = <&v3p3_fixed>;
 			pinctrl-0 = <&pcie_pins>;
 			pinctrl-names = "default";
-			perst-gpio = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+			perst-gpios = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
 		};
 
 		amba {
diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 2638b380be20..8b1d540a5f65 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -285,7 +285,7 @@ pci@1b500000 {
 			vdda_refclk-supply = <&ext_3p3v>;
 			pinctrl-0 = <&pcie_pins>;
 			pinctrl-names = "default";
-			perst-gpio = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+			perst-gpios = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
 		};
 
 		qcom,ssbi@500000 {
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
index 7a337dc08741..872f64a12047 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
@@ -100,7 +100,7 @@ m25p80@0 {
 
 		pci@40000000 {
 			status = "okay";
-			perst-gpio = <&tlmm 38 0x1>;
+			perst-gpios = <&tlmm 38 0x1>;
 		};
 
 		qpic-nand@79b0000 {
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
index 06f9f2cb2fe9..ab1835b0fe40 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -10,7 +10,7 @@ / {
 	soc {
 		pci@40000000 {
 			status = "okay";
-			perst-gpio = <&tlmm 38 0x1>;
+			perst-gpios = <&tlmm 38 0x1>;
 		};
 
 		spi@78b6000 {
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 996f4458d9fc..fa67cb6adcb8 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -842,7 +842,7 @@ pcie0: pci@1b500000 {
 			pinctrl-names = "default";
 
 			status = "disabled";
-			perst-gpio = <&qcom_pinmux 3 GPIO_ACTIVE_LOW>;
+			perst-gpios = <&qcom_pinmux 3 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie1: pci@1b700000 {
@@ -893,7 +893,7 @@ pcie1: pci@1b700000 {
 			pinctrl-names = "default";
 
 			status = "disabled";
-			perst-gpio = <&qcom_pinmux 48 GPIO_ACTIVE_LOW>;
+			perst-gpios = <&qcom_pinmux 48 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie2: pci@1b900000 {
@@ -944,7 +944,7 @@ pcie2: pci@1b900000 {
 			pinctrl-names = "default";
 
 			status = "disabled";
-			perst-gpio = <&qcom_pinmux 63 GPIO_ACTIVE_LOW>;
+			perst-gpios = <&qcom_pinmux 63 GPIO_ACTIVE_LOW>;
 		};
 
 		nss_common: syscon@03000000 {
-- 
2.35.1

