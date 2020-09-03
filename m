Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EB925C829
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 19:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgICRjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 13:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgICRjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 13:39:15 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A792CC061247
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 10:39:14 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id s62so2186697vsc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 10:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/CByT7kL2sciaOOTriM7Zuvl3yPAvDtzu36GjCZRW7A=;
        b=nok5vnFxkOP6s8+UOfVXBTxuEmKlGR/JJ0HOPPboWdedSdDQakkJ78Kz00j7Msafdt
         6V7nnuz5wqvTM9g/6kY2/J7HBCwJsAsY29ANtjl4mWRXPENKhMmQ9VCaWKm8Mo9iOSWi
         pCOVf0jhM19Y8Aa57obSXGvOKSYxFmYt7SywE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/CByT7kL2sciaOOTriM7Zuvl3yPAvDtzu36GjCZRW7A=;
        b=nf1NfN69QcaASZFYjEPDKJ36xrptVsZx1r4mbT2TxMlnp8sOTHGHoas+5Whkgol1FZ
         rGaZlA3tjEAUBCJ+C0W6kpTFxue1y4jiW21oDb864oFt1txjOUcOHq/L1ouG36tVz0U0
         0nLs4aV6srS8cXmUpYtghJbZLaZghdF8EuQq2M9IpF+MANOiCa4O0msbJo9rybdnUeTO
         nPEcTiiGarqgDJ34VWD7BMldYr2ehtkCyziOnUXFeem1P2OefYT3favFsHDbo89tdWPD
         nHBWz+OIf7X7IZiDvhPTTRMvN3Xw7HbfthxkhPrKjOZdEJap0M4N/gL+qPiKALnWLwNh
         qYfg==
X-Gm-Message-State: AOAM530GY4WMog4kfh3KLsw68hwV8zrZ698SBr0Ll3R2ZmfJExoa90oN
        GQr+nH6Ti8sHRffJco4uNi/NQ5nnj2vJlA==
X-Google-Smtp-Source: ABdhPJwzNON1u77h5KSSEHaKnenDSgyIWA8oVb/2/83U/joEckHytksNC0iqiqTSEnvC+AbGahueOw==
X-Received: by 2002:a67:33c4:: with SMTP id z187mr2486993vsz.0.1599154752253;
        Thu, 03 Sep 2020 10:39:12 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id j195sm620699vke.18.2020.09.03.10.39.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 10:39:11 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id i22so600966uat.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 10:39:11 -0700 (PDT)
X-Received: by 2002:a9f:2b89:: with SMTP id y9mr2304956uai.0.1599154750697;
 Thu, 03 Sep 2020 10:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200817144722.6665-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VE6vCPjDvvP0e73tnd8u5rPuMUa-mwvDazrfUpXP+bKQ@mail.gmail.com>
 <2a0c5fa189dbb2e810ba88f59621b65c@codeaurora.org> <CAD=FV=X8yS1gUNhhVNyfuRPzDUheG2Rco2g16KMegCG6fKJw7Q@mail.gmail.com>
 <d949bdfa15b133f74a47727401553c76@codeaurora.org> <7714ee57f75542839d5c33b28f232aa6@codeaurora.org>
 <CAD=FV=Xt0NTNjCEJ2USfyd2qZ+FfBz9xwctbpv+hSWvvCoAZFg@mail.gmail.com>
 <dd60dafcea8b75b10516bf2bc4952abb@codeaurora.org> <CAD=FV=WrEh9_XqOvA5mNYQRMDujOWBqeeDFDFj_C3XKy-okGVQ@mail.gmail.com>
 <2fe7e79f4fc877eb5d488d799fbf44d6@codeaurora.org>
