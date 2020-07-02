Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06037212503
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 15:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729115AbgGBNnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 09:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729129AbgGBNnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 09:43:22 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D50C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 06:43:21 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s1so32222325ljo.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kOGO3pzq44pmSg/YzcAUnnJRBjlHa8mINCpAJGeDECY=;
        b=vu3gQyAV2MubXb2TEGKimYM2gtK5tRzlHTv3jZqttkIrDNB5ZZFaxkleRr7s01UzHK
         3hwXl/kRiZ9hoktbLhayXXJdHwC997Va5kiiAgJon92velHG2jjAbFaOz++hLOXc8Wfg
         y8YlizyiLMN4WAn06V38Ju7RxYq+LvGj/nMMdukJJJhuyi7kXKNNZMjgDnTJsRxkPn4D
         76ZjwigExEjcOXNbkMl2BXkDk1lRlwWBdweCBjAww55kHjD4mJ9PdMoDY06LXEVXXNDr
         khToSGWa/visKSGx/EuA8gpRh2F2wjh775GrTRbpSSCpmhOo4vQqvmZgRallXNZHhiaa
         a3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOGO3pzq44pmSg/YzcAUnnJRBjlHa8mINCpAJGeDECY=;
        b=shciQ6ZJ9/vR4vm6d1mQ97xjBBV7mWHsJgOKC9+pIyH1Ovc6M5ilsNzSpQ1sEyAqbg
         Ln8AHEXdGiWPbvEtANUZElzcls3k1BRLmK/zJmu6A0z1kkSMYYPIqzl3+lr+2ao39iD4
         49QwBJa9Yd188yo9zMqeVRuKKn8c/myOeq/Ll03vu3GhCdh5YSk1vnya38T35ZkudSKE
         Gbsd6ea8WaoVjFtXGWE0jD/Txl2ZNJbwtwOhDQtRKX1HLKc5owhQWEKdVeAqiTRXUKOm
         7DOpu+OsYUv/MeRBT8nBWcnC6q7Hnl8/2KuOKHbloOk+BBqf5pPrSz9bC6iPLRTwSCKw
         tB3Q==
X-Gm-Message-State: AOAM530/e7GfKcQs6C8eLrnYn51v8/SU1iUrkRu3sjb0xt3+kvsKoRyk
        Lmckzw1nx/LuLjotlW3o+3UR6HSbwoaLYiCeeBXAZcaI
X-Google-Smtp-Source: ABdhPJyvuBJUuAJcy2syeO9FsIq0MZvkbup1qOrxAd5CU3rFCj1YTCLQPx3uSH/QyiTj51X3vlYw+xs32rUYPKtaCUY=
X-Received: by 2002:a2e:9b8c:: with SMTP id z12mr16035907lji.35.1593697400272;
 Thu, 02 Jul 2020 06:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <1593695762-19823-1-git-send-email-loic.poulain@linaro.org>
 <1593695762-19823-4-git-send-email-loic.poulain@linaro.org> <CAMZdPi-WtzuaT6vQuw1bYhmwUd57kS1BXfkSpLcqJED3TKetZA@mail.gmail.com>
In-Reply-To: <CAMZdPi-WtzuaT6vQuw1bYhmwUd57kS1BXfkSpLcqJED3TKetZA@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 2 Jul 2020 19:13:09 +0530
Message-ID: <CAP245DVkTWn3xjSbSvATum=eiaRNfFYm=gL5ubwKnGMFpcBA9w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arch: arm64: dts: msm8996: Add opp and thermal
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 2, 2020 at 6:46 PM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> Please ignore that one, wrongly integrated into the series (this is 4/4).


You're missing a patch description, so best to fix it up and send a
new version. One more fix below.


