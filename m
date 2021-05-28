Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC13393BAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 04:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236122AbhE1Cwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 22:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235597AbhE1Cwn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 22:52:43 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB55C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 19:51:09 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso2217237ote.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 19:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2KgijiAM4/UXomY9RK9iFgWWGWRQLA4snV9jm2h3EAY=;
        b=RqAov/uwrzoYCQ9EnajVO5fB2N9Ib5t67JTPpPG405RtomOCUpP0uUFQciXzKYepR6
         ZSzWKLhJrvqJcleGydNHT3p3yl3lnwWOyVDr0T0YHZporv9YJglWfaJb1KN+RBCwzZgd
         jfA2vhohVagHbNUuR1h5BrteLMRldldthzRCfi7C/jOo4jOeVCWL6AX6IkOLvheSMXTk
         4VWkYai/ROhN3AouZcqRAhY0m9mgqI0/MNwpWP3lDBd6snqKBiXOFCSxptoaEbKPZuu5
         2C57RpWs2GJhWXrWLBXJCjgN1EBCyUq143wcBDwC977SkupikpgMURVUmSoGKaUTip+I
         vqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2KgijiAM4/UXomY9RK9iFgWWGWRQLA4snV9jm2h3EAY=;
        b=fmeaLBVBonmzLR6e2NQGcg5danVg3FJjAp+OkQ/DpY5wAas6Xg5tGC0ZZsVW7SiAZI
         V+X/QP8k0ldXkEAUEcNXlHZHX5oeEr2d3+iTjifn5oGYcQkir5OfM2kMpb41j2A44Hs+
         1Pv8rk0WpXJXyrWy15ll7n5+UwJ+mu41ufnwzfnyjW8WAmeRw/3ageA1bykRHB/cRQMX
         QcIsAN1ADaUd5/htrB3o+41mAwEAVdxbt+BHYefi11msAdoSN9mSFvBdQq4Y5MIXCZ2M
         vrNqSYM+vSQpBtMZFatyhbg9VitieIvq2gq+qX9HJ/wiPpMKAdVhD7F6QeeIGpCxF55H
         3uoA==
X-Gm-Message-State: AOAM531g1ZYP81fPEo2fKMjNuPB9XFnrPtUFQJ9BYkrfVZKpMmwWey8l
        F94CHDONVW4zzWWTDlJY0og+hw==
X-Google-Smtp-Source: ABdhPJzdy30myPhIaNXKS0FErpYOTCM59Ir5+k5oKw9X3fpO9+/n1IzWxBXhhbeQOcIlTpLktCXtbA==
X-Received: by 2002:a05:6830:14d:: with SMTP id j13mr5158396otp.232.1622170269160;
        Thu, 27 May 2021 19:51:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c18sm884716otm.1.2021.05.27.19.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 19:51:08 -0700 (PDT)
Date:   Thu, 27 May 2021 21:51:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arch: arm64: dts: msm8996: Add CPU opps
Message-ID: <YLBamtRq1xgcsDRE@builder.lan>
References: <20210527194455.782108-1-konrad.dybcio@somainline.org>
 <20210527194455.782108-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527194455.782108-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 27 May 14:44 CDT 2021, Konrad Dybcio wrote:

> From: Loic Poulain <loic.poulain@linaro.org>
> 
> Add the operating points capabilities of the kryo CPUs, that can be
> used for frequency scaling. There are two differents operating point
> tables, one for the big cluster and one for the LITTLE cluster.
> 
> This frequency scaling support can then be used as a passive cooling
> device (cpufreq cooling device).
> 
> Only add nominal fmax for now, since there is no dynamic control of
> VDD APC (s11..) which is statically set at its nominal value.
> 
> Original patch link: https://patchwork.kernel.org/project/linux-arm-msm/patch/1595253740-29466-6-git-send-email-loic.poulain@linaro.org/
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [konrad: drop the thermals part, rebase and remove spaces within <>]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

As reported to Konrad on IRC, booting this causes a lockup before the
kernel reaches init, on one of my db820c boards. Booting with powersave
governor makes this board boot fine and I'm able to switch to
performance after that and at least according to cpufreq we're at full
speed on all 4 cores. But I haven't done any proper stress of the
system to narrow it down further...

