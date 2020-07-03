Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0474213C09
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 16:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgGCOt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 10:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgGCOtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 10:49:25 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA29C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 07:49:24 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t25so32704807lji.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 07:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IDY2Il79OhSM4j66hWQ9e297gVV5ubXF8JVAiA1DUUY=;
        b=gPNc60tqhyNhnH+v8wLynJ9+iwJdXmrfI20sXqLt+fTQU+Zm3RvQxiBhU5MTuBVLGo
         zVB/0P0BxtUE83s2WeagtPslvRxSgx6vlXVvpeE/4VlxoAY5MCSMQuMmYnonlxF26rZ9
         e0W4eHAgxZSvznSDko6uutayC4LGnwayUBim0ZcLRQA520SfoLEKUilNmRjOrDm5noSf
         XjZ+RfcNHl3txD0DHSPQ8g/I8+LCQOVkdia7T1dz/6Jwc790PZldd1B/CeumAfnuiexa
         LQ1F6xx3jbE8z9qE4ZjL5YfjEvBWFbPwuOQKDIoJtlijQmBO5sGBwnpQ6lGWDweEojOL
         58ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IDY2Il79OhSM4j66hWQ9e297gVV5ubXF8JVAiA1DUUY=;
        b=ZuqjAJtaGDx4au4kmiPC/ajQJUDUEg8TgiG0bUDm9F9C515BN227/jc2lbOxt/+6Ei
         QGmGILkCU3uOPPjmXR4w/ljBivCmiLnF0OEJ5eZg70cdtARqy4rEV9J9SY7ZQ/8N3o5T
         XFSm9cd2zfJ2Zkgko5dbJUt3PzdSCDe9D4cySYdM0cUyTy/hSZ1OTDQT1J5p+n35HnPw
         sQ7v5/ww7v7Y8wYulUb2LLPvIKhclBpxPN2B5CPNAwqSimHSOHYkLA9U9a9wdxxhmwRF
         vjJAhx6l93m1xOLdXzo6IdkTQ5arjD+rtNqrd5JpM1hDzlCoFeupSfZah9JzzgUCsNcE
         hoJw==
X-Gm-Message-State: AOAM533l731jHxA29O7eSGnmVMEcOIp4lVkBqUGAQgcbu3NjwMEZh/BD
        GiOZceljsleMhGOc5FL2yJtN3nj0FZrgqp1HzLRLkuPAk3o=
X-Google-Smtp-Source: ABdhPJyen1X9CafZy3yMouxitptvDAV1B23Ik5AUyhdfRPJh7L6fReo91xh42kTEXBZNCyf2Vwt06PJN8cTtK3ifmRU=
X-Received: by 2002:a2e:81d7:: with SMTP id s23mr18668741ljg.398.1593787763217;
 Fri, 03 Jul 2020 07:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org> <1593766185-16346-6-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1593766185-16346-6-git-send-email-loic.poulain@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 3 Jul 2020 20:19:11 +0530
Message-ID: <CAP245DUkPD5w7777DQHrkrSrsUCxBdo_N5KYifLxtP25v+MP4w@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] arch: arm64: dts: msm8996: Add CPU opps and thermal
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 3, 2020 at 2:14 PM Loic Poulain <loic.poulain@linaro.org> wrote:
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
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>


Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 306 +++++++++++++++++++++++++++++++++-
>  1 file changed, 301 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 2811b8c1..94738ea 100644
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
> @@ -43,6 +44,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         capacity-dmips-mhz = <1024>;
> +                       clocks = <&kryocc 0>;
> +                       operating-points-v2 = <&cluster0_opp>;
> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L2_0>;
>                         L2_0: l2-cache {
>                               compatible = "cache";
> @@ -57,6 +61,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         capacity-dmips-mhz = <1024>;
> +                       clocks = <&kryocc 0>;
> +                       operating-points-v2 = <&cluster0_opp>;
> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L2_0>;
>                 };
>
> @@ -67,6 +74,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         capacity-dmips-mhz = <1024>;
> +                       clocks = <&kryocc 1>;
> +                       operating-points-v2 = <&cluster1_opp>;
> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L2_1>;
>                         L2_1: l2-cache {
>                               compatible = "cache";
> @@ -81,6 +91,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         capacity-dmips-mhz = <1024>;
> +                       clocks = <&kryocc 1>;
> +                       operating-points-v2 = <&cluster1_opp>;
> +                       #cooling-cells = <2>;
>                         next-level-cache = <&L2_1>;
>                 };
>
> @@ -1740,8 +1753,9 @@
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
> @@ -2209,6 +2223,229 @@
>         sound: sound {
>         };
>
> +       cluster0_opp: opp_table0 {
> +               compatible = "operating-points-v2-kryo-cpu";
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
> +               compatible = "operating-points-v2-kryo-cpu";
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
> @@ -2222,13 +2459,28 @@
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
> -
> +                               cpu0_alert1: trip-point1 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
>                                 cpu0_crit: cpu_crit {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu0_alert0>;
> +                                       cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
> +                               };
> +                               map1 {
> +                                       trip = <&cpu0_alert1>;
> +                                       cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
>                 };
>
>                 cpu1-thermal {
> @@ -2243,13 +2495,28 @@
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
> -
> +                               cpu1_alert1: trip-point1 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
>                                 cpu1_crit: cpu_crit {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu1_alert0>;
> +                                       cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
> +                               };
> +                               map1 {
> +                                       trip = <&cpu1_alert1>;
> +                                       cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
>                 };
>
>                 cpu2-thermal {
> @@ -2264,13 +2531,27 @@
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
> -
> +                               cpu2_alert1: trip-point1 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
>                                 cpu2_crit: cpu_crit {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu2_alert0>;
> +                                       cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
> +                               };
> +                               map1 {
> +                                       trip = <&cpu2_alert1>;
> +                                       cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
>                 };
>
>                 cpu3-thermal {
> @@ -2285,13 +2566,28 @@
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
> -
> +                               cpu3_alert1: trip-point1 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
>                                 cpu3_crit: cpu_crit {
>                                         temperature = <110000>;
>                                         hysteresis = <2000>;
>                                         type = "critical";
>                                 };
>                         };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu3_alert0>;
> +                                       cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
> +                               };
> +                               map1 {
> +                                       trip = <&cpu3_alert1>;
> +                                       cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
>                 };
>
>                 gpu-thermal-top {
> --
> 2.7.4
>