>
> On Thu, 2 Jul 2020 at 15:11, Loic Poulain <loic.poulain@linaro.org> wrote:
>>
>> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 318 ++++++++++++++++++++++++++++++++--
>>  1 file changed, 307 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 9951286..61489fb 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -7,6 +7,7 @@
>>  #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
>>  #include <dt-bindings/clock/qcom,rpmcc.h>
>>  #include <dt-bindings/soc/qcom,apr.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>
>>  / {
>>         interrupt-parent = <&intc>;
>> @@ -43,6 +44,9 @@
>>                         enable-method = "psci";
>>                         cpu-idle-states = <&CPU_SLEEP_0>;
>>                         capacity-dmips-mhz = <1024>;
>> +                       clocks = <&kryocc 0>;
>> +                       operating-points-v2 = <&cluster0_opp>;
>> +                       #cooling-cells = <2>;
>>                         next-level-cache = <&L2_0>;
>>                         L2_0: l2-cache {
>>                               compatible = "cache";
>> @@ -57,6 +61,9 @@
>>                         enable-method = "psci";
>>                         cpu-idle-states = <&CPU_SLEEP_0>;
>>                         capacity-dmips-mhz = <1024>;
>> +                       clocks = <&kryocc 0>;
>> +                       operating-points-v2 = <&cluster0_opp>;
>> +                       #cooling-cells = <2>;
>>                         next-level-cache = <&L2_0>;
>>                 };
>>
>> @@ -67,6 +74,9 @@
>>                         enable-method = "psci";
>>                         cpu-idle-states = <&CPU_SLEEP_0>;
>>                         capacity-dmips-mhz = <1024>;
>> +                       clocks = <&kryocc 1>;
>> +                       operating-points-v2 = <&cluster1_opp>;
>> +                       #cooling-cells = <2>;
>>                         next-level-cache = <&L2_1>;
>>                         L2_1: l2-cache {
>>                               compatible = "cache";
>> @@ -81,6 +91,9 @@
>>                         enable-method = "psci";
>>                         cpu-idle-states = <&CPU_SLEEP_0>;
>>                         capacity-dmips-mhz = <1024>;
>> +                       clocks = <&kryocc 1>;
>> +                       operating-points-v2 = <&cluster1_opp>;
>> +                       #cooling-cells = <2>;
>>                         next-level-cache = <&L2_1>;
>>                 };
>>
>> @@ -424,7 +437,7 @@
>>                                 bits = <1 4>;
>>                         };
>>
>> -                       gpu_speed_bin: gpu_speed_bin@133 {
>> +                       speedbin_efuse: speedbin@133 {
>>                                 reg = <0x133 0x1>;
>>                                 bits = <5 3>;
>>                         };
>> @@ -642,7 +655,7 @@
>>                         power-domains = <&mmcc GPU_GX_GDSC>;
>>                         iommus = <&adreno_smmu 0>;
>>
>> -                       nvmem-cells = <&gpu_speed_bin>;
>> +                       nvmem-cells = <&speedbin_efuse>;
>>                         nvmem-cell-names = "speed_bin";
>>
>>                         qcom,gpu-quirk-two-pass-use-wfi;
>> @@ -1740,8 +1753,9 @@
>>                                 };
>>                         };
>>                 };
>> +
>>                 kryocc: clock-controller@6400000 {
>> -                       compatible = "qcom,apcc-msm8996";
>> +                       compatible = "qcom,msm8996-apcc";
>>                         reg = <0x06400000 0x90000>;
>>                         #clock-cells = <1>;
>>                 };
>> @@ -2209,6 +2223,229 @@
>>         sound: sound {
>>         };
>>
>> +       cluster0_opp: opp_table0 {
>> +               compatible = "operating-points-v2-kryo-cpu";
>> +               nvmem-cells = <&speedbin_efuse>;
>> +               opp-shared;
>> +
>> +               /* Nominal fmax for now */
>> +
>> +               opp-307200000 {
>> +                       opp-hz = /bits/ 64 <  307200000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-422400000 {
>> +                       opp-hz = /bits/ 64 <  422400000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-480000000 {
>> +                       opp-hz = /bits/ 64 <  480000000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-556800000 {
>> +                       opp-hz = /bits/ 64 <  556800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-652800000 {
>> +                       opp-hz = /bits/ 64 <  652800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-729600000 {
>> +                       opp-hz = /bits/ 64 <  729600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-844800000 {
>> +                       opp-hz = /bits/ 64 <  844800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-960000000 {
>> +                       opp-hz = /bits/ 64 <  960000000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1036800000 {
>> +                       opp-hz = /bits/ 64 < 1036800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1113600000 {
>> +                       opp-hz = /bits/ 64 < 1113600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1190400000 {
>> +                       opp-hz = /bits/ 64 < 1190400000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1228800000 {
>> +                       opp-hz = /bits/ 64 < 1228800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1324800000 {
>> +                       opp-hz = /bits/ 64 < 1324800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1401600000 {
>> +                       opp-hz = /bits/ 64 < 1401600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1478400000 {
>> +                       opp-hz = /bits/ 64 < 1478400000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1593600000 {
>> +                       opp-hz = /bits/ 64 < 1593600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +       };
>> +
>> +       cluster1_opp: opp_table1 {
>> +               compatible = "operating-points-v2-kryo-cpu";
>> +               nvmem-cells = <&speedbin_efuse>;
>> +               opp-shared;
>> +
>> +               /* Nominal fmax for now */
>> +
>> +               opp-307200000 {
>> +                       opp-hz = /bits/ 64 <  307200000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-403200000 {
>> +                       opp-hz = /bits/ 64 <  403200000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-480000000 {
>> +                       opp-hz = /bits/ 64 <  480000000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-556800000 {
>> +                       opp-hz = /bits/ 64 <  556800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-652800000 {
>> +                       opp-hz = /bits/ 64 <  652800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-729600000 {
>> +                       opp-hz = /bits/ 64 <  729600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-806400000 {
>> +                       opp-hz = /bits/ 64 <  806400000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-883200000 {
>> +                       opp-hz = /bits/ 64 <  883200000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-940800000 {
>> +                       opp-hz = /bits/ 64 <  940800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1036800000 {
>> +                       opp-hz = /bits/ 64 < 1036800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1113600000 {
>> +                       opp-hz = /bits/ 64 < 1113600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1190400000 {
>> +                       opp-hz = /bits/ 64 < 1190400000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1248000000 {
>> +                       opp-hz = /bits/ 64 < 1248000000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1324800000 {
>> +                       opp-hz = /bits/ 64 < 1324800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1401600000 {
>> +                       opp-hz = /bits/ 64 < 1401600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1478400000 {
>> +                       opp-hz = /bits/ 64 < 1478400000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1555200000 {
>> +                       opp-hz = /bits/ 64 < 1555200000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1632000000 {
>> +                       opp-hz = /bits/ 64 < 1632000000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1708800000 {
>> +                       opp-hz = /bits/ 64 < 1708800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1785600000 {
>> +                       opp-hz = /bits/ 64 < 1785600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1824000000 {
>> +                       opp-hz = /bits/ 64 < 1824000000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1920000000 {
>> +                       opp-hz = /bits/ 64 < 1920000000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-1996800000 {
>> +                       opp-hz = /bits/ 64 < 1996800000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-2073600000 {
>> +                       opp-hz = /bits/ 64 < 2073600000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +               opp-2150400000 {
>> +                       opp-hz = /bits/ 64 < 2150400000 >;
>> +                       opp-supported-hw = <0x77>;
>> +                       clock-latency-ns = <200000>;
>> +               };
>> +       };
>> +
>>         thermal-zones {
>>                 cpu0-thermal {
>>                         polling-delay-passive = <250>;
>> @@ -2222,13 +2459,28 @@
>>                                         hysteresis = <2000>;
>>                                         type = "passive";
>>                                 };
>> -
>> -                               cpu0_crit: cpu_crit {
>> +                               cpu0_alert1: trip-point1 {
>> +                                       temperature = <90000>;
>> +                                       hysteresis = <2000>;
>> +                                       type = "passive";
>> +                               };
>> +                               cpu_crit0: cpu_crit {

Number is attached after the cpu: "cpuN_crit: cpu_crit"


>>                                         temperature = <110000>;
>>                                         hysteresis = <2000>;
>>                                         type = "critical";
>>                                 };
>>                         };
>> +
>> +                       cooling-maps {
>> +                               map0 {
>> +                                       trip = <&cpu0_alert0>;
>> +                                       cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
>> +                               };
>> +                               map1 {
>> +                                       trip = <&cpu0_alert1>;
>> +                                       cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
>> +                               };
>> +                       };
>>                 };
>>
>>                 cpu1-thermal {
>> @@ -2243,13 +2495,28 @@
>>                                         hysteresis = <2000>;
>>                                         type = "passive";
>>                                 };
>> -
>> -                               cpu1_crit: cpu_crit {
>> +                               cpu1_alert1: trip-point1 {
>> +                                       temperature = <90000>;
>> +                                       hysteresis = <2000>;
>> +                                       type = "passive";
>> +                               };
>> +                               cpu_crit1: cpu_crit {
>>                                         temperature = <110000>;
>>                                         hysteresis = <2000>;
>>                                         type = "critical";
>>                                 };
>>                         };
>> +
>> +                       cooling-maps {
>> +                               map0 {
>> +                                       trip = <&cpu1_alert0>;
>> +                                       cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
>> +                               };
>> +                               map1 {
>> +                                       trip = <&cpu1_alert1>;
>> +                                       cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
>> +                               };
>> +                       };
>>                 };
>>
>>                 cpu2-thermal {
>> @@ -2264,13 +2531,27 @@
>>                                         hysteresis = <2000>;
>>                                         type = "passive";
>>                                 };
>> -
>> -                               cpu2_crit: cpu_crit {
>> +                               cpu2_alert1: trip-point1 {
>> +                                       temperature = <90000>;
>> +                                       hysteresis = <2000>;
>> +                                       type = "passive";
>> +                               };
>> +                               cpu_crit2: cpu_crit {
>>                                         temperature = <110000>;
>>                                         hysteresis = <2000>;
>>                                         type = "critical";
>>                                 };
>>                         };
>> +                       cooling-maps {
>> +                               map0 {
>> +                                       trip = <&cpu2_alert0>;
>> +                                       cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
>> +                               };
>> +                               map1 {
>> +                                       trip = <&cpu2_alert1>;
>> +                                       cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
>> +                               };
>> +                       };
>>                 };
>>
>>                 cpu3-thermal {
>> @@ -2285,13 +2566,28 @@
>>                                         hysteresis = <2000>;
>>                                         type = "passive";
>>                                 };
>> -
>> -                               cpu3_crit: cpu_crit {
>> +                               cpu3_alert1: trip-point1 {
>> +                                       temperature = <90000>;
>> +                                       hysteresis = <2000>;
>> +                                       type = "passive";
>> +                               };
>> +                               cpu_crit3: cpu_crit {
>>                                         temperature = <110000>;
>>                                         hysteresis = <2000>;
>>                                         type = "critical";
>>                                 };
>>                         };
>> +
>> +                       cooling-maps {
>> +                               map0 {
>> +                                       trip = <&cpu3_alert0>;
>> +                                       cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
>> +                               };
>> +                               map1 {
>> +                                       trip = <&cpu3_alert1>;
>> +                                       cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
>> +                               };
>> +                       };
>>                 };
>>
>>                 gpu-thermal-top {
>> --
>> 2.7.4
>>
