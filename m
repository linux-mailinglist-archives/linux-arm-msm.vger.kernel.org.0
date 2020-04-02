Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE62C19BFF9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 13:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388048AbgDBLOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 07:14:43 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:36496 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388044AbgDBLOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 07:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585826080;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=CEIgcbrMATbcJmh42rtSAwmh78tcZIk5LrtBPYPYa10=;
        b=LetCLskAJrdlPtxa5urJlm4y8HdxhSy2l1v6Qr/gAypMeGdVNiXChKSp8PwSsszLFo
        sM6FPsiaR77Va5RuPCy2p/dpxMWx+1GJazexhwDauy5v6h4sbnTB5QAR1Bp+T2vQZZjd
        u0+zD3Moz98AJh446R7GwSzeaWJHgbk1l/cAQgWE/zhGrv8oGJXECY5p92Pd1i19Oji/
        KWfF/A2OxL1KkyGQU4K6BsuPk41xW/maMP10KgORpfZy+TIlS9LGjznMMga8HX5kSatO
        SIWgT2Zi/N7eSIP0XVHoZ0n4wcZM/MaAvhndD0YMiMdYapi6TTb4Kzz3J62aHJGFVn5U
        qFCQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/MbIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w32BEbi1i
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 2 Apr 2020 13:14:37 +0200 (CEST)
Date:   Thu, 2 Apr 2020 13:14:32 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org
Subject: Re: [PATCH v2] arch: arm64: dts: msm8916: Add missing cpu opps
Message-ID: <20200402111432.GA95396@gerhold.net>
References: <1585821635-28324-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585821635-28324-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 02, 2020 at 12:00:35PM +0200, Loic Poulain wrote:
> The highest cpu frequency opps have been dropped because CPR is not
> supported. However, we can simply specify operating voltage so that
> they match the max corner voltages for each freq. With that, we can
> support up to 1.2Ghz. Ideally, msm8916 CPR should be implemented to
> fine tune operating voltages and optimize power consumption.
> 
> The SPMI interface is directly used for AP regulator control since
> it offers a minimal transition latency (maximum transition latency
> with spmi is 250us, with rpm is 970us as reported by cpufreq-info).
> 
> This patch:
> - Adds missing opps and corresponding target voltages to msm8916.dtsi.
> - Adds pm8916 spmi regulator node to pm8916.dtsi.
> 
> Tested with a dragonboard-410c.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: - move cpu-supply to msm8916 since pm8916 s2 is tighly coupled
>      to AP core (cf pm8916 specification) + other pm8916 supplies
>      are already defined in msm8916.

Thanks for making these changes!

I will try to test this on my devices later today,
and will ask some more people to test it on theirs.

What is a good way to test that it works correctly?
If the device manages to reach the higher frequencies and still works
correctly it's fine?

>      - s2 min/max are specified in pm8916 spec

Regarding this I have a small concern below.

>      - Removed 1.36GHz op since freq seems capped to 1.21 anyway
> 
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 25 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pm8916.dtsi  | 13 +++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 9f31064..7407157 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -103,6 +103,7 @@
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
>  			clocks = <&apcs>;
> +			cpu-supply = <&pm8916_spmi_s2>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
>  			power-domains = <&CPU_PD0>;
> @@ -116,6 +117,7 @@
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
>  			clocks = <&apcs>;
> +			cpu-supply = <&pm8916_spmi_s2>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
>  			power-domains = <&CPU_PD1>;
> @@ -129,6 +131,7 @@
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
>  			clocks = <&apcs>;
> +			cpu-supply = <&pm8916_spmi_s2>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
>  			power-domains = <&CPU_PD2>;
> @@ -142,6 +145,7 @@
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
>  			clocks = <&apcs>;
> +			cpu-supply = <&pm8916_spmi_s2>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
>  			power-domains = <&CPU_PD3>;
> @@ -342,15 +346,35 @@
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
>  		};
>  	};
>  
> @@ -1605,6 +1629,7 @@
>  					compatible = "qcom,rpm-pm8916-regulators";
>  
>  					pm8916_s1: s1 {};
> +					/* s2 is directly controlled via spmi */
>  					pm8916_s3: s3 {};
>  					pm8916_s4: s4 {};
>  
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 0bcdf04..73d3b28 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -157,5 +157,18 @@
>  			vdd-micbias-supply = <&pm8916_l13>;
>  			#sound-dai-cells = <1>;
>  		};
> +
> +		spmi_regulators: spmi_regulators  {
> +			compatible = "qcom,pm8916-regulators";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pm8916_spmi_s2: s2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1562000>;

This might be just me but I'm usually cautious when it comes to setting
up the regulator constraints.

One way is to set the regulator constraints based on the capabilities of
the regulator itself (which is what you did here I think)?

The other way is to only allow voltages that actually make sense;
to ensure that setting incorrect voltages (for whatever reason) will
fail. (I actually know someone who managed to break a board by setting
some regulator voltages incorrectly...)

We don't actually set anything < 1050000 or > 1350000.
And if I'm reading the datasheet correctly, the CPU cores are not even
specified to operate correctly at > 1.42V.

I would personally prefer to keep the min/max voltages from your
previous patch set, i.e.

	regulator-min-microvolt = <1050000>;
	regulator-max-microvolt = <1350000>;

In case a higher/lower voltage is needed it could still be changed later.

But maybe that's just me being overly cautious?

Thanks,
Stephan

> +			};
> +			/* other regulators can be controlled via rpm */
> +		};
>  	};
>  };
> -- 
> 2.7.4
> 
