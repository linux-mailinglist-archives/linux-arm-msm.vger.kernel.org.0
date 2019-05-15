Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2524C1E74E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 06:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfEOEKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 00:10:07 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34830 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfEOEKH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 00:10:07 -0400
Received: by mail-ot1-f68.google.com with SMTP id n14so1009721otk.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2019 21:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NuXfmQVzJzIUN6QMgtr2lj+FKodDhh6kmn0H209EmlA=;
        b=Zw+MHNOW3jKoyH7f70J7Co+t4ONgYnwoKc2lxCTbPrms9reJqPp7+0KpSABdItJ9hr
         zjOKiGAMT0TnwlgB/JzVse+gpraINrRM1wNOrh2gPFiVLw4/8rwI74e8qYxmN+TWkn2C
         CXCuAVjofde4OrmRvTmdRG4k6PhO+DcGVASmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NuXfmQVzJzIUN6QMgtr2lj+FKodDhh6kmn0H209EmlA=;
        b=dPzt0TXUG60muQ1T6PaZgnzzjPJi/EWMuyEHsiiGL4YaqmLxnK4daQdMdqu9SJcGMV
         nJ3AU4m20njETv2rGpaVs+JrPdGYt5lCW5cjArsfunvP9lc+MDAy7zh9MdM2vbhr8KXA
         QDKtC2N/VtdFNoY/G9D+ay/jjB5LFwArIhCfSkQA1uEME9hL3M17cXJatgnXPtkj1CtP
         ZB3TK5T9h3Lgqn4VsuaP3+7NS0YSVLBH1U/onLUm+A3RZcMnVsy82IPhv2+ftAraGicH
         rJ/8C0kRie3nfCud5Mp3AhZMVwAOabXno9MEesvqR148mB/Q1HLye/0Mc3hPI3Cw74+i
         QdxA==
X-Gm-Message-State: APjAAAXDwgQ0+rHitRU7oB+wSwLT/ebQK1walEawPN+rBrMGtiNBkkgh
        fyZYIne4B/iaeIhUb+NPh0fvV7glWmt1apuBLOX52g==
X-Google-Smtp-Source: APXvYqw2JdNkDxjGFIXwgPT3GGh6Xp2NuW/QtkUGrRaVRu5pEmDf80zbu2By0aQPNwhMa3+quKzI8BVED+EKfYAmZEg=
X-Received: by 2002:a9d:526:: with SMTP id 35mr21132700otw.163.1557893406456;
 Tue, 14 May 2019 21:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190509184415.11592-1-robdclark@gmail.com> <20190509184415.11592-3-robdclark@gmail.com>
 <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com>
In-Reply-To: <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 14 May 2019 21:09:55 -0700
Message-ID: <CAJs_Fx5PDj+T+DVixzHjun_wCG5fhZsxH8xUqRwmkfwN87UP_A@mail.gmail.com>
Subject: Re: [RFC 2/3] arm64: dts: qcom: sdm845-cheza: Re-add reserved memory
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 13, 2019 at 3:48 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, May 9, 2019 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Let's fixup the reserved memory to re-add the things we deleted in
> > ("CHROMIUM: arm64: dts: qcom: sdm845-cheza: Temporarily delete
> > reserved-mem changes") in a way that plays nicely with the new
> > upstream definitions.
>
> The message above makes no sense since that commit you reference isn't
> in upstream.
>
> ...but in any case, why not squash this in with the previous commit?

Yeah, I should have mentioned this was my intention, I just left it
unsquashed since (at the time) it was something I had cherry-picked on
top of current 4.19 cros kernel..

anyways, I pushed an (unsquashed, converted to fixup!'s) update to:

https://github.com/freedreno/kernel-msm/commits/wip/cheza-dtb-upstreaming

which has updates based on you're review comments (at least assuming I
understood them correctly).. plus some unrelated to cheza-dt patches
on top to get things actually working (ie. ignore everything on top of
the fixup!'s)

I didn't see any comments on the 'delete zap-shader' patch, so
hopefully that means what I did there was a sane (or at least not
insane) way to handle android/linux tz vs what we have on cheza?

BR,
-R


>
>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Remove Stephen's Reviewed-by.  In general reviews that happen in the
> Chrome OS gerrit shouldn't be carried over when things are posted
> upstream.
>
>
> > +/* Increase the size from 2MB to 8MB */
> > +&rmtfs_mem {
> > +       reg = <0 0x88f00000 0 0x800000>;
> > +};
> > +
> > +/ {
> > +       reserved-memory {
> > +               venus_mem: memory@96000000 {
> > +                       reg = <0 0x96000000 0 0x500000>;
> > +                       no-map;
> > +               };
> > +       };
> > +};
>
> nit: blank line?
>
> -Doug
