Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085FB19BD81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 10:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387682AbgDBIUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 04:20:02 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:36293 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387574AbgDBIUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 04:20:02 -0400
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Apr 2020 04:20:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585815600;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=YZJAJWtt6LByNZdp7SVBcx+zkchwE8FdhKYPLd8nxAs=;
        b=mBMOG28hRctVreLxaq7uQxPXudIiqphiaBGAW+AWec166/2jhnA3Vsdeumzp18UxbI
        LG3spLDtdF5V+IESSCVU/og4RJ3MFi58Cfgvpx/L3gr+p1diy92W5JMuhx5tP249OuxO
        IUpj0nWWcOkFAzZAYTdtoH9g3GCxLIYaKg4lj1m1qcSOvbsL72jwCY88bBrlBCaNL5PZ
        5LfMxSdE1CZpesK4MBJFOJn+dwLARKvU75xx/QLVCg0Kzaj6qdUF7E6M4oeYtvxvF3AW
        ja4lIp6E1oUaDgBD/N3fsqZM+xco+92R/I5H9OrTk5BeBilzy7ynyAHNkdgIHySw+vjR
        tgyw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDd/HYtbf6Kg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w328Dsgom
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 2 Apr 2020 10:13:54 +0200 (CEST)
Date:   Thu, 2 Apr 2020 10:13:49 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org,
        Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200402081349.GA932@gerhold.net>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 01, 2020 at 07:50:59PM +0200, Loic Poulain wrote:
> The highest cpu frequency opps have been dropped because CPR is not
> supported. However, we can simply specify operating voltage so that
> they match the max corner voltages for each freq. With that, we can
> support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> fine tune operating voltages and optimize power consumption.

Thanks for the patch! I was wondering how to enable the higher CPU
frequencies for a while now...

I was actually quite excited to see CPR being mainlined for QCS404.
If we are trying to add such a workaround (rather than CPR) for MSM8916
now, does that mean it's unlikely to see CPR working for MSM8916
anytime soon?

AFAICT, there is a WIP branch from Niklas Cassel here:
https://git.linaro.org/people/nicolas.dechesne/niklas.cassel/kernel.git/log/?h=cpr-msm8916-mainline
but it hasn't been updated for a while. (Not sure if it was working
already...)

Can someone explain what is missing to make CPR work for MSM8916?

One other minor comment/question below.

> 
> This patch:
> - Adds missing opps and corresponding target voltages to msm8916.dtsi.
> - Adds cpu-supply to apq8016-sbc.dtsi (board level info).
> - Adds pm8916 spmi regulator node to pm8916.dtsi.
> 
> Tested with a dragonboard-410c.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pm8916.dtsi      |  6 ++++++
>  3 files changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 037e26b..f1c1216 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -560,6 +560,30 @@
>  	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
>  };
>  
> +&spm_regulators {
> +	vdd_cpu: s2 {
> +		regulator-always-on;
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1350000>;
> +	};
> +};
> +
> +&CPU0 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU1 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU2 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU3 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +

I'm a bit confused about the separation here. The cpu-supply is defined
in the board-specific device tree, yet the voltages are set in the
common device tree below.

Is it even possible that the CPU is supplied by something other than S2
and if yes, how likely is this?

I'm asking because I have two other MSM8916 devices in mainline
(and a few more pending upstreaming), and it seems like I would need to
duplicate this into each of them.

Thanks,
Stephan

>  &smd_rpm_regulators {
>  	vdd_l1_l2_l3-supply = <&pm8916_s3>;
>  	vdd_l5-supply = <&pm8916_s3>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 9f31064..9805af0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -342,15 +342,39 @@
>  
>  		opp-200000000 {
>  			opp-hz = /bits/ 64 <200000000>;
> +			opp-microvolt = <1050000>;
>  		};
>  		opp-400000000 {
>  			opp-hz = /bits/ 64 <400000000>;
> +			opp-microvolt = <1050000>;
> +		};
> +		opp-533330000 {
> +			opp-hz = /bits/ 64 <533330000>;
> +			opp-microvolt = <1150000>;
>  		};
>  		opp-800000000 {
>  			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <1150000>;
>  		};
>  		opp-998400000 {
>  			opp-hz = /bits/ 64 <998400000>;
> +			opp-microvolt = <1350000>;
> +		};
> +		opp-1094400000 {
> +			opp-hz = /bits/ 64 <1094400000>;
> +			opp-microvolt = <1350000>;
> +		};
> +		opp-1152000000 {
> +			opp-hz = /bits/ 64 <1152000000>;
> +			opp-microvolt = <1350000>;
> +		};
> +		opp-1209600000 {
> +			opp-hz = /bits/ 64 <1209600000>;
> +			opp-microvolt = <1350000>;
> +		};
> +		opp-1363200000 {
> +			opp-hz = /bits/ 64 <1363200000>;
> +			opp-microvolt = <1350000>;
>  		};
>  	};
>  
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 0bcdf04..c9b9c4f 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -157,5 +157,11 @@
>  			vdd-micbias-supply = <&pm8916_l13>;
>  			#sound-dai-cells = <1>;
>  		};
> +
> +		spm_regulators: spm_regulators  {
> +			compatible = "qcom,pm8916-regulators";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
>  	};
>  };
> -- 
> 2.7.4
> 
