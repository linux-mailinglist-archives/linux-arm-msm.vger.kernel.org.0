Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D00A40EB65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 22:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237253AbhIPUMB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 16:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbhIPUMB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 16:12:01 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D5DC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 13:10:40 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id p80so2816507iod.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wu/5meqeHZqsVUKSjtYxX+ZcUZzqTdvsMcCN8QTUfPI=;
        b=J/r8x5aEqy8Zz1boK1o6nPUUBlaotFj7ta5KZX5ZUTU5V0joZCkMVqLukEG5o2CDDk
         IVID5A72jCCD+Xg9jI5DoVDUwa1QDhwIiBMW2+o4wK3uG3/LJVtwPKoAthIRAgnvHQcp
         4yUtKUO4Zzw0lMANMOZYcwKnxXr32rOTNAEuvtJPnykVE5wjUjKT/K2R3mjQDKTwO1sN
         ueIG2ajmmuh1zgQ3rNJ/HeqcL0yTz/ulLTcW8cXB66dQ9gN7Hh4rLciGmmB6lxJl7LYF
         gt/rTSDsCE5SWza8KETcR2wVib5qQIrw9UkkjjrKK3xMMu7VB7WUE/Rcyg7Kim5QVxhR
         sWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wu/5meqeHZqsVUKSjtYxX+ZcUZzqTdvsMcCN8QTUfPI=;
        b=GP5B/mJ3yVQioKRPiXyfj4eDTVSv/W2L2qYC0lpKTmkKgDwKU4uBX3+ve8kRt/ykPY
         qvFzqh/5fivgnC0bLLmWYJCXeND/5dqxiFuyPMoOybK93XmVb2BjHeCUGl+c+oGyZlN0
         oYhntiQWFbum2D+slLhsWRx9okDUMErTtBRKtpXJUyqfd+tXsgAVSn9vu+3z2apxFyJx
         ZT8umovfBaE7l5kpMBfZvWEq14CwAWGXu4LPoQGfXcr/gZh+aCo9Ii9EafkaKRYm4D6K
         5rEgi6A38u1TE+SFERqzYeK+fJmrlZswe/DrmHeCbx61b5eY3hFw6C9leqXz4b9uFzmO
         91Mw==
X-Gm-Message-State: AOAM533cSH2dEiERzAujtnzCAiKtS23rqX2D86wL7cIYtNR/gcCqOOic
        HepdBKzL96lwZWWHvcnrt0sjqaJF2hlhOvWCpJ+H5w==
X-Google-Smtp-Source: ABdhPJz7Kg81nthb06WDU+z8rueH0TLTwNaN9xl5YeWzadsfmddf39Ly2LGb7sxy58ZaG3ZW/Opk9vAlZ6fYEjD4NQw=
X-Received: by 2002:a6b:8bcf:: with SMTP id n198mr5846212iod.178.1631823039559;
 Thu, 16 Sep 2021 13:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210615232816.835325-1-bjorn.andersson@linaro.org>
 <CAMi1Hd0hZV7antTa7ShKvfS5CRxRei4TNycM9EJ9NR5qEBJV7g@mail.gmail.com> <YUNbntpsxISYxOro@ripper>
In-Reply-To: <YUNbntpsxISYxOro@ripper>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 17 Sep 2021 01:40:03 +0530
Message-ID: <CAMi1Hd2y8CG8Vy--b6dG7UiVKAfG+X71Ofe9Woqg_K6F3_Tn_w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-yoga: Enable IPA
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Sept 2021 at 20:27, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 16 Sep 03:52 PDT 2021, Amit Pundir wrote:
>
> > Hi Bjorn,
> >
> > On Wed, 16 Jun 2021 at 04:58, Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > Shuffle memory regions to make firmware loading succeed and then enable
> > > the ipa device.
> >
> > Just a heads-up, this reserved memory region shuffling in sdm845.dtsi
> > broke PocoF1 and may be other devices too(?) which do not override
> > these regions.
> >
>
> Thanks for the report!
>
> > IIRC you once had a patch to move the reserved memory regions to board
> > specific dts files, is it still on the cards so that we don't run into
> > breakages like this?
> >
>
> As you might remember the feedback I got was to not move the regions to
> the individual devices and it was better to just deal with the problem
> this way...
>
> But apparently I was too optimistic and should have played the usual
> game of deleting the inherited nodes and made the changes in the yoga
> dts...
>
> > Meanwhile I'll go and add these regions in sdm845-xiaomi-beryllium.dts.
> >
>
> Let's prepare a fix that moves this change into the yoga.dts and get
> that landed asap.

Done https://patchwork.kernel.org/project/linux-arm-msm/patch/20210916200554.2434439-1-amit.pundir@linaro.org/

Smoke tested on PocoF1 only.

>
> Regards,
> Bjorn
>
> > Regards,
> > Amit Pundir
> >
> >
> >
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 21 +++++++------------
> > >  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  5 +++++
> > >  2 files changed, 13 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 1796ae8372be..49624eadce84 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -128,28 +128,23 @@ camera_mem: memory@8bf00000 {
> > >                         no-map;
> > >                 };
> > >
> > > -               ipa_fw_mem: memory@8c400000 {
> > > -                       reg = <0 0x8c400000 0 0x10000>;
> > > +               wlan_msa_mem: memory@8c400000 {
> > > +                       reg = <0 0x8c400000 0 0x100000>;
> > >                         no-map;
> > >                 };
> > >
> > > -               ipa_gsi_mem: memory@8c410000 {
> > > -                       reg = <0 0x8c410000 0 0x5000>;
> > > +               gpu_mem: memory@8c515000 {
> > > +                       reg = <0 0x8c515000 0 0x2000>;
> > >                         no-map;
> > >                 };
> > >
> > > -               gpu_mem: memory@8c415000 {
> > > -                       reg = <0 0x8c415000 0 0x2000>;
> > > +               ipa_fw_mem: memory@8c517000 {
> > > +                       reg = <0 0x8c517000 0 0x5a000>;
> > >                         no-map;
> > >                 };
> > >
> > > -               adsp_mem: memory@8c500000 {
> > > -                       reg = <0 0x8c500000 0 0x1a00000>;
> > > -                       no-map;
> > > -               };
> > > -
> > > -               wlan_msa_mem: memory@8df00000 {
> > > -                       reg = <0 0x8df00000 0 0x100000>;
> > > +               adsp_mem: memory@8c600000 {
> > > +                       reg = <0 0x8c600000 0 0x1a00000>;
> > >                         no-map;
> > >                 };
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > index c2a709a384e9..3eaa42dc3794 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > @@ -415,6 +415,11 @@ ecsh: hid@5c {
> > >         };
> > >  };
> > >
> > > +&ipa {
> > > +       status = "okay";
> > > +       memory-region = <&ipa_fw_mem>;
> > > +};
> > > +
> > >  &mdss {
> > >         status = "okay";
> > >  };
> > > --
> > > 2.31.0
> > >
