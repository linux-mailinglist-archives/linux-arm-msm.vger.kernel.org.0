Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D95315375
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 17:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbhBIQKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 11:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbhBIQKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 11:10:30 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEF3C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 08:09:49 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id r75so6338867oie.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 08:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZYKZ1+uVc7Mc/n2GPg1IchJB3wg4MYFyQPOLFn54wW0=;
        b=Fzwg8xypvGHSIYsgR32AcfLaKVaAwFDnuK1asXOr+AYW2OaiqVxG5Wh95tdKB9/AF3
         GZ1pTiQLBDuFuL2GUaYu1egY8zvdVuE8vu/Y4gEqTbIUUq9fo7/D2IEWO0ZRTi8srXff
         U5tSYriry0a2GVL8X1v9Vc7VzgZ0o5pICueyjfoOf7auet+TM9rgJ36PPcKyQGdfsilX
         p5d3g5dD297QF29etUYpVbM4HU9Zz5Mjb8eGmjhFqHmHxZzj0dvM5vCoj0ca+JcWQjTS
         yLoZHKnxYuHFqG2HvtYgBKA9ZRQAjjzhuKRq3f/XsyDlKrqBhC97K6q3fpWaUnxzKRWB
         O00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZYKZ1+uVc7Mc/n2GPg1IchJB3wg4MYFyQPOLFn54wW0=;
        b=lM0LwiMXBMkzlfKXnBko9Z+AhLSZNuo+Rdii+LqliDk7l91xmfIgCwNI6RpYc8/sTX
         nb9IWMpvF9BPInw+feGCj5icDh4Va+7xrnUqBHszk2Jt+rbUNzezKIaE3NnhkmvjgvUu
         f8puAGgDbETKrGy3CmatW5sHEnVwkll1WRvsQLkxDmvkPWejd7PID8StVe+rlC+JiJWc
         WXWc8oC0n1agBMablDbqCsS/f4GuYNC4nFaWS8Ua/nASw2f5DqPjuQY70twYiW1oChXs
         g++u8bHp/DAOCCw/wcYCacvve2Ge2m8ziS4UgKaC6n+QUxhpm50V3N1zm09qbRbIPIiu
         eZIQ==
X-Gm-Message-State: AOAM532rrh62tZJdNqColBLxQFkbK/xoZgPRs7GhD+pNscwwKU/QewLJ
        eqAq8PznGLyjBm9kLNRRMMclsLTsZfvjlw==
X-Google-Smtp-Source: ABdhPJzHP3tU5hePO3BPizaHbWnSHk2wUjVZtoP4s1lr2bCfGYzf1TxSzo9bhzvV31QEIG84FSigyA==
X-Received: by 2002:aca:1906:: with SMTP id l6mr2871230oii.101.1612886988762;
        Tue, 09 Feb 2021 08:09:48 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k4sm2725967ots.24.2021.02.09.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:09:47 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845: Move reserved-memory to devices
Date:   Tue,  9 Feb 2021 10:09:45 -0600
Message-Id: <20210209160946.29382-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The reserved-memory regions used for carrying firmware to be run on the
various cores and co-processors in a Qualcomm platform differs in size,
placement and presence based on each device's feature set and security
configuration.

