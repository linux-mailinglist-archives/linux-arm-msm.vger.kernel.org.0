Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9002E1A99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 10:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgLWJl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Dec 2020 04:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgLWJl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Dec 2020 04:41:57 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AE5C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Dec 2020 01:41:17 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id t8so10061372pfg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Dec 2020 01:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VSEvuO+6OzKmY5VVoWhUG218kcfFo+f/+qMVsBfmy/Q=;
        b=sexPRHZPmgBCJelw62FPlM9uMQwQdBW4ry+Jwv5ZA+5VZt5TWhEZTfQX6W3+e/CzvN
         WbB/jilEQeWGs0sORu3lN5ADnz80LAzZbodkX4mfnC/Dy0V17UyXHB+EHTgO2E0fWNjz
         tSUuIaTKDs1l+yW0123D/8UEswHvmg2vnj2vOseMHtCbW6T+S+YALB2FZ0Epy3CbhCGj
         Ny7oxPUS/INz5JlWB3LGtfi7sw88YZeXuqSC0EklYKmXSwEI/RWIgNk0f4CNDFawfrs8
         BqD8ZoLXoKDpA4sE3AUb/DxT9ZQmYKKysnQxp9fYBPd6VuJgST2S+4JoNuhYmeu1yWxa
         8uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VSEvuO+6OzKmY5VVoWhUG218kcfFo+f/+qMVsBfmy/Q=;
        b=bRePnEKwCYTrEmawpBQb9Iebx67l/BO+iLa6pRR8/Ow6ZpOD+Mx1Nw1vNv+enxX+tv
         qnB0C+9zlKun0TeGVmnOFJinEUDLar70iO2Hooj3L1GDqSwfTCwpFORS3tVU6q4kNVmL
         ySF5Wf5eLy6iTgh+f7QpRv8KwTPah8FhWkbxoi8UOlPHVsIMGAf1uB1imyn5dPIz/05S
         VQR4IPx48cy+h+a7X2rJiG6fZZ/+CpMVTjyHx+x1/BIXoTvoj61DYHmv47BqskhCwY0h
         DzdiN6Rk6Q63f3pNOqenmhMDH9k6rh+pU8v6Iy3ghyZkFAPtj6mwLEQ4jTy9/iv+rP/R
         mJuw==
X-Gm-Message-State: AOAM5329xignaH5R5CXJgSTyS/zG95k9vzyzG4sYv7XxUrcT6qg6Qs3M
        KaslCyr+zSPh6rFtERQnpXQG
X-Google-Smtp-Source: ABdhPJy+3Y7FHJ5Y0kictnfZo7tCzGwTBHw8/mXhpDmDC69wfoIEumVDF96RbwojeTxNlDoPsjG3oA==
X-Received: by 2002:a62:19ca:0:b029:19d:cd0d:af83 with SMTP id 193-20020a6219ca0000b029019dcd0daf83mr23706594pfz.51.1608716476807;
        Wed, 23 Dec 2020 01:41:16 -0800 (PST)
Received: from thinkpad ([2409:4072:19b:2dd5:b19e:7f7d:7170:c975])
        by smtp.gmail.com with ESMTPSA id g85sm23838258pfb.4.2020.12.23.01.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 01:41:15 -0800 (PST)
Date:   Wed, 23 Dec 2020 15:11:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: [PATCH v5 06/10] mhi: pci_generic: Add suspend/resume/recovery
 procedure
Message-ID: <20201223094110.GA2644@thinkpad>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
 <1607955937-26951-7-git-send-email-loic.poulain@linaro.org>
 <20201222170534.GA18587@work>
 <CAMZdPi8kDLwqKBUjjkA2mkBpnj=AB53itEU=nObVXDVK+2jqYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi8kDLwqKBUjjkA2mkBpnj=AB53itEU=nObVXDVK+2jqYg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 23, 2020 at 09:25:37AM +0100, Loic Poulain wrote:
> Hi Mani,
> 
> On Tue, 22 Dec 2020 at 18:05, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >

[...]

> > > +
> > > +     /* Check if we can recover without full reset */
> > > +     pci_set_power_state(pdev, PCI_D0);
> > > +     pci_load_saved_state(pdev, mhi_pdev->pci_state);
> > > +     pci_restore_state(pdev);
> >
> > These pci state settings seems redundant with resume().
> >
> > In this function you should first check if MHI is alive, if yes then do
> > power up. Else you should just exit.
> 
> Recovery is not only executed on a resume but also when a crash or
> reboot is detected, that why we need to restore PCI state here.
> Moreover, contrary to resume, the restored PCI state is not the one
> saved in suspend, but the known working (and saved) initial pci state
> (mhi_pdev->pci_state).
> 

