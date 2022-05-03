Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2396651911D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 00:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243537AbiECWNK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 18:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243522AbiECWNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 18:13:09 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995DC41FA5
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 15:09:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x33so32610307lfu.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 15:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NpE7znxKqpOdFLe2btWlAqolByFJc6sXieoM5n8O52E=;
        b=TtRFsz+kgB64kUUuk/+9JhsyhG4/Do1lq80mtk/kL8j71+iwUYL4nhQ8HoxWq/Vksu
         1WmuGMxQXutf6jSAiTeIyiYvYo/lJCKjn2DYjPWzY2LgOYkDl2Io7A9BfqUQZR+yoKHP
         /Foe01Wo+NWIX2DjGTQKMtjvEKVAuGvenKyOAiFbjvrBdcJbQid+ikcxsAMWzAImrPVc
         lHcLgtzU4FFaI7biSoKbKy+WbgyeuyPUo/lXhgXnAo/VbGEdUj7pjSJ34jbhEkN0nCQm
         +6txeO5z3zS1PfabGw2dzDPkQPNW5ibezWuCXO3Ou8t8NlYcFNXBgPrl3vq1XDAXiB72
         e3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NpE7znxKqpOdFLe2btWlAqolByFJc6sXieoM5n8O52E=;
        b=Ixza18Jhpxdsh2+jnGwp4eZOV/TlpAWsRa7cBcuXpyM6PJFkrN7BnHaQMY2qUG90ae
         XjGuQAtMGWl3RzurJfYRDasVmwoQE2fKL6yZbRiajLECZ/FfNquPKIPyYQHqeYUoiiYN
         TS8fhzt9hXTROH8CuWg3WIsFk2u5pmjQNXkKxw0sW1/YKDiqnLsGHJBHPFsZmuFVIOpS
         z1XKR67d5IFDegjmmDEbO7fBGqjzWiHQS8axVhojo9kkdei9G87dpYu7aXw8YkQuL1eB
         uMp/aZGom28G1QA7TDrZbTKToUjP7v9MIqbGGq6e+YugKhrYDwSZnR4gTiNkkk73onye
         bjqA==
X-Gm-Message-State: AOAM5308MqK3zuq6D3nyS7GB5Wh3zjMnBMSeQn/8X/sjs2HA4JBX10sd
        DZUzwy7WCi3h0Hc88ypbyHz+4g==
X-Google-Smtp-Source: ABdhPJyc/FBPF1p05tenpG7uMaDKLJw/cLv2z72yhFAelhH8cl+uUpUY0utOYmDzyXZswF/yuMdNrw==
X-Received: by 2002:a05:6512:b0f:b0:473:be27:863e with SMTP id w15-20020a0565120b0f00b00473be27863emr158810lfu.167.1651615772940;
        Tue, 03 May 2022 15:09:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j9-20020ac24549000000b0047255d2111bsm1042349lfm.74.2022.05.03.15.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 15:09:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 5/5] arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support
Date:   Wed,  4 May 2022 01:09:27 +0300
Message-Id: <20220503220927.960821-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The IFC6560 is a board from Inforce Computing, built around the SDA660
SoC. This patch describes core clocks, some regulators from the two
PMICs, debug uart, storage, bluetooth and audio DSP remoteproc.

The regulator settings are inherited from prior work by Konrad Dybcio
and AngeloGioacchino Del Regno.

Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 455 ++++++++++++++++++
 2 files changed, 456 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f9e6343acd03..5f717fe0e8d0 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