PS. This was tested with next-20210527, your 3 patches, defconfig and
CONFIG_QCOM_CLK_APCC_MSM8996=y

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 234 ++++++++++++++++++++++++++
>  1 file changed, 234 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 509d5bfec8ad..10e6fecc9e13 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,apr.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -44,6 +45,9 @@ CPU0: cpu@0 {
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			capacity-dmips-mhz = <1024>;
> +			clocks = <&kryocc 0>;
> +			operating-points-v2 = <&cluster0_opp>;
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
>  			      compatible = "cache";
> @@ -58,6 +62,9 @@ CPU1: cpu@1 {
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			capacity-dmips-mhz = <1024>;
> +			clocks = <&kryocc 0>;
> +			operating-points-v2 = <&cluster0_opp>;
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
>  		};
>  
> @@ -68,6 +75,9 @@ CPU2: cpu@100 {
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			capacity-dmips-mhz = <1024>;
> +			clocks = <&kryocc 1>;
> +			operating-points-v2 = <&cluster1_opp>;
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_1>;
>  			L2_1: l2-cache {
>  			      compatible = "cache";
> @@ -82,6 +92,9 @@ CPU3: cpu@101 {
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			capacity-dmips-mhz = <1024>;
> +			clocks = <&kryocc 1>;
> +			operating-points-v2 = <&cluster1_opp>;
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_1>;
>  		};
>  
> @@ -121,6 +134,227 @@ CPU_SLEEP_0: cpu-sleep-0 {
>  		};
>  	};
>  
> +	cluster0_opp: opp_table0 {
> +		compatible = "operating-points-v2-kryo-cpu";
> +		nvmem-cells = <&speedbin_efuse>;
> +		opp-shared;
> +
> +		/* Nominal fmax for now */
> +		opp-307200000 {
> +			opp-hz = /bits/ 64 <307200000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-422400000 {
> +			opp-hz = /bits/ 64 <422400000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-556800000 {
> +			opp-hz = /bits/ 64 <556800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-652800000 {
> +			opp-hz = /bits/ 64 <652800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-729600000 {
> +			opp-hz = /bits/ 64 <729600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-844800000 {
> +			opp-hz = /bits/ 64 <844800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-960000000 {
> +			opp-hz = /bits/ 64 <960000000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1036800000 {
> +			opp-hz = /bits/ 64 <1036800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1113600000 {
> +			opp-hz = /bits/ 64 <1113600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1190400000 {
> +			opp-hz = /bits/ 64 <1190400000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1324800000 {
> +			opp-hz = /bits/ 64 <1324800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1401600000 {
> +			opp-hz = /bits/ 64 <1401600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1478400000 {
> +			opp-hz = /bits/ 64 <1478400000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1593600000 {
> +			opp-hz = /bits/ 64 <1593600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +	};
> +
> +	cluster1_opp: opp_table1 {
> +		compatible = "operating-points-v2-kryo-cpu";
> +		nvmem-cells = <&speedbin_efuse>;
> +		opp-shared;
> +
> +		/* Nominal fmax for now */
> +		opp-307200000 {
> +			opp-hz = /bits/ 64 <307200000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-403200000 {
> +			opp-hz = /bits/ 64 <403200000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-556800000 {
> +			opp-hz = /bits/ 64 <556800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-652800000 {
> +			opp-hz = /bits/ 64 <652800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-729600000 {
> +			opp-hz = /bits/ 64 <729600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-806400000 {
> +			opp-hz = /bits/ 64 <806400000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-883200000 {
> +			opp-hz = /bits/ 64 <883200000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-940800000 {
> +			opp-hz = /bits/ 64 <940800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1036800000 {
> +			opp-hz = /bits/ 64 <1036800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1113600000 {
> +			opp-hz = /bits/ 64 <1113600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1190400000 {
> +			opp-hz = /bits/ 64 <1190400000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1248000000 {
> +			opp-hz = /bits/ 64 <1248000000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1324800000 {
> +			opp-hz = /bits/ 64 <1324800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1401600000 {
> +			opp-hz = /bits/ 64 <1401600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1478400000 {
> +			opp-hz = /bits/ 64 <1478400000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1555200000 {
> +			opp-hz = /bits/ 64 <1555200000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1632000000 {
> +			opp-hz = /bits/ 64 <1632000000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1708800000 {
> +			opp-hz = /bits/ 64 <1708800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1785600000 {
> +			opp-hz = /bits/ 64 <1785600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1824000000 {
> +			opp-hz = /bits/ 64 <1824000000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1920000000 {
> +			opp-hz = /bits/ 64 <1920000000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-1996800000 {
> +			opp-hz = /bits/ 64 <1996800000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-2073600000 {
> +			opp-hz = /bits/ 64 <2073600000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +		opp-2150400000 {
> +			opp-hz = /bits/ 64 <2150400000>;
> +			opp-supported-hw = <0x77>;
> +			clock-latency-ns = <200000>;
> +		};
> +	};
> +
>  	firmware {
>  		scm {
>  			compatible = "qcom,scm-msm8996";
> -- 
> 2.31.1
> 
