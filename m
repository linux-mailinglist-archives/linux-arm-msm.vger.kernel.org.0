Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE363944E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 20:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730474AbfFGS14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 14:27:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35933 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730228AbfFGS1z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 14:27:55 -0400
Received: by mail-pg1-f196.google.com with SMTP id a3so1584844pgb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 11:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oIjp0laGeaMLz3DpfA7bZ3JYDaFx6ya3dcNI7Njhg8A=;
        b=ESkpHft1KvNCIjHH3O/JUW/TyJfp8u5I0y/5PBA0Kc3OLYfdGygNcQ3HrL6mlWClj7
         bpPx05wKv7MF2xAYgnxO6JCCJ2cIO62/8SRg3N5N7U9wPn80JwsKcfvk8CeTjbA0U4f9
         iVyZZEVy+xGP3u6Aoq8A+IXLbf28YRQfrCs+a3ovoMF4t17OeqK/B5HSIwzwIGpHAKaj
         Mbd5iK+qvuTCS0O8YKKWAm5rhOdvRI3zYHUUURf08xwu8gAWNRBNUnGTXeyJ5RK+rEry
         8xddYxkOrBjmpqUD8ftZyfQBuIp3R+2fMQNaKLXXUmzot5YaCPjuBWAledWLDCr1SUiH
         /fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oIjp0laGeaMLz3DpfA7bZ3JYDaFx6ya3dcNI7Njhg8A=;
        b=ke2Y3RQKW+bJ0jOhpvZvqRKS++s9uZfvZMhaJi8WWY3Iq4iab28S0+xVhjXrZwdfGa
         aWSmxiy+a09rjYM/ua3WVSZWMonR5XRHmhjHVOB70hZaqnHYyJzp2qnzgtDWxu5getDE
         GPnZjB7nbTkLj2V5GtNjZaLbApp+YG3piCgL25yrj7J2btUQHg5f9fW+/3W39cNO7V2Z
         d6q1dHV1Yjnk0g9ueaEmMfGwdIOpeh7dwKfFuW8MLAH4XboH+Jex7Rek4DAGAEIpSup5
         2mht2jagFX8Plsm3n8OTnKSTQisdXtTh4apvF47lsdR865ceYP6h0nKGIP4GW3booxPJ
         bDNA==
X-Gm-Message-State: APjAAAUaSCjj88Q3mfFOWonVjzO3+yg38/BG0azH5un/WJKWzZjp2cSM
        Cj+YmI4JLspRAWxmMBzb/SmINA==
X-Google-Smtp-Source: APXvYqyrJmrV7+okkrFesHkpTxqrJm8TWaLeMfZ3XymVF9KmZh5tefwAwOWAl5r4VG5HGHrfuPm0/A==
X-Received: by 2002:aa7:8ac7:: with SMTP id b7mr46483017pfd.100.1559932075002;
        Fri, 07 Jun 2019 11:27:55 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d24sm2610692pjv.24.2019.06.07.11.27.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 11:27:54 -0700 (PDT)
Date:   Fri, 7 Jun 2019 11:27:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Avri Altman <avri.altman@wdc.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        SCSI <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
Message-ID: <20190607182752.GN4814@minitux>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <20190604072001.9288-3-bjorn.andersson@linaro.org>
 <CGME20190604075345epcas2p4078376e31e760396490431a6b631f9dd@epcas2p4.samsung.com>
 <53775224-5418-1235-20a2-c46d76ef56da@free.fr>
 <875adde9-1a4b-6bb6-1990-9bb78610546c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875adde9-1a4b-6bb6-1990-9bb78610546c@samsung.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 07 Jun 03:41 PDT 2019, Alim Akhtar wrote:

