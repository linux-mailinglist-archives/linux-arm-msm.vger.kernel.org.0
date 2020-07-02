Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F37212500
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 15:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgGBNml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 09:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729339AbgGBNmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 09:42:40 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAFCC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 06:42:40 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q7so18958889ljm.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I6Ve3wfsgELxU81mcGSUBES+7Na/MexmLDwjobI3XYo=;
        b=hDkevtlL9dJWxjp9QaEiZx5BZzYPKclaIkBi3Pk/aZt4oAMVoj+OSELQJ/j4YIvC/d
         OJMYsiwvfJ066gTUds+K/FuashXY5s/+AvPp9bLNqdEZdg5LB8LRQRL3WhaCsGGrFJjb
         kD5V+F8NQS0+LOykGiVkEJx2CidR75h1j5eLrbSBrFgSagWCTSQCcZZiTlHKQygVB0tm
         oTHrVf1zIlglCXrKwjzfiSW2YvpJ/NFFyhTBRHqjwPA20TZkMbVz8NysuXCz2sXRMDmP
         o8w1ZZHF5Po1GWfYx8IRHfJ5tuejJrEJfXwTGfDW4QBLfbkAivQFRdSz0aMGZlbvsg+p
         0GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I6Ve3wfsgELxU81mcGSUBES+7Na/MexmLDwjobI3XYo=;
        b=dO6cfnbUvY55br2ZAzRjBJhk5R3wS4GvCof50W2gN/ujdGJVLsclaPjl9kfynw6g4o
         AcvEds/CJFA2G/erxtzN+5h/0ymJiDmVVl1Zz73/r42aWJ0mKCyDL8vYwXoZYEjLTEJG
         KpCHXHqXZCelaTKWB2YVUXVdy4pqxFTrQBoEQ/4b6b66LVJfcwPR18ykHtEWw85FJDQ8
         /4j8b5zeHNUxNXC3wV5kBdQWOt0gEKknfb7R/XtuLsryndvltHKxTnIKl3RQ5l7T57w/
         +nZoI0VtJRFKZ8cb2BfhzhpcVCA8rsLB4z2a9HGcNVk5oH+occiFl+moML3Rfn22m5OQ
         MuGg==
X-Gm-Message-State: AOAM531lsusvwQyjpvFGKBDzjqHG+cEmWQmeCPpVluMIWIZt1bBrPQek
        EQzz7n4rqiNIXBNvaCuJM9GGtm2fnA9jH5Kcz2gcYQ==
X-Google-Smtp-Source: ABdhPJwMADM7hTi6Lea/mmnObwuTURBqCtcFhKSwgwNIYePkuACJ/sOKnZa+mpgw9PzAP2BT833NGj12w4TeePWE3Zg=
X-Received: by 2002:a2e:8855:: with SMTP id z21mr11827374ljj.325.1593697358749;
 Thu, 02 Jul 2020 06:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org>
 <1593682763-31368-5-git-send-email-loic.poulain@linaro.org>
 <CAHLCerMra_a1CKRC=tZmC2OLEvp_AOdOqxSDf7QzDZC8fOjR9A@mail.gmail.com> <CAMZdPi-oJTH4tdvvi5PUHRHmP=2=PHpL4YV3nhO3fOLV=882rw@mail.gmail.com>
In-Reply-To: <CAMZdPi-oJTH4tdvvi5PUHRHmP=2=PHpL4YV3nhO3fOLV=882rw@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 2 Jul 2020 19:12:27 +0530
Message-ID: <CAP245DXEvD=ZX507FENHCmBhW+ecOOS3Q=GT+N01Fa-FHhL_jQ@mail.gmail.com>
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

On Thu, Jul 2, 2020 at 5:39 PM Loic Poulain <loic.poulain@linaro.org> wrote:
>
>
>
> On Thu, 2 Jul 2020 at 12:02, Amit Kucheria <amit.kucheria@linaro.org> wrote:
>>
>> On Thu, Jul 2, 2020 at 3:04 PM Loic Poulain <loic.poulain@linaro.org> wrote:
>> >

