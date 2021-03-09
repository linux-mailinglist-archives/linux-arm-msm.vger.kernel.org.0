Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA14332F7F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 21:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhCIUCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 15:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhCIUCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 15:02:05 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8072DC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 12:02:05 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id e45so14042757ote.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 12:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0AqNLeuvsdC9mTzNaR149wW23xC90Lwttj969e6DLNc=;
        b=Hylpbe4o8Tv2NHxSKoAEUNd+9G7rJY8plbBUqHO80suf+rVkUJ3tpOHXL12Xgg2zv9
         LOu4M17McFc4f+qbuI95YKev5VwHb1vSA0fgVUtB7zEb8V62qgKjOnDuw/S7BZvrLHIM
         tla7cwfMZpwCQzEwPyvKerWYMtzI+fzCGvRDjtwtZSaNit1MuDtLU3XH9ymXXo3qLX7h
         UKNL9++VzO20sBoNUO2oHGF1ByFUHsxEKeXht+iy0Nca0GSqYAXSdoRMT3m11ZMFl3zG
         G0kQrJlmVXbfAq3XYQBQmryimZLO76MY3JfUdZWsyPLXfzR9UIGR0NGJbvcVzeHHlc3L
         0/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0AqNLeuvsdC9mTzNaR149wW23xC90Lwttj969e6DLNc=;
        b=gXCYSrxNGWtXQlZeYwlzqsmp837t53OJZbU2i4Hr4fwOFlpyV/4XYHy6BgyTqVeyxZ
         1gZn13k4aMjh68n8IWtc2x/VA3JFJpHNyKnAfcoCc4ofkqZ8ZCFvfMOwxmfX+8NAEBDJ
         EUtLKv91Mw2k4+ziwTFYsQCGykradj3FlarzEEz2YA/c2HcfM6aHkUUTHPPAuL3LjYRk
         karp13LimSGpEzBlhcNflmbOK2pDRX8SNCzU6VyYcXdN74F4JnQhZPKPPEuUfr++LdDf
         60ME6W+myLfgFBo+NOsA1hVuMfw5gNU8Pr+8uHNMkSWWqlnXxfey5Xv941ZeWvsLMrKT
         64Rw==
X-Gm-Message-State: AOAM532oJKpcNAXhJJtc6QZlEb64Wj9B9G7jZJEor25BYAkFd87Cob0R
        d8A5wS3CJKhqdAdggXyh00XkXw==
X-Google-Smtp-Source: ABdhPJxVeIZCZJCkNLhQXhzNR6uBYypaM1ivYPvyQ6M1JyRer0SJf+GDm6PhTpXmylHyET1Q7TwP8g==
X-Received: by 2002:a9d:4d96:: with SMTP id u22mr16519135otk.106.1615320124618;
        Tue, 09 Mar 2021 12:02:04 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j35sm3368460ota.54.2021.03.09.12.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:02:04 -0800 (PST)
Date:   Tue, 9 Mar 2021 14:02:02 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, sartgarg@codeaurora.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH V1] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
Message-ID: <YEfUOljmaxpkxqZq@builder.lan>
References: <1615317483-23780-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615317483-23780-1-git-send-email-sbhanu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Mar 13:18 CST 2021, Shaik Sajida Bhanu wrote:

> Add nodes for eMMC and SD card on sc7280.
> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> 
> ---
> This change is depends on the below patch series:
> https://lore.kernel.org/lkml/1613114930-1661-1-git-send-email-rnayak@codeaurora.org/
> https://lore.kernel.org/patchwork/project/lkml/list/?series=&submitter=28035&state=&q=&archive=&delegate=
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  26 +++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 170 ++++++++++++++++++++++++++++++++
>  2 files changed, 196 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index ac79420..6abb2aa 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>  
>  #include "sc7280.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SC7280 IDP platform";
> @@ -256,3 +257,28 @@
>  		bias-pull-up;
>  	};
>  };
> +
> +&sdhc_1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_on>;
> +	pinctrl-1 = <&sdc1_off>;
> +
> +	vmmc-supply = <&vreg_l7b_2p9>;
> +	vqmmc-supply = <&vreg_l19b_1p8>;
> +
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default","sleep";
> +	pinctrl-0 = <&sdc2_on>;
> +	pinctrl-1 = <&sdc2_off>;
> +
> +	vmmc-supply = <&vreg_l9c_2p9>;
> +	vqmmc-supply = <&vreg_l6c_2p9>;
> +
> +	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;

Please add these nodes above the comment that says "PINCTRL -
additions..." and please include the pinctrl state for gpio 91.

> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3b86052..91fb18a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -18,6 +18,11 @@
>  
>  	chosen { };
>  
> +	aliases {
> +		mmc1 = &sdhc_1;
> +		mmc2 = &sdhc_2;
> +	};
> +
>  	clocks {
>  		xo_board: xo-board {
>  			compatible = "fixed-clock";
> @@ -315,6 +320,69 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		sdhc_1: sdhci@7c4000 {
> +			compatible = "qcom,sdhci-msm-v5";
> +			reg = <0 0x7c4000 0 0x1000>,
> +					<0 0x7c5000 0 0x1000>;
> +			reg-names = "hc", "cqhci";
> +
> +			iommus = <&apps_smmu 0xC0 0x0>;
> +			interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> +					<&gcc GCC_SDCC1_AHB_CLK>,
> +					<&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "core", "iface", "xo";
> +
> +			bus-width = <8>;
> +			non-removable;
> +			supports-cqe;
> +			no-sd;
> +			no-sdio;
> +
> +			max-frequency = <192000000>;
> +
> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;
> +
> +			status = "disabled";
> +
> +		};
> +
> +		sdhc_2: sdhci@8804000 {
> +			compatible = "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
> +
> +			iommus = <&apps_smmu 0x100 0x0>;
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> +					<&gcc GCC_SDCC2_AHB_CLK>,
> +					<&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "core", "iface", "xo";
> +
> +			bus-width = <4>;
> +
> +			no-mmc;
> +			no-sdio;
> +
> +			max-frequency = <202000000>;
> +
> +			qcom,dll-config = <0x0007642c>;
> +
> +			status = "disabled";
> +
> +		};
> +
>  		qupv3_id_0: geniqup@9c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0 0x009c0000 0 0x2000>;
> @@ -385,6 +453,108 @@
>  				pins = "gpio46", "gpio47";
>  				function = "qup13";
>  			};
> +
> +			sdc1_on: sdc1-on {
> +				pinconf-clk {

The "pinconf-" prefix does not provide any value here. Can you please
drop it?

Regards,
Bjorn

> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};
> +
> +				pinconf-cmd {
> +					pins = "sdc1_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				pinconf-data {
> +					pins = "sdc1_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				pinconf-rclk {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_off: sdc1-off {
> +				pinconf-clk {
> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-cmd {
> +					pins = "sdc1_cmd";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-data {
> +					pins = "sdc1_data";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-rclk {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc2_on: sdc2-on {
> +				pinconf-clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};
> +
> +				pinconf-cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				pinconf-data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				pinconf-sd-cd {
> +					pins = "gpio91";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +			};
> +
> +			sdc2_off: sdc2-off {
> +				pinconf-clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-sd-cd {
> +					pins = "gpio91";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +			};
>  		};
>  
>  		apps_smmu: iommu@15000000 {
> -- 
> 2.7.4
> 
