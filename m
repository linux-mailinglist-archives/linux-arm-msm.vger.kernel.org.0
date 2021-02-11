Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC91131922C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 19:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhBKSXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 13:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbhBKSVi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 13:21:38 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FDEC06178B
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 10:20:35 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id i8so11495700ejc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 10:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LSyPsxQYDwEbXoo0qBDIb16a5QUGE4UOcEOoAe9ypXc=;
        b=jv5PsFyuFEilGIx1Nt044fa2qO6BHmXQPSuCdZ0ioQA8UolQp9vqzfqMAZF3ZVxjdr
         Oe5Epuj6VGuSgW3NuKjoGK2b/Jz+qdFUBqwdeGyarIf1cfLt0FWGDjEHK4UKHsYvRxov
         8ZIj4COHTKrnx8G17xkOnehqOffST7TKs+pStECqpfuYR+hXOjC2yygCcFkoPStcl5Sy
         Zt+NNIYi/vLRWePFro0QkESh4wb3NKshbGIO8HkryAvgEnNI6Izi8GQ2ZruVJ7lry6YG
         vb5mw3VYxpWVfEjV8rpzvU+mA22EzrEG9HIhJ3gNp8KXw1gf3TacThf5HT3hT4uoPnjM
         qsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LSyPsxQYDwEbXoo0qBDIb16a5QUGE4UOcEOoAe9ypXc=;
        b=G8jacutw97QYasIbyaTqWhwR12Z6h8ZSJRrGV0OYPNKWsPOmPOo+5SZvomXVEtmXjP
         x1H54ZNZOVIV8vNfohjPy+OH0cQ9to6YGdwTxP/8bMK0mvL7pxkz7kOAYtxlaY+gBiGU
         6/0ibtmJ+28kNW/HnaxLvnL1WoqMHb9K9bTv5/6QLlxXKdBNvaLz3muCmPSCq/QUp+9L
         NDxgLD419ZZ4i5a7p/qBZ65AOA4b8lERKm+fXhcq7MYKRnDcuq4B8QqKQdMPhpk+0kLR
         vOKXprvDQtnx0+2jPk15Hw3Dfhm5trZ6pKo/xXBICTtTyQerd/mVeZ553HWbxUuhgDoU
         ytYg==
X-Gm-Message-State: AOAM531KS+rpWP0j/0Urm7G6WbZYls1eA2ZAOnNGFXVpnDbmYLZrWdKS
        rBCT69cm8Ks5aFfkBsx/qgoE4l2M6pAWFRZCoYVAHbDclV99qA==
X-Google-Smtp-Source: ABdhPJymbCGB7mrl1aZfmoBW1DkJt9HTm0PoAtR8RonX4q87JTNs+07baonNM1sirg9anRLdZPRTL9BoxRuJkwGTqOc=
X-Received: by 2002:a17:906:b6cc:: with SMTP id ec12mr9711111ejb.520.1613067633258;
 Thu, 11 Feb 2021 10:20:33 -0800 (PST)
MIME-Version: 1.0
References: <1613063283-12029-1-git-send-email-loic.poulain@linaro.org>
 <fa8c8c21-4c07-cdcc-0ce7-76945905f0d0@codeaurora.org> <CAMZdPi8rguNCgQ1rahmtBsen40nOA=d+w9smhK4uN+jeDW01SQ@mail.gmail.com>
 <6cf90335-ad7f-9e72-651e-dd3beb709d1f@codeaurora.org>
