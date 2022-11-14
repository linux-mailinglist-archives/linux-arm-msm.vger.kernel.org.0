Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A9E627AD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236332AbiKNKm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:42:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236255AbiKNKmo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:42:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B351F623
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:42 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id j16so18505456lfe.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhVzOmWLQ0AfDjFCb5OflGVxRe6o8eIbACNlgcPHwsE=;
        b=Bs5yjaBMsIR7xn7f2bQ+8gBGJ876wFKiW9xGSKrkXBnBSnK2OJjiRnIFkelXcF8W7e
         jZHeeCmY5ko8E5Qy9UNmCDkeZTf03i4CcNqVgFdMV8/HTa9kaODA3fJZZkTsSWORmoA3
         eF+RdlZXF/ZOiE5SnHBJpfjs+bHbyydyjJttKASvqZf94FEy61nmXavNzyyx0ECKWxel
         sy3UZAd4RP2M00kj7dhWh1NnL6YvlPD+n7XWIekzjhzhY/hKaaKRu9FVUUXscePTA8qY
         +DFtsXxpoDn3Nr3xJqaDdW3rOrm/v8U8KwhnLp6MKW3qjrhbIAh0ojxnF+xWhfYGKkfa
         QKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhVzOmWLQ0AfDjFCb5OflGVxRe6o8eIbACNlgcPHwsE=;
        b=S4+9DkBMV932D7Ch8dYXIcdBkTA2T/wH/Md/X3bdOBrZNp18NlUKfzpiL6DFZ+iq7u
         ZpNiua/Mvtt+Jm6R0785eSKqbaMmthW0zoFIdM8L/nBMNiI8YHFu3rkSprXhSqjtmmvM
         nHk13BDAGMQz3P9iNLQyGg/lTAz1UwNYAcZcwAk6GAcF+W5oybkYSPYgxj/d1I5Qang6
         wAIqLfWPDpLuyBT5QUlYUPJIPQwWzrlO2qMIwikKQOc6MEfGAqvYVCQuwJ1qcrou2PZ4
         aTUEC5eYWxys/n1W4PwMoaYAIVKb+uiI5uKEjv/pq3dTL6C0nDdAVXeuTq1tuMXzwf37
         dJoA==
X-Gm-Message-State: ANoB5pnNi/vovnrX7ZQ3zn19PPwA/Z8I3iOASOykxd1BnuArEjruakGg
        rJkQBv1QAXuN8Ry83IqkbLWzuPC2e37ghUdR
X-Google-Smtp-Source: AA0mqf4fdP0H5tNLp6efqzFjYJB3ZXRx/iDVyTHLz2DCSf7OBvJqn8L7biBipbEa0lheG514IfTGQg==
X-Received: by 2002:a05:6512:1047:b0:4b0:fced:f1b7 with SMTP id c7-20020a056512104700b004b0fcedf1b7mr3772526lfb.43.1668422560069;
        Mon, 14 Nov 2022 02:42:40 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id bs21-20020a05651c195500b0026c4e922fb2sm1946486ljb.48.2022.11.14.02.42.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:42:39 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] arm64: dts: qcom: sm6375: Add QUPs and corresponding SPI/I2C hosts
Date:   Mon, 14 Nov 2022 11:42:18 +0100
Message-Id: <20221114104222.36329-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114104222.36329-1-konrad.dybcio@linaro.org>
References: <20221114104222.36329-1-konrad.dybcio@linaro.org>
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

Add necessary nodes to support various QUP configurations. Note that:

- QUP3/4/5 and 11 are straight up missing
- There may be more QUPs physically on the SoC that work perfectly
fine, but Qualcomm decided not to expose them on the downstream kernel
- Many are missing pinctrls, as there are both missing pin funcs in
the TLMM driver and missing configuration settings (though they are
possible to guesstimate quite easily)

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No changes since v1.

 arch/arm64/boot/dts/qcom/sm6375.dtsi | 306 +++++++++++++++++++++++++++
 1 file changed, 306 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 952156891476..6adffd927a8e 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,sm6375-gcc.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -317,6 +318,25 @@ CLUSTER_PD: cpu-cluster0 {
 		};
 	};
 
+	qup_opp_table: opp-table-qup {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmpd_opp_low_svs>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmpd_opp_svs>;
+		};
+
+		opp-128000000 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmpd_opp_nom>;
+		};
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -630,6 +650,125 @@ gpi_dma0: dma-controller@4a00000 {
 			status = "disabled";
 		};
 
+		qupv3_id_0: geniqup@4ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x04ac0000 0x0 0x2000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			iommus = <&apps_smmu 0x3 0x0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			i2c0: i2c@4a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x04a80000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				interrupts = <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c0_default>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi0: spi@4a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x04a80000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				interrupts = <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi0_default>;
+				power-domains = <&rpmpd SM6375_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@4a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x04a84000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c1_default>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi1: spi@4a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x04a84000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmpd SM6375_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@4a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x04a88000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				interrupts = <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c2_default>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi2: spi@4a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x04a88000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				interrupts = <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmpd SM6375_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			/*
+			 * As per GCC, QUP3/4/5/11 also exist, but are not even defined downstream.
+			 * There is a comment in the included DTSI of another SoC saying that they
+			 * are not "bolled out" (probably meaning not routed to solder balls)
+			 * TLMM driver however, suggests there are as many as 15 QUPs in total!
+			 * Most of which don't even have pin configurations for.. Sad stuff!
+			 */
+		};
+
 		gpi_dma1: dma-controller@4c00000 {
 			compatible = "qcom,sm6375-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x04c00000 0 0x60000>;
@@ -650,6 +789,173 @@ gpi_dma1: dma-controller@4c00000 {
 			status = "disabled";
 		};
 
+		qupv3_id_1: geniqup@4cc0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x04cc0000 0x0 0x2000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			iommus = <&apps_smmu 0xc3 0x0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			i2c6: i2c@4c80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x04c80000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi6: spi@4c80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x04c80000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmpd SM6375_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@4c84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x04c84000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi7: spi@4c84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x04c84000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmpd SM6375_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@4c88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x04c88000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				interrupts = <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c8_default>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi8: spi@4c88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x04c88000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				interrupts = <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmpd SM6375_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c9: i2c@4c8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x04c8c000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				interrupts = <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi9: spi@4c8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x04c8c000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				interrupts = <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmpd SM6375_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@4c90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x04c90000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				interrupts = <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c10_default>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi10: spi@4c90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x04c90000 0x0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				interrupts = <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmpd SM6375_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		usb_1: usb@4ef8800 {
 			compatible = "qcom,sm6375-dwc3", "qcom,dwc3";
 			reg = <0 0x04ef8800 0 0x400>;
-- 
2.38.1

