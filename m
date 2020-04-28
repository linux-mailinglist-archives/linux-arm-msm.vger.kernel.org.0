Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A533C1BCCF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 22:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgD1UFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 16:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD1UFB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 16:05:01 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE61C03C1AB
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 13:05:01 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id a7so14844914uak.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VrdnFFgxSUrU8zTdK0khCvfnKPXqrVhg3jHujuAIUyY=;
        b=Fjh6RwClWBvZGvUtZu9EWFIQhuYDQEjUhOG1nIKG+bgD9xYspqnVrJ02sJSPa53BZw
         TaJzUBkUTZZyWAgo2Qa8zvowGyT9H4x2iX+1IbSHscsrb4xtWq0mV0ZMFxX5TNAlZgMW
         WgWa6todYdm3J1OioOM+50lBjg3x5CYld6V/4xCoKcV7rNKN2HCFFf+sgPX4cKhImbC6
         4brDUYRgCCp+3f4aWv70Z3SOlY8sTRrOHCLqSdsjV/XueZRXcrHXC5QkhfLEVzhLK4jj
         ahS+TSBYW+e0m6RmX56wuQ97DkZ27Rpydr/nc/4Wqo61YMrGdfKOMB3Q98pOBKwMm1rk
         ulag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VrdnFFgxSUrU8zTdK0khCvfnKPXqrVhg3jHujuAIUyY=;
        b=pxkN9ZMnT1mj3AAScwIdCNsxxbe3daMTdypxNQMrquI5o+27VEuusorXwlAEOi4vYJ
         y5NycI47bmtEffT83JGJRxG0CfLE07HTno4O2eTItdRLTpDU287mwXrw6tB2FmVpd4Tf
         YIVLu/6VOtUOugH3n4AgOlrtIZ7oe2m2QEhFEnf/MtafSINkLUdeSZzCia9upGwt03Xy
         /t3QbwkbU+14i1fS5UHH6sHYkhmWx8FkURmlxByGvihha8tVXV11zv7i5j3e39Ik+qBL
         pboPYj6DZ0aDm5WJkuyQyPG2sTA5cF3u/EiFZh/peFH44bmrsEEVeGJ6AF3l9cVGH3g8
         /ZMg==
X-Gm-Message-State: AGi0PubKvPN4WRGHL437tJ5rTkNXhCTrLvOsMB6DV8qKanQWjQ8WwgLF
        6TYrd388E2Ox2B5IiBrK+moPf6jL5pFpTIhcmnjyroKP
X-Google-Smtp-Source: APiQypJxgITujlmwD4i8UFbLDZE9l5i8jhbHalyYnVUvC+tRk4f7WJKQWhr24OZQdYba4YZ7Xo+ToNt1HZ3jYYkcqLI=
X-Received: by 2002:a05:6102:5c4:: with SMTP id v4mr20352486vsf.95.1588104300030;
 Tue, 28 Apr 2020 13:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 29 Apr 2020 01:34:24 +0530
Message-ID: <CAHLCerP89eZG3zpmveijY=UiX7LyP3VPjMUGp6NX9pRaJqJ=6A@mail.gmail.com>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On Wed, Apr 1, 2020 at 11:17 PM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> The highest cpu frequency opps have been dropped because CPR is not
> supported. However, we can simply specify operating voltage so that
> they match the max corner voltages for each freq. With that, we can
> support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> fine tune operating voltages and optimize power consumption.
>
> This patch:
> - Adds missing opps and corresponding target voltages to msm8916.dtsi.
> - Adds cpu-supply to apq8016-sbc.dtsi (board level info).
> - Adds pm8916 spmi regulator node to pm8916.dtsi.
>
> Tested with a dragonboard-410c.

FWIW, I took this out for a spin with stress-ng loads. The first
output is w/o the patch.

--o amitrootfs o--(/sys/devices/system/cpu/cpufreq/policy0/stats) $ grep "" *
grep: reset: Permission denied
time_in_state:200000 14304
time_in_state:400000 2
time_in_state:800000 40
time_in_state:998400 4316
total_trans:31
trans_table:   From  :    To
trans_table:         :    200000    400000    800000    998400
trans_table:   200000:         0         1        12         1
trans_table:   400000:         2         0         0         0
trans_table:   800000:        12         0         0         1
trans_table:   998400:         0         1         1         0

