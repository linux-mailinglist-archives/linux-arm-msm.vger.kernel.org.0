Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F072F2C4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 11:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389718AbhALKKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 05:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731778AbhALKKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 05:10:48 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A13C061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 02:10:08 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id i25so648963uat.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0KBkFKcqYJyDwWvmH0F1hYdVhLyFga458qwDSioxrdY=;
        b=XcOlL6LiNpa/Y7ObZMYorZOffTc/3P8XzDasGgC89hb/4cU4H8N8lwY0YZunsKrJXO
         0OVI/C80Ag+Y/j9IAI+IuEwpo/+MAytvUpe73powIDGyXjtnBHzMwWCW1aSA3pMlMvZ3
         GvaCzjKLazvdNT7+1TEYhx5baMo/j1WOmTdaykGbxBEnDgD5yQv3axK9BPvG17IWMQTl
         INWmGKErXcP4FDFE+ev8gZDnSA86RFH0gZ1xlySNV34UC/oLUqR/gtbriItguFX/AR3b
         /7D/p7wzkM/aVJPlWMRl/6VlvtP9NtvtUZ0eEYKcUGcJNDWWnWVBgutO3ghlA0Z+BF/x
         SHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0KBkFKcqYJyDwWvmH0F1hYdVhLyFga458qwDSioxrdY=;
        b=DiUblZywi0CZ7fVmuxJ+AIUhPkHMVP/wIS2llASFz6F1YPJpiMcyMBIehBNuqYgY+/
         ij/Ru26pXjVXfQQ8jAZK9n1ruIq5stvLNjeMvIfspVMJZcRffjRgl1P72Vfu0MioL3vF
         kjHonc2C0p2weZZl/ngcjAxaoZXcwJlibbHDsOlts+RO8+HDzdColvV0qJm3EtWVAfhL
         OdPABX9Drt/ghtL32x+DfC+f8XquUhgNs94xzKpqnx+Lg6/tDgqcZy18xwDiOSWf/soM
         EuYgyVcunhGFcDrKFMgmKOCBwkbp3G2wihGh+CEDFI/NRbfu04T13g2Z5FaWdLmTFTjW
         g/lg==
X-Gm-Message-State: AOAM531KEBqDlVIdhZG8ptKqLSo/TSEljxL7zEjQa05gOToX/fw82qdF
        f8okiRnxFBB8DMiLr4csUR8oelHNrfRd6SZ165cTci8T9zKTrzV3
X-Google-Smtp-Source: ABdhPJy5ycn3mTJh3aH+1AxzD1HQaf8x4911qhbSvb4tLZsn7l31Xqm29NKxgPk4vT9eUh1BYRBGt/0/j7o/PALPaSQ=
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr2864130uaa.104.1610446207337;
 Tue, 12 Jan 2021 02:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20210105201000.913183-1-danny@kdrag0n.dev> <X/Tw13VgA5fOnlCV@ripper>
In-Reply-To: <X/Tw13VgA5fOnlCV@ripper>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jan 2021 11:09:31 +0100
Message-ID: <CAPDyKFru7X1Wi3EUBoy-EVaxJ+-rTdhhtArJ9P5RC1ZMak9U+A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add support for deep CPU
 cluster idle
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Danny Lin <danny@kdrag0n.dev>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Lina

On Wed, 6 Jan 2021 at 00:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Tue 05 Jan 12:10 PST 2021, Danny Lin wrote:
>
> > This commit adds support for deep idling of the entire unified DynamIQ
> > CPU cluster on sm8150. In this idle state, the LLCC (Last-Level Cache
> > Controller) is powered off and the AOP (Always-On Processor) enters a
> > low-power sleep state.
> >
> > I'm not sure what the per-CPU 0x400000f4 idle state previously
> > contributed by Qualcomm as the "cluster sleep" state is, but the
> > downstream kernel has no such state. The real deep cluster idle state
> > is 0x41000c244, composed of:
> >
> >     Cluster idle state: (0xc24) << 4 = 0xc240
> >     Is reset state: 1 << 30 = 0x40000000
> >     Affinity level: 1 << 24 = 0x1000000
> >     CPU idle state: 0x4 (power collapse)
> >
> > This setup can be replicated with the PSCI power domain cpuidle driver,
> > which utilizes OSI to enter cluster idle when the last active CPU
> > enters idle.
> >
> > The cluster idle state cannot be used as a plain cpuidle state because
> > it requires that all CPUs in the cluster are idling.
> >
>
> This looks quite reasonable to me.
>
> @Ulf, this seems to be the first attempt at wiring up the domain idle
> pieces upstream, would you mind having a look?

Certainly I can have a look, but I could find the original posted
patch. I had a look at the below changes and it looks good to me. Feel
free to add my reviewed-by tag for it.

Also note, the db410c was the first one to support this as introduced
in commit e37131556801 for v5.6. You may have a look at
arch/arm64/boot/dts/qcom/msm8916.dtsi.

Kind regards
Uffe

