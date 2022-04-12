Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456C04FCC72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 04:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236712AbiDLC3T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 22:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238530AbiDLC3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 22:29:18 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9A12E9D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:26:59 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id q189so17655678oia.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mK8JcrG8Qx2kyMEBNEpiV/VoNjnbjCx6vfxA6ZQWMKQ=;
        b=rS0NZmTt44rjYAkBCsrNwXriu57BaIZUATZhgV6TKotVaRv3kECL/YGYu8wDiILrsd
         iJ936GXx4PSHbW5R3y/RIa3UbuWCvPfAzETQwVo9Q/PI93RfPmwfyDF8H0+qd9GIbZWi
         PAfR7CDPhb/VpqR/G1y4QOiZPYVYnf3dbEw3e5y/cy2cfIU0iSA9Ui2G9X1yFvp/0WLK
         L741lCGtTRiiohYk/HqzoGjJhciuyf5aTr4wG7vcwqYI06dIyJB1Dob1NcHzGGByc4UB
         aeXLfQckVVGFq3YWmnx9ynY99ho0pCrCOQDaBWdDpSkeEJ/iLXxUi6UDYCtqHZ8YQwQK
         ni/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mK8JcrG8Qx2kyMEBNEpiV/VoNjnbjCx6vfxA6ZQWMKQ=;
        b=uzftXfJF+MuaNOMFhes24gsBZa4hWZSB2Mr94Z7kUEDo+S17OsNcO4zVzJyEs/VYvl
         H888uB4mV4th18RsPqW+HH01eQ7CUhyGPiGg4uHocUKwNnvNVA3VU5Vwn7TBKlpvseFy
         LwXHCv09zYnP5x5K3RyE3VuKam5UzcAASxO65BAWUJEBwraifD76d25UOGm3F3D4WXfR
         Ig/qyT4XjZDm9d9pp3uw2b0DKP2MgOwWv7xz/ebmIGbB998KvRyDDQINyzTAABa6AgCQ
         7DXP9ysEF+x4wH+BG2Smf70Wlcfr3NGBqNX7A6Wjx5SeMo8dQGtSwwjYZ+Env+pvTSGm
         aWyg==
X-Gm-Message-State: AOAM532dJqKPbzVygYspkQkHyWHLwkoKljtH68SqeVeF/uda7XgaS7p3
        cUxU855NtmRfdap2f9TQP6m/yA==
X-Google-Smtp-Source: ABdhPJwiPXSmxKWuhSyRkhkg/sD3E+kIyeohpDu6LQ6plE/QLEfcaNrVHANbTmxfzoYlkQ3d7p6H0A==
X-Received: by 2002:a05:6808:1827:b0:2da:5085:2e78 with SMTP id bh39-20020a056808182700b002da50852e78mr868079oib.172.1649730419134;
        Mon, 11 Apr 2022 19:26:59 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id g25-20020a544f99000000b002da70c710b8sm12286102oiy.54.2022.04.11.19.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 19:26:58 -0700 (PDT)
Date:   Mon, 11 Apr 2022 21:26:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Beno?t Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Gross <agross@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Fix more boolean properties with values
Message-ID: <YlTjcNNM/22wtjSY@builder.lan>
References: <20220407225107.2175958-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407225107.2175958-1-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 07 Apr 17:51 CDT 2022, Rob Herring wrote:

> Boolean properties in DT are present or not present and don't take a value.
> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> matter.
> 
> It may have been intended that 0 values are false, but there is no change
> in behavior with this patch.
> 
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: "Benoît Cousson" <bcousson@baylibre.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/at91-sam9_l9260.dts            | 2 +-
>  arch/arm/boot/dts/imx28-ts4600.dts               | 2 +-
>  arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi | 4 ++--
>  arch/arm/boot/dts/qcom-ipq8064.dtsi              | 8 ++++----

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91-sam9_l9260.dts b/arch/arm/boot/dts/at91-sam9_l9260.dts
> index 1e2a28c2f365..2fb51b9aca2a 100644
> --- a/arch/arm/boot/dts/at91-sam9_l9260.dts
> +++ b/arch/arm/boot/dts/at91-sam9_l9260.dts
> @@ -101,7 +101,7 @@ pinctrl_board_mmc0: mmc0-board {
>  		nand0: nand@40000000 {
>  			nand-bus-width = <8>;
>  			nand-ecc-mode = "soft";
> -			nand-on-flash-bbt = <1>;
> +			nand-on-flash-bbt;
>  			status = "okay";
>  		};
>  
> diff --git a/arch/arm/boot/dts/imx28-ts4600.dts b/arch/arm/boot/dts/imx28-ts4600.dts
> index 097ec35c62d8..0d58da1c0cc5 100644
> --- a/arch/arm/boot/dts/imx28-ts4600.dts
> +++ b/arch/arm/boot/dts/imx28-ts4600.dts
> @@ -26,7 +26,7 @@ ssp0: spi@80010000 {
>  				pinctrl-0 = <&mmc0_4bit_pins_a
>  					     &mmc0_sck_cfg
>  					     &en_sd_pwr>;
> -				broken-cd = <1>;
> +				broken-cd;
>  				bus-width = <4>;
>  				vmmc-supply = <&reg_vddio_sd0>;
>  				status = "okay";
> diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> index b4664ab00256..d3da8b1b473b 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> +++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> @@ -118,8 +118,8 @@ usb@6,0 {
>  		gpmc,device-width = <2>;
>  		gpmc,wait-pin = <0>;
>  		gpmc,burst-length = <4>;
> -		gpmc,cycle2cycle-samecsen = <1>;
> -		gpmc,cycle2cycle-diffcsen = <1>;
> +		gpmc,cycle2cycle-samecsen;
> +		gpmc,cycle2cycle-diffcsen;
>  		gpmc,cs-on-ns = <0>;
>  		gpmc,cs-rd-off-ns = <45>;
>  		gpmc,cs-wr-off-ns = <45>;
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 996f4458d9fc..8cb04aa8ed2f 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -972,7 +972,7 @@ gmac0: ethernet@37000000 {
>  
>  			snps,axi-config = <&stmmac_axi_setup>;
>  			snps,pbl = <32>;
> -			snps,aal = <1>;
> +			snps,aal;
>  
>  			qcom,nss-common = <&nss_common>;
>  			qcom,qsgmii-csr = <&qsgmii_csr>;
> @@ -996,7 +996,7 @@ gmac1: ethernet@37200000 {
>  
>  			snps,axi-config = <&stmmac_axi_setup>;
>  			snps,pbl = <32>;
> -			snps,aal = <1>;
> +			snps,aal;
>  
>  			qcom,nss-common = <&nss_common>;
>  			qcom,qsgmii-csr = <&qsgmii_csr>;
> @@ -1020,7 +1020,7 @@ gmac2: ethernet@37400000 {
>  
>  			snps,axi-config = <&stmmac_axi_setup>;
>  			snps,pbl = <32>;
> -			snps,aal = <1>;
> +			snps,aal;
>  
>  			qcom,nss-common = <&nss_common>;
>  			qcom,qsgmii-csr = <&qsgmii_csr>;
> @@ -1044,7 +1044,7 @@ gmac3: ethernet@37600000 {
>  
>  			snps,axi-config = <&stmmac_axi_setup>;
>  			snps,pbl = <32>;
> -			snps,aal = <1>;
> +			snps,aal;
>  
>  			qcom,nss-common = <&nss_common>;
>  			qcom,qsgmii-csr = <&qsgmii_csr>;
> -- 
> 2.32.0
> 
