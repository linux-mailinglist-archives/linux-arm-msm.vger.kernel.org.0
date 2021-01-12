Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852D02F32D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 15:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbhALOXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 09:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbhALOXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 09:23:32 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13D1C061786
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 06:22:51 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id x13so2482281oic.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 06:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jb8rjsMM4lZHDV6AkHr3Gc22JovujP1aAnGakguP13Q=;
        b=luvEn02nzHcSPhycLX3M3wtrM6EoHF1KJj9wYqgksxc97aXikA4KDmUZe614hIxk1u
         S+CKzGtJOf/bSUFFt9RjOrN7DPMMC2pXj44d+KM2KNXABbkQyfDIoeMJpferd1TMbJxX
         cTT9Q5DqoTh7UaigKtsmJ9LFRiyZAF5eDC7xOA3xXofcRAc5LohPaJOKLjDwQvMTD9iB
         o46ZlVTX1a/d6uMEgwafeWSFnBU4FOM9d58hOxWP6/l0eazS8qPiT5U9A8RAPtPwCxOb
         zUHxkYzOUH3pSBqs8FWwazFRgyhNsFAXu1Co2IwzMUkv+I2QkeFM7Nmk7EHgrLV8kts/
         Y1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jb8rjsMM4lZHDV6AkHr3Gc22JovujP1aAnGakguP13Q=;
        b=DLtxtUWTzuqtgiQc+WcM3fwRCs9CAMd95rr9oplTQBqlcg6jVTHMrCEpkpn6h3VN1A
         ZWZ4bEl1Fx9d3B8kSQ4lkubxZ2Xi+sBLn7G6A6XAaUpHHKvXYn+g1QMucWUJsknwkf5n
         fW+hXOSkr6MmA3HX3Oh60HzchlirDSbqbCxdDhwiPeA6uHr/UdCv6lzWz4r79Tja+mio
         o27yjmYumivf4luC7vefEaZ5wb9bhjh3j/b85xjmM9qMQE1KX8IfL8skx8YqMfmjWB/x
         MbWMggHxcC+0PPNkj4EgJnisJlensJtP4EGcpki5rHFq+5MimdZvBBxV2nHJcAP/mfT4
         suww==
X-Gm-Message-State: AOAM5318LUApd8pM6PCQIs1rPRGjKolkJuzHLig1t6v47cVcxqzLF0T8
        VnVvDBUmDonbPn+kkOOgFUIpUw==
X-Google-Smtp-Source: ABdhPJyPqqPfXhYCxH5fOX5XjaFTVDexSRPqfbdA+S155X7ev3YJOYVoDfzgxIP1TqE+LDR7tRgr7g==
X-Received: by 2002:aca:af8f:: with SMTP id y137mr1949137oie.135.1610461371208;
        Tue, 12 Jan 2021 06:22:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 31sm651002otd.24.2021.01.12.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 06:22:50 -0800 (PST)
Date:   Tue, 12 Jan 2021 08:22:48 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add support for deep CPU
 cluster idle
Message-ID: <X/2wuPeaDYPBjVEd@builder.lan>
References: <20210105201000.913183-1-danny@kdrag0n.dev>
 <X/Tw13VgA5fOnlCV@ripper>
 <CAPDyKFru7X1Wi3EUBoy-EVaxJ+-rTdhhtArJ9P5RC1ZMak9U+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFru7X1Wi3EUBoy-EVaxJ+-rTdhhtArJ9P5RC1ZMak9U+A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 Jan 04:09 CST 2021, Ulf Hansson wrote:

> + Lina
> 
> On Wed, 6 Jan 2021 at 00:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 05 Jan 12:10 PST 2021, Danny Lin wrote:
> >
> > > This commit adds support for deep idling of the entire unified DynamIQ
> > > CPU cluster on sm8150. In this idle state, the LLCC (Last-Level Cache
> > > Controller) is powered off and the AOP (Always-On Processor) enters a
> > > low-power sleep state.
> > >
> > > I'm not sure what the per-CPU 0x400000f4 idle state previously
> > > contributed by Qualcomm as the "cluster sleep" state is, but the
> > > downstream kernel has no such state. The real deep cluster idle state
> > > is 0x41000c244, composed of:
> > >
> > >     Cluster idle state: (0xc24) << 4 = 0xc240
> > >     Is reset state: 1 << 30 = 0x40000000
> > >     Affinity level: 1 << 24 = 0x1000000
> > >     CPU idle state: 0x4 (power collapse)
> > >
> > > This setup can be replicated with the PSCI power domain cpuidle driver,
> > > which utilizes OSI to enter cluster idle when the last active CPU
> > > enters idle.
> > >
> > > The cluster idle state cannot be used as a plain cpuidle state because
> > > it requires that all CPUs in the cluster are idling.
> > >
> >
> > This looks quite reasonable to me.
> >
> > @Ulf, this seems to be the first attempt at wiring up the domain idle
> > pieces upstream, would you mind having a look?
> 
> Certainly I can have a look, but I could find the original posted
> patch. I had a look at the below changes and it looks good to me. Feel
> free to add my reviewed-by tag for it.
> 

