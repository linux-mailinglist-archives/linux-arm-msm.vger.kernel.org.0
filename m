Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C2D21A26D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 16:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgGIOrw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 10:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgGIOrv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 10:47:51 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBBCC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 07:47:51 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p3so1082665pgh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9ro8BWZ6Nt1mU3LMw0YQWvIfUyjJ2BroQgSItIneQ5Q=;
        b=r6Newwhhh4id3vyMleK/DDOTJ5BmSCDsvpopEE2wYlyQO9NJK/TuvaAh4BmqG7uYUw
         5mIauWSwlKFsSol5wFSU6pgJv/tjAg62Y3toDsZ8fL/X9SAYpg87Rb6ttxNHEe8xiXyQ
         mTi4rGoEQEDKoyARkto5x8bvekNfCkPLSH8o3t4tjJWeIjjOGwayEAPPjr2YDXFhKTu7
         ysXpEdAAmLIqsDSPVzDE1zkqQdBVPCPCm7IOc5O2VMmkD2R4srsL2+WLVwMB0y5T4MGw
         Ead/2CISYR/C9tFCxxiW9Z03MmzOM6vIGa8ye/+1R3BFm9V2HkHPPukBofmQDyEmE5bV
         YXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9ro8BWZ6Nt1mU3LMw0YQWvIfUyjJ2BroQgSItIneQ5Q=;
        b=FDpqs0kkAAP6K31JdcSV7Coagx5M879Y6vTB87HJxG50/oC3d/7WLulgjYo35X52nH
         m0Dbh1hKHyCoFcpmoxyzfJKmNyCSMjhB6biNn+t2AYF8U60xP4wa0MFLyuVq/Ts0ObyW
         hhg9GjJNxORBjIfJGxX5dLUY3xtqnSBS/n5xt7QggCvCppcZZEPKwIOlcxrY/Hua26B8
         YKMHrt08EybtYfxT6YsNUkA81aO8P7KA2L65b7Vh0smTK78Btvpw0Ofc/MQDDAtrJ2JJ
         gbM7yiVJeRqaVGn4tL1M61Qm9seXTZdQ+ExmzJk0q2ONdVHPDPQ/O01q/UqgvyrkLT1Y
         KCJA==
X-Gm-Message-State: AOAM5319sk0Xmh5o+dNckaYDXMVJHHG+oL8g6p8Aeun59YQsaUN5KHpJ
        /CyCVq4mT5stbIdOW+V9Cr8pqQ==
X-Google-Smtp-Source: ABdhPJymAnrBf8Zxkz/lsMjbxHDbT9CpQ8lZNyy0Mhe4hGauWUspH9zwNPT31V/BWn4VdYarAhLaCQ==
X-Received: by 2002:a05:6a00:2292:: with SMTP id f18mr58309786pfe.192.1594306071120;
        Thu, 09 Jul 2020 07:47:51 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e20sm3122098pfl.212.2020.07.09.07.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 07:47:50 -0700 (PDT)
Date:   Thu, 9 Jul 2020 07:45:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, saravanak@google.com,
        dianders@chromium.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, robdclark@chromium.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845: Add cpu OPP tables
Message-ID: <20200709144534.GA1881320@builder.lan>
References: <20200702204643.25785-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702204643.25785-1-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Jul 13:46 PDT 2020, Sibi Sankar wrote:

> Add OPP tables required to scale DDR/L3 per freq-domain on SDM845 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

and applied.

Thanks,
Bjorn

