Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BFB3CE64A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jul 2021 18:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243965AbhGSQDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 12:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352230AbhGSQB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 12:01:27 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BA2C053395
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 08:51:51 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id u15so21311274oiw.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wBautdayPzjxkhQkXV1Tl8Zugd/Ahos1Qnuyju/h69c=;
        b=Bns8ZOHnaTzlrg/Zs/t/lb5q1qCPBTsFcWajNDpYjFGQQyTRWofX5MpX9c2D+ThE+U
         Wt4vbOOiTZveHvPcEYByYGXAX2Gc1e5g1aglv4xVpdpWDFiMtmj+rFKT+GFIvCXqKPEz
         KVygaWb4QB1X3RPK/YZjqZ/wiwxMlDNyLDml4L/aqNDoXxO5WpsJ4tPX7zq8Jk/EDHWJ
         mcnVhF1l/oUmxZfz/MEzKf0WV+ZeQx7x6JlbdphRVZ0sq3OU1DRcJ0HLUUickjQer4wN
         ueq0CrBdQjw/4rmg3+7WaNMa0M+dpZJgAvrZQKM5SCxVOWH75FCJkRruZoVVVuaWNyuO
         zxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wBautdayPzjxkhQkXV1Tl8Zugd/Ahos1Qnuyju/h69c=;
        b=KRNc31wdPG5O/TGiqa1p0uzWAM5w4Ak1XvQXCNw9Xb4IE8fSiJeCsDVlUaAGrUEBi5
         AICxV3ltMTfQzGpggMweq0h81e9J7s3io5zWdWCFsL346X5kLfcPFmhjUOeSeQmS6uYr
         wmp8lcyqAE6CXqV4WWR9/rhNtGfKBETDi20QKSD6uy5tE2WOREBHjsfNhHFLKiNwA2T1
         JmFDksJWiY0dMYGM+uhkCOgWhNH25WciBFTXDWoQQW5+u5eC4ZAX80NSbfa48l3AgoPX
         H3Ep6NXQOLFJfQEQY4tVGkdHe9LZXk8TwuPyZbYsjzrYFjPaeRoUEDxaQahclz6hY0iI
         iLCg==
X-Gm-Message-State: AOAM531pqt+vI/+RqW7RFYQQhlEcCIFeWneZR9BO032YaivnQaXVGKN7
        ZaJvOfrXRSz25Pw616JxnrtTNA==
X-Google-Smtp-Source: ABdhPJwh/cv/iQPiAuoNX2hk+psE6r95RLP+31RVooBg/LMR9U3ZtgG9+cKTmEDx1Dhi35BN4L67LA==
X-Received: by 2002:aca:aacd:: with SMTP id t196mr17565345oie.12.1626711392206;
        Mon, 19 Jul 2021 09:16:32 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm141552oti.5.2021.07.19.09.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 09:16:31 -0700 (PDT)
Date:   Mon, 19 Jul 2021 11:16:29 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: boot: dts: qcom: sm8150: Add CPU opp tables
Message-ID: <YPWlXRDsU59LZsVb@yoga>
References: <20210714182610.92972-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714182610.92972-1-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 14 Jul 13:26 CDT 2021, Thara Gopinath wrote:

> Add OPP tables to scale DDR and L3 with CPUs for SM8150 SoCs.
> This gives a significant performance boost for cpu-ddr loads.
> Below is the results for mbw benchmark with and without the opp tables.
> 
> /mbw 1500
> 		Without l3/ddr scaling		With l3 ddr/scaling
> MEMCPY(MiB/s)		3574				10448
> DUMB(MiB/s)		3500				11721
> MCBLOCK(MiB/s)		8976				23595
> 

Nice!


Took the liberty of dropping "boot: " from $subject before applying the
patch.

Thanks,
Bjorn

> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 315 +++++++++++++++++++++++++++
>  1 file changed, 315 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 51235a9521c2..298984423356 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/clock/qcom,gcc-sm8150.h>
>  #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> +#include <dt-bindings/interconnect/qcom,sm8150.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> @@ -51,6 +52,9 @@ CPU0: cpu@0 {
>  			dynamic-power-coefficient = <232>;
>  			next-level-cache = <&L2_0>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			power-domains = <&CPU_PD0>;
>  			power-domain-names = "psci";
>  			#cooling-cells = <2>;
> @@ -72,6 +76,9 @@ CPU1: cpu@100 {
>  			dynamic-power-coefficient = <232>;
>  			next-level-cache = <&L2_100>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			power-domains = <&CPU_PD1>;
>  			power-domain-names = "psci";
>  			#cooling-cells = <2>;
> @@ -91,6 +98,9 @@ CPU2: cpu@200 {
>  			dynamic-power-coefficient = <232>;
>  			next-level-cache = <&L2_200>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			power-domains = <&CPU_PD2>;
>  			power-domain-names = "psci";
>  			#cooling-cells = <2>;
> @@ -109,6 +119,9 @@ CPU3: cpu@300 {
>  			dynamic-power-coefficient = <232>;
>  			next-level-cache = <&L2_300>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			power-domains = <&CPU_PD3>;
>  			power-domain-names = "psci";
>  			#cooling-cells = <2>;
> @@ -127,6 +140,9 @@ CPU4: cpu@400 {
>  			dynamic-power-coefficient = <369>;
>  			next-level-cache = <&L2_400>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> +			operating-points-v2 = <&cpu4_opp_table>;
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			power-domains = <&CPU_PD4>;
>  			power-domain-names = "psci";
>  			#cooling-cells = <2>;
> @@ -145,6 +161,9 @@ CPU5: cpu@500 {
>  			dynamic-power-coefficient = <369>;
>  			next-level-cache = <&L2_500>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> +			operating-points-v2 = <&cpu4_opp_table>;
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			power-domains = <&CPU_PD5>;
>  			power-domain-names = "psci";
>  			#cooling-cells = <2>;
> @@ -163,6 +182,9 @@ CPU6: cpu@600 {
>  			dynamic-power-coefficient = <369>;
>  			next-level-cache = <&L2_600>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
> +			operating-points-v2 = <&cpu4_opp_table>;
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			power-domains = <&CPU_PD6>;
>  			power-domain-names = "psci";
>  			#cooling-cells = <2>;
> @@ -181,6 +203,9 @@ CPU7: cpu@700 {
>  			dynamic-power-coefficient = <421>;
>  			next-level-cache = <&L2_700>;
>  			qcom,freq-domain = <&cpufreq_hw 2>;
> +			operating-points-v2 = <&cpu7_opp_table>;
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
> +					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
>  			power-domains = <&CPU_PD7>;
>  			power-domain-names = "psci";
>  			#cooling-cells = <2>;
> @@ -263,6 +288,296 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
>  		};
>  	};
>  
> +	cpu0_opp_table: cpu0_opp_table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		cpu0_opp1: opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			opp-peak-kBps = <800000 9600000>;
> +		};
> +
> +		cpu0_opp2: opp-403200000 {
> +			opp-hz = /bits/ 64 <403200000>;
> +			opp-peak-kBps = <800000 9600000>;
> +		};
> +
> +		cpu0_opp3: opp-499200000 {
> +			opp-hz = /bits/ 64 <499200000>;
> +			opp-peak-kBps = <800000 12902400>;
> +		};
> +
> +		cpu0_opp4: opp-576000000 {
> +			opp-hz = /bits/ 64 <576000000>;
> +			opp-peak-kBps = <800000 12902400>;
> +		};
> +
> +		cpu0_opp5: opp-672000000 {
> +			opp-hz = /bits/ 64 <672000000>;
> +			opp-peak-kBps = <800000 15974400>;
> +		};
> +
> +		cpu0_opp6: opp-768000000 {
> +			opp-hz = /bits/ 64 <576000000>;
> +			opp-peak-kBps = <1804000 19660800>;
> +		};
> +
> +		cpu0_opp7: opp-844800000 {
> +			opp-hz = /bits/ 64 <844800000>;
> +			opp-peak-kBps = <1804000 19660800>;
> +		};
> +
> +		cpu0_opp8: opp-940800000 {
> +			opp-hz = /bits/ 64 <940800000>;
> +			opp-peak-kBps = <1804000 22732800>;
> +		};
> +
> +		cpu0_opp9: opp-1036800000 {
> +			opp-hz = /bits/ 64 <1036800000>;
> +			opp-peak-kBps = <1804000 22732800>;
> +		};
> +
> +		cpu0_opp10: opp-1113600000 {
> +			opp-hz = /bits/ 64 <1113600000>;
> +			opp-peak-kBps = <2188000 25804800>;
> +		};
> +
> +		cpu0_opp11: opp-1209600000 {
> +			opp-hz = /bits/ 64 <1209600000>;
> +			opp-peak-kBps = <2188000 31948800>;
> +		};
> +
> +		cpu0_opp12: opp-1305600000 {
> +			opp-hz = /bits/ 64 <1305600000>;
> +			opp-peak-kBps = <3072000 31948800>;
> +		};
> +
> +		cpu0_opp13: opp-1382400000 {
> +			opp-hz = /bits/ 64 <1382400000>;
> +			opp-peak-kBps = <3072000 31948800>;
> +		};
> +
> +		cpu0_opp14: opp-1478400000 {
> +			opp-hz = /bits/ 64 <1478400000>;
> +			opp-peak-kBps = <3072000 31948800>;
> +		};
> +
> +		cpu0_opp15: opp-1555200000 {
> +			opp-hz = /bits/ 64 <1555200000>;
> +			opp-peak-kBps = <3072000 40550400>;
> +		};
> +
> +		cpu0_opp16: opp-1632000000 {
> +			opp-hz = /bits/ 64 <1632000000>;
> +			opp-peak-kBps = <3072000 40550400>;
> +		};
> +
> +		cpu0_opp17: opp-1708800000 {
> +			opp-hz = /bits/ 64 <1708800000>;
> +			opp-peak-kBps = <3072000 43008000>;
> +		};
> +
> +		cpu0_opp18: opp-1785600000 {
> +			opp-hz = /bits/ 64 <1785600000>;
> +			opp-peak-kBps = <3072000 43008000>;
> +		};
> +	};
> +
> +	cpu4_opp_table: cpu4_opp_table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		cpu4_opp1: opp-710400000 {
> +			opp-hz = /bits/ 64 <710400000>;
> +			opp-peak-kBps = <1804000 15974400>;
> +		};
> +
> +		cpu4_opp2: opp-825600000 {
> +			opp-hz = /bits/ 64 <825600000>;
> +			opp-peak-kBps = <2188000 19660800>;
> +		};
> +
> +		cpu4_opp3: opp-940800000 {
> +			opp-hz = /bits/ 64 <940800000>;
> +			opp-peak-kBps = <2188000 22732800>;
> +		};
> +
> +		cpu4_opp4: opp-1056000000 {
> +			opp-hz = /bits/ 64 <1056000000>;
> +			opp-peak-kBps = <3072000 25804800>;
> +		};
> +
> +		cpu4_opp5: opp-1171200000 {
> +			opp-hz = /bits/ 64 <1171200000>;
> +			opp-peak-kBps = <3072000 31948800>;
> +		};
> +
> +		cpu4_opp6: opp-1286400000 {
> +			opp-hz = /bits/ 64 <1286400000>;
> +			opp-peak-kBps = <4068000 31948800>;
> +		};
> +
> +		cpu4_opp7: opp-1401600000 {
> +			opp-hz = /bits/ 64 <1401600000>;
> +			opp-peak-kBps = <4068000 31948800>;
> +		};
> +
> +		cpu4_opp8: opp-1497600000 {
> +			opp-hz = /bits/ 64 <1497600000>;
> +			opp-peak-kBps = <4068000 40550400>;
> +		};
> +
> +		cpu4_opp9: opp-1612800000 {
> +			opp-hz = /bits/ 64 <1612800000>;
> +			opp-peak-kBps = <4068000 40550400>;
> +		};
> +
> +		cpu4_opp10: opp-1708800000 {
> +			opp-hz = /bits/ 64 <1708800000>;
> +			opp-peak-kBps = <4068000 43008000>;
> +		};
> +
> +		cpu4_opp11: opp-1804800000 {
> +			opp-hz = /bits/ 64 <1804800000>;
> +			opp-peak-kBps = <6220000 43008000>;
> +		};
> +
> +		cpu4_opp12: opp-1920000000 {
> +			opp-hz = /bits/ 64 <1920000000>;
> +			opp-peak-kBps = <6220000 49152000>;
> +		};
> +
> +		cpu4_opp13: opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-peak-kBps = <7216000 49152000>;
> +		};
> +
> +		cpu4_opp14: opp-2131200000 {
> +			opp-hz = /bits/ 64 <2131200000>;
> +			opp-peak-kBps = <8368000 49152000>;
> +		};
> +
> +		cpu4_opp15: opp-2227200000 {
> +			opp-hz = /bits/ 64 <2227200000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +
> +		cpu4_opp16: opp-2323200000 {
> +			opp-hz = /bits/ 64 <2323200000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +
> +		cpu4_opp17: opp-2419200000 {
> +			opp-hz = /bits/ 64 <2419200000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +	};
> +
> +	cpu7_opp_table: cpu7_opp_table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		cpu7_opp1: opp-825600000 {
> +			opp-hz = /bits/ 64 <825600000>;
> +			opp-peak-kBps = <2188000 19660800>;
> +		};
> +
> +		cpu7_opp2: opp-940800000 {
> +			opp-hz = /bits/ 64 <940800000>;
> +			opp-peak-kBps = <2188000 22732800>;
> +		};
> +
> +		cpu7_opp3: opp-1056000000 {
> +			opp-hz = /bits/ 64 <1056000000>;
> +			opp-peak-kBps = <3072000 25804800>;
> +		};
> +
> +		cpu7_opp4: opp-1171200000 {
> +			opp-hz = /bits/ 64 <1171200000>;
> +			opp-peak-kBps = <3072000 31948800>;
> +		};
> +
> +		cpu7_opp5: opp-1286400000 {
> +			opp-hz = /bits/ 64 <1286400000>;
> +			opp-peak-kBps = <4068000 31948800>;
> +		};
> +
> +		cpu7_opp6: opp-1401600000 {
> +			opp-hz = /bits/ 64 <1401600000>;
> +			opp-peak-kBps = <4068000 31948800>;
> +		};
> +
> +		cpu7_opp7: opp-1497600000 {
> +			opp-hz = /bits/ 64 <1497600000>;
> +			opp-peak-kBps = <4068000 40550400>;
> +		};
> +
> +		cpu7_opp8: opp-1612800000 {
> +			opp-hz = /bits/ 64 <1612800000>;
> +			opp-peak-kBps = <4068000 40550400>;
> +		};
> +
> +		cpu7_opp9: opp-1708800000 {
> +			opp-hz = /bits/ 64 <1708800000>;
> +			opp-peak-kBps = <4068000 43008000>;
> +		};
> +
> +		cpu7_opp10: opp-1804800000 {
> +			opp-hz = /bits/ 64 <1804800000>;
> +			opp-peak-kBps = <6220000 43008000>;
> +		};
> +
> +		cpu7_opp11: opp-1920000000 {
> +			opp-hz = /bits/ 64 <1920000000>;
> +			opp-peak-kBps = <6220000 49152000>;
> +		};
> +
> +		cpu7_opp12: opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-peak-kBps = <7216000 49152000>;
> +		};
> +
> +		cpu7_opp13: opp-2131200000 {
> +			opp-hz = /bits/ 64 <2131200000>;
> +			opp-peak-kBps = <8368000 49152000>;
> +		};
> +
> +		cpu7_opp14: opp-2227200000 {
> +			opp-hz = /bits/ 64 <2227200000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +
> +		cpu7_opp15: opp-2323200000 {
> +			opp-hz = /bits/ 64 <2323200000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +
> +		cpu7_opp16: opp-2419200000 {
> +			opp-hz = /bits/ 64 <2419200000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +
> +		cpu7_opp17: opp-2534400000 {
> +			opp-hz = /bits/ 64 <2534400000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +
> +		cpu7_opp18: opp-2649600000 {
> +			opp-hz = /bits/ 64 <2649600000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +
> +		cpu7_opp19: opp-2745600000 {
> +			opp-hz = /bits/ 64 <2745600000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +
> +		cpu7_opp20: opp-2841600000 {
> +			opp-hz = /bits/ 64 <2841600000>;
> +			opp-peak-kBps = <8368000 51609600>;
> +		};
> +	};
> +
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-sm8150", "qcom,scm";
> -- 
> 2.25.1
> 
