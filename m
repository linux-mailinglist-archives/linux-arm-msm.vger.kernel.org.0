Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15A2697FA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 16:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjBOPkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 10:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjBOPkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 10:40:14 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C951366A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 07:40:11 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id z13so13639756wmp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 07:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBKUFOg3aIZtzc5AANsCexRTxeA9fGhbkcwkIm+GvMw=;
        b=Ga82GK7mqpyKTgaGh6zhWl7XgCKeqt5mh3eW8BPGnsmKXgQyxq+Z6g5wIzCpBNhH8r
         mS3PXiGZV3E59K6ygFrj3LFfpdGS2f2uUMRdxBWPJq2J5Eh688dMY+Qx9PfxQrLCxPST
         d6isykjBcW+fUJRFiD5wYDy9L7izCD6hoT/hGxuF0kiF3W2+KHm44zi2QqVpSpOX/edE
         zWm9Baw9Mgm5OHckkpUQnbMI5tw2Ndt/9lmwC+EwOc5aMWJ4rxx+SBGfYtsstIeAiCdA
         R/l8lttm7VrUWjTplzN1qKVEEwHhZK9ETaf2TzdkBUoMLHcDOgQT7j5Ktf3K1HDIjOD6
         EFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBKUFOg3aIZtzc5AANsCexRTxeA9fGhbkcwkIm+GvMw=;
        b=kEcCzmgXmLXJ/mx0lg1i3UQ+91KjNS2COcip/m/EpjOh6sS26dXLOvWRj1sc07YSrh
         PvSUB2cOHqGcnmMBbpqIlxIMsoATSySvloaTwIybAQwWQWaz3ljRKHZJwX37SKlLAHzJ
         fhbIP0BNMy1RQKSH9oROm6BG0iWgEDokf7En4Vq1GnV6vbciCm79ZaOy7dwb0RqEuuGY
         wUYDF6DItcaEOvCd44gVLWKfnrirLiOD6l2bJnLU++x1sS2MJalYrjgimDtO3Z9IXuza
         nJ7/s/xC9jaB+JySAD4ObyTTrOuUtkskxPtQSV/u6ttSmyW5BAP7eEtYxJjZ+JQs5980
         5UXA==
X-Gm-Message-State: AO0yUKUXMTZbHa22j9Y8kMVHJqtK4EDwzbqPlw2XRSmvjseZZkuG8koB
        cZoMBIKBtn+CIXf4wvAIh6d2xA==
X-Google-Smtp-Source: AK7set/jizCiUpNhg8+PeUbKUwFxlTUdoMGqI6sl77dkTOJxA4pb0GcHwMNv5a1unqvXb92wMqd4eQ==
X-Received: by 2002:a05:600c:329a:b0:3db:15b1:fb28 with SMTP id t26-20020a05600c329a00b003db15b1fb28mr2241734wmp.19.1676475609534;
        Wed, 15 Feb 2023 07:40:09 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ea02:3f39:48c0:67ce])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c191100b003dd1c45a7b0sm2808877wmq.23.2023.02.15.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 07:40:09 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/4] arm64: dts: qcom: sa8775p: add the i2c node for sa8775p-ride
Date:   Wed, 15 Feb 2023 16:39:59 +0100
Message-Id: <20230215154002.446808-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215154002.446808-1-brgl@bgdev.pl>
References: <20230215154002.446808-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the i2c node for the interface exposed on the sa8775p-ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 19 +++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 34 +++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 3adf7349f4e5..5fdce8279537 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -13,6 +13,7 @@ / {
 
 	aliases {
 		serial0 = &uart10;
+		i2c18 = &i2c18;
 	};
 
 	chosen {
@@ -20,10 +21,21 @@ chosen {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
@@ -33,6 +45,13 @@ qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
 	};
+
+	qup_i2c18_default: qup-i2c18-state {
+		pins = "gpio95", "gpio96";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart10 {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 565c1376073e..82582825f92a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -491,6 +491,40 @@ &clk_virt SLAVE_QUP_CORE_1 0>,
 			};
 		};
 
+		qupv3_id_2: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x8c0000 0x0 0x6000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			iommus = <&apps_smmu 0x5a3 0x0>;
+			status = "disabled";
+
+			i2c18: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x890000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 0
+						 &clk_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_APPSS_PROC 0
+						 &config_noc SLAVE_QUP_2 0>,
+						<&aggre2_noc MASTER_QUP_2 0
+						 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
-- 
2.37.2

