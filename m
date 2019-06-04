Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D77A3529D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 00:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfFDWOc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 18:14:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34021 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFDWOb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 18:14:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id h2so7916611pgg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=imo21nhts77lO2m4lpNC7PMK1HSd6fIp3/94OeVuXHA=;
        b=snsFuNpZRFrD3eIbZEi+Uv7FiKiKfT6WkpSwYehnrSgEjWYPSx+qTKRg6iyAVtGbtp
         d5jZnk9c7k0xIx3CMRd12V9HXWXgTgeNm+0StikL5+3AvqKbj8vhSyBLN+BpZXy3+vFk
         7szwMQpG2WOpSe5fPELJ1fV6was4rmxH1QFFuWmy1HhVGT75O8CQhWJ7zgtiUifKIFxI
         B2bxWSw8NS2vnfAgnktFqm01caSqDxLRJWx9gFxG9v6N0gEzcKVL+CphkV1NSiLrQnGj
         Rg67eFCwjdrcNbat6jI96+d0EiWRtYhcy2UsQec5Rs0BgnIoBtoHRpxNh/UBExEk/tIC
         AZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=imo21nhts77lO2m4lpNC7PMK1HSd6fIp3/94OeVuXHA=;
        b=k31VkHEyuPo0E5kknbOphohmoNDn7LKxUCH/NIo8/lMLlLa0mH4MS88QNX2DeNit3u
         h6iAb52WX1R92geRx4xPwBNMUUYT27DxL56BzM4z1vTwy7lkmE4N6wzO/TfnZlKvaDzQ
         W3yvSt6+pXdd8uG0LPwa81sovrM85um9QmVs8czUPYyzSqjnCeR6158B6vB2/5n4h5P+
         7W2Jkfcfs8DiBrU0XSGECdZYO+UzRYj6YbdbM+Wq6tPrfXfBhwrzXB3t3Y53Z5r9/Nqt
         R0GB08ow0u2uPCTLCzvXYr8ojw4hDlUwEpuO0d8HirKfwHmmCas0S4z9z304ldwKgbwz
         rohg==
X-Gm-Message-State: APjAAAUkpsSi1sIs5pCP+QV6Lpxi7yvRnCDAs2md24fMVFHqu/IHdwWi
        XyGmBb+Lk9UkLTwyA1OqgckFVg==
X-Google-Smtp-Source: APXvYqzcHrktGGMQGEBY+QSIQ1X5KbH9BqqAwchtpV1cHiMUEaisv0P98YQ9idtlfo5pFOMEQKCrgA==
X-Received: by 2002:a63:b1d:: with SMTP id 29mr120470pgl.103.1559686470516;
        Tue, 04 Jun 2019 15:14:30 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l3sm17079337pgl.3.2019.06.04.15.14.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 15:14:29 -0700 (PDT)
Date:   Tue, 4 Jun 2019 15:14:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        SCSI <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
Message-ID: <20190604221428.GB4814@minitux>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <20190604072001.9288-3-bjorn.andersson@linaro.org>
 <53775224-5418-1235-20a2-c46d76ef56da@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53775224-5418-1235-20a2-c46d76ef56da@free.fr>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 04 Jun 00:53 PDT 2019, Marc Gonzalez wrote:

