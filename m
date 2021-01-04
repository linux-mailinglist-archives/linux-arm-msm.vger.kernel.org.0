Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6856E2E9BAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 18:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbhADREp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 12:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbhADREo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 12:04:44 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A07C061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 09:04:03 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id j1so14868236pld.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IQcm30joQ1MOZvDbTDrRnopca1uhY1ndGDE9lkwCZAc=;
        b=BCIixdhQz0ExCp0AmsUIvPZ18AUH+wiojlGbwoXezAz15MaThplttNDQc+MfKl32hG
         poMMlEoNBcVwoo2GLpyhRxx+QcayT9nI80+Fxm0EQ4x3zlBoy4x5ELTyGx436AIvX7e7
         KlCloSXe6Oz17jHhw4OHjPaiRUMUMBkGM09A7xe4dOJVXbKX4z91exkrSx2BfpDQhWl8
         KVPZ8S3oZjRgI2GLlrPPQ9pjp8qFuzHr/YkvF/INPPsJfjIxV3g8L2rZCvZf5ZzacELL
         4kVNGfLlsq7Drh3FHCDiG3C2pkZgynI97jj8wIrn6I9Hj/rmtSTl1dIK3rzXEijlsdwj
         v4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IQcm30joQ1MOZvDbTDrRnopca1uhY1ndGDE9lkwCZAc=;
        b=BX6PhpysJoWCU2MZ93hEJpnFmUuX0sqxNpIZ0CAKdGMBXJBQP13vMvOvYtc6wU6kQk
         i8Q7Al3+27w1z8fBH/dLqg68NSG40f9uCKKbHO2I9cFfUjEqBdEGuGtIvbqUMH7/sb6k
         yvKbCKQal9i+uYBtuyzmsWzaDHSh4kZOuF7/bK82CAVPuCakLHKN/0UpKHS6OygnUw7g
         uJZfTIWD5Mn+J7LojZOD+z5vCXH8XXzxc4QD/6O868NLWdUBMQP4+ZtzqRX42b6jEmda
         sWPxyj9rsCbxWnxH1WIpLW/fF4qom8tACNVstt+L52+xguAtHw69PM1p/r0YI7+Fwvow
         905Q==
X-Gm-Message-State: AOAM533heF2V82xbZxykBMBJCxid+UCplk0mB9wzFMukNfZlYMaAKFce
        YAMjZPhX5d/g11sj09NPiSp6
X-Google-Smtp-Source: ABdhPJzstLU9i3O9N1V2w9aLZIwS7/jD4AeG4EenR1Mw3gYn+u7BY34odJUrymKTvSm7jCXshIi1LQ==
X-Received: by 2002:a17:90a:454e:: with SMTP id r14mr31112408pjm.194.1609779843170;
        Mon, 04 Jan 2021 09:04:03 -0800 (PST)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id w63sm55114714pfc.20.2021.01.04.09.04.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 09:04:02 -0800 (PST)
Date:   Mon, 4 Jan 2021 22:33:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Carl Huang <cjhuang@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
Message-ID: <20210104170359.GE2256@work>
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104101128.8217-1-cjhuang@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 04, 2021 at 06:11:28PM +0800, Carl Huang wrote:
> If controller driver has specified the irq_flags, mhi uses this specified
> irq_flags. Otherwise, mhi uses default irq_flags.
> 
> The purpose of this change is to support one MSI vector for QCA6390.
> MHI will use one same MSI vector too in this scenario.
> 
> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
> is requested. The reason is if irq migration happens, the msi_data may
> change too. However, the msi_data is already programmed to QCA6390
> hardware during initialization phase. This msi_data inconsistence will
> result in crash in kernel.
> 
> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
> 
> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
> of one MSI vector when mhi_register_controller is called.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
> v3:
> - replace "client driver" with "controller driver"
> - add Reviewed-by: Manivannan Sadhasivam 
> 
> v2:
> - document irq_flags added to mhi_controller
> 
>  drivers/bus/mhi/core/init.c | 9 +++++++--
>  include/linux/mhi.h         | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 381fdea..37903a8 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>  {
>  	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>  	int i, ret;
>  
> +	/* if controller driver has set irq_flags, use it */
> +	if (mhi_cntrl->irq_flags)
> +		irq_flags = mhi_cntrl->irq_flags;
> +
>  	/* Setup BHI_INTVEC IRQ */
>  	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
>  				   mhi_intvec_threaded_handler,
> -				   IRQF_SHARED | IRQF_NO_SUSPEND,
> +				   irq_flags,
>  				   "bhi", mhi_cntrl);
>  	if (ret)
>  		return ret;
> @@ -171,7 +176,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>  
>  		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
>  				  mhi_irq_handler,
> -				  IRQF_SHARED | IRQF_NO_SUSPEND,
> +				  irq_flags,
>  				  "mhi", mhi_event);
>  		if (ret) {
>  			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index cb7cd54..77f1e3f 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -351,6 +351,7 @@ struct mhi_controller_config {
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
>   * @pre_init: MHI host needs to do pre-initialization before power up
>   * @wake_set: Device wakeup set flag
> + * @irq_flags: irq flags passed to request_irq (optional)
>   *
>   * Fields marked as (required) need to be populated by the controller driver
>   * before calling mhi_register_controller(). For the fields marked as (optional)
> @@ -440,6 +441,7 @@ struct mhi_controller {
>  	bool fbc_download;
>  	bool pre_init;
>  	bool wake_set;
> +	unsigned long irq_flags;
>  };
>  
>  /**
> -- 
> 2.7.4
> 
