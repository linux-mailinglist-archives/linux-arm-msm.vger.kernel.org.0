Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CACD32CE40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 09:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbhCDIRB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 03:17:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233479AbhCDIQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 03:16:58 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25689C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 00:16:18 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id 192so11364001pfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 00:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zkwRUxzTrDrmGFgWbFn3mkhzRvuK/Ax+WZIZoQASsj0=;
        b=uL9GIxkNef1K76JzN/AXMPcSMUlACiITzpYIKml7yI7AllFI9fh2NKummHMa38VbPX
         pAQNSkgnRuEm8XlIQ5RxwV4OqsACeVNAxLBCHKOC28zDSqCss16NrWwIzOzlr1YAtC1u
         cL7cXqdJJNnjaxYwepNPDTklARJ9Psq3nku3JbMdHHZPiWAXePzyASJITDOQwN7hzDvz
         p4boiMeOzCQxikrusmj9A+9/5ms+Vr0xK1UtVy1eWmUSYxiy6rULRbC6hYrr/gOgwGaF
         mdgnna/X6uLVtzfDnkYG7jLHGVsAcwMHlJ1pZPbovNpkAqNTiwBFwyp1goski76dqkok
         RUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zkwRUxzTrDrmGFgWbFn3mkhzRvuK/Ax+WZIZoQASsj0=;
        b=UlDFcULPP2S0/v0VJjhO6ImsORqbRsAsTsu5guz5BW0hog4lVNTIouo3O1pLnWqIQg
         L1gClSnHNzqpP15g7oOYKOD2RAhXRUSLL2wFdElo/YOvZVqa+cqnVwGqMFkL0xUkKxdY
         pq4tL6bL2EebbtOjMWOnC75160HIxHdSmo8OMQoiUbu1h+M5FGxB+l6v+rBkrbOMTXNn
         +AjfYY8KJSuVpnUNtE1RhRlP5P8OvQekSnU7vkMs1FmgIfLwVJUDyZwT6txx68JeG8s5
         w7IzidxSJNgkzAcmkPlAqpRCksBP6L4pNjKhx75lI+w6lRPwnsHwg8ChEN7sf5fKu0vp
         AlMQ==
X-Gm-Message-State: AOAM530ou49aZ5HQNJ0fByqkLp1MmAdMFdm1WxZr9dFofNtniGsreZKq
        /OEI9HFCH7xr1uNVN141V78hNApCZpy+LSKGonGMhgxThhO/EQ==
X-Google-Smtp-Source: ABdhPJzRgiN7VbchZzoENIXPJ3hbOtHoGToAaPeR5J0NyLTI14IhEcSGB2VqsJN/3B5bq3ZCbFFEuLRYGeXO8A+968U=
X-Received: by 2002:a63:511:: with SMTP id 17mr2657617pgf.173.1614845777527;
 Thu, 04 Mar 2021 00:16:17 -0800 (PST)
MIME-Version: 1.0
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
 <1614615911-18794-5-git-send-email-loic.poulain@linaro.org> <20210304065643.GE3363@thinkpad>
In-Reply-To: <20210304065643.GE3363@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 4 Mar 2021 09:23:56 +0100
Message-ID: <CAMZdPi8SfUK0fVCXbPsmSSKudpU4jScSuLva3KpZebyVt6MPeA@mail.gmail.com>
Subject: Re: [PATCH 5/6] mhi: pci_generic: Use generic PCI power management
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Mar 2021 at 07:56, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, Mar 01, 2021 at 05:25:10PM +0100, Loic Poulain wrote:
> > The PCI core can take care of proper PCI suspend/resume operations, but
> > this is discarded when the driver saves PCI state by its own. This
> > currently prevents the PCI core to enable PME (for modem initiated
> > D3 exit) which is requested for proper runtime pm support.
> >
> > This change deletes explicit PCI state-saving and state-set from
> > suspend callback, letting the PCI doing the appropriate work.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/bus/mhi/pci_generic.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 8423293..2a66f80 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -544,9 +544,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >
> >       pci_set_drvdata(pdev, mhi_pdev);
> >
> > -     /* Have stored pci confspace at hand for restore in sudden PCI error */
> > +     /* Have stored pci confspace at hand for restore in sudden PCI error.
> > +      * cache the state locally and discard the PCI core one.
> > +      */
> >       pci_save_state(pdev);
> >       mhi_pdev->pci_state = pci_store_saved_state(pdev);
> > +     pci_load_saved_state(pdev, NULL);
>
> Why do you need to load the state here?

This one corresponds to 'discarding of PCI core saved state', indeed
in this driver context we save the PCI config in order to restore it
after reset or crash (and only for this). But pci_save_state() is also
used 'manually' in some drivers for suspend/resume operations, and
when PCI core detects a saved state done by a driver, it considers the
PCI driver to have done all appropriated suspend actions and does not
interfere in the suspend path. In this driver, we do want PCI core to
take care of suspending in a generic way (save-state, enable PME,
wakeup, etc...) but for this, we need to be sure the state is not
considered as manually saved, so this trick (loading a NULL state), is
just used to discard the saved_state from PCI core, to prevent issue
on first suspend.

Regards,
Loic
