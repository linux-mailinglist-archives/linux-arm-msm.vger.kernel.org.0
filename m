Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E09131914E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 18:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbhBKRmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 12:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbhBKRkJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 12:40:09 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D946C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 09:39:28 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id df22so7853473edb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=khgvxjAf6RlfaPYG1L37lt3EW1hIvhDsNFzPojIdtIA=;
        b=HWg0m1gCkTiX2Bfb2p2H/XIvlveijBtoYiXMCouXF4j1/0QzO8T0jqDvqvyysSp2ON
         oIIfiLe9c7D4nrlxIZKd2/hnGVjFvXU2o07POr/MHDHc6a4RJejssM9eRyrCOc66Jdpm
         l10cEVs1AmBSeQuf3RFFI6p6Q06LCkqX1DEIhmwWitAH62gy1SdkRU9fglSBjiViRwBt
         7igqruIbOEJglY0uSQvpJhrjSmv2VfIk+dK66NRzMD1JwYf7gvXiy5mxGbNSy4V1cyiU
         K3NrfmNKKiJfcm/4m4IhvVObJfQgu436q8k3oEuLGq7A4Pt+P4NzqeY6YVxbKx6Q29dh
         69Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=khgvxjAf6RlfaPYG1L37lt3EW1hIvhDsNFzPojIdtIA=;
        b=OBphM/+stRzwKotG+q+KDVQAuZcveyYzCl4i4x9viOHWcgQpD1ZOLP+C7Or5074+1N
         Kq9g6fYTSJbd6eFBjDY+CjUtfFsXxVURUK5NFCSdAHe4gDIaJhRuZBWw3GhRw93JBRVn
         WfVttxGwaXqgH1j0F1otGpbMQnjHj2uVBUNIZEpxvNOp+Cms8q5SAaYWWXYt8BQZ8wuh
         u6pbPQv5bsDqPWyHstzunhqx+nzpcwu+dHvUV0gGgSqxMY2s2MzRNLd0EcvhCm3qHnyJ
         lDV3ZM9fOxUbPXC/vH3wjh3cMKxHyv3cyfSIppJxtu+h62wJqokWQNeDNyeSZ731XD98
         F6FQ==
X-Gm-Message-State: AOAM531514fdkPZY6gtF9QGeTU55z7A7C8ipcj2xojOqVlv3xE1o09h4
        51motGqSrP0g0tWXkAxT8L5S2vEn7lUNKpSjxPl/DkuGRmlnHw==
X-Google-Smtp-Source: ABdhPJwnMkpsmGRQ2hgqLmKkK+0IjsetCyovqrqq16v0q/7QSD+NLsp4lVvHPOP9qY2613Fs2MSy7fxDDuWvIFxLhTc=
X-Received: by 2002:a50:cbc7:: with SMTP id l7mr9329459edi.134.1613065166306;
 Thu, 11 Feb 2021 09:39:26 -0800 (PST)
MIME-Version: 1.0
References: <1613063283-12029-1-git-send-email-loic.poulain@linaro.org> <fa8c8c21-4c07-cdcc-0ce7-76945905f0d0@codeaurora.org>
In-Reply-To: <fa8c8c21-4c07-cdcc-0ce7-76945905f0d0@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 11 Feb 2021 18:47:00 +0100
Message-ID: <CAMZdPi8rguNCgQ1rahmtBsen40nOA=d+w9smhK4uN+jeDW01SQ@mail.gmail.com>
Subject: Re: [PATCH] mhi: pci_generic: Ensure device readiness before starting MHI
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Feb 2021 at 18:13, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 2/11/2021 10:08 AM, Loic Poulain wrote:
> > The PCI device may have not been bound from cold boot and be in
> > undefined state, or simply not yet ready for MHI operations. This
> > change ensures that the MHI layer is reset to initial state and
> > ready for MHI initialization and power up.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   drivers/bus/mhi/pci_generic.c | 23 +++++++++++++++++++++++
> >   1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index c20f59e..bfa0a1e 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -17,6 +17,8 @@
> >   #include <linux/timer.h>
> >   #include <linux/workqueue.h>
> >
> > +#include "core/internal.h"
> > +
> >   #define MHI_PCI_DEFAULT_BAR_NUM 0
> >
> >   #define MHI_POST_RESET_DELAY_MS 500
> > @@ -391,6 +393,22 @@ static void health_check(struct timer_list *t)
> >       mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> >   }
> >
> > +static void __mhi_sw_reset(struct mhi_controller *mhi_cntrl)
> > +{
> > +     unsigned int max_wait_ready = 200;
> > +
> > +     mhi_pci_write_reg(mhi_cntrl, mhi_cntrl->regs + MHICTRL,
> > +                       MHICTRL_RESET_MASK);
> > +
> > +     while (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_READY) {
> > +             if (!max_wait_ready--) {
> > +                     dev_warn(mhi_cntrl->cntrl_dev, "Not ready\n");
> > +                     break;
> > +             }
> > +             msleep(50);
> > +     }
> > +}
> > +
> >   static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >   {
> >       const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> > @@ -451,6 +469,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >               goto err_unregister;
> >       }
> >
> > +     /* Before starting MHI, ensure device is in good initial state */
> > +     __mhi_sw_reset(mhi_cntrl);
> > +
> >       err = mhi_sync_power_up(mhi_cntrl);
> >       if (err) {
> >               dev_err(&pdev->dev, "failed to power up MHI controller\n");
> > @@ -532,6 +553,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
> >               return;
> >       }
> >
> > +     __mhi_sw_reset(mhi_cntrl);
> > +
> >       err = mhi_sync_power_up(mhi_cntrl);
> >       if (err) {
> >               dev_err(&pdev->dev, "failed to power up MHI controller\n");
> >
>
> So, I'm curious, how does this actually work?
>
>  From what I can see, you define SBL images.  If those get loaded by the
> PBL, it doesn't happen over MHI.  PBL will not move MHI to ready state,
> except in the specific instance of a fatal error.

I defined generic SBL images for flashless controller versions, but
mine is not, and so it boots directly in mission mode.

>
> Your above change works if the device comes up straight in mission mode
> (AMSS), but if it comes up in PBL, you are going to hit the timeout and
> dev_warn() every time.

Ok, I thought we should get into MHI ready state, whatever the
'execution environment'... So I definitely need to take that into
consideration. thanks.

Regards,
Loic