Thank you.

> Also note, the db410c was the first one to support this as introduced
> in commit e37131556801 for v5.6. You may have a look at
> arch/arm64/boot/dts/qcom/msm8916.dtsi.
> 

For some reason I failed to find that commit while looking for your work
on the subject, thanks for pointing it out!

Regards,
Bjorn

> Kind regards
> Uffe
> 
> >
> > The SM8150 pretty much identical to RB3 in this regard.
> >
> > Regards,
> > Bjorn
> >
> > > Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 91 ++++++++++++++++++++++------
> > >  1 file changed, 73 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > index 309e00b6fa44..8956c6986744 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > @@ -52,10 +52,10 @@ CPU0: cpu@0 {
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <488>;
> > >                       dynamic-power-coefficient = <232>;
> > > -                     cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > > -                                        &CLUSTER_SLEEP_0>;
> > >                       next-level-cache = <&L2_0>;
> > >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > > +                     power-domains = <&CPU_PD0>;
> > > +                     power-domain-names = "psci";
> > >                       #cooling-cells = <2>;
> > >                       L2_0: l2-cache {
> > >                               compatible = "cache";
> > > @@ -73,10 +73,10 @@ CPU1: cpu@100 {
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <488>;
> > >                       dynamic-power-coefficient = <232>;
> > > -                     cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > > -                                        &CLUSTER_SLEEP_0>;
> > >                       next-level-cache = <&L2_100>;
> > >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > > +                     power-domains = <&CPU_PD1>;
> > > +                     power-domain-names = "psci";
> > >                       #cooling-cells = <2>;
> > >                       L2_100: l2-cache {
> > >                               compatible = "cache";
> > > @@ -92,10 +92,10 @@ CPU2: cpu@200 {
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <488>;
> > >                       dynamic-power-coefficient = <232>;
> > > -                     cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > > -                                        &CLUSTER_SLEEP_0>;
> > >                       next-level-cache = <&L2_200>;
> > >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > > +                     power-domains = <&CPU_PD2>;
> > > +                     power-domain-names = "psci";
> > >                       #cooling-cells = <2>;
> > >                       L2_200: l2-cache {
> > >                               compatible = "cache";
> > > @@ -110,10 +110,10 @@ CPU3: cpu@300 {
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <488>;
> > >                       dynamic-power-coefficient = <232>;
> > > -                     cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > > -                                        &CLUSTER_SLEEP_0>;
> > >                       next-level-cache = <&L2_300>;
> > >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > > +                     power-domains = <&CPU_PD3>;
> > > +                     power-domain-names = "psci";
> > >                       #cooling-cells = <2>;
> > >                       L2_300: l2-cache {
> > >                               compatible = "cache";
> > > @@ -128,10 +128,10 @@ CPU4: cpu@400 {
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <1024>;
> > >                       dynamic-power-coefficient = <369>;
> > > -                     cpu-idle-states = <&BIG_CPU_SLEEP_0
> > > -                                        &CLUSTER_SLEEP_0>;
> > >                       next-level-cache = <&L2_400>;
> > >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > > +                     power-domains = <&CPU_PD4>;
> > > +                     power-domain-names = "psci";
> > >                       #cooling-cells = <2>;
> > >                       L2_400: l2-cache {
> > >                               compatible = "cache";
> > > @@ -146,10 +146,10 @@ CPU5: cpu@500 {
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <1024>;
> > >                       dynamic-power-coefficient = <369>;
> > > -                     cpu-idle-states = <&BIG_CPU_SLEEP_0
> > > -                                        &CLUSTER_SLEEP_0>;
> > >                       next-level-cache = <&L2_500>;
> > >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > > +                     power-domains = <&CPU_PD5>;
> > > +                     power-domain-names = "psci";
> > >                       #cooling-cells = <2>;
> > >                       L2_500: l2-cache {
> > >                               compatible = "cache";
> > > @@ -164,10 +164,10 @@ CPU6: cpu@600 {
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <1024>;
> > >                       dynamic-power-coefficient = <369>;
> > > -                     cpu-idle-states = <&BIG_CPU_SLEEP_0
> > > -                                        &CLUSTER_SLEEP_0>;
> > >                       next-level-cache = <&L2_600>;
> > >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > > +                     power-domains = <&CPU_PD6>;
> > > +                     power-domain-names = "psci";
> > >                       #cooling-cells = <2>;
> > >                       L2_600: l2-cache {
> > >                               compatible = "cache";
> > > @@ -182,10 +182,10 @@ CPU7: cpu@700 {
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <1024>;
> > >                       dynamic-power-coefficient = <421>;
> > > -                     cpu-idle-states = <&BIG_CPU_SLEEP_0
> > > -                                        &CLUSTER_SLEEP_0>;
> > >                       next-level-cache = <&L2_700>;
> > >                       qcom,freq-domain = <&cpufreq_hw 2>;
> > > +                     power-domains = <&CPU_PD7>;
> > > +                     power-domain-names = "psci";
> > >                       #cooling-cells = <2>;
> > >                       L2_700: l2-cache {
> > >                               compatible = "cache";
> > > @@ -251,11 +251,13 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> > >                               min-residency-us = <4488>;
> > >                               local-timer-stop;
> > >                       };
> > > +             };
> > >
> > > +             domain-idle-states {
> > >                       CLUSTER_SLEEP_0: cluster-sleep-0 {
> > > -                             compatible = "arm,idle-state";
> > > +                             compatible = "domain-idle-state";
> > >                               idle-state-name = "cluster-power-collapse";
> > > -                             arm,psci-suspend-param = <0x400000F4>;
> > > +                             arm,psci-suspend-param = <0x4100c244>;
> > >                               entry-latency-us = <3263>;
> > >                               exit-latency-us = <6562>;
> > >                               min-residency-us = <9987>;
> > > @@ -291,6 +293,59 @@ pmu {
> > >       psci {
> > >               compatible = "arm,psci-1.0";
> > >               method = "smc";
> > > +
> > > +             CPU_PD0: cpu0 {
> > > +                     #power-domain-cells = <0>;
> > > +                     power-domains = <&CLUSTER_PD>;
> > > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > > +             };
> > > +
> > > +             CPU_PD1: cpu1 {
> > > +                     #power-domain-cells = <0>;
> > > +                     power-domains = <&CLUSTER_PD>;
> > > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > > +             };
> > > +
> > > +             CPU_PD2: cpu2 {
> > > +                     #power-domain-cells = <0>;
> > > +                     power-domains = <&CLUSTER_PD>;
> > > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > > +             };
> > > +
> > > +             CPU_PD3: cpu3 {
> > > +                     #power-domain-cells = <0>;
> > > +                     power-domains = <&CLUSTER_PD>;
> > > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > > +             };
> > > +
> > > +             CPU_PD4: cpu4 {
> > > +                     #power-domain-cells = <0>;
> > > +                     power-domains = <&CLUSTER_PD>;
> > > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > > +             };
> > > +
> > > +             CPU_PD5: cpu5 {
> > > +                     #power-domain-cells = <0>;
> > > +                     power-domains = <&CLUSTER_PD>;
> > > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > > +             };
> > > +
> > > +             CPU_PD6: cpu6 {
> > > +                     #power-domain-cells = <0>;
> > > +                     power-domains = <&CLUSTER_PD>;
> > > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > > +             };
> > > +
> > > +             CPU_PD7: cpu7 {
> > > +                     #power-domain-cells = <0>;
> > > +                     power-domains = <&CLUSTER_PD>;
> > > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > > +             };
> > > +
> > > +             CLUSTER_PD: cpu-cluster0 {
> > > +                     #power-domain-cells = <0>;
> > > +                     domain-idle-states = <&CLUSTER_SLEEP_0>;
> > > +             };
> > >       };
> > >
> > >       reserved-memory {
> > > --
> > > 2.29.2
> > >
