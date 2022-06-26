Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A3055B293
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 17:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbiFZPMY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jun 2022 11:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbiFZPMX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jun 2022 11:12:23 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A77ADFD0;
        Sun, 26 Jun 2022 08:12:22 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id t16so11639322qvh.1;
        Sun, 26 Jun 2022 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QrV1Kz38fCUq3dgGH+FjS8T2hJSWCnU/jkW7c/a/OHo=;
        b=ZWVqOxpxWuNscFrgyKqwqJXhsbWXT5DzbilIGjfgr8Ey2U5wWNKSGviTuu9MlQKERs
         h8lgB/Y/xtxartPXqoKPWl8K4ibVXU/HgIJrnSL3cGi7OVFbH/YP+hKoZPUuN01iyjmm
         IoZICtMJLIrqPQo8F5HOYzth8LA+RqjY2BU0P6okUc9iLW3qJRMcLl78IZ5rNLnbXfby
         AUL/Vw79SXK5R5Tvl5XwINQa+LiojPlkHMq3T+KmdcIhGYBGJSCXDA6r3WU5J2wmr7aT
         K0zxwrLDshD8FuFJIAi7NI3B6hUkEEjrepMbsW+r5gU+r1ZHKrBDeEaWkKNBFD4zhZGO
         cgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QrV1Kz38fCUq3dgGH+FjS8T2hJSWCnU/jkW7c/a/OHo=;
        b=qr/UjTiUaJ9dfNBeZZ69RZBaCnN1zsmLb22Oat0j08AibM9rOyTOEZcq1J5qL7IzGx
         EaloJxMs3A8ZqVvwWIK1QHEt3uNshGOWuP/VotnHK3wMDkI8DE8QNYtoiwTr8ZakqPxv
         N36SGI+tx4Pyk7RJDRA8fB06E8ffaRI6bcYTy6Sm3SkF0tgCbhoZJ86YwTppiUW6jFEg
         v3G9/DLZxWQrByN+86wMhT1fvHKdHR9U8OqImR5uKM0ao2AGLZs53EexbYbZBffB04+p
         gJ0cXAdw7BVrb6xIjHXiKgX8fS4n2/TSSFU0SUdiaw0PiCAc4ok/fzhowihCk4RW1vQs
         aoKA==
X-Gm-Message-State: AJIora9b73cSTFmWAhIFhnzXZY3jig74oQ8BQYVYHHQulQesLJ/aAbvu
        9LxOR9nvxbBz4uoxZt717bRLqh8xdmeLeg==
X-Google-Smtp-Source: AGRyM1sVkYsXC5wHYN2jHhqdjE/SC9Dezn4oVe9mR9el8VPPJzSweKVbqYaDmFN3or7IDNcio0wgcg==
X-Received: by 2002:ac8:588e:0:b0:318:88fe:1959 with SMTP id t14-20020ac8588e000000b0031888fe1959mr4922953qta.71.1656256341640;
        Sun, 26 Jun 2022 08:12:21 -0700 (PDT)
Received: from numbers.. ([198.179.6.194])
        by smtp.gmail.com with ESMTPSA id x4-20020ac87a84000000b00307cac53129sm5193462qtr.42.2022.06.26.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 08:12:21 -0700 (PDT)
From:   Stefan Hansson <newbie13xd@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Anton Bambura <jenneron@protonmail.com>,
        Stefan Hansson <newbie13xd@gmail.com>,
        Gregari Ivanov <llamashere@posteo.de>
Subject: [PATCH v3 2/2] arm64: dts: qcom: add device tree for LG G7 and LG V35
Date:   Sun, 26 Jun 2022 11:12:13 -0400
Message-Id: <20220626151213.10159-2-newbie13xd@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220626151213.10159-1-newbie13xd@gmail.com>
References: <20220626151213.10159-1-newbie13xd@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Anton Bambura <jenneron@protonmail.com>

Adds initial support for the LG G7 (judyln) and
LG V35 (judyp) phones.

Currently supported features:

 - Display via simplefb (panel driver is WIP)
 - Keys
 - Micro SD card
 - Modem (not tested much, but initialises)
 - UFS (crashes during intensive workloads, may need quirks)
 - USB in peripheral mode

Notable missing features:

 - Enabling WiFi causes a remoteproc crash, so it's disabled here.
   Needs to be debugged - ideas welcome!

Changes since v1:

 - Enabled GPU
 - Changed some node names
 - Moved framebuffer node from common dtsi

Changes since v2:

 - Made pm8998-smps4 regulator name generic

Signed-off-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Stefan Hansson <newbie13xd@gmail.com>
Tested-by: Gregari Ivanov <llamashere@posteo.de>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 614 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts |  68 ++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts  |  44 ++
 4 files changed, 728 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2f8aec2cc6db..3494abb367f4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -100,6 +100,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
