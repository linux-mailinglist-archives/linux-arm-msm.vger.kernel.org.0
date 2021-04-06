Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE403557CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 17:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhDFPaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 11:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhDFPaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 11:30:24 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6409C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 08:30:16 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id i19so11440247qtv.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 08:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cc3DwkAQsJvcOKQ79nl8EinflQsdwOxKQEM5zH2Ee7k=;
        b=ulRJ95NyMoD7BFkHiDPXiFcFkGAXuWm3cApCiBYkiro9rksIAVDht3j2m0R2virxym
         XbDbWkQCL88f8YFMQ59kIiUsGyxEGahzNi9eA1CxpyYJSUDxwGk5Ia0V/qLT0kKOX4Qa
         64j3tgFQd/tuXsGEBHwTiYrRoIO3Q8ecq/70KnMC4CLVlVK+yszBQK7zv2eX6mPkfJNo
         9ytgQctJzIjMTK6L/69UsvJmqscYPW8wPNpIaCS2EqTZtOjg5qrWiRp1dxba/4BoKmvz
         DD+qJdwOL+ndBnjEmWZezpOzXGWNCImMshXexIRiC5yPn0TGoqaHvDu/+Ivx1qIIyGpN
         tATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cc3DwkAQsJvcOKQ79nl8EinflQsdwOxKQEM5zH2Ee7k=;
        b=to8YDc2rX0bztzG/mAjjEpPRVV6FrALCBnjhk6W2AFt1/Z7yvhrNRGcEQpKvJ66ScW
         69A7tf/kBDv090idnqz8LPPPDNvJFdWTaWrwwZw/FJQfbBZAj/7IMFCkBE3TXAcoTTKr
         3M6rrjRwbrQChhMhuM757jCheVMtfDdRCcYUYKKfBsbczOrR0TyviCnNYJwQhExg7uGr
         09ZAA7HJBbE2kaHWSvdTdsxPMGRvL4IUN4lNkiC+93L5U30VEi+SZB7xUuZ4pGAYe1Hn
         H2+OcwWisNLHvoABrMzYuQCDsP0hLhWXM7mnb5Zcsj9u29oaw0GblLelcsgK2fzXQobH
         ceoQ==
X-Gm-Message-State: AOAM531zSMxo3xE6Kb49Cbq8pVwrLjG5RFKGO6Agi+/5sanG1ADZ3A/S
        fjYw65BEERJJlQ2vU/LDyUv5pD29bdbUToVtLtTUyTdlnlw=
X-Google-Smtp-Source: ABdhPJwIlhw2X3MtEW79k6Zw+oA3BcL9hgmUJ/bL1RfuKA2jyIsMvoMazrr+VDxQXNcccHBgsBjk0UunLBf63vd4hvc=
X-Received: by 2002:ac8:1385:: with SMTP id h5mr28332539qtj.298.1617723016225;
 Tue, 06 Apr 2021 08:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210318201405.2244723-1-dmitry.baryshkov@linaro.org>
 <97f37835-a543-c0b1-4497-b093ce182155@linaro.org> <YGxyqrm09A8NSkWg@builder.lan>
In-Reply-To: <YGxyqrm09A8NSkWg@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 6 Apr 2021 18:30:04 +0300
Message-ID: <CAA8EJpqROgEWxW_X++2Fo83yW+M2OLN4PX-4DxMhZ2EQqfLXDw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sdm845-db845c: make firmware filenames follow linux-firmware
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 6 Apr 2021 at 17:39, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Tue 06 Apr 09:27 CDT 2021, Dmitry Baryshkov wrote:
>
> > Hi Bjorn,
> >
> > On 18/03/2021 23:14, Dmitry Baryshkov wrote:
> > > Cange aDSP and cDSP firmware filenames to follow filenames merged into
> > > linux-firmware tree. Switch from split .mdt files to merged .mbn files.
> >
> > Any chance of getting this into 5.13?
> >
>
> I've picked this up and will send another set of pull requests this
> week, hopefully soc@ will accept them.

Thanks a lot!

>
> Thanks,
> Bjorn
>
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > > index c4ac6f5dc008..b36a002c654a 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > > @@ -244,7 +244,7 @@ vph_pwr: vph-pwr-regulator {
> > >   &adsp_pas {
> > >     status = "okay";
> > > -   firmware-name = "qcom/sdm845/adsp.mdt";
> > > +   firmware-name = "qcom/sdm845/adsp.mbn";
> > >   };
> > >   &apps_rsc {
> > > @@ -390,7 +390,7 @@ vreg_bob: bob {
> > >   &cdsp_pas {
> > >     status = "okay";
> > > -   firmware-name = "qcom/sdm845/cdsp.mdt";
> > > +   firmware-name = "qcom/sdm845/cdsp.mbn";
> > >   };
> > >   &dsi0 {
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