>> >                 };
>> >
>> > @@ -424,7 +449,7 @@
>> >                                 bits = <1 4>;
>> >                         };
>> >
>> > -                       gpu_speed_bin: gpu_speed_bin@133 {
>> > +                       speedbin_efuse: speedbin@133 {
>> >                                 reg = <0x133 0x1>;
>> >                                 bits = <5 3>;
>> >                         };
>> > @@ -642,7 +667,7 @@
>> >                         power-domains = <&mmcc GPU_GDSC>;
>> >                         iommus = <&adreno_smmu 0>;
>> >
>> > -                       nvmem-cells = <&gpu_speed_bin>;
>> > +                       nvmem-cells = <&speedbin_efuse>;
>> >                         nvmem-cell-names = "speed_bin";
>>
>> This bit changing the name of the node should be a separate patch, IMO.
>
>
> Well, I think it makes sense to change the name here since the new introduced
> cpu opp tables make use of the speedbin value as well, keeping gpu name would
> be misleading.

That is the point I'm making. This rename should be done earlier in
your series as a bug fix since obviously the node name is not just
related to gpu.

Then in this patch you just the corrected name.

>>
>> >                         qcom,gpu-quirk-two-pass-use-wfi;
>> > @@ -1703,8 +1728,9 @@
>> >                                 };
>> >                         };
>> >                 };
>> > +
>> >                 kryocc: clock-controller@6400000 {
>> > -                       compatible = "qcom,apcc-msm8996";
>> > +                       compatible = "qcom,msm8996-apcc";
>> >                         reg = <0x06400000 0x90000>;
>> >                         #clock-cells = <1>;
>> >                 };
>> > @@ -2172,6 +2198,229 @@
>> >         sound: sound {
>> >         };
>> >
>> > +       cluster0_opp: opp_table0 {
>> > +               compatible = "operating-points-v2-qcom-cpu";
>> > +               nvmem-cells = <&speedbin_efuse>;
>> > +               opp-shared;
>> > +
>> > +               /* Nominal fmax for now */
>> > +
>> > +               opp-307200000 {
>> > +                       opp-hz = /bits/ 64 <  307200000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-422400000 {
>> > +                       opp-hz = /bits/ 64 <  422400000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-480000000 {
>> > +                       opp-hz = /bits/ 64 <  480000000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-556800000 {
>> > +                       opp-hz = /bits/ 64 <  556800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-652800000 {
>> > +                       opp-hz = /bits/ 64 <  652800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-729600000 {
>> > +                       opp-hz = /bits/ 64 <  729600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-844800000 {
>> > +                       opp-hz = /bits/ 64 <  844800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-960000000 {
>> > +                       opp-hz = /bits/ 64 <  960000000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1036800000 {
>> > +                       opp-hz = /bits/ 64 < 1036800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1113600000 {
>> > +                       opp-hz = /bits/ 64 < 1113600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1190400000 {
>> > +                       opp-hz = /bits/ 64 < 1190400000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1228800000 {
>> > +                       opp-hz = /bits/ 64 < 1228800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1324800000 {
>> > +                       opp-hz = /bits/ 64 < 1324800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1401600000 {
>> > +                       opp-hz = /bits/ 64 < 1401600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1478400000 {
>> > +                       opp-hz = /bits/ 64 < 1478400000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1593600000 {
>> > +                       opp-hz = /bits/ 64 < 1593600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +       };
>> > +
>> > +       cluster1_opp: opp_table1 {
>> > +               compatible = "operating-points-v2-qcom-cpu";
>> > +               nvmem-cells = <&speedbin_efuse>;
>> > +               opp-shared;
>> > +
>> > +               /* Nominal fmax for now */
>> > +
>> > +               opp-307200000 {
>> > +                       opp-hz = /bits/ 64 <  307200000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-403200000 {
>> > +                       opp-hz = /bits/ 64 <  403200000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-480000000 {
>> > +                       opp-hz = /bits/ 64 <  480000000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-556800000 {
>> > +                       opp-hz = /bits/ 64 <  556800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-652800000 {
>> > +                       opp-hz = /bits/ 64 <  652800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-729600000 {
>> > +                       opp-hz = /bits/ 64 <  729600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-806400000 {
>> > +                       opp-hz = /bits/ 64 <  806400000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-883200000 {
>> > +                       opp-hz = /bits/ 64 <  883200000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-940800000 {
>> > +                       opp-hz = /bits/ 64 <  940800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1036800000 {
>> > +                       opp-hz = /bits/ 64 < 1036800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1113600000 {
>> > +                       opp-hz = /bits/ 64 < 1113600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1190400000 {
>> > +                       opp-hz = /bits/ 64 < 1190400000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1248000000 {
>> > +                       opp-hz = /bits/ 64 < 1248000000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1324800000 {
>> > +                       opp-hz = /bits/ 64 < 1324800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1401600000 {
>> > +                       opp-hz = /bits/ 64 < 1401600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1478400000 {
>> > +                       opp-hz = /bits/ 64 < 1478400000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1555200000 {
>> > +                       opp-hz = /bits/ 64 < 1555200000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1632000000 {
>> > +                       opp-hz = /bits/ 64 < 1632000000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1708800000 {
>> > +                       opp-hz = /bits/ 64 < 1708800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1785600000 {
>> > +                       opp-hz = /bits/ 64 < 1785600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1824000000 {
>> > +                       opp-hz = /bits/ 64 < 1824000000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1920000000 {
>> > +                       opp-hz = /bits/ 64 < 1920000000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-1996800000 {
>> > +                       opp-hz = /bits/ 64 < 1996800000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-2073600000 {
>> > +                       opp-hz = /bits/ 64 < 2073600000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +               opp-2150400000 {
>> > +                       opp-hz = /bits/ 64 < 2150400000 >;
>> > +                       opp-supported-hw = <0x77>;
>> > +                       clock-latency-ns = <200000>;
>> > +               };
>> > +       };
>> > +
>> >         thermal-zones {
>> >                 cpu0-thermal {
>> >                         polling-delay-passive = <250>;
>> > @@ -2180,18 +2429,33 @@
>> >                         thermal-sensors = <&tsens0 3>;
>> >
>> >                         trips {
>> > -                               cpu0_alert0: trip-point@0 {
>> > +                               cpu_alert0: cpu_alert0 {
>>
>> Please use the node name pattern we're using in some of the other dtsi
>> filenames for consistency. See sdm845.dtsi for an example.
>>
>> This also fixes dtsi warnings about address units, I suspect. So the
>> name change may be a separate patch just to fix the warnings, if you
>> want.
>
>
> Ok, rebasing on master now to get your changes.
>
>>
>>
>> >                                         temperature = <75000>;
>> >                                         hysteresis = <2000>;
>> > +                                       type = "active";
>>
>> We only need a passive trip type for cpufreq driven cooling. active
>> trip types are for driving fans and such.
>
>
> Right, will change that.
>
> Loic
