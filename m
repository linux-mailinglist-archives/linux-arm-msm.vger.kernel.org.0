Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1FDF382891
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 11:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbhEQJmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 05:42:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235911AbhEQJmD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 05:42:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DFB3611CD;
        Mon, 17 May 2021 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621244447;
        bh=tE5qXO8A3sZbTfEPqKJZUmRiUX18pcJSzQ/10l1WaSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VPnPhLwPH0T4scfo6rFt3KzSKxrKAqv6/gSk1dXKI9yAP0k62F3CInKWPICO8eull
         PoCwNq6igJlkeOQQVKfphDH40XLBO5HmPgLzjGTjpYFexQWIgyh8SEVhejYM4DvAZZ
         B9SWWaE5cDekGizUG+Q4uwl3VBgqF6V7CVMfOWwG2h/AT2OadgZzBqjFOrV1+5njKA
         emHfwLwEQ8CCPcwFIVRk3g2tqqpole2QQ6vz2whek4l+DmRmS7zp5cgHNeONw79xIu
         mWtDk7wD0srXOe9cOV6Ocb0CZySl73ex1HQW3d7ABwCSmLD8N1ANbU7lLhb/E7IVYd
         umv0gVIgpGKow==
Date:   Mon, 17 May 2021 15:10:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: qcom: Add ADM DMA + NAND definitions to
 ipq806x
Message-ID: <YKI6GxlSSSv2q03g@vkoul-mobl.Dlink>
References: <cover.1621097174.git.noodles@earth.li>
 <fb8b3df3a25120cb1ae9adfd25c754334e8eaf4e.1621097174.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb8b3df3a25120cb1ae9adfd25c754334e8eaf4e.1621097174.git.noodles@earth.li>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-05-21, 17:52, Jonathan McDowell wrote:
> Now the ADM driver is in mainline add the appropriate definitions for it
> and the NAND controller to get NAND working on IPQ806x platforms,
> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 67 +++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 98995ead4413..aaab3820ab0b 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -185,6 +185,31 @@
>  					bias-pull-up;
>  				};
>  			};
> +
> +			nand_pins: nand_pins {
> +				mux {
> +					pins = "gpio34", "gpio35", "gpio36",
> +					       "gpio37", "gpio38", "gpio39",
> +					       "gpio40", "gpio41", "gpio42",
> +					       "gpio43", "gpio44", "gpio45",
> +					       "gpio46", "gpio47";
> +					function = "nand";
> +					drive-strength = <10>;
> +					bias-disable;
> +				};
> +
> +				pullups {
> +					pins = "gpio39";
> +					bias-pull-up;
> +				};
> +
> +				hold {
> +					pins = "gpio40", "gpio41", "gpio42",
> +					       "gpio43", "gpio44", "gpio45",
> +					       "gpio46", "gpio47";
> +					bias-bus-hold;
> +				};
> +			};
>  		};
>  
>  		intc: interrupt-controller@2000000 {
> @@ -226,6 +251,26 @@
>  			reg = <0x02098000 0x1000>, <0x02008000 0x1000>;
>  		};
>  
> +		adm_dma: dma@18300000 {

dma-controller@...

-- 
~Vinod