Ah I missed it!

> >
> > > +
> > > +     if (!mhi_pci_is_alive(mhi_cntrl))
> > > +             goto err_try_reset;
> > > +
> > > +     err = mhi_prepare_for_power_up(mhi_cntrl);
> > > +     if (err)
> > > +             goto err_try_reset;
> > > +
> > > +     err = mhi_sync_power_up(mhi_cntrl);
> > > +     if (err)
> > > +             goto err_unprepare;
> >
> > Add a debug log for recovery success.
> 
> Yes, will do.
> 
> >
> > > +
> > > +     set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> > > +     return;
> > > +
> > > +err_unprepare:
> > > +     mhi_unprepare_after_power_down(mhi_cntrl);
> > > +err_try_reset:
> > > +     if (pci_reset_function(pdev))
> >
> > So if the device recovers, who will make sure reinitializing the MHI
> > controller? That's why I think we should convey the recovery result to
> > PM core. I don't think using workqueue here is a good idea.
> 
> The mhi controller is reinitialized in the recovery work itself.
> Recovery can be a long process, and play with device
> registering/deregistering. We can not do that synchronously in the
> system resume path since it causes unexpected resume latency (this is
> actually no more a resume but a complete reset), moving it
> synchronously in resume cause hang on my side. However I agree that
> the PM core should be informed about the resume failure, so instead of
> unconditionally returning success in the resume callback I'm going to
> forward the error to PM core (and trigger recovery in parallel).
> 

okay.

> >
> > > +             dev_err(&pdev->dev, "Recovery failed\n");
> > > +}
> > > +
> > >  static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >  {
> > >       const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> > > @@ -327,6 +371,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >       if (!mhi_pdev)
> > >               return -ENOMEM;
> > >
> > > +     INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
> > > +
> > >       mhi_cntrl_config = info->config;
> > >       mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > >
> > > @@ -391,6 +437,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> > >       struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> > >       struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > >
> > > +     cancel_work_sync(&mhi_pdev->recovery_work);
> > > +
> > >       if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> > >               mhi_power_down(mhi_cntrl, true);
> > >               mhi_unprepare_after_power_down(mhi_cntrl);
> > > @@ -456,12 +504,66 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
> > >       .reset_done = mhi_pci_reset_done,
> > >  };
> > >
> > > +static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> > > +{
> > > +     struct pci_dev *pdev = to_pci_dev(dev);
> > > +     struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> > > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > > +
> > > +     cancel_work_sync(&mhi_pdev->recovery_work);
> > > +
> > > +     /* Transition to M3 state */
> > > +     mhi_pm_suspend(mhi_cntrl);
> > > +
> > > +     pci_save_state(pdev);
> > > +     pci_disable_device(pdev);
> > > +     pci_wake_from_d3(pdev, true);
> > > +     pci_set_power_state(pdev, PCI_D3hot);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int __maybe_unused mhi_pci_resume(struct device *dev)
> > > +{
> > > +     struct pci_dev *pdev = to_pci_dev(dev);
> > > +     struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> > > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > > +     int err;
> > > +
> > > +     pci_set_power_state(pdev, PCI_D0);
> > > +     pci_restore_state(pdev);
> > > +     pci_set_master(pdev);
> > > +
> > > +     err = pci_enable_device(pdev);
> > > +     if (err)
> > > +             goto err_recovery;
> > > +
> > > +     /* Exit M3, transition to M0 state */
> > > +     err = mhi_pm_resume(mhi_cntrl);
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "failed to resume device: %d\n", err);
> > > +             goto err_recovery;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +err_recovery:
> > > +     /* The device may have loose power or crashed, try recovering it */
> >
> > Did you actually hit this scenario? In the case of power loss or crash, can we
> > access the MHI register space?
> 
> Yes I hit this scenario on my computer since PCI power is not
> maintained, mhi_pm_resume behaves correctly whether the MHI register
> space is available or not since it will hit and return an error moving
> to M0 state:
> mhi mhi0: Did not enter M0 state, MHI state: M3, PM state: M3->M0
> 

Okay. As long as you are returning the error code to PM core I'm fine.

Thanks,
Mani

> 
> Regards,
> Loic