new file mode 100644
index 000000000000..20f275f8694d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -0,0 +1,614 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDM845 LG G7 / V35 (judyln / judyp) common device tree
+ *
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &gpu_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
+/delete-node/ &qseecom_mem;
+/delete-node/ &rmtfs_mem;
+/delete-node/ &slpi_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &venus_mem;
+/delete-node/ &wlan_msa_mem;
+
+/ {
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		qseecom_mem: memory@b2000000 {
+			reg = <0 0xb2000000 0 0x1800000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8c415000 {
+			reg = <0 0x8c415000 0 0x2000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8c500000 {
+			reg = <0 0x8c500000 0 0x1e00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8e300000 {
+			reg = <0 0x8e300000 0 0x100000>;
+			no-map;
+		};
+
+		mpss_region: memory@8e400000 {
+			reg = <0 0x8e400000 0 0x8900000>;
+			no-map;
+		};
+
+		venus_mem: memory@96d00000 {
+			reg = <0 0x96d00000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@97200000 {
+			reg = <0 0x97200000 0 0x800000>;
+			no-map;
+		};
+
+		mba_region: memory@97a00000 {
+			reg = <0 0x97a00000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: memory@97c00000 {
+			reg = <0 0x97c00000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: memory@99000000 {
+			reg = <0 0x99000000 0 0x100000>;
+			no-map;
+		};
+
+		/* Framebuffer region */
+		memory@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x2400000>;
+			no-map;
+		};
+
+		/* rmtfs lower guard */
+		memory@f0800000 {
+			reg = <0 0xf0800000 0 0x1000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@f0801000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xf0801000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		/* rmtfs upper guard */
+		memory@f0a01000 {
+			reg = <0 0xf0a01000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_pin_a>;
+
+		label = "GPIO Buttons";
+
+		key-vol-up {
+			label = "Volume up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	/*
+	 * Apparently RPMh does not provide support for PM8998 S4 because it
+	 * is always-on; model it as a fixed regulator.
+	 */
+	vreg_s4a_1p8: pm8998-smps4-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&adsp_pas {
+	status = "okay";
+};
+
+&apps_rsc {
+	pm8998-rpmh-regulators {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-s11-supply = <&vph_pwr>;
+		vdd-s12-supply = <&vph_pwr>;
+		vdd-s13-supply = <&vph_pwr>;
+		vdd-l1-l27-supply = <&vreg_s7a_1p025>;
+		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
+		vdd-l3-l11-supply = <&vreg_s7a_1p025>;
+		vdd-l4-l5-supply = <&vreg_s7a_1p025>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
+		vdd-l9-supply = <&vreg_bob>;
+		vdd-l10-l23-l25-supply = <&vreg_bob>;
+		vdd-l13-l19-l21-supply = <&vreg_bob>;
+		vdd-l16-l28-supply = <&vreg_bob>;
+		vdd-l18-l22-supply = <&vreg_bob>;
+		vdd-l20-l24-supply = <&vreg_bob>;
+		vdd-l26-supply = <&vreg_s3a_1p35>;
+		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s2a_1p125: smps2 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		vreg_s3a_1p35: smps3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		vreg_s5a_2p04: smps5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7a_1p025: smps7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+
+		vdd_qusb_hs0:
+		vdda_hp_pcie_core:
+		vdda_mipi_csi0_0p9:
+		vdda_mipi_csi1_0p9:
+		vdda_mipi_csi2_0p9:
+		vdda_mipi_dsi0_pll:
+		vdda_mipi_dsi1_pll:
+		vdda_qlink_lv:
+		vdda_qlink_lv_ck:
+		vdda_qrefs_0p875:
+		vdda_pcie_core:
+		vdda_pll_cc_ebi01:
+		vdda_pll_cc_ebi23:
+		vdda_sp_sensor:
+		vdda_ufs1_core:
+		vdda_ufs2_core:
+		vdda_usb1_ss_core:
+		vdda_usb2_ss_core:
+		vreg_l1a_0p875: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_10:
+		vreg_l2a_1p2: ldo2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l3a_1p0: ldo3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_wcss_cx:
+		vdd_wcss_mx:
+		vdda_wcss_pll:
+		vreg_l5a_0p8: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_13:
+		vreg_l6a_1p8: ldo6 {
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <1856000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_1p2: ldo8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1248000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a_1p8: ldo9 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a_1p0: ldo11 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1048000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_qfprom:
+		vdd_qfprom_sp:
+		vdda_apc1_cs_1p8:
+		vdda_gfx_cs_1p8:
+		vdda_qrefs_1p8:
+		vdda_qusb_hs0_1p8:
+		vddpx_11:
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_2:
+		vreg_l13a_2p95: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p88: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_1p3: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_2p7: ldo18 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a_2p95: ldo20 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a_2p95: ldo21 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22a_2p85: ldo22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23a_3p3: ldo23 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_qusb_hs0_3p1:
+		vreg_l24a_3p075: ldo24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l25a_3p3: ldo25 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_hp_pcie_1p2:
+		vdda_hv_ebi0:
+		vdda_hv_ebi1:
+		vdda_hv_ebi2:
+		vdda_hv_ebi3:
+		vdda_mipi_csi_1p25:
+		vdda_mipi_dsi0_1p2:
+		vdda_mipi_dsi1_1p2:
+		vdda_pcie_1p2:
+		vdda_ufs1_1p2:
+		vdda_ufs2_1p2:
+		vdda_usb1_ss_1p2:
+		vdda_usb2_ss_1p2:
+		vreg_l26a_1p2: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l28a_3p0: ldo28 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+
+	pmi8998-rpmh-regulators {
+		compatible = "qcom,pmi8998-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-bypass;
+		};
+	};
+
+	pm8005-rpmh-regulators {
+		compatible = "qcom,pm8005-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s3c_0p6: smps3 {
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <600000>;
+		};
+	};
+};
+
+&cdsp_pas {
+	status = "okay";
+};
+
+&dispcc {
+	status = "disabled";
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_LPASS_Q6_AXI_CLK>,
+			   <GCC_LPASS_SWAY_CLK>;
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+	};
+};
+
+&ipa {
+	status = "okay";
+	modem-init;
+};
+
+&mss_pil {
+	status = "okay";
+};
+
+&pm8998_pon {
+	resin {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		bias-pull-up;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_card_det_n>;
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vddpx_2>;
+};
+
+/*
+ * UFS works partially and only with clk_ignore_unused.
+ * Sometimes it crashes with I/O errors.
+ */
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	/* TODO: these devices have usb id pin */
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdd-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb1_ss_core>;
+};
+
+/* PINCTRL - additions to nodes defined in sdm845.dtsi */
+
+&tlmm {
+	gpio-reserved-ranges = <28 4>, <81 4>;
+
+	sdc2_clk: sdc2-clk {
+		pinconf {
+			pins = "sdc2_clk";
+			bias-disable;
+
+			/*
+			 * It seems that mmc_test reports errors if drive
+			 * strength is not 16 on clk, cmd, and data pins.
+			 *
+			 * TODO: copy-pasted from mtp, try other values
+			 * on these devices.
+			 */
+			drive-strength = <16>;
+		};
+	};
+
+	sdc2_cmd: sdc2-cmd {
+		pinconf {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	sdc2_data: sdc2-data {
+		pinconf {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	sd_card_det_n: sd-card-det-n {
+		pinmux {
+			pins = "gpio126";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio126";
+			bias-pull-up;
+		};
+	};
+};
+
+&pm8998_gpio {
+	vol_up_pin_a: vol-up-active-pins {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
new file mode 100644
index 000000000000..7d967a104b3e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDM845 LG G7 (judyln) device tree.
+ *
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sdm845-lg-common.dtsi"
+
+/ {
+	model = "LG G7 ThinQ";
+	compatible = "lg,judyln", "qcom,sdm845";
+
+	chosen {
+		framebuffer@9d400000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
+			width = <1440>;
+			height = <3120>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+			lab-supply = <&lab>;
+			ibb-supply = <&ibb>;
+		};
+	};
+
+	/* Additional ThinQ key */
+	gpio-keys {
+		pinctrl-0 = <&vol_up_pin_a &thinq_key_default>;
+
+		key-thinq {
+			label = "ThinQ";
+			linux,code = <KEY_ASSISTANT>;
+			interrupt-parent = <&tlmm>;
+			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&adsp_pas {
+	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
+};
+
+&cdsp_pas {
+	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
+};
+
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
+	};
+};
+
+&mss_pil {
+	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+};
+
+&tlmm {
+	thinq_key_default: thinq-key-default {
+		pins = "gpio89";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
new file mode 100644
index 000000000000..d17d4d4d5609
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDM845 LG V35 (judyp) device tree.
+ *
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sdm845-lg-common.dtsi"
+
+/ {
+	model = "LG V35 ThinQ";
+	compatible = "lg,judyp", "qcom,sdm845";
+
+	chosen {
+		framebuffer@9d400000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
+			width = <1440>;
+			height = <2880>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+};
+
+&adsp_pas {
+	firmware-name = "qcom/sdm845/judyp/adsp.mbn";
+};
+
+&cdsp_pas {
+	firmware-name = "qcom/sdm845/judyp/cdsp.mbn";
+};
+
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/sdm845/judyp/a630_zap.mbn";
+	};
+};
+
+&mss_pil {
+	firmware-name = "qcom/sdm845/judyp/mba.mbn", "qcom/sdm845/judyp/modem.mbn";
+};
-- 
2.36.1

