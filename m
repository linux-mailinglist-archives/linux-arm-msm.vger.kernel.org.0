Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A528F607381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 11:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiJUJJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 05:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbiJUJJE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 05:09:04 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B2D1A3E01
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 02:09:01 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v1so3787299wrt.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8zoiO3HcCMOhvwnFbJarwF7HI12ZyCQT2wJzcSF7bw=;
        b=Uz6ED8+AFKkavxx4Z4rUSZ49p6KCGe3ktPcOBHN6WexT7SyHWpM6TnwFv/A3y1Sd5x
         WE9Nuf4iKsjXPtEkH6zp+umlRZCRh37PLcXAZy6nqmiWmRBE+mTivIKi0MpiGhHSi/pn
         xNeRFpiKCEDcj38NIp+sNtJSP96sQYyygQH2rMvZ/X4SrKR7vCvSUF/AnE8vqs55l6Od
         XkeRrMcVjzW95YqcF1/os/jOLZI/6FJdMOKjlDXWCj2FVYV45DwL2DdLgU3tCJohi9sA
         VUna4rGH+A01zmT9mJtRtT1LuDZbp2Bq8wT5zxMPuIQchB//v9g1u7GiCyMWeeEIsjkt
         lv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8zoiO3HcCMOhvwnFbJarwF7HI12ZyCQT2wJzcSF7bw=;
        b=6uJFGsfhgC1+0kJkvtZlt7yRGidUw4jtRt/TW8P3wFAp/CNWcPytdqHaLpPRssYORd
         GaeWc12C6cCgHnHTt3HnLTduWHGLCitzOZOEv6pLMYlHxOUKjsL4Z1vGFpLgjBLsrNzT
         j+aioV+OmLv6O7NvXHpoSYbne2zKIwla3HE4tkm0ZFw/g/Rs4V39Zxx7bzZGYTEkBYbV
         pcY4vU0LkS6fC2BImyeu1q8tJ5zPVmRrKX3j7D3EPYkOrJKZB3GLDFSDqXzcgCh9fxlR
         LREhaZeS3o7kYQXCHZrlN8AmC2d78NRt9kX+d7Moaeg6MxQBorZoNG2tUNRO4F0qLyMS
         wOYg==
X-Gm-Message-State: ACrzQf2pzql48yh+yH6Ur22MjRnc2DUebrQsAh/HwvlyMxBG61iZteJT
        f9qA/E/lRBfXdK82pr6RG9c35A==
X-Google-Smtp-Source: AMsMyM6jIh9zbKsc1vnvwPsF6zzTaHqTxKuVbiY7pDHJlXhCrSir/VQF9R12RHVdtYEqxXhm2nHf2Q==
X-Received: by 2002:adf:d0c5:0:b0:22d:e73a:a4c9 with SMTP id z5-20020adfd0c5000000b0022de73aa4c9mr11224682wrh.315.1666343339285;
        Fri, 21 Oct 2022 02:08:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003c6f27d275dsm2230286wmn.33.2022.10.21.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:08:58 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 21 Oct 2022 11:06:47 +0200
Subject: [PATCH v4 11/11] arm: dts: qcom: mdm9615: remove useless amba subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v4-11-dac2dfaac703@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The separate amba device node doesn't add anything significant to the
DT. The OF parsing code already creates amba_device or platform_device
depending on the compatibility lists.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 78 +++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 9d950f96280d..482fd246321c 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -314,49 +314,43 @@ sdcc2bam: dma-controller@12142000{
 			qcom,ee = <0>;
 		};
 
-		amba {
-			compatible = "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			sdcc1: mmc@12180000 {
-				status = "disabled";
-				compatible = "arm,pl18x", "arm,primecell";
-				arm,primecell-periphid = <0x00051180>;
-				reg = <0x12180000 0x2000>;
-				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <8>;
-				max-frequency = <48000000>;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				vmmc-supply = <&vsdcc_fixed>;
-				dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
-				dma-names = "tx", "rx";
-				assigned-clocks = <&gcc SDC1_CLK>;
-				assigned-clock-rates = <400000>;
-			};
+		sdcc1: mmc@12180000 {
+			status = "disabled";
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00051180>;
+			reg = <0x12180000 0x2000>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <8>;
+			max-frequency = <48000000>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
+			dma-names = "tx", "rx";
+			assigned-clocks = <&gcc SDC1_CLK>;
+			assigned-clock-rates = <400000>;
+		};
 
-			sdcc2: mmc@12140000 {
-				compatible = "arm,pl18x", "arm,primecell";
-				arm,primecell-periphid = <0x00051180>;
-				status = "disabled";
-				reg = <0x12140000 0x2000>;
-				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <4>;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				max-frequency = <48000000>;
-				no-1-8-v;
-				vmmc-supply = <&vsdcc_fixed>;
-				dmas = <&sdcc2bam 2>, <&sdcc2bam 1>;
-				dma-names = "tx", "rx";
-				assigned-clocks = <&gcc SDC2_CLK>;
-				assigned-clock-rates = <400000>;
-			};
+		sdcc2: mmc@12140000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00051180>;
+			status = "disabled";
+			reg = <0x12140000 0x2000>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <4>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <48000000>;
+			no-1-8-v;
+			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc2bam 2>, <&sdcc2bam 1>;
+			dma-names = "tx", "rx";
+			assigned-clocks = <&gcc SDC2_CLK>;
+			assigned-clock-rates = <400000>;
 		};
 
 		tcsr: syscon@1a400000 {

-- 
b4 0.10.1