Rather than providing some basic set that works on the MTP and then
piecemeal patch this up on the various devices, push the configuration
of these regions out to the individual device dts files.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    | 89 +++++++++++++------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 85 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       | 87 ++++++++++++++++++
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 78 +++++++++++++++-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 45 ++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 83 -----------------
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 86 ++++++++++++++++++
 7 files changed, 428 insertions(+), 125 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 216a74f0057c..2f44785d1af0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -153,36 +153,66 @@ panel_in_edp: endpoint {
  * all modifications to the memory map (from sdm845.dtsi) in one place.
  */
 
-/*
- * Our mpss_region is 8MB bigger than the default one and that conflicts
- * with venus_mem and cdsp_mem.
- *
- * For venus_mem we'll delete and re-create at a different address.
- *
- * cdsp_mem isn't used on cheza right now so we won't bother re-creating it; but
- * that also means we need to delete cdsp_pas.
- */
-/delete-node/ &venus_mem;
-/delete-node/ &cdsp_mem;
-/delete-node/ &cdsp_pas;
-/delete-node/ &gpu_mem;
-
-/* Increase the size from 120 MB to 128 MB */
-&mpss_region {
-	reg = <0 0x8e000000 0 0x8000000>;
-};
-
-/* Increase the size from 2MB to 8MB */
-&rmtfs_mem {
-	reg = <0 0x88f00000 0 0x800000>;
-};
-
 / {
 	reserved-memory {
+		tz_mem: memory@86200000 {
+			reg = <0 0x86200000 0 0x2d00000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@88f00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0x88f00000 0 0x800000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8c410000 {
+			reg = <0 0x8c410000 0 0x5000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8c500000 {
+			reg = <0 0x8c500000 0 0x1a00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8df00000 {
+			reg = <0 0x8df00000 0 0x100000>;
+			no-map;
+		};
+
+		mpss_region: memory@8e000000 {
+			reg = <0 0x8e000000 0 0x8000000>;
+			no-map;
+		};
+
 		venus_mem: memory@96000000 {
 			reg = <0 0x96000000 0 0x500000>;
 			no-map;
 		};
+
+		mba_region: memory@96500000 {
+			reg = <0 0x96500000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: memory@96700000 {
+			reg = <0 0x96700000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: memory@97b00000 {
+			reg = <0 0x97b00000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
@@ -206,7 +236,6 @@ flash@0 {
 	};
 };
 
-
 &apps_rsc {
 	pm8998-rpmh-regulators {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -645,6 +674,14 @@ &adreno_smmu {
 &mss_pil {
 	iommus = <&apps_smmu 0x781 0x0>,
 		 <&apps_smmu 0x724 0x3>;
+
+	mba {
+		memory-region = <&mba_region>;
+	};
+
+	mpss {
+		memory-region = <&mpss_region>;
+	};
 };
 
 &pm8998_pwrkey {
@@ -850,6 +887,7 @@ &usb_2_qmpphy {
 
 &wifi {
 	status = "okay";
+	memory-region = <&wlan_msa_mem>;
 
 	vdd-0.8-cx-mx-supply = <&src_pp800_l5a >;
 	vdd-1.8-xo-supply = <&pp1800_l7a_wcn3990>;
@@ -1321,6 +1359,7 @@ config {
 };
 
 &venus {
+	memory-region = <&venus_mem>;
 	video-firmware {
 		iommus = <&apps_smmu 0x10b2 0x0>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c4ac6f5dc008..0c175685c135 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -157,6 +157,77 @@ cam3_avdd_2v8: reg_cam3_avdd_2v8 {
 		vin-supply = <&vbat>;
 	};
 
+	reserved-memory {
+		tz_mem: memory@86200000 {
+			reg = <0 0x86200000 0 0x2d00000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@88f00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0x88f00000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8c410000 {
+			reg = <0 0x8c410000 0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8c415000 {
+			reg = <0 0x8c415000 0 0x2000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8df00000 {
+			reg = <0 0x8df00000 0 0x100000>;
+			no-map;
+		};
+
+		mpss_region: memory@8e000000 {
+			reg = <0 0x8e000000 0 0x7800000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8c500000 {
+			reg = <0 0x8c500000 0 0x1a00000>;
+			no-map;
+		};
+
+		venus_mem: memory@95800000 {
+			reg = <0 0x95800000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@95d00000 {
+			reg = <0 0x95d00000 0 0x800000>;
+			no-map;
+		};
+
+		mba_region: memory@96500000 {
+			reg = <0 0x96500000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: memory@96700000 {
+			reg = <0 0x96700000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: memory@97b00000 {
+			reg = <0 0x97b00000 0 0x100000>;
+			no-map;
+		};
+	};
+
 	pcie0_3p3v_dual: vldo-3v3-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VLDO_3V3";
@@ -244,6 +315,7 @@ vph_pwr: vph-pwr-regulator {
 &adsp_pas {
 	status = "okay";
 
+	memory-region = <&adsp_mem>;
 	firmware-name = "qcom/sdm845/adsp.mdt";
 };
 
@@ -390,6 +462,7 @@ vreg_bob: bob {
 
 &cdsp_pas {
 	status = "okay";
+	memory-region = <&cdsp_mem>;
 	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
@@ -492,6 +565,14 @@ &mdss_mdp {
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
+
+	mba {
+		memory-region = <&mba_region>;
+	};
+
+	mpss {
+		memory-region = <&mpss_region>;
+	};
 };
 
 &pcie0 {
@@ -999,6 +1080,10 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&venus {
+	memory-region = <&venus_mem>;
+};
+
 &wcd9340{
 	pinctrl-0 = <&wcd_intr_default>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 1372fe8601f5..aab598011c04 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -23,6 +23,77 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	reserved-memory {
+		tz_mem: memory@86200000 {
+			reg = <0 0x86200000 0 0x2d00000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@88f00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0x88f00000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8c410000 {
+			reg = <0 0x8c410000 0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8c415000 {
+			reg = <0 0x8c415000 0 0x2000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8df00000 {
+			reg = <0 0x8df00000 0 0x100000>;
+			no-map;
+		};
+
+		mpss_region: memory@8e000000 {
+			reg = <0 0x8e000000 0 0x7800000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8c500000 {
+			reg = <0 0x8c500000 0 0x1a00000>;
+			no-map;
+		};
+
+		venus_mem: memory@95800000 {
+			reg = <0 0x95800000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@95d00000 {
+			reg = <0 0x95d00000 0 0x800000>;
+			no-map;
+		};
+
+		mba_region: memory@96500000 {
+			reg = <0 0x96500000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: memory@96700000 {
+			reg = <0 0x96700000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: memory@97b00000 {
+			reg = <0 0x97b00000 0 0x100000>;
+			no-map;
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -50,6 +121,7 @@ vreg_s4a_1p8: pm8998-smps4 {
 
 &adsp_pas {
 	status = "okay";
+	memory-region = <&adsp_mem>;
 	firmware-name = "qcom/sdm845/adsp.mdt";
 };
 
@@ -351,6 +423,7 @@ vreg_s3c_0p6: smps3 {
 
 &cdsp_pas {
 	status = "okay";
+	memory-region = <&cdsp_mem>;
 	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
@@ -459,6 +532,14 @@ &mdss_mdp {
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
+
+	mba {
+		memory-region = <&mba_region>;
+	};
+
+	mpss {
+		memory-region = <&mpss_region>;
+	};
 };
 
 &qupv3_id_1 {
@@ -558,8 +639,14 @@ &usb_2_qmpphy {
 	vdda-pll-supply = <&vdda_usb2_ss_core>;
 };
 
+&venus {
+	memory-region = <&venus_mem>;
+};
+
 &wifi {
 	status = "okay";
+	memory-region = <&wlan_msa_mem>;
+
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8f617f7b6d34..721d34ce1e39 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -15,8 +15,6 @@
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
-/delete-node/ &rmtfs_mem;
-
 / {
 	aliases {
 		hsuart0 = &uart6;
@@ -46,6 +44,66 @@ vol-up {
 	};
 
 	reserved-memory {
+		tz_mem: memory@86200000 {
+			reg = <0 0x86200000 0 0x2d00000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8c410000 {
+			reg = <0 0x8c410000 0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8c415000 {
+			reg = <0 0x8c415000 0 0x2000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8c500000 {
+			reg = <0 0x8c500000 0 0x1a00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8df00000 {
+			reg = <0 0x8df00000 0 0x100000>;
+			no-map;
+		};
+
+		mpss_region: memory@8e000000 {
+			reg = <0 0x8e000000 0 0x7800000>;
+			no-map;
+		};
+
+		venus_mem: memory@95800000 {
+			reg = <0 0x95800000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@95d00000 {
+			reg = <0 0x95d00000 0 0x800000>;
+			no-map;
+		};
+
+		mba_region: memory@96500000 {
+			reg = <0 0x96500000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: memory@96700000 {
+			reg = <0 0x96700000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: memory@97b00000 {
+			reg = <0 0x97b00000 0 0x100000>;
+			no-map;
+		};
+
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
 		 * but given the same address every time. Hard code it as this address is
@@ -125,6 +183,7 @@ ts_1p8_supply: ts-1p8-regulator {
 
 &adsp_pas {
 	status = "okay";
+	memory-region = <&adsp_mem>;
 	firmware-name = "qcom/sdm845/oneplus6/adsp.mbn";
 };
 
@@ -291,6 +350,7 @@ vreg_s3c_0p6: smps3 {
 
 &cdsp_pas {
 	status = "okay";
+	memory-region = <&cdsp_mem>;
 	firmware-name = "qcom/sdm845/oneplus6/cdsp.mbn";
 };
 
@@ -399,6 +459,14 @@ &mdss_mdp {
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/oneplus6/mba.mbn", "qcom/sdm845/oneplus6/modem.mbn";
+
+	mba {
+		memory-region = <&mba_region>;
+	};
+
+	mpss {
+		memory-region = <&mpss_region>;
+	};
 };
 
 &pm8998_gpio {
@@ -612,8 +680,14 @@ mux {
 	};
 };
 
+&venus {
+	memory-region = <&venus_mem>;
+};
+
 &wifi {
 	status = "okay";
+	memory-region = <&wlan_msa_mem>;
+
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 86cbae63eaf7..a9a54273c1b4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -9,21 +9,6 @@
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
-/*
- * Delete following upstream (sdm845.dtsi) reserved
- * memory mappings which are different in this device.
- */
-/delete-node/ &tz_mem;
-/delete-node/ &adsp_mem;
-/delete-node/ &wlan_msa_mem;
-/delete-node/ &mpss_region;
-/delete-node/ &venus_mem;
-/delete-node/ &cdsp_mem;
-/delete-node/ &mba_region;
-/delete-node/ &slpi_mem;
-/delete-node/ &spss_mem;
-/delete-node/ &rmtfs_mem;
-
 / {
 	model = "Xiaomi Pocophone F1";
 	compatible = "xiaomi,beryllium", "qcom,sdm845";
@@ -57,6 +42,21 @@ tz_mem: memory@86200000 {
 			no-map;
 		};
 
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8c410000 {
+			reg = <0 0x8c410000 0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8c415000 {
+			reg = <0 0x8c415000 0 0x2000>;
+			no-map;
+		};
+
 		adsp_mem: memory@8c500000 {
 			reg = <0 0x8c500000 0 0x1e00000>;
 			no-map;
@@ -119,6 +119,7 @@ vreg_s4a_1p8: vreg-s4a-1p8 {
 
 &adsp_pas {
 	status = "okay";
+	memory-region = <&adsp_mem>;
 	firmware-name = "qcom/sdm845/adsp.mdt";
 };
 
@@ -197,6 +198,7 @@ vreg_l26a_1p2: ldo26 {
 
 &cdsp_pas {
 	status = "okay";
+	memory-region = <&cdsp_mem>;
 	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
@@ -218,6 +220,14 @@ zap-shader {
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
+
+	mba {
+		memory-region = <&mba_region>;
+	};
+
+	mpss {
+		memory-region = <&mpss_region>;
+	};
 };
 
 &pm8998_gpio {
@@ -345,8 +355,13 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l1a_0p875>;
 };
 
+&venus {
+	memory-region = <&venus_mem>;
+};
+
 &wifi {
 	status = "okay";
+	memory-region = <&wlan_msa_mem>;
 
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..084f5471eddf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -104,20 +104,6 @@ smem_mem: memory@86000000 {
 			no-map;
 		};
 
-		tz_mem: memory@86200000 {
-			reg = <0 0x86200000 0 0x2d00000>;
-			no-map;
-		};
-
-		rmtfs_mem: memory@88f00000 {
-			compatible = "qcom,rmtfs-mem";
-			reg = <0 0x88f00000 0 0x200000>;
-			no-map;
-
-			qcom,client-id = <1>;
-			qcom,vmid = <15>;
-		};
-
 		qseecom_mem: memory@8ab00000 {
 			reg = <0 0x8ab00000 0 0x1400000>;
 			no-map;
@@ -127,61 +113,6 @@ camera_mem: memory@8bf00000 {
 			reg = <0 0x8bf00000 0 0x500000>;
 			no-map;
 		};
-
-		ipa_fw_mem: memory@8c400000 {
-			reg = <0 0x8c400000 0 0x10000>;
-			no-map;
-		};
-
-		ipa_gsi_mem: memory@8c410000 {
-			reg = <0 0x8c410000 0 0x5000>;
-			no-map;
-		};
-
-		gpu_mem: memory@8c415000 {
-			reg = <0 0x8c415000 0 0x2000>;
-			no-map;
-		};
-
-		adsp_mem: memory@8c500000 {
-			reg = <0 0x8c500000 0 0x1a00000>;
-			no-map;
-		};
-
-		wlan_msa_mem: memory@8df00000 {
-			reg = <0 0x8df00000 0 0x100000>;
-			no-map;
-		};
-
-		mpss_region: memory@8e000000 {
-			reg = <0 0x8e000000 0 0x7800000>;
-			no-map;
-		};
-
-		venus_mem: memory@95800000 {
-			reg = <0 0x95800000 0 0x500000>;
-			no-map;
-		};
-
-		cdsp_mem: memory@95d00000 {
-			reg = <0 0x95d00000 0 0x800000>;
-			no-map;
-		};
-
-		mba_region: memory@96500000 {
-			reg = <0 0x96500000 0 0x200000>;
-			no-map;
-		};
-
-		slpi_mem: memory@96700000 {
-			reg = <0 0x96700000 0 0x1400000>;
-			no-map;
-		};
-
-		spss_mem: memory@97b00000 {
-			reg = <0 0x97b00000 0 0x100000>;
-			no-map;
-		};
 	};
 
 	cpus {
@@ -766,8 +697,6 @@ adsp_pas: remoteproc-adsp {
 		clocks = <&rpmhcc RPMH_CXO_CLK>;
 		clock-names = "xo";
 
-		memory-region = <&adsp_mem>;
-
 		qcom,smem-states = <&adsp_smp2p_out 0>;
 		qcom,smem-state-names = "stop";
 
@@ -865,8 +794,6 @@ cdsp_pas: remoteproc-cdsp {
 		clocks = <&rpmhcc RPMH_CXO_CLK>;
 		clock-names = "xo";
 
-		memory-region = <&cdsp_mem>;
-
 		qcom,smem-states = <&cdsp_smp2p_out 0>;
 		qcom,smem-state-names = "stop";
 
@@ -2987,14 +2914,6 @@ mss_pil: remoteproc@4080000 {
 					<&rpmhpd SDM845_MSS>;
 			power-domain-names = "load_state", "cx", "mx", "mss";
 
-			mba {
-				memory-region = <&mba_region>;
-			};
-
-			mpss {
-				memory-region = <&mpss_region>;
-			};
-
 			glink-edge {
 				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
 				label = "modem";
@@ -3851,7 +3770,6 @@ venus: video-codec@aa00000 {
 				      "vcodec1_core", "vcodec1_bus";
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
-			memory-region = <&venus_mem>;
 			interconnects = <&mmss_noc MASTER_VIDEO_P0 0 &mem_noc SLAVE_EBI1 0>,
 					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
 			interconnect-names = "video-mem", "cpu-cfg";
@@ -4775,7 +4693,6 @@ wifi: wifi@18800000 {
 			status = "disabled";
 			reg = <0 0x18800000 0 0x800000>;
 			reg-names = "membase";
-			memory-region = <&wlan_msa_mem>;
 			clock-names = "cxo_ref_clk_pin";
 			clocks = <&rpmhcc RPMH_RF_CLK2>;
 			interrupts =
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 43e33a1359d1..9c2ab377faf1 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -59,6 +59,77 @@ panel_in_edp: endpoint {
 		};
 	};
 
+	reserved-memory {
+		tz_mem: memory@86200000 {
+			reg = <0 0x86200000 0 0x2d00000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@88f00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0x88f00000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8c410000 {
+			reg = <0 0x8c410000 0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8c415000 {
+			reg = <0 0x8c415000 0 0x2000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8c500000 {
+			reg = <0 0x8c500000 0 0x1a00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8df00000 {
+			reg = <0 0x8df00000 0 0x100000>;
+			no-map;
+		};
+
+		mpss_region: memory@8e000000 {
+			reg = <0 0x8e000000 0 0x7800000>;
+			no-map;
+		};
+
+		venus_mem: memory@95800000 {
+			reg = <0 0x95800000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@95d00000 {
+			reg = <0 0x95d00000 0 0x800000>;
+			no-map;
+		};
+
+		mba_region: memory@96500000 {
+			reg = <0 0x96500000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: memory@96700000 {
+			reg = <0 0x96700000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: memory@97b00000 {
+			reg = <0 0x97b00000 0 0x100000>;
+			no-map;
+		};
+	};
+
 	sn65dsi86_refclk: sn65dsi86-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -75,6 +146,7 @@ backlight: backlight {
 
 &adsp_pas {
 	firmware-name = "qcom/LENOVO/81JL/qcadsp850.mbn";
+	memory-region = <&adsp_mem>;
 	status = "okay";
 };
 
@@ -284,6 +356,7 @@ vreg_lvs2a_1p8: lvs2 {
 
 &cdsp_pas {
 	firmware-name = "qcom/LENOVO/81JL/qccdsp850.mbn";
+	memory-region = <&cdsp_mem>;
 	status = "okay";
 };
 
@@ -437,6 +510,14 @@ &mdss_mdp {
 
 &mss_pil {
 	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
+
+	mba {
+		memory-region = <&mba_region>;
+	};
+
+	mpss {
+		memory-region = <&mpss_region>;
+	};
 };
 
 &qup_i2c10_default {
@@ -696,6 +777,10 @@ &usb_2_qmpphy {
 	vdda-pll-supply = <&vdda_usb2_ss_core>;
 };
 
+&venus {
+	memory-region = <&venus_mem>;
+};
+
 &wcd9340{
 	pinctrl-0 = <&wcd_intr_default>;
 	pinctrl-names = "default";
@@ -731,6 +816,7 @@ right_spkr: wsa8810-right{
 
 &wifi {
 	status = "okay";
+	memory-region = <&wlan_msa_mem>;
 
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-- 
2.30.0

