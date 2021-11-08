Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C066D447B40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 08:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235939AbhKHHnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 02:43:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:37968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235686AbhKHHnf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 02:43:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B451A61178;
        Mon,  8 Nov 2021 07:40:48 +0000 (UTC)
Date:   Mon, 8 Nov 2021 13:10:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
Message-ID: <20211108074044.GA6161@thinkpad>
References: <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation>
 <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
 <20211022144026.GA7657@thinkpad>
 <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
 <20211102105035.GB5646@thinkpad>
 <CAAP7ucLVtOR7+NJiWK_is0yv+zWKB9vmxpy4PyO5FQdVUE6uzA@mail.gmail.com>
 <20211102162259.GC5646@thinkpad>
 <CAAP7ucLLaYVBgLU7Fp5r21wtnqBhoYK-+9=qr3Rf1O1S81xDBw@mail.gmail.com>
 <20211102180912.GD5646@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20211102180912.GD5646@thinkpad>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

On Tue, Nov 02, 2021 at 11:39:12PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Nov 02, 2021 at 05:55:34PM +0100, Aleksander Morgado wrote:
> > > > > > [    7.189547] mhi mhi0: Transitioning from PM state: Linkdown or
> > > > > > Error Fatal Detect to: SYS ERROR Process
> > > > >
> > > > > Hmm, I think the use of sync_power_up might be causing the issue here as it
> > > > > forces the MHI state to fatal error.
> > > > >
> > > > > Ignore the previous diff and try the below one:
> > > > >
> > > > > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > > > > index 59a4896a8030..b1e8c7de4e54 100644
> > > > > --- a/drivers/bus/mhi/pci_generic.c
> > > > > +++ b/drivers/bus/mhi/pci_generic.c
> > > > > @@ -637,7 +637,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
> > > > >         if (err)
> > > > >                 goto err_try_reset;
> > > > >
> > > > > -       err = mhi_sync_power_up(mhi_cntrl);
> > > > > +       err = mhi_async_power_up(mhi_cntrl);
> > >
> > > Doh! Sorry, I modified the wrong function. Here is the correct one:
> > >
> > > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > > index 59a4896a8030..1e3c74bfbe34 100644
> > > --- a/drivers/bus/mhi/pci_generic.c
> > > +++ b/drivers/bus/mhi/pci_generic.c
> > > @@ -743,7 +743,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >                 goto err_unregister;
> > >         }
> > >
> > > -       err = mhi_sync_power_up(mhi_cntrl);
> > > +       err = mhi_async_power_up(mhi_cntrl);
> > >         if (err) {
> > >                 dev_err(&pdev->dev, "failed to power up MHI controller\n");
> > >                 goto err_unprepare;
> > >
> > > Let's see how it goes :)
> > >
> > 
> > Oh, wow, what a difference a single extra byte in the correct place makes! :D
> > 
> > This looks waaaaay better; I've rebooted the board at least 10 times
> > now and all of them worked nicely, at least just the process to probe
> > the device and get the control and net ports exposed looks very
> > reliable now. I'll test the setup with ModemManager in the next days
> > and see how everything goes. Thank you very much!
> > 
> 
> That's great to hear! Let me know how your testing goes with ModemManager. I'll
> then submit a patch to fix the pci-generic driver.
> 

Can you please test the attached patch? We had an internal discussion and came
to a conclusion that the device is not handling the SYS_ERR case during host
bootup. So we need to adjust the SYS_ERR logic handling in host to workaround
it.

Thanks,
Mani

> Thanks,
> Mani

--ew6BAiZeqk4r7MaW
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-bus-mhi-Register-IRQ-handler-after-SYS_ERR-check-dur.patch"

From f2fc172e2fcaadb07e2d22bb0cc5642df7cd6495 Mon Sep 17 00:00:00 2001
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 8 Nov 2021 13:05:50 +0530
Subject: [PATCH] bus: mhi: Register IRQ handler after SYS_ERR check during
 power up

Some devices tend to issue SYS_ERR interrupt while the host handling
the SYS_ERR state of the device during power up. This creates a race
and causes failure in booting up the device.

Hence, register the irq handler only after handling the SYS_ERR check
to avoid getting spurious IRQs from the device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index fb99e3727155..ec5f11166820 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1055,10 +1055,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	mutex_lock(&mhi_cntrl->pm_mutex);
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 
-	ret = mhi_init_irq_setup(mhi_cntrl);
-	if (ret)
-		goto error_setup_irq;
-
 	/* Setup BHI INTVEC */
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
@@ -1072,7 +1068,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		dev_err(dev, "%s is not a valid EE for power on\n",
 			TO_MHI_EXEC_STR(current_ee));
 		ret = -EIO;
-		goto error_async_power_up;
+		goto error_setup_irq;
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
@@ -1082,19 +1078,18 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	if (state == MHI_STATE_SYS_ERR) {
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 		ret = wait_event_timeout(mhi_cntrl->state_event,
-				MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
-					mhi_read_reg_field(mhi_cntrl,
-							   mhi_cntrl->regs,
-							   MHICTRL,
-							   MHICTRL_RESET_MASK,
-							   MHICTRL_RESET_SHIFT,
+					 mhi_read_reg_field(mhi_cntrl,
+							    mhi_cntrl->regs,
+							    MHICTRL,
+							    MHICTRL_RESET_MASK,
+							    MHICTRL_RESET_SHIFT,
 							   &val) ||
 					!val,
 				msecs_to_jiffies(mhi_cntrl->timeout_ms));
 		if (!ret) {
 			ret = -EIO;
 			dev_info(dev, "Failed to reset MHI due to syserr state\n");
-			goto error_async_power_up;
+			goto error_setup_irq;
 		}
 
 		/*
@@ -1104,6 +1099,10 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
 	}
 
+	ret = mhi_init_irq_setup(mhi_cntrl);
+	if (ret)
+		goto error_setup_irq;
+
 	/* Transition to next state */
 	next_state = MHI_IN_PBL(current_ee) ?
 		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
@@ -1116,9 +1115,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 
-error_async_power_up:
-	mhi_deinit_free_irq(mhi_cntrl);
-
 error_setup_irq:
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 	mutex_unlock(&mhi_cntrl->pm_mutex);
-- 
2.25.1


--ew6BAiZeqk4r7MaW--
