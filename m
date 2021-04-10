Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77DB35AB37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 07:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbhDJFwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Apr 2021 01:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233606AbhDJFwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Apr 2021 01:52:31 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2106FC061762;
        Fri,  9 Apr 2021 22:52:17 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id m3so8920076edv.5;
        Fri, 09 Apr 2021 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZYOaVyBkrUpgFdOkrrPCPXje/e+nQsjc8jrXcFPI7Wo=;
        b=S3ROlRJDA0CrI1j4yvDkFZuk67wASpNR7mPYOzPJuiGZcmuUhr1MgDTY6pIcjyx6GG
         jZug5HHnhAJslGqgZHU2apaTQ8j8LBSEWHPcZJzauDVeCFiSAFVtOfWke9k5a7UV47Ny
         8pyFy6OEQgH20NSvlX07S7bfIglYxBu6LMuva609cMI4yQ1N9zWvdrpZvOy5a6rARKHM
         z/Bs5xsisl2vtVsatoWTNdMj2ACUde1oQQg1n6ZtI3iEiEznmF/z7IrdUv+LZHVqBQj2
         G6DiplONSx8Jfr4N9Tfa0MeMc6JEl7YSHzWLnfQ3oMGhLat9j1/Yoo3ZoLpzjvk6FVfP
         O+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZYOaVyBkrUpgFdOkrrPCPXje/e+nQsjc8jrXcFPI7Wo=;
        b=nQDWiSdtB2DEBP5/bO2SmzPq7xC5n8kM1+OMf8Ib8j5GTBGBgKxgwJCQ9uy+gL87vg
         cQH4ZFqqDyh9Ja3FKVgKsNSH7A58Web98paUws5mxYo3P8wnWQJmwADVH1rzDhn2QmoX
         krONlKW2hwFNT/FgwDyV9G+4i+buX+/sJF8JF26aqVWtjrZL4y9mJBuiYxfxKWmzNnV4
         vHKadY0xIb5+WM8Y7Q9tkZVbRq6WyipDFLZvVFJsGPjhPtk/jkDHmIFtf8n+wdLw6ule
         XtCFxLIZ9lqoJxjwbrNUNvpH/0rkCC2zcTC688AKb2QGOL84OIhAG5PgPj93pBwtuoop
         9Ozw==
X-Gm-Message-State: AOAM530U3WVYELS1ZQa5liyrNGPg7zCXRmtZIPQ31IKnfvPBo6THXCcd
        qofQMKfATTD5KwFrUTMu1/U=
X-Google-Smtp-Source: ABdhPJyJJaMOZlYGb5WCUVG+/EivFEAt5xSflzXs4aUkS26Q62YNAMdDmWC8kXBL6R7seOrzvuiAXQ==
X-Received: by 2002:a05:6402:3486:: with SMTP id v6mr20434799edc.109.1618033935713;
        Fri, 09 Apr 2021 22:52:15 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id 28sm2526881edw.82.2021.04.09.22.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 22:52:15 -0700 (PDT)
Date:   Sat, 10 Apr 2021 07:52:13 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Message-ID: <YHE9Df/Ztq7VaoK2@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
 <YG9TWEJlpDmNeeit@pevik>
 <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
 <YG/HwrzRcm7bwgFe@pevik>
 <20210409033726.GT904837@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409033726.GT904837@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Thu 08 Apr 22:19 CDT 2021, Petr Vorel wrote:

> > Hi Konrad,
> > > Hi,

> > > to clear up some confusion:


> > > On Qualcomm boards GPIOs that are used for "secure" (duh) peripherals,
> > > like a fingerprint scanner, are not allowed to be controlled from Linux (the "non-secure world").
> > > Trying to do so causes an immediate reboot due to "attempting to violate the security".
> > Thanks for an explanation.

> > > The GPIOs seem to all be iterated over on boot, except for the ones specified in "gpio-reserved-ranges".
> > > As a result, if such "secure" GPIOs are not declared in the DT, the board essentially dies on TLMM (pinctrl) probe
> > > (which happens veeeery early - so that all other peripherals can set the pins as they see fit)
> > > and that's very unpleasant to debug. Without this patch, Petr's device will simply not boot.
> > Exactly.

> > > So, why did it work before!?


> > > Well, either the GPIOs weren't iterated over, or the TLMM (pinctrl) driver wasn't in place back then.
> > I suppose GPIOs not being iterated over is the case for first fix (i.e. fixing
> > 3edfb7bd76bd "gpiolib: Show correct direction from the beginning").


> We had a long discussion about this in the past, and this resulted in
> gpio-reserved-ranges and flagging off GPIOs that shouldn't be touched.

> It seems we introduced the angler dts prior to said changes in the
> gpiolib, so it's probably right to say that it's a regression. However,
> the introduction of this was done 3 years ago and we're happy with it on
> all other devices.

> There's no harm in introducing this property prior to the introduction
> of the related gpiolib patches, so if you really care about it being backported
> I would suggest you say:

> Fixes: feeaf56ac78d ("arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support")
You're right. I'd also note that the problem manifested only after 3edfb7bd76bd.
But yes, that's a minor detail. Documenting precisely is good, because problem
is not solved yet due that second reset.

Konrad, is there any public docs about GPIOs on this secure peripherals?
It it somehow related to Chain of Trust? [1].  I guess it's not, because once we
boot Linux all bootloader stuff is over.

