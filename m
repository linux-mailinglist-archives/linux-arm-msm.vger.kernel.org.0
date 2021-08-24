Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BD03F614D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 17:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbhHXPKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 11:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238040AbhHXPKG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 11:10:06 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC7AC061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 08:09:22 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso35671809ots.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 08:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d3BTl0th1hxH3iAelzZG6JdEFeXgV6Q2lm+ZL7uQbY8=;
        b=uVzodX7lrh2NRTJDEYx/QBYQVUB0j10btx5rOd6ty98mdnRiJc1rY07/wbqdBRxKWN
         awqfR4FF+9T+EbYproYXLZLJLUgyaGLAXTQ4h3wgxx/nriXKKwgFM3CzKhlFTGZGjin4
         W9g7fOOoLeWjJOmMpbHGMsBacS07zGIbRMsPPYm3+m892tVyCl2vb9NIX/RSH1Aec4Wc
         wyRCp7JSd3lTicn+wPsnRQXBo61GbSc8oajbMAQ4Loci4rj2HkM82G2BeJ7cLnm78j5h
         q/kNvsZwlAqxPD1wQ6Ginjnfo1o/21IizHXWt+g5bIi6HS8uJCyfP+kvXirT7Qzp/YRZ
         +PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d3BTl0th1hxH3iAelzZG6JdEFeXgV6Q2lm+ZL7uQbY8=;
        b=tlLSYCOmsyLU+1sNb18Gkd2NoJc6Hcx+pbyL4kqtlAl2VGgd5FS+pu2UEG+o9NG5fk
         ILZvt58VMEhSKfJd0kJUx1/30vs+JGa12C8V4sVlYBqbbfCYplf/2CYpOkaGIGoJvckq
         wS/DXjo29TQrWuKzdMlhufcpoX91UlVubaoXl7DuDw0BFOtmFFf7NNhE9aCa2dygnz4h
         0mu1BfqUIJR7y/vU4vxqA6srS1eLLcBsiwZyi09EJOliAYl2DBrOZBBIJf0KpktIDOuq
         XAK+Xm3AobObjEtJtrnCiT+AI267XaFVDHFW9HOeRR8GJY85Sm33fAmQAXM1uidjktci
         TYQw==
X-Gm-Message-State: AOAM531nJBis/nMN17AvP4Bs1Z2KgbGzXKW0MKwyC2uqhYWTmcJRJ0YM
        3driB8/yG/gd7DUhmhxy/Xa6rA==
X-Google-Smtp-Source: ABdhPJwZiLA+3h4VAoxBovE0mdmunuDICzZZF19f9D0NffiVafv3Lcnlgyv5Ztih6RZ8b18QxuEkhw==
X-Received: by 2002:a9d:12af:: with SMTP id g44mr18735747otg.45.1629817761787;
        Tue, 24 Aug 2021 08:09:21 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n130sm4453772oif.32.2021.08.24.08.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 08:09:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH] arm64: dts: qcom: sdm660: Add initial IFC6560 board
Date:   Tue, 24 Aug 2021 08:10:36 -0700
Message-Id: <20210824151036.678802-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The IFC6560 is a board from Inforce Computing, built around the SDA660
SoC. This patch describes core clocks, some regulators from the two
PMICs, debug uart, storage, bluetooth and audio DSP remoteproc.

The regulator settings are inherited from prior work by Konrad Dybcio
and AngeloGioacchino Del Regno.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts | 279 ++++++++++++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 70516508be56..88abcfeb4d38 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -73,6 +73,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-voyager.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-ifc6560.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts b/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts
new file mode 100644
index 000000000000..2244529bc6bf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts
@@ -0,0 +1,279 @@
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
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
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
+&blsp1_uart2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart_active>;
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
+			regulator-min-microvolt = <2040000>;
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
+		vreg_l2b_2p95: l2 {
+			/*
+			 * This regulator supports 1.648 - 3.104V on this board
+			 * but we set a max voltage of anything less than 2.7V
+			 * to satisfy a condition in sdhci.c that will disable
+			 * 3.3V SDHCI signaling, which happens to be not really
+			 * supported on the Xperia Nile/Ganges platform.
+			 */
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <2696000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l4b_29p5: l4 {
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
+		vreg_l5b_29p5: l5 {
+			/*
+			 * Downstream specifies a range of 1721-3600mV,
+			 * but the only assigned consumers are SDHCI2 VMMC
+			 * and Coresight QPDI that both request pinned 2.95V.
+			 * Tighten the range to 1.8-3.328 (closest to 3.3) to
+			 * make the mmc driver happy.
+			 */
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3328000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-ramp-delay = <0>;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
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
+			regulator-min-microvolt = <3304000>;
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
+	vmmc-supply = <&vreg_l4b_29p5>;
+	vqmmc-supply = <&vreg_l8a_1p8>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	vmmc-supply = <&vreg_l5b_29p5>;
+	vqmmc-supply = <&vreg_l2b_2p95>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <8 4>;
+
+	uart_active: uart-active-state {
+		pins = "gpio4", "gpio5";
+		function = "blsp_uart2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
-- 
2.29.2

