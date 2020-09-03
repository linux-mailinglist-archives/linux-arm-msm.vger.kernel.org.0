Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0296525C619
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 18:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbgICQFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 12:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728628AbgICQF2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 12:05:28 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989BCC061246
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 09:05:28 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l191so2502872pgd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eTxpo239Q1Z2aA7OYZkm3VeC3SFlCkkhmTmtTuPhGHo=;
        b=NUE5PZU7yscakFzG0TZ2qxLJ6LJfw/2uqnsDa01uCn81c4eEtUBdvfX9mc1hzSYJ2h
         nhmM37WGhEihACz/paHly0nXkwp+xWGgCyKLvyA7xLkNfEyHQBs0RXR4y8Q1ZLXoPYe4
         O5fAmk1a25EXiTBrgZEemx/GFA777TfQXStOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eTxpo239Q1Z2aA7OYZkm3VeC3SFlCkkhmTmtTuPhGHo=;
        b=NB/NETKg7bfDVVtqbhFmZe9h8YiwONTHimxpjSqsUEnsHIcQLlrLQJ0mOvx0w64xPE
         GUo+azX9QuqzBWg2a1RHlkuLrAQ+F+OudK8h90LLFejaRPgC+nbjlAU9s2qmTD7HaAvK
         zKOxqunXMAUeazuiIjDydFmXxYNqEQ2zfFChPmPnNE+M2Im5LXUoGwcTVxfduPcBWx0J
         Mzs4X23oXmuW98xWp4dLAiLu51IDh/k/QepKUzc50wDRe5U/1oYTNAlFkVzRUvE2xTez
         YsopsIEEIX8PFoLdUZGWW9Y3lkq+kTtVbrVum7DLcXt+jLTPDUySDTBgIgN0zBl4jGiF
         +d7w==
X-Gm-Message-State: AOAM533Ycz8Bc4gqceFLnrpqjTrWy8Pj4DbvO6zxh97QvFjjrwKcd+/9
        toHG0PBGz06stg16AeitFK7RUQ==
X-Google-Smtp-Source: ABdhPJxksNg2GgSt6v8Socv4/6n5417vpVnRMthuonRDr9yqg+92q68fJ2Ln+eA0+q6Osst+j/DQ8A==
X-Received: by 2002:a17:902:aa89:: with SMTP id d9mr4697508plr.192.1599149127847;
        Thu, 03 Sep 2020 09:05:27 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a138sm3638241pfd.19.2020.09.03.09.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 09:05:27 -0700 (PDT)
Date:   Thu, 3 Sep 2020 09:05:24 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V4 1/4] arm64: dts: sc7180: Add wakeup support over UART
 RX
Message-ID: <20200903160524.GH3419728@google.com>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
 <1599145498-20707-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1599145498-20707-2-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 03, 2020 at 08:34:55PM +0530, satya priya wrote:
