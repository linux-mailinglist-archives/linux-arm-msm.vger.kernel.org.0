Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5577424682
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239311AbhJFTLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239314AbhJFTLg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:11:36 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88314C061746;
        Wed,  6 Oct 2021 12:09:43 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id r1so3714988qta.12;
        Wed, 06 Oct 2021 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VL8huvHNt0AW4VbvHoyUVP6MU5/wX3Bj6/diTCZsDhw=;
        b=nEfMYzi66QIGok2oQdVZQIYT1PqFopAy8Md5kYeZVvtvZCrh0S/5Tb9Na/zmFrVA8L
         0fM47209loAcRogudkTHSmAtX7ogUbikzNDP2dCvvFEyh4NmWJX/Wmuij/pT1Hh6Blet
         2iB45DdHw3DfnROu9GEetkcQpZSo/I3P3pbkJRd6q7vgvLOH8CfV7oKLIcLDGSU0LSUS
         kx7fKtdXj6OF0FHw3FAARnC6ueNLZErsQ24y+RY2c9rmAe3eUvt1UiOt/azZ1ZjWqara
         dnkNkE9ymjW9dC6u78KAJ5zy4UkX4Gf+p13asciqvMqtbK1BM4q460rO/WqAQY73sS70
         7CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VL8huvHNt0AW4VbvHoyUVP6MU5/wX3Bj6/diTCZsDhw=;
        b=ynOaEen/mOv65VbopjYg7i9T+Wq3qdOqNVJi799T8bR/X8TEl2o/WtR9kZ1zM9VzzT
         zp+JSzehtBnp6TVTvk5EQKUdsASViCLZHWrBL2anc37zQjdk2jvydCBOzpEf9NeJppKB
         g+orJb2NlJxcGyB7iVLUvrsUThjfj10O2vMLQyJpg1m0rGiXrvOyqztxr5aCcRQHY0Jh
         ioch5stSpBfx3SkE2i5k7OovpjW7FQXGcRVeRI/mxB29etrDO3w3Z3KEHlOg5wf+wOQ+
         daj+vbgLCFwtemG0NAHR6x7p1g633DnJRCq53rISQCCM0DfQ2I3tTJe6vwqK1frAbb8r
         CzIg==
X-Gm-Message-State: AOAM531AcXDYa1vRSL50Ehbbs1jTfZIMQ0X121LPxJf0mYEtQSJ3qfVY
        hK6Jelgoqod9aEF57nDs0Lflt8U2+i1XQU0EPhs=
X-Google-Smtp-Source: ABdhPJyuoHhYVDdnFB0RJ7H6Qb8GSeTcN1K+azR1B1QNT9f5CUZ/P8aZh1M6ZZpIf09WbGXeunb+0JQDx5QqMJvzaPk=
X-Received: by 2002:ac8:4313:: with SMTP id z19mr536654qtm.356.1633547382635;
 Wed, 06 Oct 2021 12:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210902214708.1776690-1-robimarko@gmail.com> <YUf3aKn78+41Cb/G@builder.lan>
 <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
 <632a7d28c23a8497d35ea009bfe89883@codeaurora.org> <CAOX2RU5+jeXiqz8oss8Sd-BWa059uAv5xu=7nx_YF4RYpG2S6w@mail.gmail.com>
 <YUurqDL/S15RziCQ@builder.lan> <20211006182419.GC33862@thinkpad>
 <CAOX2RU43D72yx1Kyb0jRMMOLgBd1OMscWLH-dEdp0P=L-5quHQ@mail.gmail.com> <20211006184404.GD33862@thinkpad>
In-Reply-To: <20211006184404.GD33862@thinkpad>
From:   Robert Marko <robimarko@gmail.com>
Date:   Wed, 6 Oct 2021 21:09:31 +0200
Message-ID: <CAOX2RU44mp2MfbEsjziV_X7SdO1wf+ptPbF-51Tc8FPzQcozJw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Oct 2021 at 20:44, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Oct 06, 2021 at 08:26:10PM +0200, Robert Marko wrote:
> > On Wed, 6 Oct 2021 at 20:24, Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
>
> [...]
>
> > > Sorry, missed this earlier. I did face the probe deferral issue before and
> > > submitted a small series for fixing that:
> > >
> > > https://lore.kernel.org/linux-mtd/20210302132757.225395-1-manivannan.sadhasivam@linaro.org/
> > >
> > > These 2 patches are in mainline now. Robert, can you make sure that you have
> > > these 2 patches in your tree?
> >
> > Hi Mani,
> > Yes, I have those patches as I am running this on top of 5.15-rc4 currently.
> >
>
> Hmm. So if both SMEM and NAND drivers are added to the probe deferral list then
> the issue is likely not related to probe ordering.
>
> Can you nail down the point where the board starts rebooting?

Unfortunately not, I can see that it resets after the NAND driver
requesting probe deferral but I cannot pinpoint the exact thing that
resets it
as there is no stack trace.

Regards,
Robert
>
> Thanks,
> Mani
>
> > Regards,
> > Robert
> > >
> > > Thanks,
> > > Mani
> > >
> > > > Thanks,
> > > > Bjorn
