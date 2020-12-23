Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1EB2E19DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 09:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgLWITm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Dec 2020 03:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbgLWITl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Dec 2020 03:19:41 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8E4C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Dec 2020 00:19:01 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id q22so21715108eja.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Dec 2020 00:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Juh5G8RBCUCYjwppYo3Xz5ig7z9rCHBHN683xCPS1Q8=;
        b=DFi8xDVYmNdBlKti3WgTwL9v/JOtzOs9XvhJfIHCXCbt60u3KC/lsKtEHLOCkGxrdh
         y1akI5MfcEbiMa6TyR6WT+pRFh10IpcCJOMINfYqDJ9oyNcWgXMWv0mpndz8rFX0ZNS7
         YTtxZNRwelubSSrFoGl2Ucj0A9s3A52Y5lCwy8DLnw0jWYjgH8DviTTflDhH4vCBIcCK
         jafsX49AzX9tYE0KQ7sofBDwp54kRMJLCNQNC3miqMOx8ghba01uSDRTAR0H7a7Fxvxr
         pcHhW/xYlJ7Ig2n5Zb/xMbiAEYP/6K57DPHwlQ819ETnXwzu+25vfhLA+ces1f10oTM7
         8+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Juh5G8RBCUCYjwppYo3Xz5ig7z9rCHBHN683xCPS1Q8=;
        b=g2minjLHGCS5o1b63/TAu595jakYeO689wl1jn78JIL2yQkfHNDiNZ7yFfpmigVDnV
         NiWeIWwVr7RjNN9+ABcoT/E9xz0Q74Z+0Q2S6lobcdOky/zB6igvWBmrqEbHb/90u3k6
         ZEFiWX2e/bKgK/NhXFdBSmk1im6iR9VCUkLxDqf2nsBhrr2+njN1FzONpjZpVUjTr2jk
         hKPOwssr73Sv5R8bJ/tYI4ZejIWnJlCmwGqOwLzMDmZHxWTnsEaZTelc4+KGF3y6/Wn7
         4IgwynQYmaBkTdkTiGuB7fDZwX7AV4Xfv3sRXuBFLwWIdhvXjT3N9savFQpj0iBH0o4r
         /GUA==
X-Gm-Message-State: AOAM530cMi96cmbE205MQ+muIxjMnTx/DqbJxz1OPHl0plQKQ9YFcpnF
        bLthod167pDYwoJP4CzU4msdkM6Xm2Kjc+kX/retQQ==
X-Google-Smtp-Source: ABdhPJxJCJ9QKxdTIdPMUxeOjVY0tEpwlNJN2I26UXtohmRokR4EhY8HCGau5ROGtvHcdlk7mLes8ajS7JfiV3DmY6g=
X-Received: by 2002:a17:906:40c1:: with SMTP id a1mr22765270ejk.520.1608711539304;
 Wed, 23 Dec 2020 00:18:59 -0800 (PST)
MIME-Version: 1.0
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
 <1607955937-26951-7-git-send-email-loic.poulain@linaro.org> <20201222170534.GA18587@work>
In-Reply-To: <20201222170534.GA18587@work>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 23 Dec 2020 09:25:37 +0100
Message-ID: <CAMZdPi8kDLwqKBUjjkA2mkBpnj=AB53itEU=nObVXDVK+2jqYg@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] mhi: pci_generic: Add suspend/resume/recovery procedure
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Tue, 22 Dec 2020 at 18:05, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, Dec 14, 2020 at 03:25:33PM +0100, Loic Poulain wrote:
> > Add support for system wide suspend/resume. During suspend, MHI
> > device controller must be put in M3 state and PCI bus in D3 state.
> >
> > Add a recovery procedure allowing to reinitialize the device in case
> > of error during resume steps, which can happen if device loses power
> > (and so its context) while system suspend.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
> > ---
> >  drivers/bus/mhi/pci_generic.c | 102 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 2521cd4..0936701 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/mhi.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > +#include <linux/workqueue.h>
> >
> >  #define MHI_PCI_DEFAULT_BAR_NUM 0
> >
> > @@ -186,6 +187,7 @@ enum mhi_pci_device_status {
> >  struct mhi_pci_device {
> >       struct mhi_controller mhi_cntrl;
> >       struct pci_saved_state *pci_state;
> > +     struct work_struct recovery_work;
> >       unsigned long status;
> >  };
> >
> > @@ -313,6 +315,48 @@ static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
> >       /* no PM for now */
> >  }
> >
> > +static void mhi_pci_recovery_work(struct work_struct *work)
> > +{
> > +     struct mhi_pci_device *mhi_pdev = container_of(work, struct mhi_pci_device,
> > +                                                    recovery_work);
> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +     struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> > +     int err;
> > +
> > +     dev_warn(&pdev->dev, "device recovery started\n");
> > +
> > +     /* Clean up MHI state */
> > +     if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> > +             mhi_power_down(mhi_cntrl, false);
> > +             mhi_unprepare_after_power_down(mhi_cntrl);
> > +     }
> > +
> > +     /* Check if we can recover without full reset */
> > +     pci_set_power_state(pdev, PCI_D0);
> > +     pci_load_saved_state(pdev, mhi_pdev->pci_state);
> > +     pci_restore_state(pdev);
>
> These pci state settings seems redundant with resume().
>
> In this function you should first check if MHI is alive, if yes then do
> power up. Else you should just exit.

