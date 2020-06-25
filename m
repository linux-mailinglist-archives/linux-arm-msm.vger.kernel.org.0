Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBDC20A1B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 17:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405650AbgFYPRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 11:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405632AbgFYPRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 11:17:17 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEF2C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 08:17:17 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id i4so3375405pjd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rH3zkglepBahSd9IX1c75pcis6Uc/eb/JPbk2O7tSmk=;
        b=MaHYka52QScOhrdXtHQC1gIcx4Dyvz26if9PDHp1EVLPiMmBQPeQwEF6pnjVHBvInK
         weoFFjzpWeqxRVgi7QRvLgcKq+W6NcqAcGzqEGBUHYq6KbPnyfvyxtwlHEoMY2XqT+SC
         cTS6qpbgW04cLrorTlXutjhq72Hk3WqNCJVks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rH3zkglepBahSd9IX1c75pcis6Uc/eb/JPbk2O7tSmk=;
        b=nLONpdg5bxNFwf07/bGHa43E7eqwHWTtMuDCNK8+C3NAfki/jk5S/qj2ZxKFJIJ11N
         hwpCcwS8SUuMWVWoteYXKYi736d887SXbrbku5MMTwbPzEL/IDXyeanRQNF9b6KF2AdS
         h7DUPjZTIizo/EwTkbqkLq4WFqA3a8/Ig1cdtVE8zZQwph+LyNPxcNxgmGeb+mtL8elk
         gg6vPvxksUw2RJNXFjbOxQ4l28qTxT3/gnpducz/QyUe6qbm64hfTkbFnIFLo1THsVF8
         iwfkmpgLlIdmC8kGBJWegtKHHd/ysC0lHFKcWVAr1aMpWFKxyouaE7haQRx4MR6TeW01
         S7Bg==
X-Gm-Message-State: AOAM531dt8j6Pxed277Iva1dDbX8sKFjU0tXz0wyYZ+2pjYyytXzZYQC
        Q6ayNAPgqsLlEVHq3tSQClHroQ==
X-Google-Smtp-Source: ABdhPJyUX+tn/N6OlkqVwlbjw4CKCpKjnFXHqmfwRQv9TkChDD6Yx9e+Ac4EStM+cmhIIN9n0/oCIA==
X-Received: by 2002:a17:902:d352:: with SMTP id l18mr33405732plk.68.1593098236608;
        Thu, 25 Jun 2020 08:17:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id x29sm5953573pfj.190.2020.06.25.08.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 08:17:14 -0700 (PDT)
Date:   Thu, 25 Jun 2020 08:17:13 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/17] arm64: dts: sc7180: Add OPP table for all qup
 devices
Message-ID: <20200625151713.GF39073@google.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-5-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588080785-6812-5-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On Tue, Apr 28, 2020 at 07:02:52PM +0530, Rajendra Nayak wrote:
> qup has a requirement to vote on the performance state of the CX domain
> in sc7180 devices. Add OPP tables for these and also add power-domains
> property for all qup instances.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 998f101..efba600 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -417,6 +417,25 @@
>  			status = "disabled";
>  		};
>  
> +		qup_opp_table: qup-opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-75000000 {
> +				opp-hz = /bits/ 64 <75000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-100000000 {
> +				opp-hz = /bits/ 64 <100000000>;
> +				required-opps = <&rpmhpd_opp_svs>;
> +			};
> +
> +			opp-128000000 {
> +				opp-hz = /bits/ 64 <128000000>;
> +				required-opps = <&rpmhpd_opp_nom>;
> +			};
> +		};
> +
>  		qupv3_id_0: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0 0x008c0000 0 0x6000>;


no entries for i2c0?

> @@ -452,6 +471,8 @@
>  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -463,6 +484,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart0_default>;
>  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -476,6 +499,8 @@
>  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -489,6 +514,8 @@
>  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -500,6 +527,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart1_default>;
>  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -513,6 +542,8 @@
>  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -524,6 +555,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart2_default>;
>  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -537,6 +570,8 @@
>  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -550,6 +585,8 @@
>  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -561,6 +598,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart3_default>;
>  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -574,6 +613,8 @@
>  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -585,6 +626,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart4_default>;
>  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -598,6 +641,8 @@
>  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -611,6 +656,8 @@
>  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -622,6 +669,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart5_default>;
>  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  		};

no entries for i2c6?

> @@ -661,6 +710,8 @@
>  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -672,6 +723,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart6_default>;
>  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -685,6 +738,8 @@
>  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -696,6 +751,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart7_default>;
>  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -709,6 +766,8 @@
>  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -722,6 +781,8 @@
>  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -733,6 +794,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart8_default>;
>  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -746,6 +809,8 @@
>  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -757,6 +822,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart9_default>;
>  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -770,6 +837,8 @@
>  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -783,6 +852,8 @@
>  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -794,6 +865,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart10_default>;
>  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -807,6 +880,8 @@
>  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -820,6 +895,8 @@
>  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  
> @@ -831,6 +908,8 @@
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart11_default>;
>  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
>  				status = "disabled";
>  			};
>  		}