new file mode 100644
index 000000000000..bb5cbd20379e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ * Copyright (c) 2020, AngeloGioacchino Del Regno
+ *                     <angelogioacchino.delregno@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "sdm660.dtsi"
+#include "pm660.dtsi"
+#include "pm660l.dtsi"
+
+/ {
+	model = "Inforce 6560 Single Board Computer";
+	compatible = "inforce,ifc6560", "qcom,sdm660";
+
+	aliases {
+		serial0 = &blsp1_uart2;
+		serial1 = &blsp2_uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		volup {
+			label = "Volume Up";
+			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+
+	/*
+	 * Until we hook up type-c detection, we
+	 * have to stick with this. But it works.
+	 */
+	extcon_usb: extcon-usb {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&adv7533_out>;
+			};
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	v3p3_bck_bst: v3p3-bck-bst-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "v3p3_bck_bst";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	v1p2_ldo: v1p2-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "v1p2_ldo";
+
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	v5p0_boost: v5p0-boost-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "v5p0_boost";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&adsp_pil {
+	firmware-name = "qcom/inforce/ifc6560/adsp.mbn";
+};
+
+&blsp_i2c6 {
+	status = "okay";
+
+	/* BAM DMA doesn't seem to work on the board */
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+
+	adv7533: hdmi@39 {
+		compatible = "adi,adv7535";
+
+		reg = <0x39>, <0x66>;
+		reg-names = "main", "edid";
+
+		interrupt-parent = <&pm660l_gpios>;
+		interrupts = <11 2>;
+
+		clocks = <&rpmcc 12>;
+		clock-names = "cec";
+		adi,dsi-lanes = <3>;
+		avdd-supply = <&vreg_l13a_1p8>;
+		dvdd-supply = <&vreg_l13a_1p8>;
+		pvdd-supply = <&vreg_l13a_1p8>;
+		a2vdd-supply = <&vreg_l13a_1p8>;
+		v3p3-supply = <&v3p3_bck_bst>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7533_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7533_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+/* BAM DMA doesn't seem to work on the board */
+&blsp1_dma {
+	status = "disabled";
+};
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+/* BAM DMA doesn't seem to work on the board */
+&blsp2_dma {
+	status = "disabled";
+};
+
+&blsp2_uart1 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_l13a_1p8>;
+		vddxo-supply = <&vreg_l9a_1p8>;
+		vddrf-supply = <&vreg_l6a_1p3>;
+		vddch0-supply = <&vreg_l19a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l1a_1p225>;
+};
+
+&dsi0_out {
+	remote-endpoint = <&adv7533_in>;
+	data-lanes = <0 1 2>;
+};
+
+&dsi0_phy {
+	status = "okay";
+	vcca-supply = <&vreg_l1b_0p925>;
+};
+
+&mdp {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mmss_smmu {
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+
+	linux,code = <115>;
+};
+
+&qusb2phy {
+	status = "okay";
+
+	vdd-supply = <&vreg_l1b_0p925>;
+
+	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
+};
+
+&qusb2phy1 {
+	status = "okay";
+
+	vdd-supply = <&vreg_l1b_0p925>;
+
+	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
+};
+
+&rpm_requests {
+	pm660-regulators {
+		compatible = "qcom,rpm-pm660-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+
+		vdd_l1_l6_l7-supply = <&vreg_s5a_1p35>;
+		vdd_l2_l3-supply = <&vreg_s2b_1p05>;
+		vdd_l5-supply = <&vreg_s2b_1p05>;
+		vdd_l8_l9_l10_l11_l12_l13_l14-supply = <&vreg_s4a_2p04>;
+		vdd_l15_l16_l17_l18_l19-supply = <&vreg_bob>;
+
+		vreg_s4a_2p04: s4 {
+			regulator-min-microvolt = <1805000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-enable-ramp-delay = <200>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+		};
+
+		vreg_s5a_1p35: s5 {
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-enable-ramp-delay = <200>;
+			regulator-ramp-delay = <0>;
+		};
+
+		vreg_l1a_1p225: l1 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1250000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l6a_1p3: l6 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1368000>;
+			regulator-allow-set-load;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+		};
+
+		vreg_l8a_1p8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+			regulator-system-load = <325000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l9a_1p8: l9 {
+			regulator-min-microvolt = <1804000>;
+			regulator-max-microvolt = <1896000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l13a_1p8: l13 {
+			/* This gives power to the LPDDR4: never turn it off! */
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1944000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		vreg_l19a_3p3: l19 {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+			regulator-allow-set-load;
+		};
+	};
+
+	pm660l-regulators {
+		compatible = "qcom,rpm-pm660l-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+
+		vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
+		vdd_l2-supply = <&vreg_bob>;
+		vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
+		vdd_l4_l6-supply = <&vreg_bob>;
+		vdd_bob-supply = <&vph_pwr>;
+
+		vreg_s2b_1p05: s2 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-enable-ramp-delay = <200>;
+			regulator-ramp-delay = <0>;
+		};
+
+		vreg_l1b_0p925: l1 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <925000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l2b_2p95: l2 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l4b_2p95: l4 {
+			regulator-min-microvolt = <2944000>;
+			regulator-max-microvolt = <2952000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+
+			regulator-min-microamp = <200>;
+			regulator-max-microamp = <600000>;
+			regulator-system-load = <570000>;
+			regulator-allow-set-load;
+		};
+
+		/*
+		 * Downstream specifies a range of 1721-3600mV,
+		 * but the only assigned consumers are SDHCI2 VMMC
+		 * and Coresight QPDI that both request pinned 2.95V.
+		 * Tighten the range to 1.8-3.328 (closest to 3.3) to
+		 * make the mmc driver happy.
+		 */
+		vreg_l5b_2p95: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3328000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
+		};
+
+		vreg_l7b_3p125: l7 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3125000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l8b_3p3: l8 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3624000>;
+			regulator-enable-ramp-delay = <500>;
+			regulator-ramp-delay = <0>;
+		};
+	};
+};
+
+&sdhc_1 {
+	status = "okay";
+	supports-cqe;
+
+	mmc-ddr-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+
+	vmmc-supply = <&vreg_l4b_2p95>;
+	vqmmc-supply = <&vreg_l8a_1p8>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_state_on &sdc2_card_det_n>;
+	pinctrl1 = <&sdc2_state_off &sdc2_card_det_n>;
+
+	vmmc-supply = <&vreg_l5b_2p95>;
+	vqmmc-supply = <&vreg_l2b_2p95>;
+
+	cd-gpios = <&tlmm 54 1>;
+	no-sdio;
+	no-emmc;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <8 4>;
+
+	sdc2_card_det_n: sd-card-det-n {
+		pins = "gpio54";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&usb2 {
+	status = "okay";
+};
+
+&usb2_dwc3 {
+	dr_mode = "host";
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "peripheral";
+	extcon = <&extcon_usb>;
+};
-- 
2.35.1

