Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A1E7D56C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 17:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343730AbjJXPoE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 11:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343610AbjJXPoD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 11:44:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD29D6;
        Tue, 24 Oct 2023 08:44:00 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50802148be9so1871704e87.2;
        Tue, 24 Oct 2023 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698162239; x=1698767039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCGdTmBDmHWO5DolEO8B8gYx0s0EfY/8C8DSenfPc7g=;
        b=OL4YCjk0NV9QjEXoc0NvZuufDRM5CPnQuK0+Jk222I8oqvUdreqTkeqVS7v2hHwGZV
         VWNifjsTY6+YFGORPbCIsY4f5wf1MEMe/fVhtfATEWB8WxueX017SuLrIlR+AFuCfc1v
         bAbaUC6FQc4CZvk3613cDARcDBsZae3LpTgIkXjgVW7J7m7MKZpyjmnGfocbAzSPEKqE
         vKM3Psq+MkyzLKgHLHFh1I/325WUgIzvDFEDB0nGlwTmiPxxpJ7hZM1qfDb+Wu5wB9O+
         9DgLBakiCg8HqO5XAekVVb3om6wpsxEQWF5F7qjCWiylZB6uw3ZG0BI+0QyhKHJoUoN6
         SoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698162239; x=1698767039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCGdTmBDmHWO5DolEO8B8gYx0s0EfY/8C8DSenfPc7g=;
        b=uk7X76ImDzEL2E7xXh2c+MiQAVfPiwhzzNkAeLw1z/xPwFBITI7sDXiy1FpVjsy0dS
         1zEQn22LZ28XkzLm97dVDuSdCCePrYiPwAjWFspvUarJATDZPiqo4MlHm1VtM1JmA7Jl
         U0xVtGmI6vyI/nrDTNMvgC2y/4BCZPsIDwiVOh5l6ivYP+e2SuNW2fT8n8rojOp+wQ2A
         TaGvjpnaDFkJBx06cCFAz3/82P2CAQmFqe51E0zVk9YW6pT8mOW4OnSwMJiELY/k+0UZ
         OmtYkdbezL8VhxGZ2zrDVHosYRUmShvB7zVAFw31IFERQsQIkfk4vsMvX9yigjwKm3/x
         nbpw==
X-Gm-Message-State: AOJu0YzsirrmaWYtDERW5ei5qTrqP29i3PczUbELWO2Fpys2fbiaZf26
        eIn7XrPasHp5criq4Ssv0d/oW+4FvAg=
X-Google-Smtp-Source: AGHT+IFaCFLrFAcj5lthmjKvxafU2Ig5n/dpEmQqM8JQ2n3MKzCvVXt817KlzMuYIqdvnkbawG/Avg==
X-Received: by 2002:ac2:5a08:0:b0:508:12f6:ff07 with SMTP id q8-20020ac25a08000000b0050812f6ff07mr236551lfn.48.1698162238963;
        Tue, 24 Oct 2023 08:43:58 -0700 (PDT)
Received: from debian.lan ([37.45.216.172])
        by smtp.googlemail.com with ESMTPSA id m1-20020ac24ac1000000b0050810b02cffsm102420lfp.22.2023.10.24.08.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 08:43:58 -0700 (PDT)
From:   Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Dzmitry Sankouski <dsankouski@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: starqltechn: enable more features
Date:   Tue, 24 Oct 2023 18:43:36 +0300
Message-Id: <20231024154338.407191-5-dsankouski@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231024154338.407191-1-dsankouski@gmail.com>
References: <20231024154338.407191-1-dsankouski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- enable usb 2.0
- enable debug uart (uart9)
- enable touchscreen
- enable ipa so that we can bring up mobile data

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---

Changes in v2:
- hex to decimal in regulator values
- fix dtb_check warnings

 .../dts/qcom/sdm845-samsung-starqltechn.dts   | 173 +++++++++++++++++-
 1 file changed, 171 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 6fc30fd1262b..f2bc3c412a2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -11,11 +11,17 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
 