The following output is with the patch applied. The cpu ran at 1.3GHz
for a short while until thermal kicked in and throttled the device to
800MHz-1GHz OPPs.

--o amitrootfs o--(/sys/devices/system/cpu/cpufreq/policy0/stats) $ grep "" *
grep: reset: Permission denied
time_in_state:200000 201824
time_in_state:400000 158
time_in_state:533330 2501
time_in_state:800000 37804
time_in_state:998400 23326
time_in_state:1094400 2325
time_in_state:1152000 747
time_in_state:1209600 922
time_in_state:1363200 10788
total_trans:1504
trans_table:   From  :    To
trans_table:         :    200000    400000    533330    800000
998400   1094400   1152000   1209600   1363200
trans_table:   200000:         0        18         5         8
99         0         1         0         2
trans_table:   400000:        18         0         0         0
3         0         0         0         0
trans_table:   533330:         7         1         0        77
1         0         0         0         0
trans_table:   800000:        13         1         1         0
547         0         0         0         1
trans_table:   998400:        92         1        80       477
0        12         0         0         2
trans_table:  1094400:         1         0         0         0
14         0         0         0         2
trans_table:  1152000:         1         0         0         0
1         4         0         0         1
trans_table:  1209600:         0         0         0         0
0         0         5         0         0
trans_table:  1363200:         1         0         0         0
0         1         1         5         0



> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

I haven't found a v2 of this patch incorporating Bjorn's suggestions
yet. Until then,

Tested-by: Amit Kucheria <amit.kucheria@linaro.org>



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
>         qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
>  };
>
> +&spm_regulators {
> +       vdd_cpu: s2 {
> +               regulator-always-on;
> +               regulator-min-microvolt = <1050000>;
> +               regulator-max-microvolt = <1350000>;
> +       };
> +};
> +
> +&CPU0 {
> +       cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU1 {
> +       cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU2 {
> +       cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU3 {
> +       cpu-supply = <&vdd_cpu>;
> +};
> +
>  &smd_rpm_regulators {
>         vdd_l1_l2_l3-supply = <&pm8916_s3>;
>         vdd_l5-supply = <&pm8916_s3>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 9f31064..9805af0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -342,15 +342,39 @@
>
>                 opp-200000000 {
>                         opp-hz = /bits/ 64 <200000000>;
> +                       opp-microvolt = <1050000>;
>                 };
>                 opp-400000000 {
>                         opp-hz = /bits/ 64 <400000000>;
> +                       opp-microvolt = <1050000>;
> +               };
> +               opp-533330000 {
> +                       opp-hz = /bits/ 64 <533330000>;
> +                       opp-microvolt = <1150000>;
>                 };
>                 opp-800000000 {
>                         opp-hz = /bits/ 64 <800000000>;
> +                       opp-microvolt = <1150000>;
>                 };
>                 opp-998400000 {
>                         opp-hz = /bits/ 64 <998400000>;
> +                       opp-microvolt = <1350000>;
> +               };
> +               opp-1094400000 {
> +                       opp-hz = /bits/ 64 <1094400000>;
> +                       opp-microvolt = <1350000>;
> +               };
> +               opp-1152000000 {
> +                       opp-hz = /bits/ 64 <1152000000>;
> +                       opp-microvolt = <1350000>;
> +               };
> +               opp-1209600000 {
> +                       opp-hz = /bits/ 64 <1209600000>;
> +                       opp-microvolt = <1350000>;
> +               };
> +               opp-1363200000 {
> +                       opp-hz = /bits/ 64 <1363200000>;
> +                       opp-microvolt = <1350000>;
>                 };
>         };
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 0bcdf04..c9b9c4f 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -157,5 +157,11 @@
>                         vdd-micbias-supply = <&pm8916_l13>;
>                         #sound-dai-cells = <1>;
>                 };
> +
> +               spm_regulators: spm_regulators  {
> +                       compatible = "qcom,pm8916-regulators";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +               };
>         };
>  };
> --
> 2.7.4
>