Recovery is not only executed on a resume but also when a crash or
reboot is detected, that why we need to restore PCI state here.
Moreover, contrary to resume, the restored PCI state is not the one
saved in suspend, but the known working (and saved) initial pci state
(mhi_pdev->pci_state).

>
> > +
> > +     if (!mhi_pci_is_alive(mhi_cntrl))
> > +             goto err_try_reset;
> > +
> > +     err = mhi_prepare_for_power_up(mhi_cntrl);
> > +     if (err)
> > +             goto err_try_reset;
> > +
> > +     err = mhi_sync_power_up(mhi_cntrl);
> > +     if (err)
> > +             goto err_unprepare;
>
> Add a debug log for recovery success.

Yes, will do.

>
> > +
> > +     set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> > +     return;
> > +
> > +err_unprepare:
> > +     mhi_unprepare_after_power_down(mhi_cntrl);
> > +err_try_reset:
> > +     if (pci_reset_function(pdev))
>
> So if the device recovers, who will make sure reinitializing the MHI
> controller? That's why I think we should convey the recovery result to
> PM core. I don't think using workqueue here is a good idea.

The mhi controller is reinitialized in the recovery work itself.
Recovery can be a long process, and play with device
registering/deregistering. We can not do that synchronously in the
system resume path since it causes unexpected resume latency (this is
actually no more a resume but a complete reset), moving it
synchronously in resume cause hang on my side. However I agree that
the PM core should be informed about the resume failure, so instead of
unconditionally returning success in the resume callback I'm going to
forward the error to PM core (and trigger recovery in parallel).

>
> > +             dev_err(&pdev->dev, "Recovery failed\n");
> > +}
> > +
> >  static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  {
> >       const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> > @@ -327,6 +371,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >       if (!mhi_pdev)
> >               return -ENOMEM;
> >
> > +     INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
> > +
> >       mhi_cntrl_config = info->config;
> >       mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >
> > @@ -391,6 +437,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> >       struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> >       struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >
> > +     cancel_work_sync(&mhi_pdev->recovery_work);
> > +
> >       if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> >               mhi_power_down(mhi_cntrl, true);
> >               mhi_unprepare_after_power_down(mhi_cntrl);
> > @@ -456,12 +504,66 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
> >       .reset_done = mhi_pci_reset_done,
> >  };
> >
> > +static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> > +{
> > +     struct pci_dev *pdev = to_pci_dev(dev);
> > +     struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +
> > +     cancel_work_sync(&mhi_pdev->recovery_work);
> > +
> > +     /* Transition to M3 state */
> > +     mhi_pm_suspend(mhi_cntrl);
> > +
> > +     pci_save_state(pdev);
> > +     pci_disable_device(pdev);
> > +     pci_wake_from_d3(pdev, true);
> > +     pci_set_power_state(pdev, PCI_D3hot);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused mhi_pci_resume(struct device *dev)
> > +{
> > +     struct pci_dev *pdev = to_pci_dev(dev);
> > +     struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +     int err;
> > +
> > +     pci_set_power_state(pdev, PCI_D0);
> > +     pci_restore_state(pdev);
> > +     pci_set_master(pdev);
> > +
> > +     err = pci_enable_device(pdev);
> > +     if (err)
> > +             goto err_recovery;
> > +
> > +     /* Exit M3, transition to M0 state */
> > +     err = mhi_pm_resume(mhi_cntrl);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to resume device: %d\n", err);
> > +             goto err_recovery;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_recovery:
> > +     /* The device may have loose power or crashed, try recovering it */
>
> Did you actually hit this scenario? In the case of power loss or crash, can we
> access the MHI register space?

Yes I hit this scenario on my computer since PCI power is not
maintained, mhi_pm_resume behaves correctly whether the MHI register
space is available or not since it will hit and return an error moving
to M0 state:
mhi mhi0: Did not enter M0 state, MHI state: M3, PM state: M3->M0


Regards,
Loic
