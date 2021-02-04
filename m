Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E8E30F134
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 11:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235436AbhBDKvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 05:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235443AbhBDKvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 05:51:03 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1B6C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 02:50:23 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id j13so1461380qvu.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KVJwoeo9aPU3oZrumbGjpJHY7ISC3SG8P4gukAladUE=;
        b=YwSGrMfBKYycd9952zyMwL6n+5aHZS3/ah4z18MM+qmnt9vpg2GV5t4FfzQvx/bNWG
         pNVEwY31a3dJeCrZw4YpAPXnBGGGf3S1H6MMELpMFdQDlrLasgZqjkTJvb/7CGMW5zCv
         c7W0kkO+TxFqbOyus7I7WRZm7eJMJH0hf7iU97Yw73OqpJNEGPDLkaPKBTc9HSmDs8yI
         T0Lfv3Y9e62gOOMYQVqf9Uy91Z0r5zfRJ8cQSqxkmg+mYaOszr+357/juASIGqnszSmg
         tYw1HQOMagAkmbPE+R6Q5Xv6RNSYfEsKW0IzCZGMEtByuSZ4MNaeFrCeUY2vg2BLwVGy
         vyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVJwoeo9aPU3oZrumbGjpJHY7ISC3SG8P4gukAladUE=;
        b=dql7kgj24dbEucW/b9A2iR0p0bnLLlSHnknuSARl9wLAQkPNJRX3VqNuT9hjVtW2L3
         wVeu9SvR0qYgmYH/FB6wRt1taQ7nEJlsucEHmYH66tHfT9ZRYo9jJYCIkt+Qg/DXo11y
         LXdoWsjpd52gLDDRzGAE798mdxvQEBAYEHElmmZs637poMl0syp57DjqvQh/yqZHrxvs
         PIJkMs665bSjMmX28YSpXAJ/BOrUI81X+gtWFnJzrPDPFJV3yZGclZlnp0W2rZ5jMj49
         FxicX5HPQ8G2gLvFxUjT9rNoGml52UH8KLroBgXxT/Z7Zns8pd3A5mLCI4lG+MSlprlv
         sT3A==
X-Gm-Message-State: AOAM532kpS8D0OuL5YrbOht5G7KgORqs/sbdL+6i4O+BawXdnluAI6mZ
        UPsPrCPhfsb9rD2WeDp+fP08CvZRms4YG0y3ak0TMw==
X-Google-Smtp-Source: ABdhPJwDLoOb7M+O/coq4UCyxUTpnTvoOCHWQdo/SUD4EELPuV+ioJfdBg193A7umuGhZent605PsFkFkw1Lqd5/JUg=
X-Received: by 2002:a0c:d403:: with SMTP id t3mr6765787qvh.4.1612435822422;
 Thu, 04 Feb 2021 02:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
 <CAA8EJpquw_HBT+x=go_378_ZVqLiHmq7y9FvBEgoqESaTosy4Q@mail.gmail.com> <106dcea1-557a-a3cd-267a-43517815eaef@linaro.org>
In-Reply-To: <106dcea1-557a-a3cd-267a-43517815eaef@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 4 Feb 2021 13:50:12 +0300
Message-ID: <CAA8EJpo2kVg_=wny49tgs_0-sX9RXZUaCupXxN2X_z=t7o8WNQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/4] Fixup clocks for venus on sm8250
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 3 Feb 2021 at 17:56, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/02/2021 14:25, Dmitry Baryshkov wrote:
> > On Wed, 3 Feb 2021 at 14:53, Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> >>
> >> - Adds some missing indices to the videocc index
> >> - Adds videocc clock tree hirearchy for msv0
> >> - Adds a regulator to power the videocc consistent with downstream
> >>
> >> Once done we can move on to enabling these clocks in the DTS and switch on
> >> the venus.
> >>
> >> Bryan O'Donoghue (4):
> >>    dt-bindings: clock: Add missing SM8250 videoc clock indices
> >>    clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
> >>    clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
> >>    clk: qcom: videocc: Add gdsc mmcx-reg supply hook
> >
> > I remember now the old discussion about these two clocks
> > (https://lore.kernel.org/linux-arm-msm/160092826778.310579.12225989905897101118@swboyd.mtv.corp.google.com/).
> >
> > Is the message. reported by Jonathan, solved by the mmcx-reg supply?
>
> The stuck problem is a bandwidth problem not a regulator problem,
> there's some internal clock dependency we don't have visibility of.
>
> Both of these resolve,
>
> Jonathan had a hack:
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=tracking-qcomlt-sm8250-09-11-20%2bvenus-flto-simple-test2&id=d4bea74282d14244127a1e97766b6108ec68e22f
>
> Dikshita proposed this instead, which, we will send out soon:
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=tracking-qcomlt-sm8250-venus-integrated-sm8250&id=782202d611761e639af7e44d8344c0c098642b9f
>
> > Also are these clocks necessary at all?
>
> Eh well I'm not sure what happens if I try to dump the clocks but, this
> is an accurate representation of what is done downstream so..

OK then.

-- 
With best wishes
Dmitry
