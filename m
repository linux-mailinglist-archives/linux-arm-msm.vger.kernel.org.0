Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DA226A879
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 17:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgIOPM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 11:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbgIOPI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 11:08:59 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3945C061788
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 08:08:58 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id ef16so1862428qvb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EFLCdMmOvFwRQ905l+aagH4TBh+YWb/tavTex3w/ZbY=;
        b=g7YWP0N72IQhnklFtqkMNvEcX5od87RTTkt2zDF1nPt6N5F8Y6k9/MV0dXLjdomz/e
         jiFF+ZncByZ6t+H14afu3RRXaIjkd3gUX2BURxysb/jKgBg68nbD6Wcwm6Zar2W/jUC0
         AJ0paCLXKapT0wOyKySQLXNrWdIEh6rCK5MylWXBH44kFt1iYkIEM1ON5kPJOxt3bTA9
         GysjUkVwdBJANmwqDH5bgJMGoRZVgWy68izNxN+Uy1LI2begrnMoRNBzxYWYpgHg9dXK
         p4p1icPGWUsZ/Fpm+uuiRd5NclyhuYuna4TvLCOdkxTCeU24rtyUdUDABE3tVXHptals
         OdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EFLCdMmOvFwRQ905l+aagH4TBh+YWb/tavTex3w/ZbY=;
        b=cR8X0RP2lnjo15jplEbvW0GEGKjzkxUOMQpAMaic/fKFQf0XD9SwJvg1ICb4PXnj3K
         TPnngpTUDXSkIy9GqhtlxfOhFYoBNQ4QrS0gl5yespPB6Ze487TIs0xzK+L8k0EgDyu/
         aJYrSP8NqZWv9LP5hmWoGud1ZNH8OrCQUTkA/YG9nb+7yaUWLlhndFbtu3z8ee0Ji8sf
         iHOdhlGLZkvhkkWTGdkARPLYlH+RDgw+tNdAOXQHTiRVbNmNoOQ+O40oIVMszkje4AWJ
         Zj36FeexQJLgSg3cztY/C6bw4BxSwlvt6KQQHN4aFHXkg0hYsxTKU3vtIKPpHAj/2a9/
         7ttQ==
X-Gm-Message-State: AOAM532bt7OPPLU/aS1pou7bn/kwmPJ9bSznQ7STeFYckY2xa1+Juv9s
        Vw5jz3u9QPjZInWoklMn2GUDeIdidvaA4g==
X-Google-Smtp-Source: ABdhPJyuTZE9nzlFToNqSbqEB352XN172Sc4lh+1QDiN2tmgMwy287vmXBaSabyhghLmzDVeXfuAeQ==
X-Received: by 2002:a0c:e649:: with SMTP id c9mr17989382qvn.16.1600182537667;
        Tue, 15 Sep 2020 08:08:57 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id r2sm16869663qti.92.2020.09.15.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 08:08:56 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:08:55 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] arm64: dts: sm8250: Add OPP table for all qup devices
Message-ID: <20200915150855.GB478@uller>
References: <20200915120203.290295-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915120203.290295-1-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 12:02 UTC 2020, Dmitry Baryshkov wrote:

> qup has a requirement to vote on the performance state of the CX domain
> in sm8250 devices. Add OPP tables for these and also add power-domains
> property for all qup instances for uart and spi.
> i2c does not support scaling and uses a fixed clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index c989bc1370ab..6cd45a667ba9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -411,6 +411,25 @@ ipcc: mailbox@408000 {
>  			#mbox-cells = <2>;
>  		};
>  
> +		qup_opp_table: qup-opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-50000000 {
> +				opp-hz = /bits/ 64 <50000000>;
> +				required-opps = <&rpmhpd_opp_min_svs>;
> +			};
> +
> +			opp-75000000 {
> +				opp-hz = /bits/ 64 <75000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-120000000 {
> +				opp-hz = /bits/ 64 <120000000>;
> +				required-opps = <&rpmhpd_opp_svs>;
> +			};
> +		};
> +
>  		qupv3_id_2: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x008c0000 0x0 0x6000>;
> @@ -445,6 +464,8 @@ spi14: spi@880000 {
>  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -471,6 +492,8 @@ spi15: spi@884000 {
>  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -497,6 +520,8 @@ spi16: spi@888000 {
>  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -523,6 +548,8 @@ spi17: spi@88c000 {
>  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -534,6 +561,8 @@ uart17: serial@88c000 {
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart17_default>;
>  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -560,6 +589,8 @@ spi18: spi@890000 {
>  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -571,6 +602,8 @@ uart18: serial@890000 {
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart18_default>;
>  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -597,6 +630,8 @@ spi19: spi@894000 {
>  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  		};
> @@ -635,6 +670,8 @@ spi0: spi@980000 {
>  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -661,6 +698,8 @@ spi1: spi@984000 {
>  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -687,6 +726,8 @@ spi2: spi@988000 {
>  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -698,6 +739,8 @@ uart2: serial@988000 {
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart2_default>;
>  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -724,6 +767,8 @@ spi3: spi@98c000 {
>  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -750,6 +795,8 @@ spi4: spi@990000 {
>  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -776,6 +823,8 @@ spi5: spi@994000 {
>  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -802,6 +851,8 @@ spi6: spi@998000 {
>  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -813,6 +864,8 @@ uart6: serial@998000 {
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart6_default>;
>  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -839,6 +892,8 @@ spi7: spi@99c000 {
>  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  		};
> @@ -877,6 +932,8 @@ spi8: spi@a80000 {
>  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -903,6 +960,8 @@ spi9: spi@a84000 {
>  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -929,6 +988,8 @@ spi10: spi@a88000 {
>  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -955,6 +1016,8 @@ spi11: spi@a8c000 {
>  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -981,6 +1044,8 @@ spi12: spi@a90000 {
>  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -992,6 +1057,8 @@ uart12: serial@a90000 {
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart12_default>;
>  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -1018,6 +1085,8 @@ spi13: spi@a94000 {
>  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SM8250_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  		};
> -- 
> 2.28.0
> 
