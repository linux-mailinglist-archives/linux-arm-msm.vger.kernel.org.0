Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6D0274777
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 19:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIVR2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 13:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgIVR2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 13:28:35 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D08C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 10:28:34 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e23so24044755eja.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 10:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bxPPiY0DEKYyOmXiSi2gGDkfWu7wqu7yt5daKtdFtn0=;
        b=qs7fMaVnPW1ImJnBB3gI/U/GuDzyA9UeCBbRG/SQJBhzzDXtCfq8Flm476Ybx+0/Gb
         VHZK+/YCRdYHuOAleRLXlTy3EuJNXg+MuLFbKq2KfuvgI6N6PE5cP4RgrYtzFmIaguc5
         o2JfqGLRIxqsu4uGi9q/xiwpkta+nDK+bSNsWIe6iryFsuDOQsygyNoTetb/aVVQ/SPG
         zcJ+8rctADzcf6Qj6O3cdeQ5sfaKb1i3Wp8XNqTgWaBocKF0OhJsvIG7TPnNBqQh3Yn7
         fgYEE2r2eQNqYsCenBjpICF2EMlWpcXCV1ob7HO519s868Y4l7dPT0hfPfOeHzRbvqvB
         fFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bxPPiY0DEKYyOmXiSi2gGDkfWu7wqu7yt5daKtdFtn0=;
        b=t2NuzBD59frND0Lz5tEtyZRAYZm9IUynHCmVl9r8H6duNAGgitc094/twMxXpvTpgT
         u2azSoZfKGUVReKoVZiTgSgS/Y6Jx8luBRPAX1/5HGJDNpuSXOQgghanQjF0VMeubvFy
         p268+bt62GIM7i4SNomPmi/xF7pCRNSEIZihPTnbFyh1pROT31TXVgsTD1CIOTOsx5Ds
         dianJQj0SZjlpAfX0k7rEnh6ekMkbdp6bS3SHumCuZIVj4H861Vim8Mm5mPCJe8+kq0o
         UKYofqqrnZrGio4YGQEXFmHCzcehIkm6nlAUKCnlM33o5hGkMTkD+0soo0leEPRq/Fo6
         CZOw==
X-Gm-Message-State: AOAM531mTouDh5I6qlCHgZ6bzb2qRMqCYMYeDPsBUOsPc6wYIZaYe9wt
        oBzzDPmfa4TxYZcyPW2E/RY6tijsaXWACDquDRNGdJSgBJz6Yw==
X-Google-Smtp-Source: ABdhPJydpRKP4xzI/ibQnerT+ybdf4I3+adcz4A0MksLztnOsBaMozCDfPxNxM4vFJVNpn6Asf+a9tPMHahQcfWUiOk=
X-Received: by 2002:a17:906:24d2:: with SMTP id f18mr6077255ejb.510.1600795713225;
 Tue, 22 Sep 2020 10:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <1600762066-25849-1-git-send-email-loic.poulain@linaro.org> <c052dbd8dcc2bd625b300b6c21638e3b@codeaurora.org>
In-Reply-To: <c052dbd8dcc2bd625b300b6c21638e3b@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 22 Sep 2020 19:33:47 +0200
Message-ID: <CAMZdPi-b-P45Q1n5bTH45YmaqunXJwidU_gnTGL1rLXvyBBWcA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Move irq check in controller registration
To:     bbhatt@codeaurora.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Tue, 22 Sep 2020 at 19:00, <bbhatt@codeaurora.org> wrote:
>
> On 2020-09-22 01:07, Loic Poulain wrote:
> > Move irq number check early in mhi_register_controller along
> > with other mandatory parameters checking.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/bus/mhi/core/init.c | 2 +-
> >  drivers/bus/mhi/core/pm.c   | 3 ---
> >  2 files changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > index ca08437..34f9ae3 100644
> > --- a/drivers/bus/mhi/core/init.c
> > +++ b/drivers/bus/mhi/core/init.c
> > @@ -871,7 +871,7 @@ int mhi_register_controller(struct mhi_controller
> > *mhi_cntrl,
> >
> >       if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
> >           !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
> > -         !mhi_cntrl->write_reg)
> > +         !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)
> >               return -EINVAL;
> >
> >       ret = parse_config(mhi_cntrl, config);
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index 3de7b16..07efdbc 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -918,9 +918,6 @@ int mhi_async_power_up(struct mhi_controller
> > *mhi_cntrl)
> >
> >       dev_info(dev, "Requested to power ON\n");
> >
> > -     if (mhi_cntrl->nr_irqs < 1)
> > -             return -EINVAL;
> > -
> >       /* Supply default wake routines if not provided by controller driver
> > */
> >       if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
> >           !mhi_cntrl->wake_toggle) {
> Hi Loic,
>
> Can you please add a Suggested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> tag with my name?
>
> Also, I made this patch myself too but you can submit it. It'd be nice
> to add some more
> details in the commit text.
>
> Mine goes like this:
>
> bus: mhi: core: Check for IRQ availability during registration
>
>      Current design allows a controller to register with MHI successfully
>      without the need to have any IRQs available for use. If no IRQs are
>      available, power up requests to MHI can fail after a successful
>      registration with MHI. Improve the design by checking for the number
>      of IRQs available sooner within the mhi_regsiter_controller() API as
>      it is required to be specified by the controller.

Then I would prefer you to submit yours and we discard mine, don't
want to be authored for your work.

Thanks,
Loic
