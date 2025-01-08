Return-Path: <linux-arm-msm+bounces-44289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46690A05176
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7ED3A485C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA061199FAB;
	Wed,  8 Jan 2025 03:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHNKqeAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64D199E88;
	Wed,  8 Jan 2025 03:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305917; cv=none; b=SNrwyO5qBgCnBllok/jF0NB70gJir9ArhaiMDLQT9puOunZ8b8JFxVwdSseF+npbVDrT69gxdQs+NAFb5mVe852S/7pR0IxEZobaOPGZhkWEE2U3/kTMd5dMN8mbKM+4Em4oO3z2Bwu9pGRnx+GO5ywsKxkr4A3gweOXtlfybFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305917; c=relaxed/simple;
	bh=/A64Znv9LqgKovJ1M1aJ9hSKh7/aCBRONyqePVJLZL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulDUxgj1MxQKpLWhqik/CtOS9JdpW+KHMFDZ0oy9MayDkEAarxuW6JjNkyW0wma7L9Qt/GiiLsYp+7lBTfYcVvxJLCrWVFty0yGQdK+U2nhWG8GbVzvtnpKGNyBALuso6IenC6X8TPB+qn7tWNj61tRZ5EBgxSqYmIDc9sT/lag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHNKqeAZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862CBC4CED6;
	Wed,  8 Jan 2025 03:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736305917;
	bh=/A64Znv9LqgKovJ1M1aJ9hSKh7/aCBRONyqePVJLZL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHNKqeAZV9mHCjMf07lBSdX0VtFPDsFKC6tfL/R1PKsa3BjnfGD/RKP1pwPZrGiaU
	 f4ECNm0C7Frh8YU1qGNT3XxQp1Wlj7x2KUrcFlpXuHCdqMha3FPec9y/xbS7/J5/7D
	 npb/XHKfcUDAOMYFaY1EuKHMw+X0vobB/WPdUlwAbW1wcicBTcopquEJg3qkBRpWJV
	 0qL/PziimzsTRSZOQQRcChXG7T4QxhaMRhVZzj3V6U3xkmyHhr9JpX28VocwY5mCGd
	 AeNB/Hx2TXH5cWb8oPd3wrgw7OzSwGxLDu87J1KIyza2/I6dzSO/ocUQDxhTVjNMIV
	 e17CfBd8dD36Q==
Date: Tue, 7 Jan 2025 21:11:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: setup cpu thermal with
 idle on high temperatures
Message-ID: <2xp2xz4w7drpnql5khevz4wenlmiu3omwcilfisb3vvq2jlnwg@tcmjb475kghk>
References: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
 <20250103-topic-sm8650-thermal-cpu-idle-v1-1-faa1f011ecd9@linaro.org>
 <qszkxmtrqr62wgd3qx7uctu22w4qrkietasvffinzwmzt7ccum@r26dikuqp7a4>
 <11ca788f-67e6-4e5c-9ace-083b730bc9ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11ca788f-67e6-4e5c-9ace-083b730bc9ce@linaro.org>

On Tue, Jan 07, 2025 at 09:13:18AM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 07/01/2025 00:39, Bjorn Andersson wrote:
> > On Fri, Jan 03, 2025 at 03:38:26PM +0100, Neil Armstrong wrote:
> > > On the SM8650, the dynamic clock and voltage scaling (DCVS) is done in an
> > > hardware controlled loop using the LMH and EPSS blocks with constraints and
> > > OPPs programmed in the board firmware.
> > > 
> > > Since the Hardware does a better job at maintaining the CPUs temperature
> > > in an acceptable range by taking in account more parameters like the die
> > > characteristics or other factory fused values, it makes no sense to try
> > > and reproduce a similar set of constraints with the Linux cpufreq thermal
> > > core.
> > > 
> > > In addition, the tsens IP is responsible for monitoring the temperature
> > > across the SoC and the current settings will heavily trigger the tsens
> > > UP/LOW interrupts if the CPU temperatures reaches the hardware thermal
> > > constraints which are currently defined in the DT. And since the CPUs
> > > are not hooked in the thermal trip points, the potential interrupts and
> > > calculations are a waste of system resources.
> > > 
> > > Instead, set higher temperatures in the CPU trip points, and hook some CPU
> > > idle injector with a 100% duty cycle at the highest trip point in the case
> > > the hardware DCVS cannot handle the temperature surge, and try our best to
> > > avoid reaching the critical temperature trip point which should trigger an
> > > inevitable thermal shutdown.
> > > 
> > 
> > Are you able to hit these higher temperatures? Do you have some test
> > case where the idle-injection shows to be successful in blocking us from
> > reaching the critical temp?
> 
> No, I've been able to test idle-injection and observed a noticeable effect
> but I had to set lower trip, do you know how I can easily "block" LMH/EPSS from
> scaling down and let the temp go higher ?
> 