> Add the necessary pinctrl and interrupts to make UART wakeup capable.
> 
> If QUP function is selected in sleep state, UART RTS/RFR is pulled high
> during suspend and BT SoC not able to send wakeup bytes. So, configure
> GPIO mode in sleep state to keep it low during suspend.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Matthias's comment added wakeup support for all the UARTs
>    of SC7180.
> 
> Changes in V3:
>  - No change.
> 
> Changes in V4:
>  - As per Matthias's comment, added the reason for configuring GPIO
>    mode for sleep state in commit text.
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 98 ++++++++++++++++++++++++++++++------
>  1 file changed, 84 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..855b13e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -793,9 +793,11 @@
>  				reg = <0 0x00880000 0 0x4000>;
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>  				pinctrl-0 = <&qup_uart0_default>;
> -				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart0_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 37 IRQ_TYPE_EDGE_FALLING>;
>  				power-domains = <&rpmhpd SC7180_CX>;
>  				operating-points-v2 = <&qup_opp_table>;
>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> @@ -845,9 +847,11 @@
>  				reg = <0 0x00884000 0 0x4000>;
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>  				pinctrl-0 = <&qup_uart1_default>;
> -				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart1_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 3 IRQ_TYPE_EDGE_FALLING>;
>  				power-domains = <&rpmhpd SC7180_CX>;
>  				operating-points-v2 = <&qup_opp_table>;
>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> @@ -931,9 +935,11 @@
>  				reg = <0 0x0088c000 0 0x4000>;
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>  				pinctrl-0 = <&qup_uart3_default>;
> -				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart3_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
>  				power-domains = <&rpmhpd SC7180_CX>;
>  				operating-points-v2 = <&qup_opp_table>;
>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> @@ -1017,9 +1023,11 @@
>  				reg = <0 0x00894000 0 0x4000>;
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>  				pinctrl-0 = <&qup_uart5_default>;
> -				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart5_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 28 IRQ_TYPE_EDGE_FALLING>;
>  				power-domains = <&rpmhpd SC7180_CX>;
>  				operating-points-v2 = <&qup_opp_table>;
>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> @@ -1084,9 +1092,11 @@
>  				reg = <0 0x00a80000 0 0x4000>;
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>  				pinctrl-0 = <&qup_uart6_default>;
> -				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart6_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 62 IRQ_TYPE_EDGE_FALLING>;
>  				power-domains = <&rpmhpd SC7180_CX>;
>  				operating-points-v2 = <&qup_opp_table>;
>  				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
> @@ -1256,9 +1266,11 @@
>  				reg = <0 0x00a90000 0 0x4000>;
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>  				pinctrl-0 = <&qup_uart10_default>;
> -				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart10_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 89 IRQ_TYPE_EDGE_FALLING>;
>  				power-domains = <&rpmhpd SC7180_CX>;
>  				operating-points-v2 = <&qup_opp_table>;
>  				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
> @@ -1308,9 +1320,11 @@
>  				reg = <0 0x00a94000 0 0x4000>;
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>  				pinctrl-0 = <&qup_uart11_default>;
> -				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart11_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 56 IRQ_TYPE_EDGE_FALLING>;
>  				power-domains = <&rpmhpd SC7180_CX>;
>  				operating-points-v2 = <&qup_opp_table>;
>  				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
> @@ -1638,6 +1652,14 @@
>  				};
>  			};
>  
> +			qup_uart0_sleep: qup-uart0-sleep {
> +				pinmux {
> +					pins = "gpio34", "gpio35",
> +					       "gpio36", "gpio37";
> +					function = "gpio";
> +				};
> +			};
> +
>  			qup_uart1_default: qup-uart1-default {
>  				pinmux {
>  					pins = "gpio0", "gpio1",
> @@ -1646,6 +1668,14 @@
>  				};
>  			};
>  
> +			qup_uart1_sleep: qup-uart1-sleep {
> +				pinmux {
> +					pins = "gpio0", "gpio1",
> +					       "gpio2", "gpio3";
> +					function = "gpio";
> +				};
> +			};
> +
>  			qup_uart2_default: qup-uart2-default {
>  				pinmux {
>  					pins = "gpio15", "gpio16";
> @@ -1661,6 +1691,14 @@
>  				};
>  			};
>  
> +			qup_uart3_sleep: qup-uart3-sleep {
> +				pinmux {
> +					pins = "gpio38", "gpio39",
> +					       "gpio40", "gpio41";
> +					function = "gpio";
> +				};
> +			};
> +
>  			qup_uart4_default: qup-uart4-default {
>  				pinmux {
>  					pins = "gpio115", "gpio116";
> @@ -1676,6 +1714,14 @@
>  				};
>  			};
>  
> +			qup_uart5_sleep: qup-uart5-sleep {
> +				pinmux {
> +					pins = "gpio25", "gpio26",
> +					       "gpio27", "gpio28";
> +					function = "gpio";
> +				};
> +			};
> +
>  			qup_uart6_default: qup-uart6-default {
>  				pinmux {
>  					pins = "gpio59", "gpio60",
> @@ -1684,6 +1730,14 @@
>  				};
>  			};
>  
> +			qup_uart6_sleep: qup-uart6-sleep {
> +				pinmux {
> +					pins = "gpio59", "gpio60",
> +					       "gpio61", "gpio62";
> +					function = "gpio";
> +				};
> +			};
> +
>  			qup_uart7_default: qup-uart7-default {
>  				pinmux {
>  					pins = "gpio6", "gpio7";
> @@ -1713,6 +1767,14 @@
>  				};
>  			};
>  
> +			qup_uart10_sleep: qup-uart10-sleep {
> +				pinmux {
> +					pins = "gpio86", "gpio87",
> +					       "gpio88", "gpio89";
> +					function = "gpio";
> +				};
> +			};
> +
>  			qup_uart11_default: qup-uart11-default {
>  				pinmux {
>  					pins = "gpio53", "gpio54",
> @@ -1721,6 +1783,14 @@
>  				};
>  			};
>  
> +			qup_uart11_sleep: qup-uart11-sleep {
> +				pinmux {
> +					pins = "gpio53", "gpio54",
> +					       "gpio55", "gpio56";
> +					function = "gpio";
> +				};
> +			};
> +
>  			sdc1_on: sdc1-on {
>  				pinconf-clk {
>  					pins = "sdc1_clk";

It seems only the RTS pin actually requires a pinmux change. One could
argue that only the muxing of this pin should be changed in sleep mode.
But well, changing all pins to GPIO simplifies the config, so I guess
it's ok as long as there are no side effects.

I noticed you changed only the UARTs that have RTS/CTS signals. Do the
others not support wakeup? I understand that the pinmux change isn't
needed for these UARTs, since they have no RTS signal, however I'd expect
them to need the 'interrupts-extended' entry if they support wakeup.