> [ Shuffling the recipients list ]
> 
> On 04/06/2019 09:20, Bjorn Andersson wrote:
> 
> > Acquire the device-reset GPIO and toggle this to reset the UFS device
> > during initialization and host reset.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/scsi/ufs/ufshcd.c | 44 +++++++++++++++++++++++++++++++++++++++
> >  drivers/scsi/ufs/ufshcd.h |  4 ++++
> >  2 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 8c1c551f2b42..951a0efee536 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -42,6 +42,7 @@
> >  #include <linux/nls.h>
> >  #include <linux/of.h>
> >  #include <linux/bitfield.h>
> > +#include <linux/gpio/consumer.h>
> >  #include "ufshcd.h"
> >  #include "ufs_quirks.h"
> >  #include "unipro.h"
> > @@ -6104,6 +6105,25 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> >  	return err;
> >  }
> >  
> > +/**
> > + ufshcd_device_reset() - toggle the (optional) device reset line
> > + * @hba: per-adapter instance
> > + *
> > + * Toggles the (optional) reset line to reset the attached device.
> > + */
> > +static void ufshcd_device_reset(struct ufs_hba *hba)
> > +{
> > +	/*
> > +	 * The USB device shall detect reset pulses of 1us, sleep for 10us to
> > +	 * be on the safe side.
> > +	 */
> > +	gpiod_set_value_cansleep(hba->device_reset, 1);
> > +	usleep_range(10, 15);
> > +
> > +	gpiod_set_value_cansleep(hba->device_reset, 0);
> > +	usleep_range(10, 15);
> > +}
> > +
> >  /**
> >   * ufshcd_host_reset_and_restore - reset and restore host controller
> >   * @hba: per-adapter instance
> > @@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
> >  	int retries = MAX_HOST_RESET_RETRIES;
> >  
> >  	do {
> > +		/* Reset the attached device */
> > +		ufshcd_device_reset(hba);
> > +
> >  		err = ufshcd_host_reset_and_restore(hba);
> >  	} while (err && --retries);
> >  
> > @@ -7355,6 +7378,18 @@ static void ufshcd_variant_hba_exit(struct ufs_hba *hba)
> >  	ufshcd_vops_exit(hba);
> >  }
> >  
> > +static int ufshcd_init_device_reset(struct ufs_hba *hba)
> > +{
> > +	hba->device_reset = devm_gpiod_get_optional(hba->dev, "device-reset",
> > +						    GPIOD_OUT_HIGH);
> > +	if (IS_ERR(hba->device_reset)) {
> > +		dev_err(hba->dev, "failed to acquire reset gpio: %ld\n",
> > +			PTR_ERR(hba->device_reset));
> > +	}
> > +
> > +	return PTR_ERR_OR_ZERO(hba->device_reset);
> > +}
> > +
> >  static int ufshcd_hba_init(struct ufs_hba *hba)
> >  {
> >  	int err;
> > @@ -7394,9 +7429,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
> >  	if (err)
> >  		goto out_disable_vreg;
> >  
> > +	err = ufshcd_init_device_reset(hba);
> > +	if (err)
> > +		goto out_disable_variant;
> > +
> >  	hba->is_powered = true;
> >  	goto out;
> >  
> > +out_disable_variant:
> > +	ufshcd_vops_setup_regulators(hba, false);
> >  out_disable_vreg:
> >  	ufshcd_setup_vreg(hba, false);
> >  out_disable_clks:
> > @@ -8290,6 +8331,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
> >  		goto exit_gating;
> >  	}
> >  
> > +	/* Reset the attached device */
> > +	ufshcd_device_reset(hba);
> > +
> >  	/* Host controller enable */
> >  	err = ufshcd_hba_enable(hba);
> >  	if (err) {
> > diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> > index ecfa898b9ccc..d8be67742168 100644
> > --- a/drivers/scsi/ufs/ufshcd.h
> > +++ b/drivers/scsi/ufs/ufshcd.h
> > @@ -72,6 +72,8 @@
> >  #define UFSHCD "ufshcd"
> >  #define UFSHCD_DRIVER_VERSION "0.2"
> >  
> > +struct gpio_desc;
> > +
> >  struct ufs_hba;
> >  
> >  enum dev_cmd_type {
> > @@ -706,6 +708,8 @@ struct ufs_hba {
> >  
> >  	struct device		bsg_dev;
> >  	struct request_queue	*bsg_queue;
> > +
> > +	struct gpio_desc *device_reset;
> >  };
> >  
> >  /* Returns true if clocks can be gated. Otherwise false */
> > 
> 
> Why is this needed on 845 and not on 8998?
> 

It's needed with certain UFS chips and TLMM in both msm8996 and msm8998
seems to provide an identical mechanism - so patch 1 would have to be
duplicated for those.

> On 8998 we already have:
> 
> 			resets = <&gcc GCC_UFS_BCR>;
> 			reset-names = "rst";
> 

This is the SoC-internal reset signal for the UFS host controller block.

> The above reset line gets wiggled/frobbed when appropriate.
> 
> (What's the difference between gpio and pinctrl? vs a reset "clock" as above)
> 

The TLMM block is the piece responsible for this and it implements GPIO,
pinmux and pinconf functionality. So patch 1 extends the SDM845 pinctrl
driver to expose the UFS reset pin as a GPIO.

> ufshcd_device_reset_ctrl() vs ufshcd_init_device_reset()
> 
> Sounds like the nomenclature could be unified or clarified.
> 

Agreed, some consistency there would look better.

Thanks,
Bjorn
