Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8392652739B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234800AbiENTBv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234807AbiENTBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:49 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DC6A467
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t25so19654651lfg.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GRnP0k72A6Rn/P6bIjVlTkWcKN2lm4vnrIO3tU5Omrk=;
        b=JVyeMxrGyswq64cngAeD+PxirPYfqaAEjTli7p9FuWEWComRfUGRaR5rOO1EjF7CPL
         b0dlFUG5NsSyQD46ea4NZER9VHwe7khvNWAZb6TsTXlmALnORyrbn2x+inbW4zIwtrlq
         uAwyMQbH9iDVUhlYY4y9iv9xKu031scfyQb4NCSlI4U03FCLSWzx2e9B3w4pVmhvmPfW
         n1ZqrmTFvyQ5eBJq8cL4LnI7K7Yv2jO6fcwQ1S0bIs+5grLBb2ZiDGuSZ9dbe0SW4Nly
         +B41ztOYmCrNSNPN8mg9pDvJJ/SoPjqKMSD7W7kIwjfQkTWGkaifZIaj0A24d76HyJZE
         4dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GRnP0k72A6Rn/P6bIjVlTkWcKN2lm4vnrIO3tU5Omrk=;
        b=Iv7B+eV2CWzTQmsFFp29kgnjxEKuBASFMWaucwRl/aUVNRAQ5ghSnEaaLxleHiAl3p
         lzfYJScndkaUJ3EEwS04z1S36cv4Ce2T2+nLLCpnpYDyA3yHqrfFUbvYJPuZqxT/puCE
         +lNm75lkVtWex4voJ81gBA1lkxYxRHbBOuWw/650xFD/AGPUhXEamAQqcQGzwHhCnHEl
         ftReinkYg2MffIYHgDV+NEpPS+ew8JeD6H7H0OvqZHkeIaKHkuX+P8/VUs7emhpfvBBq
         jvJAkRKafUOxstYh4r3mRgxpup5kBf6YN6nE0te3qBQkt4twdG+9rc5nNm+GSmpIbHMN
         Fm9A==
X-Gm-Message-State: AOAM532oDSjkjxL7Pl3cklaAZBGpm3DBkn5e8jToD+lGlGU3yq3lJKqO
        4FaH+euU28YtgtxNXEVH3zb/oQ==
X-Google-Smtp-Source: ABdhPJy3XKGVWqLJnpHrk5od+pvu6bzhAtGPlR6MP9znt/gGo5bR0qsgEo2aOnVTcB5xV+5Qkih5Hw==
X-Received: by 2002:ac2:5601:0:b0:472:11a6:8287 with SMTP id v1-20020ac25601000000b0047211a68287mr7545183lfd.440.1652554905252;
        Sat, 14 May 2022 12:01:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 06/12] arm64: dts: qcom: sdm630: add second (HS) USB host support
Date:   Sat, 14 May 2022 22:01:32 +0300
Message-Id: <20220514190138.3179964-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT entries for the second DWC3 USB host, which is limited to the
USB2.0 (HighSpeed), and the corresponding QUSB PHY.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index eb8504e5735c..2b5dbc12bdf8 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1270,6 +1270,20 @@ qusb2phy0: phy@c012000 {
 			status = "disabled";
 		};
 
+		qusb2phy1: phy@c014000 {
+			compatible = "qcom,sdm660-qusb2-phy";
+			reg = <0x0c014000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				 <&gcc GCC_RX1_USB2_CLKREF_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim>;
+			status = "disabled";
+		};
+
 		sdhc_2: sdhci@c084000 {
 			compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0c084000 0x1000>;
@@ -1375,6 +1389,47 @@ opp-384000000 {
 			};
 		};
 
+		usb2: usb@c2f8800 {
+			compatible = "qcom,sdm660-dwc3", "qcom,dwc3";
+			reg = <0x0c2f8800 0x400>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>;
+			clock-names = "cfg_noc", "core",
+				      "mock_utmi", "sleep";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <60000000>;
+
+			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq";
+
+			qcom,select-utmi-as-pipe-clk;
+
+			resets = <&gcc GCC_USB_20_BCR>;
+
+			usb2_dwc3: usb@c200000 {
+				compatible = "snps,dwc3";
+				reg = <0x0c200000 0xc8d0>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+
+				/* This is the HS-only host */
+				maximum-speed = "high-speed";
+				phys = <&qusb2phy1>;
+				phy-names = "usb2-phy";
+				snps,hird-threshold = /bits/ 8 <0>;
+			};
+		};
+
 		mmcc: clock-controller@c8c0000 {
 			compatible = "qcom,mmcc-sdm630";
 			reg = <0x0c8c0000 0x40000>;
-- 
2.35.1