> ---
> 
> v2:
>  * Drop interconnect tags
>  * Add all possible cpu opps from supported frequency list
> 
> v1: https://patchwork.kernel.org/patch/11527589/
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 285 +++++++++++++++++++++++++++
>  1 file changed, 285 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 8eb5a31346d28..9a7e27ede7186 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/clock/qcom,lpass-sdm845.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,videocc-sdm845.h>
> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sdm845.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
> @@ -198,6 +199,9 @@ &LITTLE_CPU_SLEEP_1
>  			capacity-dmips-mhz = <607>;
>  			dynamic-power-coefficient = <100>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gladiator_noc MASTER_APPSS_PROC &mem_noc SLAVE_EBI1>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
> @@ -220,6 +224,9 @@ &LITTLE_CPU_SLEEP_1
>  			capacity-dmips-mhz = <607>;
>  			dynamic-power-coefficient = <100>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gladiator_noc MASTER_APPSS_PROC &mem_noc SLAVE_EBI1>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_100>;
>  			L2_100: l2-cache {
> @@ -239,6 +246,9 @@ &LITTLE_CPU_SLEEP_1
>  			capacity-dmips-mhz = <607>;
>  			dynamic-power-coefficient = <100>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gladiator_noc MASTER_APPSS_PROC &mem_noc SLAVE_EBI1>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_200>;
>  			L2_200: l2-cache {
> @@ -258,6 +268,9 @@ &LITTLE_CPU_SLEEP_1
>  			capacity-dmips-mhz = <607>;
>  			dynamic-power-coefficient = <100>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gladiator_noc MASTER_APPSS_PROC &mem_noc SLAVE_EBI1>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_300>;
>  			L2_300: l2-cache {
> @@ -277,6 +290,9 @@ &BIG_CPU_SLEEP_1
>  					   &CLUSTER_SLEEP_0>;
>  			dynamic-power-coefficient = <396>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> +			operating-points-v2 = <&cpu4_opp_table>;
> +			interconnects = <&gladiator_noc MASTER_APPSS_PROC &mem_noc SLAVE_EBI1>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_400>;
>  			L2_400: l2-cache {
> @@ -296,6 +312,9 @@ &BIG_CPU_SLEEP_1
>  					   &CLUSTER_SLEEP_0>;
>  			dynamic-power-coefficient = <396>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> +			operating-points-v2 = <&cpu4_opp_table>;
> +			interconnects = <&gladiator_noc MASTER_APPSS_PROC &mem_noc SLAVE_EBI1>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_500>;
>  			L2_500: l2-cache {
> @@ -315,6 +334,9 @@ &BIG_CPU_SLEEP_1
>  					   &CLUSTER_SLEEP_0>;
>  			dynamic-power-coefficient = <396>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> +			operating-points-v2 = <&cpu4_opp_table>;
> +			interconnects = <&gladiator_noc MASTER_APPSS_PROC &mem_noc SLAVE_EBI1>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_600>;
>  			L2_600: l2-cache {
> @@ -334,6 +356,9 @@ &BIG_CPU_SLEEP_1
>  					   &CLUSTER_SLEEP_0>;
>  			dynamic-power-coefficient = <396>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> +			operating-points-v2 = <&cpu4_opp_table>;
> +			interconnects = <&gladiator_noc MASTER_APPSS_PROC &mem_noc SLAVE_EBI1>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_700>;
>  			L2_700: l2-cache {
> @@ -433,6 +458,266 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
>  		};
>  	};
>  
> +	cpu0_opp_table: cpu0_opp_table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		cpu0_opp1: opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			opp-peak-kBps = <800000 4800000>;
> +		};
> +
> +		cpu0_opp2: opp-403200000 {
> +			opp-hz = /bits/ 64 <403200000>;
> +			opp-peak-kBps = <800000 4800000>;
> +		};
> +
> +		cpu0_opp3: opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			opp-peak-kBps = <800000 6451200>;
> +		};
> +
> +		cpu0_opp4: opp-576000000 {
> +			opp-hz = /bits/ 64 <576000000>;
> +			opp-peak-kBps = <800000 6451200>;
> +		};
> +
> +		cpu0_opp5: opp-652800000 {
> +			opp-hz = /bits/ 64 <652800000>;
> +			opp-peak-kBps = <800000 7680000>;
> +		};
> +
> +		cpu0_opp6: opp-748800000 {
> +			opp-hz = /bits/ 64 <748800000>;
> +			opp-peak-kBps = <1804000 9216000>;
> +		};
> +
> +		cpu0_opp7: opp-825600000 {
> +			opp-hz = /bits/ 64 <825600000>;
> +			opp-peak-kBps = <1804000 9216000>;
> +		};
> +
> +		cpu0_opp8: opp-902400000 {
> +			opp-hz = /bits/ 64 <902400000>;
> +			opp-peak-kBps = <1804000 10444800>;
> +		};
> +
> +		cpu0_opp9: opp-979200000 {
> +			opp-hz = /bits/ 64 <979200000>;
> +			opp-peak-kBps = <1804000 11980800>;
> +		};
> +
> +		cpu0_opp10: opp-1056000000 {
> +			opp-hz = /bits/ 64 <1056000000>;
> +			opp-peak-kBps = <1804000 11980800>;
> +		};
> +
> +		cpu0_opp11: opp-1132800000 {
> +			opp-hz = /bits/ 64 <1132800000>;
> +			opp-peak-kBps = <2188000 13516800>;
> +		};
> +
> +		cpu0_opp12: opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-peak-kBps = <2188000 15052800>;
> +		};
> +
> +		cpu0_opp13: opp-1324800000 {
> +			opp-hz = /bits/ 64 <1324800000>;
> +			opp-peak-kBps = <2188000 16588800>;
> +		};
> +
> +		cpu0_opp14: opp-1420800000 {
> +			opp-hz = /bits/ 64 <1420800000>;
> +			opp-peak-kBps = <3072000 18124800>;
> +		};
> +
> +		cpu0_opp15: opp-1516800000 {
> +			opp-hz = /bits/ 64 <1516800000>;
> +			opp-peak-kBps = <3072000 19353600>;
> +		};
> +
> +		cpu0_opp16: opp-1612800000 {
> +			opp-hz = /bits/ 64 <1612800000>;
> +			opp-peak-kBps = <4068000 19353600>;
> +		};
> +
> +		cpu0_opp17: opp-1689600000 {
> +			opp-hz = /bits/ 64 <1689600000>;
> +			opp-peak-kBps = <4068000 20889600>;
> +		};
> +
> +		cpu0_opp18: opp-1766400000 {
> +			opp-hz = /bits/ 64 <1766400000>;
> +			opp-peak-kBps = <4068000 22425600>;
> +		};
> +	};
> +
> +	cpu4_opp_table: cpu4_opp_table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		cpu4_opp1: opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			opp-peak-kBps = <800000 4800000>;
> +		};
> +
> +		cpu4_opp2: opp-403200000 {
> +			opp-hz = /bits/ 64 <403200000>;
> +			opp-peak-kBps = <800000 4800000>;
> +		};
> +
> +		cpu4_opp3: opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			opp-peak-kBps = <1804000 4800000>;
> +		};
> +
> +		cpu4_opp4: opp-576000000 {
> +			opp-hz = /bits/ 64 <576000000>;
> +			opp-peak-kBps = <1804000 4800000>;
> +		};
> +
> +		cpu4_opp5: opp-652800000 {
> +			opp-hz = /bits/ 64 <652800000>;
> +			opp-peak-kBps = <1804000 4800000>;
> +		};
> +
> +		cpu4_opp6: opp-748800000 {
> +			opp-hz = /bits/ 64 <748800000>;
> +			opp-peak-kBps = <1804000 4800000>;
> +		};
> +
> +		cpu4_opp7: opp-825600000 {
> +			opp-hz = /bits/ 64 <825600000>;
> +			opp-peak-kBps = <2188000 9216000>;
> +		};
> +
> +		cpu4_opp8: opp-902400000 {
> +			opp-hz = /bits/ 64 <902400000>;
> +			opp-peak-kBps = <2188000 9216000>;
> +		};
> +
> +		cpu4_opp9: opp-979200000 {
> +			opp-hz = /bits/ 64 <979200000>;
> +			opp-peak-kBps = <2188000 9216000>;
> +		};
> +
> +		cpu4_opp10: opp-1056000000 {
> +			opp-hz = /bits/ 64 <1056000000>;
> +			opp-peak-kBps = <3072000 9216000>;
> +		};
> +
> +		cpu4_opp11: opp-1132800000 {
> +			opp-hz = /bits/ 64 <1132800000>;
> +			opp-peak-kBps = <3072000 11980800>;
> +		};
> +
> +		cpu4_opp12: opp-1209600000 {
> +			opp-hz = /bits/ 64 <1209600000>;
> +			opp-peak-kBps = <4068000 11980800>;
> +		};
> +
> +		cpu4_opp13: opp-1286400000 {
> +			opp-hz = /bits/ 64 <1286400000>;
> +			opp-peak-kBps = <4068000 11980800>;
> +		};
> +
> +		cpu4_opp14: opp-1363200000 {
> +			opp-hz = /bits/ 64 <1363200000>;
> +			opp-peak-kBps = <4068000 15052800>;
> +		};
> +
> +		cpu4_opp15: opp-1459200000 {
> +			opp-hz = /bits/ 64 <1459200000>;
> +			opp-peak-kBps = <4068000 15052800>;
> +		};
> +
> +		cpu4_opp16: opp-1536000000 {
> +			opp-hz = /bits/ 64 <1536000000>;
> +			opp-peak-kBps = <5412000 15052800>;
> +		};
> +
> +		cpu4_opp17: opp-1612800000 {
> +			opp-hz = /bits/ 64 <1612800000>;
> +			opp-peak-kBps = <5412000 15052800>;
> +		};
> +
> +		cpu4_opp18: opp-1689600000 {
> +			opp-hz = /bits/ 64 <1689600000>;
> +			opp-peak-kBps = <5412000 19353600>;
> +		};
> +
> +		cpu4_opp19: opp-1766400000 {
> +			opp-hz = /bits/ 64 <1766400000>;
> +			opp-peak-kBps = <6220000 19353600>;
> +		};
> +
> +		cpu4_opp20: opp-1843200000 {
> +			opp-hz = /bits/ 64 <1843200000>;
> +			opp-peak-kBps = <6220000 19353600>;
> +		};
> +
> +		cpu4_opp21: opp-1920000000 {
> +			opp-hz = /bits/ 64 <1920000000>;
> +			opp-peak-kBps = <7216000 19353600>;
> +		};
> +
> +		cpu4_opp22: opp-1996800000 {
> +			opp-hz = /bits/ 64 <1996800000>;
> +			opp-peak-kBps = <7216000 20889600>;
> +		};
> +
> +		cpu4_opp23: opp-2092800000 {
> +			opp-hz = /bits/ 64 <2092800000>;
> +			opp-peak-kBps = <7216000 20889600>;
> +		};
> +
> +		cpu4_opp24: opp-2169600000 {
> +			opp-hz = /bits/ 64 <2169600000>;
> +			opp-peak-kBps = <7216000 20889600>;
> +		};
> +
> +		cpu4_opp25: opp-2246400000 {
> +			opp-hz = /bits/ 64 <2246400000>;
> +			opp-peak-kBps = <7216000 20889600>;
> +		};
> +
> +		cpu4_opp26: opp-2323200000 {
> +			opp-hz = /bits/ 64 <2323200000>;
> +			opp-peak-kBps = <7216000 20889600>;
> +		};
> +
> +		cpu4_opp27: opp-2400000000 {
> +			opp-hz = /bits/ 64 <2400000000>;
> +			opp-peak-kBps = <7216000 22425600>;
> +		};
> +
> +		cpu4_opp28: opp-2476800000 {
> +			opp-hz = /bits/ 64 <2476800000>;
> +			opp-peak-kBps = <7216000 22425600>;
> +		};
> +
> +		cpu4_opp29: opp-2553600000 {
> +			opp-hz = /bits/ 64 <2553600000>;
> +			opp-peak-kBps = <7216000 22425600>;
> +		};
> +
> +		cpu4_opp30: opp-2649600000 {
> +			opp-hz = /bits/ 64 <2649600000>;
> +			opp-peak-kBps = <7216000 22425600>;
> +		};
> +
> +		cpu4_opp31: opp-2745600000 {
> +			opp-hz = /bits/ 64 <2745600000>;
> +			opp-peak-kBps = <7216000 25497600>;
> +		};
> +
> +		cpu4_opp32: opp-2803200000 {
> +			opp-hz = /bits/ 64 <2803200000>;
> +			opp-peak-kBps = <7216000 25497600>;
> +		};
> +	};
> +
>  	pmu {
>  		compatible = "arm,armv8-pmuv3";
>  		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