>
> The SM8150 pretty much identical to RB3 in this regard.
>
> Regards,
> Bjorn
>
> > Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 91 ++++++++++++++++++++++------
> >  1 file changed, 73 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 309e00b6fa44..8956c6986744 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -52,10 +52,10 @@ CPU0: cpu@0 {
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <488>;
> >                       dynamic-power-coefficient = <232>;
> > -                     cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > -                                        &CLUSTER_SLEEP_0>;
> >                       next-level-cache = <&L2_0>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > +                     power-domains = <&CPU_PD0>;
> > +                     power-domain-names = "psci";
> >                       #cooling-cells = <2>;
> >                       L2_0: l2-cache {
> >                               compatible = "cache";
> > @@ -73,10 +73,10 @@ CPU1: cpu@100 {
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <488>;
> >                       dynamic-power-coefficient = <232>;
> > -                     cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > -                                        &CLUSTER_SLEEP_0>;
> >                       next-level-cache = <&L2_100>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > +                     power-domains = <&CPU_PD1>;
> > +                     power-domain-names = "psci";
> >                       #cooling-cells = <2>;
> >                       L2_100: l2-cache {
> >                               compatible = "cache";
> > @@ -92,10 +92,10 @@ CPU2: cpu@200 {
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <488>;
> >                       dynamic-power-coefficient = <232>;
> > -                     cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > -                                        &CLUSTER_SLEEP_0>;
> >                       next-level-cache = <&L2_200>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > +                     power-domains = <&CPU_PD2>;
> > +                     power-domain-names = "psci";
> >                       #cooling-cells = <2>;
> >                       L2_200: l2-cache {
> >                               compatible = "cache";
> > @@ -110,10 +110,10 @@ CPU3: cpu@300 {
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <488>;
> >                       dynamic-power-coefficient = <232>;
> > -                     cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > -                                        &CLUSTER_SLEEP_0>;
> >                       next-level-cache = <&L2_300>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > +                     power-domains = <&CPU_PD3>;
> > +                     power-domain-names = "psci";
> >                       #cooling-cells = <2>;
> >                       L2_300: l2-cache {
> >                               compatible = "cache";
> > @@ -128,10 +128,10 @@ CPU4: cpu@400 {
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <1024>;
> >                       dynamic-power-coefficient = <369>;
> > -                     cpu-idle-states = <&BIG_CPU_SLEEP_0
> > -                                        &CLUSTER_SLEEP_0>;
> >                       next-level-cache = <&L2_400>;
> >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > +                     power-domains = <&CPU_PD4>;
> > +                     power-domain-names = "psci";
> >                       #cooling-cells = <2>;
> >                       L2_400: l2-cache {
> >                               compatible = "cache";
> > @@ -146,10 +146,10 @@ CPU5: cpu@500 {
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <1024>;
> >                       dynamic-power-coefficient = <369>;
> > -                     cpu-idle-states = <&BIG_CPU_SLEEP_0
> > -                                        &CLUSTER_SLEEP_0>;
> >                       next-level-cache = <&L2_500>;
> >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > +                     power-domains = <&CPU_PD5>;
> > +                     power-domain-names = "psci";
> >                       #cooling-cells = <2>;
> >                       L2_500: l2-cache {
> >                               compatible = "cache";
> > @@ -164,10 +164,10 @@ CPU6: cpu@600 {
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <1024>;
> >                       dynamic-power-coefficient = <369>;
> > -                     cpu-idle-states = <&BIG_CPU_SLEEP_0
> > -                                        &CLUSTER_SLEEP_0>;
> >                       next-level-cache = <&L2_600>;
> >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > +                     power-domains = <&CPU_PD6>;
> > +                     power-domain-names = "psci";
> >                       #cooling-cells = <2>;
> >                       L2_600: l2-cache {
> >                               compatible = "cache";
> > @@ -182,10 +182,10 @@ CPU7: cpu@700 {
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <1024>;
> >                       dynamic-power-coefficient = <421>;
> > -                     cpu-idle-states = <&BIG_CPU_SLEEP_0
> > -                                        &CLUSTER_SLEEP_0>;
> >                       next-level-cache = <&L2_700>;
> >                       qcom,freq-domain = <&cpufreq_hw 2>;
> > +                     power-domains = <&CPU_PD7>;
> > +                     power-domain-names = "psci";
> >                       #cooling-cells = <2>;
> >                       L2_700: l2-cache {
> >                               compatible = "cache";
> > @@ -251,11 +251,13 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> >                               min-residency-us = <4488>;
> >                               local-timer-stop;
> >                       };
> > +             };
> >
> > +             domain-idle-states {
> >                       CLUSTER_SLEEP_0: cluster-sleep-0 {
> > -                             compatible = "arm,idle-state";
> > +                             compatible = "domain-idle-state";
> >                               idle-state-name = "cluster-power-collapse";
> > -                             arm,psci-suspend-param = <0x400000F4>;
> > +                             arm,psci-suspend-param = <0x4100c244>;
> >                               entry-latency-us = <3263>;
> >                               exit-latency-us = <6562>;
> >                               min-residency-us = <9987>;
> > @@ -291,6 +293,59 @@ pmu {
> >       psci {
> >               compatible = "arm,psci-1.0";
> >               method = "smc";
> > +
> > +             CPU_PD0: cpu0 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD1: cpu1 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD2: cpu2 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD3: cpu3 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD4: cpu4 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD5: cpu5 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD6: cpu6 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD7: cpu7 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CLUSTER_PD: cpu-cluster0 {
> > +                     #power-domain-cells = <0>;
> > +                     domain-idle-states = <&CLUSTER_SLEEP_0>;
> > +             };
> >       };
> >
> >       reserved-memory {
> > --
> > 2.29.2
> >
