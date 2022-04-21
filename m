Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D53D50A03F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 15:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiDUND7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 09:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiDUND6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 09:03:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF3A32994;
        Thu, 21 Apr 2022 06:01:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D9FC1B82432;
        Thu, 21 Apr 2022 13:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869EFC385AB;
        Thu, 21 Apr 2022 13:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650546066;
        bh=26fiXcvDemM6BJ7uZ1NVAx0sy6/ya5jdkv/ODhIVIJM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QzXJaaWURzsxlRelTQ1EYdAlpTjHmbufxUxEVBW/phmgqw3wF4Mv6nyK0VdBdYv2O
         XxwnR6Qubn80jnGhFQ++iMw9V3wKMIaZeUwNi765ODsUFuMz/NXDde8+sE+MsH9XT3
         4EvH20663mGCDBT06jpb5TPaKl+IN6K+vMWk4x9AZ1Kns3BMq+8G5rl3O6uDBayHgX
         vLvco/PPlVguW/VXsLgvXMeulXm5oNpIlDJZr1RGUeTVc46MBM5sL3mYIvFv75Euql
         uUR+YTgLliR2gXApnYL5muRWwW3yCGB1Kk7UMAxPLGV63gEpijnH15uZR7K8Z+t9zT
         ogfspf4u1cAfQ==
Date:   Thu, 21 Apr 2022 18:30:57 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: db845c: Add support for MCP2517FD
Message-ID: <20220421130057.GB262430@thinkpad>
References: <20220421073438.1824061-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421073438.1824061-1-vkoul@kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 21, 2022 at 01:04:38PM +0530, Vinod Koul wrote:
> Add support for onboard MCP2517FD SPI CAN transceiver attached to
> SPI0 of RB3.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

One comment below but irrespective of that,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
> Change in v3:
>  - change underscore(_) to dash (-) in can-clock node name
>  - remove superfluous status = okay in can node
> 
> Changes in v2:
>  - add cs and pinctrl config
>  - remove misleading comment
> 
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 28fe45c5d516..d2ade684703d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -28,6 +28,13 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	/* Fixed crystal oscillator dedicated to MCP2517FD */
> +	clk40M: can-clock {

clock@?

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <40000000>;
> +	};
> +
>  	dc12v: dc12v-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "DC12V";
> @@ -746,6 +753,23 @@ codec {
>  	};
>  };
>  
> +&spi0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qup_spi0_default>;
> +	cs-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +	can@0 {
> +		compatible = "microchip,mcp2517fd";
> +		reg = <0>;
> +		clocks = <&clk40M>;
> +		interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vdc_5v>;
> +		xceiver-supply = <&vdc_5v>;
> +	};
> +};
> +
>  &spi2 {
>  	/* On Low speed expansion */
>  	label = "LS-SPI0";
> @@ -1219,3 +1243,11 @@ ov7251_ep: endpoint {
>  		};
>  	};
>  };
> +
> +/* PINCTRL - additions to nodes defined in sdm845.dtsi */
> +&qup_spi0_default {
> +	config {
> +		drive-strength = <6>;
> +		bias-disable;
> +	};
> +};
> -- 
> 2.34.1
> 