I guess with gpio-reserved-ranges = <85 4> I solved problems with gpiolib,
which controls tlmm, right?

Is there any other GPIO related setup?

BTW downstream kernel (3.10.73) uses gpiochip:

ls -la /sys/class/gpio/
gpiochip0 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpiochip0
gpiochip1005 -> ../../devices/soc.0/qpnp-pin-14/gpio/gpiochip1005
gpiochip1006 -> ../../devices/soc.0/qpnp-pin-13/gpio/gpiochip1006
gpiochip1008 -> ../../devices/soc.0/qpnp-pin-4/gpio/gpiochip1008
gpiochip1011 -> ../../devices/soc.0/qpnp-pin-3/gpio/gpiochip1011
gpiochip685 -> ../../devices/soc.0/qcom,smp2pgpio-ssr-smp2p-1-out.16/gpio/gpiochip685
gpiochip717 -> ../../devices/soc.0/qcom,smp2pgpio-ssr-smp2p-1-in.15/gpio/gpiochip717
gpiochip749 -> ../../devices/soc.0/qcom,smp2pgpio-ssr-smp2p-2-out.14/gpio/gpiochip749
gpiochip781 -> ../../devices/soc.0/qcom,smp2pgpio-ssr-smp2p-2-in.13/gpio/gpiochip781
gpiochip813 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-2-out.11/gpio/gpiochip813
gpiochip845 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-2-in.9/gpio/gpiochip845
gpiochip877 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-1-out.7/gpio/gpiochip877
gpiochip909 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-1-in.5/gpio/gpiochip909
gpiochip941 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-7-out.3/gpio/gpiochip941
gpiochip973 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-7-in.1/gpio/gpiochip973

After /sys/class/gpio/export of 0-2 5-84 89-146 it looks like:

for i in $(seq 0 2) $(seq 5 84) $(seq 89 146); do echo $i > /sys/class/gpio/export; sleep 1; done
ls -la /sys/class/gpio/
gpio0 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio0
gpio1 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio1
gpio2 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio2
gpio5 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio5
gpio6 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio6
gpio7 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio7
gpio10 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio10
gpio11 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio11
gpio12 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio12
gpio13 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio13
gpio14 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio14
gpio15 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio15
gpio17 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio17
gpio18 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio18
gpio91 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio91
gpio92 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio92
gpio95 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio95
gpio97 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio97
gpio98 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio98
gpio99 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio99
gpio100 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio100
gpio101 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio101
gpio103 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio103
gpio104 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio104
gpio105 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio105
gpio106 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio106
gpio107 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio107
gpio109 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio109
gpio110 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio110
gpio111 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio111
gpio112 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio112
gpio114 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio114
gpio115 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio115
gpio116 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio116
gpio117 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio117
gpio118 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio118
gpio119 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio119
gpio120 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio120
gpio121 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio121
gpio122 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio122
gpio123 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio123
gpio124 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio124
gpio125 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio125
gpio126 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio126
gpio127 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio127
gpio128 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio128
gpio129 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio129
gpio130 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio130
gpio131 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio131
gpio132 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio132
gpio133 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio133
gpio134 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio134
gpio135 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio135
gpio136 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio136
gpio137 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio137
gpio138 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio138
gpio139 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio139
gpio140 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio140
gpio141 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio141
gpio142 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio142
gpio143 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio143
gpio144 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio144
gpio145 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpio145
gpiochip0 -> ../../devices/soc.0/fd510000.pinctrl/gpio/gpiochip0
gpiochip685 -> ../../devices/soc.0/qcom,smp2pgpio-ssr-smp2p-1-out.16/gpio/gpiochip685
gpiochip717 -> ../../devices/soc.0/qcom,smp2pgpio-ssr-smp2p-1-in.15/gpio/gpiochip717
gpiochip749 -> ../../devices/soc.0/qcom,smp2pgpio-ssr-smp2p-2-out.14/gpio/gpiochip749
gpiochip781 -> ../../devices/soc.0/qcom,smp2pgpio-ssr-smp2p-2-in.13/gpio/gpiochip781
gpiochip813 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-2-out.11/gpio/gpiochip813
gpiochip845 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-2-in.9/gpio/gpiochip845
gpiochip877 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-1-out.7/gpio/gpiochip877
gpiochip909 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-1-in.5/gpio/gpiochip909
gpiochip941 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-7-out.3/gpio/gpiochip941
gpiochip973 -> ../../devices/soc.0/qcom,smp2pgpio-smp2p-7-in.1/gpio/gpiochip973
gpiochip1005 -> ../../devices/soc.0/qpnp-pin-14/gpio/gpiochip1005
gpiochip1006 -> ../../devices/soc.0/qpnp-pin-13/gpio/gpiochip1006
gpiochip1008 -> ../../devices/soc.0/qpnp-pin-4/gpio/gpiochip1008
gpiochip1011 -> ../../devices/soc.0/qpnp-pin-3/gpio/gpiochip1011

Kind regards,
Petr

[1] https://lineageos.org/engineering/Qualcomm-Firmware/

> But I presume based on the awesome work you guys are putting into the
> 8994 platform people shouldn't run "old" kernels anyways, so I think it
> would be fine with us just ignoring the Fixes as well...

> Regards,
> Bjorn
