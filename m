Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA0511929C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 22:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfLJVBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 16:01:02 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:41220 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfLJVBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 16:01:02 -0500
Received: by mail-io1-f67.google.com with SMTP id z26so20325131iot.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 13:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VF0gTV9qdWB6cnJyQqzS/oysI3Ok/hp0ujuFEUT1g/4=;
        b=jsdqNPAHXsElTW1fJAS379zuHUGC1oFc2lHyUu72dO6VkV1JVCClw9ZN+rn6bAUJGB
         C82zcTIw8LQuDXCPKAu2QqRxsfmkZbxzScIxSv63J4vse3xkMpl7akVJoOM/Sd4Mc5iN
         Ghgbbj5j7YjYddfLWXRZh/smuPdg9k6YThKhn70z+FpSA79pHqjAnD4yPe709xBI7nzK
         l85Viv4xHrS0XF4lrF7bvcRqsrBDj0Kh/UQ9RI+03wjHkMr4VnfZ+IRVcVGuv1WvkuRg
         qCYpdnBbLS268d5ap1C1ge+a9210siLx0F0SkQ1txAQX5ydc17l9GW2gWasCZvdIuimj
         vX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VF0gTV9qdWB6cnJyQqzS/oysI3Ok/hp0ujuFEUT1g/4=;
        b=VvfWRBFqRW9dpYUqeEvcI6EI2prf90zunjyxfdgcFWWoFGtmN9RbtXOAElV6xG3Mt2
         Dt4bF7IcfHvNFyX5mdIM6MM2Gkj6+NE5rs6M0E0J+moqhlfn60xNYcSGLz9zDmGUUlQU
         U0Y8T7zwXkp4Nk85psHVqTXWKhltz6HFExlJfgg7O/afWWAcrixyWXtgdNF20/ZUyoVx
         AWlq6bg+plzYlFPtl+mgbACNPNqqhxg0NjY3SohJOAUC5WJBJd5aiR1PMhhZGoxJRWOY
         Xbr5KhEyGq8DDF66x9R37Vhk1UYWCXkHgxpR1tQ+z3VplTStHNI0/0bhixX6wop3tXFC
         Halw==
X-Gm-Message-State: APjAAAVzMdA0R4bBhioR2CnfmCBslrP0FUloJlZqqQSklscbX25Mbh96
        rK65OcXDB+4tv/cipQYCIygxUHtl3ejB2YH3HdsT2rA9XZ0=
X-Google-Smtp-Source: APXvYqxzBB5WAs2ik4ARKNQYfI4ndrdxS2nJ3+fmDiOYcyhxlOuNpRg3Z3djUNZQYQV70261GmtQr430uehjQHAQNN4=
X-Received: by 2002:a02:6957:: with SMTP id e84mr229095jac.11.1576011661410;
 Tue, 10 Dec 2019 13:01:01 -0800 (PST)
MIME-Version: 1.0
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <1573068840-13098-2-git-send-email-agross@kernel.org> <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
 <20191108031854.GA12993@hector.lan> <20191210105737.GB228968@gerhold.net>
 <CAHLCerPs8+Fp1N-x7cQ2ETQ8d+fHN5b08V-jVFyFdQLYDndoBA@mail.gmail.com> <20191210181725.GD314059@yoga>
In-Reply-To: <20191210181725.GD314059@yoga>
From:   Olof Johansson <olof@lixom.net>
Date:   Tue, 10 Dec 2019 13:00:49 -0800
Message-ID: <CAOesGMiiMG8kND=ZGv93t525B4L3ogA7py+3fdw2F6XaZspw_w@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 10, 2019 at 10:17 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 10 Dec 09:36 PST 2019, Amit Kucheria wrote:
>
> > On Tue, Dec 10, 2019 at 4:27 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > On Thu, Nov 07, 2019 at 09:18:54PM -0600, Andy Gross wrote:
> > > > On Thu, Nov 07, 2019 at 07:36:03PM +0530, Amit Kucheria wrote:
> > > > > (Removing arm-soc)
> > > > >
> > > > > Hi Andy,
> > > > >
> > > > > On Thu, Nov 7, 2019 at 1:04 AM Andy Gross <agross@kernel.org> wrote:
> > > > > >
> > > > > > Arnd, Olof, and Kevin,
> > > > > >
> > > > > > I have one slight faux paux in this pull request.  A drivers: soc change got
> > > > > > into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
> > > > > > without messing up a lot of people who depend on the SHAs not changing.  So I'm
> > > > > > sorry for this inclusion.  I'll scrub this better next time.
> > > > > >
> > > > > > Andy
> > > > >
> > > > > > ----------------------------------------------------------------
> > > > > > Amit Kucheria (5):
> > > > > >       arm64: dts: qcs404: thermal: Add interrupt support
> > > > > >       arm64: dts: msm8998: thermal: Add interrupt support
> > > > > >       arm64: dts: msm8996: thermal: Add interrupt support
> > > > > >       arm64: dts: sdm845: thermal: Add interrupt support
> > > > > >       arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
> > > > >
> > > > > One of my patches to add interrupt support to msm8916 tsens is missing
> > > > > here. Specifically this one:
> > > > > https://patchwork.kernel.org/patch/11201853/
> > > > >
> > > > > Will there be a second PR this cycle?
> > > >
> > > > I can work up another and throw it on top.
> > > >
> > >
> > > FYI, the patch seems to be still missing in 5.5-rc1.
> > > tsens now fails to probe on MSM8916 with:
> > >
> > >   qcom-tsens 4a9000.thermal-sensor: IRQ uplow not found
> > >
> > > Can you queue up the patch as fix for 5.5?
> >
> > Indeed. Andy/Bjorn, let me know if you need anything from me to get
> > this into -rc2.
> >
>
> I'm pulling in some fixes for a rc-pull, so I could add it there.
>
> But why are we breaking backwards compatibility with existing dtbs to
> add a new (optional) feature? Shouldn't there be a rc-fix in the driver
> for this regression?

100% agreed.

Driver shouldn't require the DT update to continue to function. It
needs to fill in the previous behavior as default.

As a matter of fact, based on that I don't want to see that DT patch
as a fix, please queue it up for 5.6 instead.


-Olof
