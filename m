Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97443212080
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 12:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgGBKCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 06:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbgGBKCC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 06:02:02 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA18C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 03:02:02 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id k7so13601661vso.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k1bLe5yElM9VbMi4YXxwi+DrlhLKM55G+0q59qXSr34=;
        b=eRhxNxmd0TNZDe5xA6DxZnS4b6ET0eAPkBGTv9SrQdwYJFCc/DUdChn7U1N8sprPmf
         TNi1qTE7lJ7rb6A4j70veHd7s1uBdY4Z9OQcuZaw9LXSS43B5XXpfince7EaQbM0z5PO
         +juZR5o2tppGwJsMHPMFfUdBx/PZrSOwua3d0Y+yQOh1y2UnVB2W4poZTA8Wuqei5l5+
         T5QWIV45H9L7tXzvvm4xI1Ram7GwRScmagbEQAid+yVdBox17DsxuEb96JR4IWHYQnKd
         6NIdo5Q7HLNCjteeYIKj5HphmZaG5nJ2jo7mMMFuGWnjOjyFNlm9ickGY0gzTYA/z2n4
         xXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k1bLe5yElM9VbMi4YXxwi+DrlhLKM55G+0q59qXSr34=;
        b=eKsgrXz3LruUevwb0f/+NyN7qtIEokabn/IqB0av0CO4lP4TO7c/P7MFpkkMHwOfJw
         cfDVSb7fzmeLKZwJs8PccD8alHFnVDIU9XNmiEBeIgUwefTg3p410axuzvXtM60MAiCt
         XGqSeE4H1UOXDQ6cX7f4AoUSuJf8CEtPq+JgMGp1Oh476j7Ip5dWDk7LRGkLdG1K27PX
         IDDbQlHZsAZNCn5AlvWVM2/I2x4mpwdEdmS5T4scLrgw/UkQ5f5uXzatiYjH1O8iKQH+
         WQyNqeQiDWPMrrSXZE4kVpN2wI62614MhhvA/3mi+EUfUue4PsQnB5zo99zk0nivBPpP
         6S3Q==
X-Gm-Message-State: AOAM530HotrE2sZ1UyhwhQcULDjfTEc/ZBDcYZTTdzAfeVTTKOvfKCZn
        dko+rkPOlxIzd3RqEeVtAR6kDT3UlZsZ7f5AxvaAZA==
X-Google-Smtp-Source: ABdhPJz7BngFQ5ENalO8M5ak4rcbtrr9Da5EU4OVkjGS15AhZP9YT1RQaGbrlX+RcgDD+rLJUAhRC4IL6FX0Vu2ZdJI=
X-Received: by 2002:a67:3244:: with SMTP id y65mr18742296vsy.5.1593684120955;
 Thu, 02 Jul 2020 03:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org> <1593682763-31368-5-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1593682763-31368-5-git-send-email-loic.poulain@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 2 Jul 2020 15:31:49 +0530
Message-ID: <CAHLCerMra_a1CKRC=tZmC2OLEvp_AOdOqxSDf7QzDZC8fOjR9A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arch: arm64: dts: msm8996: Add opp and thermal
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 2, 2020 at 3:04 PM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 338 ++++++++++++++++++++++++++++++++--
>  1 file changed, 323 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 98634d5..0f73efe 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/soc/qcom,apr.h>
> +#include <dt-bindings/thermal/thermal.h>
>
>  / {
>         interrupt-parent = <&intc>;
> @@ -43,6 +44,12 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         capacity-dmips-mhz = <1024>;
> +                       clocks = <&kryocc 0>;
> +                       operating-points-v2 = <&cluster0_opp>;
> +                       /* cooling options */
> +                       cooling-min-level = <0>;
> +                       cooling-max-level = <15>;

cooling-min-level and cooling-max-level are no longer used upstream as
of 4.17 (somewhere in 2018) :-)


> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L2_0>;
>                         L2_0: l2-cache {
>                               compatible = "cache";
> @@ -57,6 +64,12 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         capacity-dmips-mhz = <1024>;
> +                       clocks = <&kryocc 0>;
> +                       operating-points-v2 = <&cluster0_opp>;
> +                       /* cooling options */
> +                       cooling-min-level = <0>;
> +                       cooling-max-level = <15>;
> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L2_0>;
>                 };
>
> @@ -67,6 +80,12 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         capacity-dmips-mhz = <1024>;
> +                       clocks = <&kryocc 1>;
> +                       operating-points-v2 = <&cluster1_opp>;
> +                       /* cooling options */
> +                       cooling-min-level = <0>;
> +                       cooling-max-level = <15>;
> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L2_1>;
>                         L2_1: l2-cache {
>                               compatible = "cache";
> @@ -81,6 +100,12 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         capacity-dmips-mhz = <1024>;
> +                       clocks = <&kryocc 1>;
> +                       operating-points-v2 = <&cluster1_opp>;
> +                       /* cooling options */
> +                       cooling-min-level = <0>;
> +                       cooling-max-level = <15>;
> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L2_1>;
>                 };
>
> @@ -424,7 +449,7 @@
>                                 bits = <1 4>;
>                         };
>
> -                       gpu_speed_bin: gpu_speed_bin@133 {
> +                       speedbin_efuse: speedbin@133 {
>                                 reg = <0x133 0x1>;
>                                 bits = <5 3>;
>                         };
> @@ -642,7 +667,7 @@
>                         power-domains = <&mmcc GPU_GDSC>;
>                         iommus = <&adreno_smmu 0>;
>
> -                       nvmem-cells = <&gpu_speed_bin>;
> +                       nvmem-cells = <&speedbin_efuse>;
>                         nvmem-cell-names = "speed_bin";

This bit changing the name of the node should be a separate patch, IMO.

>                         qcom,gpu-quirk-two-pass-use-wfi;
> @@ -1703,8 +1728,9 @@
>                                 };
>                         };
>                 };
> +
>                 kryocc: clock-controller@6400000 {
> -                       compatible = "qcom,apcc-msm8996";
> +                       compatible = "qcom,msm8996-apcc";
>                         reg = <0x06400000 0x90000>;
>                         #clock-cells = <1>;
>                 };
> @@ -2172,6 +2198,229 @@
>         sound: sound {
>         };
>
> +       cluster0_opp: opp_table0 {
> +               compatible = "operating-points-v2-qcom-cpu";
> +               nvmem-cells = <&speedbin_efuse>;
> +               opp-shared;
> +
> +               /* Nominal fmax for now */
> +
> +               opp-307200000 {
> +                       opp-hz = /bits/ 64 <  307200000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-422400000 {
> +                       opp-hz = /bits/ 64 <  422400000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-480000000 {
> +                       opp-hz = /bits/ 64 <  480000000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-556800000 {
> +                       opp-hz = /bits/ 64 <  556800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-652800000 {
> +                       opp-hz = /bits/ 64 <  652800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-729600000 {
> +                       opp-hz = /bits/ 64 <  729600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-844800000 {
> +                       opp-hz = /bits/ 64 <  844800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-960000000 {
> +                       opp-hz = /bits/ 64 <  960000000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1036800000 {
> +                       opp-hz = /bits/ 64 < 1036800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1113600000 {
> +                       opp-hz = /bits/ 64 < 1113600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1190400000 {
> +                       opp-hz = /bits/ 64 < 1190400000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1228800000 {
> +                       opp-hz = /bits/ 64 < 1228800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1324800000 {
> +                       opp-hz = /bits/ 64 < 1324800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1401600000 {
> +                       opp-hz = /bits/ 64 < 1401600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1478400000 {
> +                       opp-hz = /bits/ 64 < 1478400000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1593600000 {
> +                       opp-hz = /bits/ 64 < 1593600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +       };
> +
> +       cluster1_opp: opp_table1 {
> +               compatible = "operating-points-v2-qcom-cpu";
> +               nvmem-cells = <&speedbin_efuse>;
> +               opp-shared;
> +
> +               /* Nominal fmax for now */
> +
> +               opp-307200000 {
> +                       opp-hz = /bits/ 64 <  307200000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-403200000 {
> +                       opp-hz = /bits/ 64 <  403200000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-480000000 {
> +                       opp-hz = /bits/ 64 <  480000000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-556800000 {
> +                       opp-hz = /bits/ 64 <  556800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-652800000 {
> +                       opp-hz = /bits/ 64 <  652800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-729600000 {
> +                       opp-hz = /bits/ 64 <  729600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-806400000 {
> +                       opp-hz = /bits/ 64 <  806400000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-883200000 {
> +                       opp-hz = /bits/ 64 <  883200000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-940800000 {
> +                       opp-hz = /bits/ 64 <  940800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1036800000 {
> +                       opp-hz = /bits/ 64 < 1036800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1113600000 {
> +                       opp-hz = /bits/ 64 < 1113600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1190400000 {
> +                       opp-hz = /bits/ 64 < 1190400000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1248000000 {
> +                       opp-hz = /bits/ 64 < 1248000000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1324800000 {
> +                       opp-hz = /bits/ 64 < 1324800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1401600000 {
> +                       opp-hz = /bits/ 64 < 1401600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1478400000 {
> +                       opp-hz = /bits/ 64 < 1478400000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1555200000 {
> +                       opp-hz = /bits/ 64 < 1555200000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1632000000 {
> +                       opp-hz = /bits/ 64 < 1632000000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1708800000 {
> +                       opp-hz = /bits/ 64 < 1708800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1785600000 {
> +                       opp-hz = /bits/ 64 < 1785600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1824000000 {
> +                       opp-hz = /bits/ 64 < 1824000000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1920000000 {
> +                       opp-hz = /bits/ 64 < 1920000000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-1996800000 {
> +                       opp-hz = /bits/ 64 < 1996800000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-2073600000 {
> +                       opp-hz = /bits/ 64 < 2073600000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +               opp-2150400000 {
> +                       opp-hz = /bits/ 64 < 2150400000 >;
> +                       opp-supported-hw = <0x77>;
> +                       clock-latency-ns = <200000>;
> +               };
> +       };
> +
>         thermal-zones {
>                 cpu0-thermal {
>                         polling-delay-passive = <250>;
> @@ -2180,18 +2429,33 @@
>                         thermal-sensors = <&tsens0 3>;
>
>                         trips {
> -                               cpu0_alert0: trip-point@0 {
> +                               cpu_alert0: cpu_alert0 {

Please use the node name pattern we're using in some of the other dtsi
filenames for consistency. See sdm845.dtsi for an example.

This also fixes dtsi warnings about address units, I suspect. So the
name change may be a separate patch just to fix the warnings, if you
want.

>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
> +                                       type = "active";

We only need a passive trip type for cpufreq driven cooling. active
trip types are for driving fans and such.

> +                               };
> +                               cpu_warn0: cpu_warn0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
>                                         type = "passive";
>                                 };
> -
> -                               cpu0_crit: cpu_crit {
> +                               cpu_crit0: cpu_crit0 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu_alert0>;
> +                                       cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
> +                               };
> +                               map1 {
> +                                       trip = <&cpu_warn0>;
> +                                       cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
>                 };
>
>                 cpu1-thermal {
> @@ -2201,18 +2465,33 @@
>                         thermal-sensors = <&tsens0 5>;
>
>                         trips {
> -                               cpu1_alert0: trip-point@0 {
> +                               cpu_alert1: cpu_alert1 {
>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
> +                                       type = "active";
> +                               };
> +                               cpu_warn1: cpu_warn1 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
>                                         type = "passive";
>                                 };
> -
> -                               cpu1_crit: cpu_crit {
> +                               cpu_crit1: cpu_crit1 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu_alert1>;
> +                                       cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
> +                               };
> +                               map1 {
> +                                       trip = <&cpu_warn1>;
> +                                       cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
>                 };
>
>                 cpu2-thermal {
> @@ -2222,18 +2501,32 @@
>                         thermal-sensors = <&tsens0 8>;
>
>                         trips {
> -                               cpu2_alert0: trip-point@0 {
> +                               cpu_alert2: cpu_alert2 {
>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
> +                                       type = "active";
> +                               };
> +                               cpu_warn2: cpu_warn2 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
>                                         type = "passive";
>                                 };
> -
> -                               cpu2_crit: cpu_crit {
> +                               cpu_crit2: cpu_crit2 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu_alert2>;
> +                                       cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
> +                               };
> +                               map1 {
> +                                       trip = <&cpu_warn2>;
> +                                       cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
>                 };
>
>                 cpu3-thermal {
> @@ -2243,18 +2536,33 @@
>                         thermal-sensors = <&tsens0 10>;
>
>                         trips {
> -                               cpu3_alert0: trip-point@0 {
> +                               cpu_alert3: cpu_alert3 {
>                                         temperature = <75000>;
>                                         hysteresis = <2000>;
> +                                       type = "active";
> +                               };
> +                               cpu_warn3: cpu_warn3 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
>                                         type = "passive";
>                                 };
> -
> -                               cpu3_crit: cpu_crit {
> +                               cpu_crit3: trip1 {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu_alert3>;
> +                                       cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
> +                               };
> +                               map1 {
> +                                       trip = <&cpu_warn3>;
> +                                       cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
>                 };
>
>                 gpu-thermal-top {
> --
> 2.7.4
>