In-Reply-To: <6cf90335-ad7f-9e72-651e-dd3beb709d1f@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 11 Feb 2021 19:28:07 +0100
Message-ID: <CAMZdPi939vrEY-vQJ6t5L0Xo8OQR_sFs=EZnTKc3jsUxpraGKw@mail.gmail.com>
Subject: Re: [PATCH] mhi: pci_generic: Ensure device readiness before starting MHI
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Feb 2021 at 18:55, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 2/11/2021 10:47 AM, Loic Poulain wrote:
> > On Thu, 11 Feb 2021 at 18:13, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >>
> >> On 2/11/2021 10:08 AM, Loic Poulain wrote:
> >>> The PCI device may have not been bound from cold boot and be in
> >>> undefined state, or simply not yet ready for MHI operations. This
> >>> change ensures that the MHI layer is reset to initial state and
> >>> ready for MHI initialization and power up.
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> >>> ---
> >>>    drivers/bus/mhi/pci_generic.c | 23 +++++++++++++++++++++++
> >>>    1 file changed, 23 insertions(+)
> >>>
> >>> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> >>> index c20f59e..bfa0a1e 100644
> >>> --- a/drivers/bus/mhi/pci_generic.c
> >>> +++ b/drivers/bus/mhi/pci_generic.c
> >>> @@ -17,6 +17,8 @@
> >>>    #include <linux/timer.h>
> >>>    #include <linux/workqueue.h>
> >>>
> >>> +#include "core/internal.h"
> >>> +
> >>>    #define MHI_PCI_DEFAULT_BAR_NUM 0
> >>>
> >>>    #define MHI_POST_RESET_DELAY_MS 500
> >>> @@ -391,6 +393,22 @@ static void health_check(struct timer_list *t)
> >>>        mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> >>>    }
> >>>
> >>> +static void __mhi_sw_reset(struct mhi_controller *mhi_cntrl)
> >>> +{
> >>> +     unsigned int max_wait_ready = 200;
> >>> +
> >>> +     mhi_pci_write_reg(mhi_cntrl, mhi_cntrl->regs + MHICTRL,
> >>> +                       MHICTRL_RESET_MASK);
> >>> +
> >>> +     while (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_READY) {
> >>> +             if (!max_wait_ready--) {
> >>> +                     dev_warn(mhi_cntrl->cntrl_dev, "Not ready\n");
> >>> +                     break;
> >>> +             }
> >>> +             msleep(50);
> >>> +     }
> >>> +}
> >>> +
> >>>    static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >>>    {
> >>>        const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> >>> @@ -451,6 +469,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >>>                goto err_unregister;
> >>>        }
> >>>
> >>> +     /* Before starting MHI, ensure device is in good initial state */
> >>> +     __mhi_sw_reset(mhi_cntrl);
> >>> +
> >>>        err = mhi_sync_power_up(mhi_cntrl);
> >>>        if (err) {
> >>>                dev_err(&pdev->dev, "failed to power up MHI controller\n");
> >>> @@ -532,6 +553,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
> >>>                return;
> >>>        }
> >>>
> >>> +     __mhi_sw_reset(mhi_cntrl);
> >>> +
> >>>        err = mhi_sync_power_up(mhi_cntrl);
> >>>        if (err) {
> >>>                dev_err(&pdev->dev, "failed to power up MHI controller\n");
> >>>
> >>
> >> So, I'm curious, how does this actually work?
> >>
> >>   From what I can see, you define SBL images.  If those get loaded by the
> >> PBL, it doesn't happen over MHI.  PBL will not move MHI to ready state,
> >> except in the specific instance of a fatal error.
> >
> > I defined generic SBL images for flashless controller versions, but
> > mine is not, and so it boots directly in mission mode.
> >
> >>
> >> Your above change works if the device comes up straight in mission mode
> >> (AMSS), but if it comes up in PBL, you are going to hit the timeout and
> >> dev_warn() every time.
> >
> > Ok, I thought we should get into MHI ready state, whatever the
> > 'execution environment'... So I definitely need to take that into
> > consideration. thanks.
>
> I could see where you could think that, which is why I commented.  I
> didn't want you to run into issues later, assuming those issues are
> valid to you.
>
> MHI only gets into the ready state via EEs which drive MHI.  PBL
> famously does not drive MHI because PBL is encoded into hardware and
> extremely difficult to fix, so it is generally designed with the mantra
> of "simpler is more reliable".

Ok understood.

>
> Hopefully I didn't throw a wrench in things for you.  Just trying to
> save you some pain later.

Yes, that's perfectly fine and valid, so I'm going to rework that.

Regards,
Loic
