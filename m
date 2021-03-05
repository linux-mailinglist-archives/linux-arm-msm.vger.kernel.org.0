Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E555832F2E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 19:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhCESkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 13:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhCESjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 13:39:54 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332BAC061764
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 10:39:42 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id a24so1828254plm.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 10:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIaqPs20iclQtPrPbuK2QQUA3tuWwAs9PxpQJ3oU0YQ=;
        b=Qg5Iy9q/rSyLsg7FhZCk+YrmgLUWmt0z3DVtWRHUpakf19pg300D8Or1wxhDcn+Oea
         cMDtwqMJsfEctAu/foVC9d+TbIEGkGsGGasmnIH9bjWaAWC1JSpTRXAra0rnLMrDDtLh
         vnGPnH3VX1IjqRBUJBj0H40gPgSNrVj51Y8bZO7BW4xevBggg1JZMJv3Ke8axnZADq7I
         TPFx6ai/U3WpUMVskd0VFjiCnENXgUUUzHfdTx7hkAnAbYyXOvWV6XACKBrmF07uul+o
         Q4f4sj5JRSQEiLnH6eiIrtrwFWPa/IZR7gjVt0L7i5Je+mWi2bw7PIOtTtMRPwJtwsAb
         8zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIaqPs20iclQtPrPbuK2QQUA3tuWwAs9PxpQJ3oU0YQ=;
        b=YG8qjaGUPw1JH/8sRngluxP8+XuTZWEGFeqUHjfM4RsfmeYSB72xyYX+TXCu59VLhl
         jmHZNSQ2CCjw8UTJgmi9UqsZf0SCuuIJa6DF1XynO74xyz82AMGxgJbfs2NcA8CFoYOt
         d6S7kSe/cRPwFDDaraX4bfqkw+6J16TLPkWo+O5nVsRdvG20N4QA7tkmn9RugGFtR0pq
         odlRz1LqjObkCdyNv/q348WAjhi5o0V3kQhbRQp0wIbcaUuRj6khPA1QS4ZjCrRrfQkg
         pAtRzkfmPq0DVvG2P8xV2RHJhQRYZZEPnadpaxZYzcgUTPS0BPbLH1lBY4AQMMaZmPWK
         HpXA==
X-Gm-Message-State: AOAM531J/X82UrogNHCpfJ8t7olbtFa2Ko9UvV1mMvdFknXka7ziWk9e
        OzsmfsZU3x/fSemT/uiGeI2Xiqd70R6zY6E70VoSoTfmjhB2nA==
X-Google-Smtp-Source: ABdhPJyAojT4F6cbrWMGnSdfSrYhtw+kfm0BVS5ILqj7yfrhq+Y8zDqWg01YZJa22PsEXExYic7niSladGbz4ID6EQw=
X-Received: by 2002:a17:902:b697:b029:e5:d83e:3757 with SMTP id
 c23-20020a170902b697b02900e5d83e3757mr9492833pls.67.1614969581491; Fri, 05
 Mar 2021 10:39:41 -0800 (PST)
MIME-Version: 1.0
References: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
 <1614948478-2284-6-git-send-email-loic.poulain@linaro.org> <20210305174623.GE2553@thinkpad>
In-Reply-To: <20210305174623.GE2553@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 5 Mar 2021 19:39:05 +0100
Message-ID: <CAMZdPi_p7Hta0xAFmwX5Ai0SUGtfQchhQxtrL0yRkPcY-DsSmg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] mhi: pci_generic: Add support for runtime PM
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Fri, 5 Mar 2021 at 18:46, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Fri, Mar 05, 2021 at 01:47:58PM +0100, Loic Poulain wrote:
> > When the device is idle it is possible to move it into the lowest MHI
> > PM state (M3). In that mode, all MHI operations are suspended and the
> > PCI device can be safely put into PCI D3 state.
> >
> > The device is then resumed from D3/M3 either because of host initiated
> > MHI operation (e.g. buffer TX) or because the device (modem) has
> > triggered wake-up via PME feature (e.g. on incoming data).
> >
> > Same procedures can be used for system wide or runtime suspend/resume.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: replace force_runtime_suspend/resume via local function to ensure
> >      device is always resumed during system resume whatever its runtime
> >      pm state.
> >
> >  drivers/bus/mhi/pci_generic.c | 95 +++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 86 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 4ab0aa8..e36f5a9 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/mhi.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/timer.h>
> >  #include <linux/workqueue.h>
> >
> > @@ -274,6 +275,7 @@ MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> >
> >  enum mhi_pci_device_status {
> >       MHI_PCI_DEV_STARTED,
> > +     MHI_PCI_DEV_SUSPENDED,
> >  };
> >
> >  struct mhi_pci_device {
> > @@ -306,6 +308,11 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
> >       case MHI_CB_FATAL_ERROR:
> >       case MHI_CB_SYS_ERROR:
> >               dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
> > +             pm_runtime_forbid(&pdev->dev);
> > +             break;
> > +     case MHI_CB_EE_MISSION_MODE:
> > +             pm_runtime_mark_last_busy(&pdev->dev);
>
> Do you really need to update the last_busy time here? You're already updating it
> before each runtime_put() call and those will overwrite this value.

Right, it is not strictly necessary.

>
> > +             pm_runtime_allow(&pdev->dev);
> >               break;
> >       default:
> >               break;
> > @@ -427,13 +434,19 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>
> [...]
>
> > -static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> > +static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
> >  {
> >       struct pci_dev *pdev = to_pci_dev(dev);
> >       struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> >       struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +     int err;
> > +
> > +     if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
> > +             return 0;
> >
> >       del_timer(&mhi_pdev->health_check_timer);
> >       cancel_work_sync(&mhi_pdev->recovery_work);
> >
> > +     if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
> > +                     mhi_cntrl->ee != MHI_EE_AMSS)
> > +             goto pci_suspend; /* Nothing to do at MHI level */
> > +
> >       /* Transition to M3 state */
> > -     mhi_pm_suspend(mhi_cntrl);
> > +     err = mhi_pm_suspend(mhi_cntrl);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to suspend device: %d;\n", err);
>
> Remove the semicolon after "%d"

OK.

>
> > +             clear_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status);
> > +             return -EBUSY;
> > +     }
> >
> > +pci_suspend:
> >       pci_disable_device(pdev);
> >       pci_wake_from_d3(pdev, true);
> >
> >       return 0;
> >  }
> >
> > -static int __maybe_unused mhi_pci_resume(struct device *dev)
> > +static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
> >  {
> >       struct pci_dev *pdev = to_pci_dev(dev);
> >       struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> >       struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >       int err;
> >
> > +     if (!test_and_clear_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
> > +             return 0;
> > +
> >       err = pci_enable_device(pdev);
> >       if (err)
> >               goto err_recovery;
> > @@ -740,6 +786,13 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
> >       pci_set_master(pdev);
> >       pci_wake_from_d3(pdev, false);
> >
> > +     /* It can be a remote wakeup (no mhi runtime_get), update access time */
> > +     pm_runtime_mark_last_busy(dev);
>
> I think this should be moved after mhi_pm_resume().

you're right.

Loic


>
> Thanks,
> Mani