> Hi Marc
> Thanks for coping me.
> 
> On 6/4/19 1:23 PM, Marc Gonzalez wrote:
> > [ Shuffling the recipients list ]
> > 
> > On 04/06/2019 09:20, Bjorn Andersson wrote:
> > 
> >> Acquire the device-reset GPIO and toggle this to reset the UFS device
> >> during initialization and host reset.
> >>
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> ---
> >>   drivers/scsi/ufs/ufshcd.c | 44 +++++++++++++++++++++++++++++++++++++++
> >>   drivers/scsi/ufs/ufshcd.h |  4 ++++
> >>   2 files changed, 48 insertions(+)
> >>
> >> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> >> index 8c1c551f2b42..951a0efee536 100644
> >> --- a/drivers/scsi/ufs/ufshcd.c
> >> +++ b/drivers/scsi/ufs/ufshcd.c
> >> @@ -42,6 +42,7 @@
> >>   #include <linux/nls.h>
> >>   #include <linux/of.h>
> >>   #include <linux/bitfield.h>
> >> +#include <linux/gpio/consumer.h>
> >>   #include "ufshcd.h"
> >>   #include "ufs_quirks.h"
> >>   #include "unipro.h"
> >> @@ -6104,6 +6105,25 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> >>   	return err;
> >>   }
> >>   
> >> +/**
> >> + ufshcd_device_reset() - toggle the (optional) device reset line
> >> + * @hba: per-adapter instance
> >> + *
> >> + * Toggles the (optional) reset line to reset the attached device.
> >> + */
> >> +static void ufshcd_device_reset(struct ufs_hba *hba)
> >> +{
> >> +	/*
> >> +	 * The USB device shall detect reset pulses of 1us, sleep for 10us to
> >> +	 * be on the safe side.
> >> +	 */
> >> +	gpiod_set_value_cansleep(hba->device_reset, 1);
> >> +	usleep_range(10, 15);
> >> +
> >> +	gpiod_set_value_cansleep(hba->device_reset, 0);
> >> +	usleep_range(10, 15);
> >> +}
> >> +
> >>   /**
> >>    * ufshcd_host_reset_and_restore - reset and restore host controller
> >>    * @hba: per-adapter instance
> >> @@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
> >>   	int retries = MAX_HOST_RESET_RETRIES;
> >>   
> >>   	do {
> >> +		/* Reset the attached device */
> >> +		ufshcd_device_reset(hba);
> >> +
> >>   		err = ufshcd_host_reset_and_restore(hba);
> >>   	} while (err && --retries);
> >>   
> >> @@ -7355,6 +7378,18 @@ static void ufshcd_variant_hba_exit(struct ufs_hba *hba)
> >>   	ufshcd_vops_exit(hba);
> >>   }
> >>   
> >> +static int ufshcd_init_device_reset(struct ufs_hba *hba)
> >> +{
> >> +	hba->device_reset = devm_gpiod_get_optional(hba->dev, "device-reset",
> >> +						    GPIOD_OUT_HIGH);
> >> +	if (IS_ERR(hba->device_reset)) {
> >> +		dev_err(hba->dev, "failed to acquire reset gpio: %ld\n",
> >> +			PTR_ERR(hba->device_reset));
> >> +	}
> >> +
> >> +	return PTR_ERR_OR_ZERO(hba->device_reset);
> >> +}
> >> +
> >>   static int ufshcd_hba_init(struct ufs_hba *hba)
> >>   {
> >>   	int err;
> >> @@ -7394,9 +7429,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
> >>   	if (err)
> >>   		goto out_disable_vreg;
> >>   
> >> +	err = ufshcd_init_device_reset(hba);
> >> +	if (err)
> >> +		goto out_disable_variant;
> >> +
> >>   	hba->is_powered = true;
> >>   	goto out;
> >>   
> >> +out_disable_variant:
> >> +	ufshcd_vops_setup_regulators(hba, false);
> >>   out_disable_vreg:
> >>   	ufshcd_setup_vreg(hba, false);
> >>   out_disable_clks:
> >> @@ -8290,6 +8331,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
> >>   		goto exit_gating;
> >>   	}
> >>   
> >> +	/* Reset the attached device */
> >> +	ufshcd_device_reset(hba);
> >> +
> >>   	/* Host controller enable */
> >>   	err = ufshcd_hba_enable(hba);
> >>   	if (err) {
> >> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> >> index ecfa898b9ccc..d8be67742168 100644
> >> --- a/drivers/scsi/ufs/ufshcd.h
> >> +++ b/drivers/scsi/ufs/ufshcd.h
> >> @@ -72,6 +72,8 @@
> >>   #define UFSHCD "ufshcd"
> >>   #define UFSHCD_DRIVER_VERSION "0.2"
> >>   
> >> +struct gpio_desc;
> >> +
> >>   struct ufs_hba;
> >>   
> >>   enum dev_cmd_type {
> >> @@ -706,6 +708,8 @@ struct ufs_hba {
> >>   
> >>   	struct device		bsg_dev;
> >>   	struct request_queue	*bsg_queue;
> >> +
> >> +	struct gpio_desc *device_reset;
> >>   };
> >>   
> >>   /* Returns true if clocks can be gated. Otherwise false */
> >>
> > 
> > Why is this needed on 845 and not on 8998?
> > 
> Not sure about MSM, but this is high implementation dependent, different 
> SoC vendors implement device reset in different way, like one mentioned 
> above in this patch, and in case of Samsung/exynos, HCI register control 
> device reset. AFA ufs spec is concerns, it just mandate about connecting 
> a active low signal to RST_n pin of the ufs device.

I didn't consider the case where the host controller is the GPIO
controller, in which case it makes sense to move this to the platform
driver so that we don't have to implement a gpio-controller in the
exynos platform driver, to be consumed by the ufshcd.

I'll rework this.

Thanks,
Bjorn