I don't know how to override that configuration.

> > 
> > E.g. in X13s (SC8280XP) we opted for relying on LMH/EPSS and define only
> > the critical trip for when the hardware fails us.
> 
> It's the goal here aswell
> 

How about simplifying the patch by removing the idle-injection step and
just rely on LMH/EPSS and the "critical" trip (at least until someone
can prove that there's value in the extra mitigation)?

Regards,
Bjorn

> > 
> > 
> > I have no concerns at all about "removing" the 90C trip point, that
> > makes total sense to me - let the hardware keep the cores as close to
> > max as possible, and then use some slower sensor for keeping the system
> > temperature in check (such as the x13s skin sensor).
> > 
> > 
> > PS. The described behavior should apply to anything SDM845 and newer, so
> > I'd like to see this set/document precedence for other platforms.
> > 
> > Regards,
> > Bjorn
> > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8650.dtsi | 274 +++++++++++++++++++++++++++--------
> > >   1 file changed, 214 insertions(+), 60 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > > index 25e47505adcb790d09f1d2726386438487255824..448374a32e07151e35727d92fab77356769aea8a 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > > @@ -99,6 +99,13 @@ l3_0: l3-cache {
> > >   					cache-unified;
> > >   				};
> > >   			};
> > > +
> > > +			cpu0_idle: thermal-idle {
> > > +				#cooling-cells = <2>;
> > > +				duration-us = <800000>;
> > > +				exit-latency-us = <10000>;
> > > +			};
> > > +
> > >   		};
> > >   		cpu1: cpu@100 {
> > > @@ -119,6 +126,12 @@ cpu1: cpu@100 {
> > >   			qcom,freq-domain = <&cpufreq_hw 0>;
> > >   			#cooling-cells = <2>;
> > > +
> > > +			cpu1_idle: thermal-idle {
> > > +				#cooling-cells = <2>;
> > > +				duration-us = <800000>;
> > > +				exit-latency-us = <10000>;
> > > +			};
> > >   		};
> > >   		cpu2: cpu@200 {
> > > @@ -146,6 +159,12 @@ l2_200: l2-cache {
> > >   				cache-unified;
> > >   				next-level-cache = <&l3_0>;
> > >   			};
> > > +
> > > +			cpu2_idle: thermal-idle {
> > > +				#cooling-cells = <2>;
> > > +				duration-us = <800000>;
> > > +				exit-latency-us = <10000>;
> > > +			};
> > >   		};
> > >   		cpu3: cpu@300 {
> > > @@ -166,6 +185,12 @@ cpu3: cpu@300 {
> > >   			qcom,freq-domain = <&cpufreq_hw 3>;
> > >   			#cooling-cells = <2>;
> > > +
> > > +			cpu3_idle: thermal-idle {
> > > +				#cooling-cells = <2>;
> > > +				duration-us = <800000>;
> > > +				exit-latency-us = <10000>;
> > > +			};
> > >   		};
> > >   		cpu4: cpu@400 {
> > > @@ -193,6 +218,12 @@ l2_400: l2-cache {
> > >   				cache-unified;
> > >   				next-level-cache = <&l3_0>;
> > >   			};
> > > +
> > > +			cpu4_idle: thermal-idle {
> > > +				#cooling-cells = <2>;
> > > +				duration-us = <800000>;
> > > +				exit-latency-us = <10000>;
> > > +			};
> > >   		};
> > >   		cpu5: cpu@500 {
> > > @@ -220,6 +251,12 @@ l2_500: l2-cache {
> > >   				cache-unified;
> > >   				next-level-cache = <&l3_0>;
> > >   			};
> > > +
> > > +			cpu5_idle: thermal-idle {
> > > +				#cooling-cells = <2>;
> > > +				duration-us = <800000>;
> > > +				exit-latency-us = <10000>;
> > > +			};
> > >   		};
> > >   		cpu6: cpu@600 {
> > > @@ -247,6 +284,12 @@ l2_600: l2-cache {
> > >   				cache-unified;
> > >   				next-level-cache = <&l3_0>;
> > >   			};
> > > +
> > > +			cpu6_idle: thermal-idle {
> > > +				#cooling-cells = <2>;
> > > +				duration-us = <800000>;
> > > +				exit-latency-us = <10000>;
> > > +			};
> > >   		};
> > >   		cpu7: cpu@700 {
> > > @@ -274,6 +317,12 @@ l2_700: l2-cache {
> > >   				cache-unified;
> > >   				next-level-cache = <&l3_0>;
> > >   			};
> > > +
> > > +			cpu7_idle: thermal-idle {
> > > +				#cooling-cells = <2>;
> > > +				duration-us = <800000>;
> > > +				exit-latency-us = <10000>;
> > > +			};
> > >   		};
> > >   		cpu-map {
> > > @@ -5752,23 +5801,30 @@ cpu2-top-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu2_top_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu2-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu2_top_alert1>;
> > > +					cooling-device = <&cpu2_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu2-bottom-thermal {
> > > @@ -5776,23 +5832,30 @@ cpu2-bottom-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu2_bottom_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu2-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu2_bottom_alert1>;
> > > +					cooling-device = <&cpu2_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu3-top-thermal {
> > > @@ -5800,23 +5863,30 @@ cpu3-top-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu3_top_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu3-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu3_top_alert1>;
> > > +					cooling-device = <&cpu3_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu3-bottom-thermal {
> > > @@ -5824,23 +5894,30 @@ cpu3-bottom-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu3_bottom_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu3-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu3_bottom_alert1>;
> > > +					cooling-device = <&cpu3_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu4-top-thermal {
> > > @@ -5848,23 +5925,30 @@ cpu4-top-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu4_top_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu4-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu4_top_alert1>;
> > > +					cooling-device = <&cpu4_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu4-bottom-thermal {
> > > @@ -5872,23 +5956,30 @@ cpu4-bottom-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu4_bottom_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu4-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu4_bottom_alert1>;
> > > +					cooling-device = <&cpu4_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu5-top-thermal {
> > > @@ -5896,23 +5987,30 @@ cpu5-top-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu5_top_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu5-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu5_top_alert1>;
> > > +					cooling-device = <&cpu5_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu5-bottom-thermal {
> > > @@ -5920,23 +6018,30 @@ cpu5-bottom-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu5_bottom_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu5-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu5_bottom_alert1>;
> > > +					cooling-device = <&cpu5_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu6-top-thermal {
> > > @@ -5944,23 +6049,30 @@ cpu6-top-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu6_top_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu6-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu6_top_alert1>;
> > > +					cooling-device = <&cpu6_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu6-bottom-thermal {
> > > @@ -5968,23 +6080,30 @@ cpu6-bottom-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu6_bottom_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu6-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu6_bottom_alert1>;
> > > +					cooling-device = <&cpu6_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		aoss1-thermal {
> > > @@ -6010,23 +6129,30 @@ cpu7-top-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu7_top_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu7-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu7_top_alert1>;
> > > +					cooling-device = <&cpu7_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu7-middle-thermal {
> > > @@ -6034,23 +6160,30 @@ cpu7-middle-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu7_middle_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu7-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu7_middle_alert1>;
> > > +					cooling-device = <&cpu7_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu7-bottom-thermal {
> > > @@ -6058,23 +6191,30 @@ cpu7-bottom-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu7_bottom_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu7-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu7_bottom_alert1>;
> > > +					cooling-device = <&cpu7_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu0-thermal {
> > > @@ -6082,23 +6222,30 @@ cpu0-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu0_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu0-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu0_alert1>;
> > > +					cooling-device = <&cpu0_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		cpu1-thermal {
> > > @@ -6106,23 +6253,30 @@ cpu1-thermal {
> > >   			trips {
> > >   				trip-point0 {
> > > -					temperature = <90000>;
> > > +					temperature = <108000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > > -				trip-point1 {
> > > -					temperature = <95000>;
> > > +				cpu1_alert1: trip-point1 {
> > > +					temperature = <110000>;
> > >   					hysteresis = <2000>;
> > >   					type = "passive";
> > >   				};
> > >   				cpu1-critical {
> > > -					temperature = <110000>;
> > > +					temperature = <115000>;
> > >   					hysteresis = <1000>;
> > >   					type = "critical";
> > >   				};
> > >   			};
> > > +
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&cpu1_alert1>;
> > > +					cooling-device = <&cpu1_idle 100 100>;
> > > +				};
> > > +			};
> > >   		};
> > >   		nsphvx0-thermal {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> 

