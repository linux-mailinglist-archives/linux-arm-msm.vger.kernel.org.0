Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F944685C80
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 02:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjBABAb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 20:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjBABAa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 20:00:30 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B7045887;
        Tue, 31 Jan 2023 17:00:28 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id w3so6759490qts.7;
        Tue, 31 Jan 2023 17:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7T7rE7+/dPI6AvaycsPezxrGgpivBpp3ehLm3SpYU0=;
        b=lLVJ5DzcjikKiW4p1Hk554QLaII2VbZmzvwXd2l5pnKZk0njKP8Qxp6bTpaXGgY/Pt
         B79TkIc5J/aC8sHxaYq7HmD45cicuK098kvzvfNJiO8jlYcv8xJhVgGgdgmdVGXG+Aum
         nujoN9TDFuxPWPjcVf8wM9Ops50XhzhdmOC9t7o6oTeOYImb3f/h6oZZKdLJb+CkzDhE
         KJQWZ7DxbcMY8Hu1StYnijPQ0wfzEX92Qf0fx/RzrXB5IJGoyfBYmHoY73pKBcGgVJdL
         +319DyAxSd3RNmWDiJauW+/L3SXtsh3FfpoE634Uyll2vOf6MohIU+MjoWbT8xSRN1o7
         OePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7T7rE7+/dPI6AvaycsPezxrGgpivBpp3ehLm3SpYU0=;
        b=iq9BZM/n6O+DZDY2hl+pslYR1T5V5HGNUv0gCH45A23AU1Z1xWfEIvQnwS4m0cjwSD
         ad13E7GU5bRSgP2LJFL/+vRwFEnOwuHlUUFG5J8FtpKOezLv7jwRncbEj70KDAxqbaM6
         B2nGyWLJvPo2qTayhXoUX8Fowewu1dPVXQShj7HNA/+yW/PfgDwYs/LyRIOytk4d4p9e
         UZCRa1bDfaNF8iFbB4zan+2EM8TUXfMBHBLTozRWm0cLYJlKU9tQYQVdAyMU0UQKEZFA
         p5H1jbHGr/5V23Qwb4HOy/xcP+uu63dBgDa/HQNiC4kbBmZdDYnG/ZCp0W2uOfI49obS
         Kg/g==
X-Gm-Message-State: AO0yUKUQEuEvW4jefb22WA2RFfMpBFic1Htrb1xogdXshpZw5zoVj3Cf
        +NqqD0GDkct+FQnpF53DMvA=
X-Google-Smtp-Source: AK7set9ulwKevS0veht+2sdyMy7Z3OaOyyUan9ji45crl6ughbjUfZiiXdeQ7vF/Vr3vOojKweRuKg==
X-Received: by 2002:ac8:5e4c:0:b0:3b6:3ac8:22ea with SMTP id i12-20020ac85e4c000000b003b63ac822eamr1367582qtx.10.1675213228097;
        Tue, 31 Jan 2023 17:00:28 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::2e4f])
        by smtp.gmail.com with ESMTPSA id g15-20020ae9e10f000000b00728bbe45888sm660370qkm.10.2023.01.31.17.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 17:00:27 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: sdm670: add opps for peripherals
Date:   Tue, 31 Jan 2023 20:00:20 -0500
Message-Id: <20230201010020.84586-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201010020.84586-1-mailingradian@gmail.com>
References: <20230201010020.84586-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The interconnects are now in place. Add Operating Performance Points for
them to allow the kernel to properly manage them.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 109 +++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 02f14692dd9d..c5f839dd1c6e 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,sdm670-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -430,6 +431,10 @@ sdhc_1: mmc@7c4000 {
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>,
 				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
 			clock-names = "iface", "core", "xo", "ice", "bus";
+			interconnects = <&aggre1_noc MASTER_EMMC 0 &aggre1_noc SLAVE_A1NOC_SNOC 0>,
+					<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_EMMC_CFG 0>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+			operating-points-v2 = <&sdhc1_opp_table>;
 
 			iommus = <&apps_smmu 0x140 0xf>;
 
@@ -442,6 +447,38 @@ sdhc_1: mmc@7c4000 {
 			non-removable;
 
 			status = "disabled";
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-20000000 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_min_svs>;
+					opp-peak-kBps = <80000 80000>;
+					opp-avg-kBps = <52286 80000>;
+				};
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <200000 100000>;
+					opp-avg-kBps = <130718 100000>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <200000 130000>;
+					opp-avg-kBps = <130718 130000>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <4096000 4096000>;
+					opp-avg-kBps = <1338562 1338562>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@800000 {
@@ -477,6 +514,8 @@ qupv3_id_0: geniqup@8c0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>;
+			interconnect-names = "qup-core";
 			status = "disabled";
 
 			i2c0: i2c@880000 {
@@ -490,6 +529,10 @@ i2c0: i2c@880000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
+						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -507,6 +550,10 @@ i2c1: i2c@884000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
+						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -524,6 +571,10 @@ i2c2: i2c@888000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
+						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -541,6 +592,10 @@ i2c3: i2c@88c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
+						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -558,6 +613,10 @@ i2c4: i2c@890000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
+						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -575,6 +634,10 @@ i2c5: i2c@894000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
+						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -592,6 +655,10 @@ i2c6: i2c@898000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
+						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -609,6 +676,10 @@ i2c7: i2c@89c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
+						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -649,6 +720,8 @@ qupv3_id_1: geniqup@ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>;
+			interconnect-names = "qup-core";
 			status = "disabled";
 
 			i2c8: i2c@a80000 {
@@ -662,6 +735,10 @@ i2c8: i2c@a80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
+						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -679,6 +756,10 @@ i2c9: i2c@a84000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
+						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -696,6 +777,10 @@ i2c10: i2c@a88000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
+						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -713,6 +798,10 @@ i2c11: i2c@a8c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
+						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -730,6 +819,10 @@ i2c12: i2c@a90000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
+						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -747,6 +840,10 @@ i2c13: i2c@a94000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
+						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -764,6 +861,10 @@ i2c14: i2c@a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
+						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -781,6 +882,10 @@ i2c15: i2c@a9c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
+						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core", "qup-config", "qup-memory";
 				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
@@ -1028,6 +1133,10 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre2_noc MASTER_USB3 0 &mem_noc SLAVE_EBI_CH0 0>,
+					<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			status = "disabled";
 
 			usb_1_dwc3: usb@a600000 {
-- 
2.39.1

