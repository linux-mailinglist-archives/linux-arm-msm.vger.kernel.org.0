Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD10336D63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 08:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCKH6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 02:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhCKH57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 02:57:59 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C88AC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 23:57:58 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id g4so13162352pgj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 23:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jo2RhC9QxHpswkt+87C4WQNVSS4A9CqqhuHyQ/zJtu8=;
        b=gngZ54vAr0M2IR2pvoo7e3M/FviJFc/mqnvgU55EfOPmOqJzQQYCnJKdPLMCxwEbqG
         +9PQMVvnSsCaY/p3T4irfyDVNIqKh0XWcRnMOj+LYuauu60u1DH6Oghf4IEt+DpjEB81
         Pr6cb1RQyL4daOfQOj6NJ6K/3bBvCXl0qeuVwCuDMLZI93Pxxd6m0VDcdGcHuFur5TqR
         czryEEVjRNpaXLjDo217cYZ6VW11ziS/e/gFVOzOJLl9R71xE1rrI3hSYiEWRQYIZGwC
         8JB+Tjm3zSfsf4zMnUB4TqL431opq73NLiLq5UekjIV1/iIpGrXuCOFHzPTe7rVu2PLJ
         8RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jo2RhC9QxHpswkt+87C4WQNVSS4A9CqqhuHyQ/zJtu8=;
        b=Y9huCcFkc3plUASshgnZBOvW6qesA/0kk4x4tJ5XDGg+iX5dywRv0Za/g6QfF1g2xD
         qHSMrY0nPTKAeHSw9hHfA0E2hMmYLnLS28Acg/viexU+MRKPUhj+0NpmzbCJY65zRELD
         pZUOjMqMILisWoyPP96+xrvTF4LOL8aXJV3BXzDXt/hDBIsDQIdVrCHnsVwjJzLnGFo1
         4R3otjIMzSRxoeknYO8Bw72huFJ/xdlt+d6ppjX3hbYxSBekURUI0eb2t65Rr+W0O9KR
         HmwnmNddaxhgN4QKZx9TArqfAHitcKZYZxps97h/ifFkp7vgkUkTmnAYmxcOU2j0YWqB
         QcWw==
X-Gm-Message-State: AOAM531f+RLdhHWg6sElRwDaydQBOxkdi5/h3hqM6hgtdH99UG02Cib8
        fR6CoBh5n9iE9f9d1YB4Ux4rqacAh8B7QZ6eLnfsYpw2lJNI1w==
X-Google-Smtp-Source: ABdhPJzjqphGIUhoKyiQCV4rLsrLVz+GmBuT+zt3KSiiHg1wpSpRkEq05rLntEwGfeRvquvOXgg9Zuz2nROinDvcUcc=
X-Received: by 2002:a63:2262:: with SMTP id t34mr6357230pgm.303.1615449477807;
 Wed, 10 Mar 2021 23:57:57 -0800 (PST)
MIME-Version: 1.0
References: <1615376308-1941-1-git-send-email-loic.poulain@linaro.org> <781d27cf-f9a6-eecc-8832-341a9a5fbb3a@codeaurora.org>
In-Reply-To: <781d27cf-f9a6-eecc-8832-341a9a5fbb3a@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 11 Mar 2021 09:05:58 +0100
Message-ID: <CAMZdPi-krgO4QrEoAzbciB4Ph1TnRqkFC3RQWb8R74ihCAvmPQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Command completion workaround
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

On Wed, 10 Mar 2021 at 17:19, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 3/10/2021 4:38 AM, Loic Poulain wrote:
> > Some buggy hardwares (e.g sdx24) may report the current command
> > ring wp pointer instead of the command completion pointer. It's
> > obviously wrong, causing completion timeout. We can however deal
> > with that situation by completing the cmd n-1 element, which is
> > what the device actually completes.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   drivers/bus/mhi/core/main.c | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > index 16b9640..3e3c520 100644
> > --- a/drivers/bus/mhi/core/main.c
> > +++ b/drivers/bus/mhi/core/main.c
> > @@ -707,6 +707,7 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
> >   {
> >       dma_addr_t ptr = MHI_TRE_GET_EV_PTR(tre);
> >       struct mhi_cmd *cmd_ring = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
> > +     struct device *dev = &mhi_cntrl->mhi_dev->dev;
> >       struct mhi_ring *mhi_ring = &cmd_ring->ring;
> >       struct mhi_tre *cmd_pkt;
> >       struct mhi_chan *mhi_chan;
> > @@ -714,6 +715,23 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
> >
> >       cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
> >
> > +     if (unlikely(cmd_pkt == mhi_ring->wp)) {
> > +             /* Some buggy hardwares (e.g sdx24) sometimes report the current
> > +              * command ring wp pointer instead of the command completion
> > +              * pointer. It's obviously wrong, causing completion timeout. We
> > +              * can however deal with that situation by completing the cmd
> > +              * n-1 element.
> > +              */
> > +             void *ring_ptr = (void *)cmd_pkt - mhi_ring->el_size;
> > +
> > +             if (ring_ptr < mhi_ring->base)
> > +                     ring_ptr += mhi_ring->len;
> > +
> > +             cmd_pkt = ring_ptr;
> > +
> > +             dev_warn(dev, "Bad completion pointer (ptr == ring_wp)\n");
>
> Is there value in having this warning every time?  I wonder if a _once
> version would be better to not flood the kernel log.  Although this is
> only for commands, which shouldn't be frequent, so maybe that is the
> implicit rate limiter.
>
> What do you think?

As you said it's kind of self rate-limited because of the unfrequent
command operations, mostly for starting and stopping channels. A _once
variant would hide the issue a bit, and probably not annoying enough
to raise curiosity.

>
> > +     }
> > +
> >       chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
> >       mhi_chan = &mhi_cntrl->mhi_chan[chan];
> >       write_lock_bh(&mhi_chan->lock);
> >
>
>
> --
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