In-Reply-To: <2fe7e79f4fc877eb5d488d799fbf44d6@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Sep 2020 10:38:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xbq6nv6t907XScJcfPDzB7B3LWtiT-f3RW3Pgg8uCAXg@mail.gmail.com>
Message-ID: <CAD=FV=Xbq6nv6t907XScJcfPDzB7B3LWtiT-f3RW3Pgg8uCAXg@mail.gmail.com>
Subject: Re: [PATCHv2] soc: qcom: llcc: Support chipsets that can write to
 llcc registers
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 3, 2020 at 9:04 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi,
>
> On 2020-09-03 21:24, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Sep 3, 2020 at 8:47 AM Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >> On 2020-09-03 19:16, Doug Anderson wrote:
> >> > Hi,
> >> >
> >> > On Thu, Sep 3, 2020 at 2:58 AM Sai Prakash Ranjan
> >> > <saiprakash.ranjan@codeaurora.org> wrote:
> >> >>
> >> >> Hi,
> >> >>
> >> >> On 2020-08-18 21:07, Sai Prakash Ranjan wrote:
> >> >> > Hi Doug,
> >> >> >
> >> >> >>
> >> >> >> I guess to start, it wasn't obvious (to me) that there were two
> >> >> >> choices and we were picking one.  Mentioning that the other
> >> >> >> alternative was way-based allocation would help a lot.  Even if =
you
> >> >> >> can't fully explain the differences between the two, adding some=
thing
> >> >> >> to the commit message indicating that this is a policy decision =
(in
> >> >> >> other words, both work but each have their tradeoffs) would help=
.
> >> >> >> Something like this, if it's correct:
> >> >> >>
> >> >> >> In general we try to enable capacity based allocation (instead o=
f the
> >> >> >> default way based allocation) since that gives us better perform=
ance
> >> >> >> with the current software / hardware configuration.
> >> >> >>
> >> >> >
> >> >> > Thanks, I will add it for next version. Let me also go poke some =
arch
> >> >> > teams
> >> >> > to understand if we actually do gain something with this selectio=
n, who
> >> >> > knows
> >> >> > we might get some additional details as well.
> >> >> >
> >> >>
> >> >> I got some information from arch team today, to quote them exactly:
> >> >>
> >> >> 1) What benefits capacity based allocation brings over the default =
way
> >> >> based allocation?
> >> >>
> >> >> "Capacity based allows finer grain partition. It is not about impro=
ved
> >> >> performance but more flexibility in configuration."
> >> >>
> >> >> 2) Retain through power collapse, doesn=E2=80=99t it burn more powe=
r?
> >> >>
> >> >> "This feature is similar to the standard feature of retention. Yes,
> >> >> when
> >> >> we
> >> >> have cache in retention mode it burns more power but it keeps the
> >> >> values
> >> >> so
> >> >> that when we wake up we can get more cache hits."
> >> >>
> >> >>
> >> >> If its good enough, then I will add this info to the commit msg and
> >> >> post
> >> >> next version.
> >> >
> >> > Sounds fine to me.  I was mostly looking for a high level idea of wh=
at
> >> > was happening here.  I am at least a little curious about the
> >> > retention bit.  Is that retention during S3, or during some sort of
> >> > Runtime PM?  Any idea how much power is burned?  Unless the power is
> >> > miniscule it seems hard to believe that it would be a net win to kee=
p
> >> > a cache powered up during S3 unless you're planning on waking up a
> >> > lot.
> >> >
> >>
> >> The retention setting is based on sub cache id(SCID), so I think its
> >> for
> >> runtime pm, the power numbers weren't provided. But I believe these
> >> decisions are made after solid testing and not some random
> >> approximations.
> >
> > Right, I believe it was tested, I just wonder if it was tested on a
> > phone vs. a laptop.  A phone is almost constantly waking up to deal
> > with stuff (which is why my phone battery barely lasts till the end of
> > the day).  Phones also usually have some type of self refresh on their
> > panels so they can be suspended even when they look awake which means
> > even more constant wakeups.  A laptop (especially without panel self
> > refresh) may have very different usage models.  I'm trying to confirm
> > that this setting is appropriate for both classes of devices or if it
> > has been only measured / optimized for the cell phone use case.
> >
>
> Could be, but there are windows laptops based on QCOM SoCs where these
> must have also been tested (note that this setting can also be in
> firmware
> and no one would know), but I don't have numbers to quantify.

OK, fair enough.  Thanks for the discussion.  I'm good with a somewhat
broad explanation in the commit message then and if we find that this
somehow affects power numbers in a bad way we can track down further.

-Doug
