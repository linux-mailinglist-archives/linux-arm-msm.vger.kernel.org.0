Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADB752709A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 12:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbiENKMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 06:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbiENKL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 06:11:58 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22857F73
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 03:11:55 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B93D520576;
        Sat, 14 May 2022 12:11:53 +0200 (CEST)
Date:   Sat, 14 May 2022 12:11:52 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: sdm630: add second (HS) USB
 host support
Message-ID: <20220514101152.57pno74fqbxib26n@SoMainline.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513234518.3068480-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-14 02:45:15, Dmitry Baryshkov wrote:
> Add DT entries for the second DWC3 USB host, which is limited to the
> USB2.0 (HighSpeed), and the corresponding QUSB PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Some minor style nits below.

> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 55 ++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index cca56f2fad96..17a1877587cf 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1270,6 +1270,20 @@ qusb2phy: phy@c012000 {
>  			status = "disabled";
>  		};
>  
> +		qusb2phy1: phy@c014000 {

Should we rename qusb2phy to qusb2phy0?

> +			compatible = "qcom,sdm660-qusb2-phy";
> +			reg = <0x0c014000 0x180>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +				<&gcc GCC_RX1_USB2_CLKREF_CLK>;

Should use the correct indentation from the get-go?

> +			clock-names = "cfg_ahb", "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
> +			nvmem-cells = <&qusb2_hstx_trim>;
> +			status = "disabled";
> +		};
> +
>  		sdhc_2: sdhci@c084000 {
>  			compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0x0c084000 0x1000>;
> @@ -1375,6 +1389,47 @@ opp-384000000 {
>  			};
>  		};
>  
> +		usb2: usb@c2f8800 {
> +			compatible = "qcom,sdm660-dwc3", "qcom,dwc3";
> +			reg = <0x0c2f8800 0x400>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB2_AXI_CLK>,
> +				 <&gcc GCC_USB20_MASTER_CLK>,
> +				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_USB20_SLEEP_CLK>;
> +			clock-names = "cfg_noc", "core",
> +				      "mock_utmi", "sleep";

This fits on one line and stays at 79 characters.

- Marijn

> +
> +			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB20_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <60000000>;
> +
> +			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hs_phy_irq";
> +
> +			qcom,select-utmi-as-pipe-clk;
> +
> +			resets = <&gcc GCC_USB_20_BCR>;
> +
> +			usb2_dwc3: usb@c200000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0c200000 0xc8d0>;
> +				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +
> +				/* This is the HS-only host */
> +				maximum-speed = "high-speed";
> +				phys = <&qusb2phy1>;
> +				phy-names = "usb2-phy";
> +				snps,hird-threshold = /bits/ 8 <0>;
> +			};
> +		};
> +
>  		mmcc: clock-controller@c8c0000 {
>  			compatible = "qcom,mmcc-sdm630";
>  			reg = <0x0c8c0000 0x40000>;
> -- 
> 2.35.1
> 
