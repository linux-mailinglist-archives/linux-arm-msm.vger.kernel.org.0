Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2E91FEE41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 11:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgFRJC0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 05:02:26 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221]:15572 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728588AbgFRJCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 05:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592470936;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=1wfLoFw1H/5l6k5HuZySiOqzR5RhC6ugiPkc6U/riKI=;
        b=aI/qL/vZh+pmcNQJvcaqCWjM0iNlNn/+SkuKEFd4O7WCscM6Wvz7jEVLvspQhkY8W8
        Z3tj0XaumiP8qwESRl5DwZnTs17yZrxNvFqAbywWiw50BLawcMBYgb4o0FgSolukjCaG
        0ldpBt98e+tUWwKX68OPUYWwLAn+Rggw6S7tGeXx8gw9331cwTWjMy45H5YWsPwpcv5k
        h4jQYN86V1Xl4thPP2nLBAKlWQLRMiX0YxGoCnVFTx3tebKZtKJHJtRd7flmDstP5YhZ
        2WbPUea1JDAU/VXMmPS+7wwyxq6uhYVRbgXBgwWAhQ7DB+wCKjgpnmO+L+wAYcHKbvmB
        TUKQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IcjDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id 6005e9w5I92GgLn
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 18 Jun 2020 11:02:16 +0200 (CEST)
Date:   Thu, 18 Jun 2020 11:02:10 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: msm8916: Add interconnect provider DT nodes
Message-ID: <20200618090210.GA48113@gerhold.net>
References: <20200617134515.25229-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617134515.25229-1-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Georgi,

On Wed, Jun 17, 2020 at 04:45:15PM +0300, Georgi Djakov wrote:
> Add nodes for the network-on-chip interconnect buses present on
> MSM8916-based platforms.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Thanks for resending this patch!

I tested this recently: it seems to probe fine and request the related
clocks; without interconnect consumers nothing is different otherwise
(as expected). FWIW:

Tested-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 32bd140ac9fd..6c57896d9836 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/arm/coresight-cti-dt.h>
> +#include <dt-bindings/interconnect/qcom,msm8916.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8916.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8916.h>
> @@ -406,11 +407,38 @@ soc: soc {
>  		ranges = <0 0 0 0xffffffff>;
>  		compatible = "simple-bus";
>  
> +		bimc: interconnect@400000 {
> +			compatible = "qcom,msm8916-bimc";
> +			reg = <0x00400000 0x62000>;
> +			#interconnect-cells = <1>;
> +			clock-names = "bus", "bus_a";
> +			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> +				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
> +		};
> +
>  		restart@4ab000 {
>  			compatible = "qcom,pshold";
>  			reg = <0x4ab000 0x4>;
>  		};
>  
> +		pcnoc: interconnect@500000 {
> +			compatible = "qcom,msm8916-pcnoc";
> +			reg = <0x00500000 0x11000>;
> +			#interconnect-cells = <1>;
> +			clock-names = "bus", "bus_a";
> +			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
> +				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
> +		};
> +
> +		snoc: interconnect@580000 {
> +			compatible = "qcom,msm8916-snoc";
> +			reg = <0x00580000 0x14000>;
> +			#interconnect-cells = <1>;
> +			clock-names = "bus", "bus_a";
> +			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> +				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
> +		};
> +
>  		msmgpio: pinctrl@1000000 {
>  			compatible = "qcom,msm8916-pinctrl";
>  			reg = <0x1000000 0x300000>;
