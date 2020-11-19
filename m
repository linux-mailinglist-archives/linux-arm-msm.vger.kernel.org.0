Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D1D2B8F59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 10:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgKSJsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 04:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgKSJsx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 04:48:53 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E09C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 01:48:53 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id f23so7026475ejk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HrPXGNeVjoAIy6TbpTY+phkkCXLIJzRvYmlpIIU6nSs=;
        b=S0QTcNMwcv5jlTKBjtdOFxFZJ1YoOZeiKix0ys+5lwPw8CZC+sCIDceDX2PJOLtZ41
         YE+/0bXe8PIjK8Fp0Xz8JohJQqlm18HpoYaAqxK5TFtFTJb7H7iwojMKvSjsBTRT0onT
         KfUg44zhmsqFC+SOBXtIxbHp3EPWgVt+80A9a8+uIz2m3Gkb0PwJ+TD0YthX93Bp73Sm
         JVU/0tGq5ZfisVGjOFx5r0FTRl+rbjDkZtCnjRmojjRIOem9k2y/XOXnmFgmrZSuCXba
         gs6BO2BAQIiph9OQaTt/0+Ol8cu/hFNruftyo0SRfp9ZeGH/p32SmjoEI0GIGa6DmQ2x
         90GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HrPXGNeVjoAIy6TbpTY+phkkCXLIJzRvYmlpIIU6nSs=;
        b=epRTL4SrztSY/jllaKlLTKN1bTmDZwz4pnP9T4D3eURqoaajTPHRszSB9gqjlYYFEK
         s1mNwDs3GmLbxQYYV8qVTVr4UIpcS8rSfoj0legHPudwRCk0k5GWrtBmns8d1wHP1E9H
         SzVExqy2/HlTNfP20uj2P/N9FgtqrnrSj2YbikilD8QqKxT/Is8vF0qd0nZT+h+vhjtU
         ysmQU9Rap5EODsLznGtIx2VYO/wBxVjsw+aTPdbCu/A/aTDxj+qOLhS75IPDuCvMENwy
         Vf3je7AaWgwR2wFPN1l0z7pOE/Vg9WqG8DNW/krHquCYlf1mmjcgYsijvVssyJ/mVRs/
         0Rxw==
X-Gm-Message-State: AOAM533FXdVSHRlKM3e/rgq+fdTnGSO4vU1QKP3qspiJReVAd4LWOL26
        FxDKc+1ZbanVn2Re8blrzPxL3zrrbHhfBjS/e/QxcQ==
X-Google-Smtp-Source: ABdhPJyGCMs3a+222v9uqkdwJ0jHQr4lAObzm8Bqi7la8s4DIzXj+UXoFIVawdHw0mY39XxkW2CN6ywLwJrdFMmoop8=
X-Received: by 2002:a17:906:38db:: with SMTP id r27mr28080886ejd.328.1605779332040;
 Thu, 19 Nov 2020 01:48:52 -0800 (PST)
MIME-Version: 1.0
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-6-git-send-email-loic.poulain@linaro.org> <5702d42a-d1ec-0489-b7be-e40a8178e808@codeaurora.org>
In-Reply-To: <5702d42a-d1ec-0489-b7be-e40a8178e808@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 19 Nov 2020 10:54:54 +0100
Message-ID: <CAMZdPi94wfXb+_ZAUKk1ahFWX8-J69Gw0b9DFfEmZNNCOcG5SQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] mhi: pci_generic: Add suspend/resume/recovery procedure
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant,

On Thu, 19 Nov 2020 at 03:21, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 11/13/20 6:59 AM, Loic Poulain wrote:
> > Add support for system wide suspend/resume. During suspend, MHI
> > device controller must be put in M3 state and PCI bus in D3 state.
> >
> > Add a recovery procedure allowing to reinitialize the device in case
> > of error during resume steps, which can happen if device loses power
> > (and so its context) while system suspend.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> [..]
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
> > +
> > +     set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> > +     return;
> > +
> > +err_unprepare:
> > +     mhi_unprepare_after_power_down(mhi_cntrl);
> > +err_try_reset:
> > +     if (pci_reset_function(pdev))
> > +             dev_err(&pdev->dev, "Recovery failed\n");
> > +}
> > +
> >   static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >   {
> >       const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> > @@ -333,6 +377,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >       if (!mhi_pdev)
> >               return -ENOMEM;
> >
> > +     INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
> > +
> >       mhi_cntrl_config = info->config;
> >       mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >       mhi_cntrl->cntrl_dev = &pdev->dev;
> > @@ -395,6 +441,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> >       struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> >       struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >
> > +     cancel_work_sync(&mhi_pdev->recovery_work);
> > +
> >       if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> >               mhi_power_down(mhi_cntrl, true);
> >               mhi_unprepare_after_power_down(mhi_cntrl);
> > @@ -463,12 +511,64 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
> >       .reset_done = mhi_pci_reset_done,
> >   };
> >
> > +int  __maybe_unused mhi_pci_suspend(struct device *dev)
> > +{
> > +     struct pci_dev *pdev = to_pci_dev(dev);
> > +     struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +
> is it possible we come here and work still did not get a chance to run ?
> If so we can flush it before going through suspend.

Yes, would be good to cancel that work, will fix that.

> > +     /* Transition to M3 state */
> > +     mhi_pm_suspend(mhi_cntrl);
> > +
> > +     pci_save_state(pdev);
> > +     pci_disable_device(pdev);
> > +     pci_wake_from_d3(pdev, true);
> > +     pci_set_power_state(pdev, PCI_D3hot);
> are you planning to park the device in D3hot all the time ?
> Is there a plan to move to D3Cold in your use case ?

D3Cold is not a state that is controllable in software.

But here we support both scenarios:

Either the device is kept powered during platform suspend, because
e.g. it has auxiliary power. In that case, context is maintained and
the device can be safely resumed from M3. (e.g The M2 spec specifies
that 3.3V power should be provided even during system suspend).

Or the device has its power cut off during platform suspend, that
actually the case with my desktop, PCI express ports are disabled, and
the modem is powered off, this is D3Cold. In that case, we need to
reinitialize the modem, that what is done in the recovery procedure.

Regards,
Loic
