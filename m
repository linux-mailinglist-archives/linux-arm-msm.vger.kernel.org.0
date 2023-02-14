Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E20696891
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 16:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjBNP51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 10:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbjBNP5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 10:57:25 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F600279BA
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 07:57:22 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id o36so11303133wms.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 07:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DA8FtU5k5fQCyhIkgC0GoFOKfitMelFiT63AH7hnguA=;
        b=7eN3BP8AkQFtGqaNGwWwWbPKrGgZBMZUHpkH5f0/HuKFWFLoB7ivIR6dcnFqG5271Y
         n5o401BCENTCdBAdmkcXaKA/XAmJiMHMlGFba3X0ntCL6mPbdJknQAAvqQXcKud6iEkW
         Cu+ATodJl0Scpy1muwutSr6QJvyabsD53SV2wQg2/7Y6If6M/z7Lt0/dZ/mpdhYOSskv
         nWCbeBp7z86Eir9OMI9fU2TXQbx90E2CRGuGWm+x2zQhxaCypW5eXgnvMvKTKE+yoLJl
         bAqpShYt8NT9coxtJ94H5wKpaLmcav1XjhnJIiCVnu8RYCIW2dc44bDvNHxIZyPRAbwX
         xIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DA8FtU5k5fQCyhIkgC0GoFOKfitMelFiT63AH7hnguA=;
        b=yXcVUGF4wu3/ZaLiQ7p6vhVQMOtqlw2s8n2b5eKi9iECxvzi+rf3cNsI9ps/c8rw6+
         ih/+xJg/hYU+Ob4v1ln18hyUhsug3WNFCRRsRYQJEuS1GL1H9WTAJ1A60cu2EndPfLp8
         oMOLsxtrz0gPGSBay7dRrvEv0Do5mZv9i9g0vZ8BzwW6XsDmNKqIcwtybpJRMZ8CUFvo
         5Gh6JPqAeEMHXhomIsUvJDwUUxbMBeKnnHQXzHdcCWAMkP8d6P3XCruq3b/j7BDGBhW7
         ny/igU7VpAFf1soa9hrKg/HPBYfszpUHw3RVgAr9gtXDQy03/7gNNrEqN6VG6DURlTxf
         vVIA==
X-Gm-Message-State: AO0yUKXVBxswi7oX6A7T6k426dGvLJFEvlZX/HjO3vo50wAHcdjYVabv
        oIgdcSW6xOEPg0xIXmUCrF6irQ==
X-Google-Smtp-Source: AK7set/Dl/NEs9QHLiVu2oDlCOH36DBWZ8sGP1zEbqmJZPp20fVlscwUQTc2SH9hsjCMIDYtwkFpXg==
X-Received: by 2002:a05:600c:1708:b0:3de:1d31:1048 with SMTP id c8-20020a05600c170800b003de1d311048mr2200741wmn.29.1676390241025;
        Tue, 14 Feb 2023 07:57:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6e4b:bef:7edd:1af1])
        by smtp.gmail.com with ESMTPSA id x2-20020a1c7c02000000b003df30c94850sm20451924wmc.25.2023.02.14.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 07:57:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sa8775p: add the SPI node for sa8775p-ride
Date:   Tue, 14 Feb 2023 16:57:14 +0100
Message-Id: <20230214155715.451130-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214155715.451130-1-brgl@bgdev.pl>
References: <20230214155715.451130-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the SPI node for the interface exposed on the sa8775p-ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 21 +++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 5fdce8279537..d01ca3a9ee37 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		serial0 = &uart10;
 		i2c18 = &i2c18;
+		spi16 = &spi16;
 	};
 
 	chosen {
@@ -40,12 +41,25 @@ &sleep_clk {
 	clock-frequency = <32764>;
 };
 
+&spi16 {
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &tlmm {
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
 	};
 
+	qup_spi16_default: qup-spi16-state {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		function = "qup2_se2";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
 	qup_i2c18_default: qup-i2c18-state {
 		pins = "gpio95", "gpio96";
 		function = "qup2_se4";
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 82582825f92a..1abb545ff4f4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -503,6 +503,27 @@ qupv3_id_2: geniqup@8c0000 {
 			iommus = <&apps_smmu 0x5a3 0x0>;
 			status = "disabled";
 
+			spi16: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x888000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
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
+
 			i2c18: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x890000 0x0 0x4000>;
-- 
2.37.2