+/delete-node/ &rmtfs_mem;
+
 / {
 	chassis-type = "handset";
 	model = "Samsung Galaxy S9 SM-G9600";
 	compatible = "samsung,starqltechn", "qcom,sdm845";
 
+	aliases {
+		serial0 = &uart9;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -68,6 +74,93 @@ memory@a1300000 {
 			ftrace-size = <0x40000>;
 			pmsg-size = <0x40000>;
 		};
+
+		/* The rmtfs_mem needs to be guarded due to "XPU limitations"
+		 * it is otherwise possible for an allocation adjacent to the
+		 * rmtfs_mem region to trigger an XPU violation, causing a crash.
+		 */
+		rmtfs_lower_guard: memory@fde00000 {
+			no-map;
+			reg = <0 0xfde00000 0 0x1000>;
+		};
+
+		rmtfs_mem: rmtfs-mem@fde01000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xfde01000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		rmtfs_upper_guard: rmtfs-upper-guard@fe001000 {
+			no-map;
+			reg = <0 0xfe001000 0 0x1000>;
+		};
+
+		/*
+		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
+		 * random crashes which are most likely modem related, more testing needed.
+		 */
+		removed_region: removed-region@88f00000 {
+			no-map;
+			reg = <0 0x88f00000 0 0x1c00000>;
+		};
+	};
+
+	i2c@21 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 127 0x0>;
+		scl-gpios = <&tlmm 128 0x0>;
+		i2c-gpio,delay-us = <0x2>;
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c21_sda_state &i2c21_scl_state>;
+
+		regulator@60 {
+			compatible = "samsung,s2dos05";
+			reg = <0x60>;
+
+			regulators {
+				s2dos05_ldo1: s2dos05-ldo1 {
+					regulator-name = "s2dos05-ldo1";
+					regulator-min-microvolt = <1500000>;
+					regulator-max-microvolt = <2000000>;
+					regulator-active-discharge = <0x1>;
+				};
+
+				s2dos05_ldo2: s2dos05-ldo2 {
+					regulator-name = "s2dos05-ldo2";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-active-discharge = <0x1>;
+					regulator-boot-on;
+				};
+
+				s2dos05_ldo3: s2dos05-ldo3 {
+					regulator-name = "s2dos05-ldo3";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-active-discharge = <0x1>;
+					regulator-boot-on;
+				};
+
+				s2dos05_ldo4: s2dos05-ldo4 {
+					regulator-name = "s2dos05-ldo4";
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <3775000>;
+					regulator-active-discharge = <0x1>;
+				};
+
+				s2dos05_buck1: s2dos05-buck1 {
+					regulator-name = "s2dos05-buck1";
+					regulator-min-microvolt = <850000>;
+					regulator-max-microvolt = <2100000>;
+					regulator-active-discharge = <0x1>;
+				};
+			};
+		};
 	};
 };
 
@@ -135,8 +228,6 @@ vdda_pll_cc_ebi23:
 		vdda_sp_sensor:
 		vdda_ufs1_core:
 		vdda_ufs2_core:
-		vdda_usb1_ss_core:
-		vdda_usb2_ss_core:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
@@ -157,6 +248,7 @@ vreg_l3a_1p0: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vdda_usb1_ss_core:
 		vdd_wcss_cx:
 		vdd_wcss_mx:
 		vdda_wcss_pll:
@@ -365,6 +457,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &uart9 {
 	status = "okay";
 };
@@ -391,13 +487,50 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&i2c11 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <120 0x0>;
+		vdd-supply = <&s2dos05_ldo2>;
+		avdd-supply = <&s2dos05_ldo3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_irq_state>;
+	};
+};
+
+/* Modem/wifi*/
+&mss_pil {
+	status = "okay";
+	firmware-name = "qcom/sdm845/starqltechn/mba.mbn", "qcom/sdm845/starqltechn/modem.mbn";
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/starqltechn/ipa_fws.mbn";
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
+	/*
+	 * disable USB3 clock requirement as the device only supports
+	 * USB2.
+	 */
+	qcom,select-utmi-as-pipe-clk;
 };
 
 &usb_1_dwc3 {
 	/* Until we have Type C hooked up we'll force this as peripheral. */
 	dr_mode = "peripheral";
+
+	maximum-speed = "high-speed";
 };
 
 &usb_1_hsphy {
@@ -449,4 +582,40 @@ sd_card_det_n_state: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	i2c21_sda_state: i2c-sda-state {
+		pins = "gpio127";
+		function = "gpio";
+		drive-strength = <0x2>;
+		bias-disable;
+	};
+
+	i2c21_scl_state: i2c-scl-state {
+		pins = "gpio128";
+		function = "gpio";
+		drive-strength = <0x2>;
+		bias-disable;
+	};
+
+	touch_irq_state: touch-irq-state {
+		pins = "gpio120";
+		function = "gpio";
+		bias-disable;
+		output-disable;
+	};
+};
+
+&qup_uart9_tx {
+	drive-strength = <0x2>;
+	bias-pull-up;
+};
+
+&qup_uart9_rx {
+	drive-strength = <0x2>;
+	bias-pull-up;
+};
+
+&qup_i2c11_default {
+	drive-strength = <2>;
+	bias-disable;
 };
-- 
2.30.2

