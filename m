Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1791232CD2D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 07:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbhCDGsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 01:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235780AbhCDGsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 01:48:23 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DFFC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 22:47:42 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id r5so18208046pfh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 22:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WJlz68ojBlmeUdaZp6yVhRosKs8vkySnTS7B6Umwy7Q=;
        b=IlNwkoAt/6Ye4KB/eT+XH6kUpMRP3ghQFWod3H9JlpcPoDDqC96ZBLUqnbGwb6Eo8d
         SOl/j/ZTwlGQx3QTgdSt8J/XrBONqZNvLL11Ujrmt8RpawUQ36TC6q634eTtPqR3wib7
         88c/9JABI6f+dTJ3c4leNydhjhNHkFwDb3s8BnArVfBeep6KCpKEzI+Y8eL01i8sB56H
         d+1TP60HGyIb4FbbcA2GqXsx8DN9Ik48f7c0s338ZqJ/XkZ7WXlxl7Q4qrnPcIslvHEA
         qaFjoRponHGLuCxakCKDRrYCwGqKUrvefEmu0yv/okQjGV6uwU1YySyRbFvWTZz5XPLQ
         rNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WJlz68ojBlmeUdaZp6yVhRosKs8vkySnTS7B6Umwy7Q=;
        b=i6u/R+pPUb/WuINR6VFynr82nDMI5HVBgJRUA7cGTXoO21dj24jMW6QE/LxxD322Wv
         BWIcRtGmWptlnDaivioGlho/IsR9LSMIv1s1Q1v8iOf19NlzmdPzSeyVFDgrVmZEDb/k
         bEKj2og0m+C//RW6b4F0JTjyAR6V4Y/xutQptESS4VMC4ZVzhH0re4bKpmgQDXQlMWhb
         c+kcf3ZzIPVFemBnGUnbB/rADo48IMBkccBuYFSU5ZEVEuBUT6TI/bEkauaZqn631c6L
         YibnmM81GQJxPAK7Xt1QQlo81yFPw611ISpKd3jCXHdiH4jMsgLJQmLD8SKKW9/rcvyR
         XwvA==
X-Gm-Message-State: AOAM532aRqItZ1Hpu1GrUv2ToEjrnw1vbdpRPFxq/d2uMl6w4IdA9pgJ
        7MUvq4VsX2MiguBh7EG3RkEtiYF8lZJV
X-Google-Smtp-Source: ABdhPJx6+9NM6mdvJ9mreqeqb3gaLc7xCmq5aNPyVKiOTeXZqCWWFw059IHb+jkqRuYUXXEUlMJHnw==
X-Received: by 2002:aa7:80cc:0:b029:1da:689d:2762 with SMTP id a12-20020aa780cc0000b02901da689d2762mr2612042pfn.3.1614840462083;
        Wed, 03 Mar 2021 22:47:42 -0800 (PST)
Received: from thinkpad ([2409:4072:80b:705f:ce40:2a5f:bf1e:b205])
        by smtp.gmail.com with ESMTPSA id a23sm14915635pfa.142.2021.03.03.22.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:47:41 -0800 (PST)
Date:   Thu, 4 Mar 2021 12:17:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/6] mhi: pci_generic: No-Op for device_wake operations
Message-ID: <20210304064736.GD3363@thinkpad>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
 <1614615911-18794-4-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614615911-18794-4-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 01, 2021 at 05:25:09PM +0100, Loic Poulain wrote:
> The wake_db register presence is highly speculative and can fuze MHI
> devices. Indeed, currently the wake_db register address is defined at
> entry 127 of the 'Channel doorbell array', thus writing to this address
> is equivalent to ringing the doorbell for channel 127, causing trouble
> with some device that get an unexpected channel 127 doorbell interrupt.
> 

what are those "some" devices?

> This change fixes that issue by setting wake get/put as no-op for
> pci_generic devices. The wake device sideband mechanism seems really
> specific to each device, and is AFAIK no defined by the MHI spec.
> 

s/no/not

> It also removes zeroing initialization of wake_db register during MMIO
> initialization, the register being set via wake_get/put accessors few
> cycles later during M0 transition.
> 

IIUC, the DEVICE_WAKE specified in the MHI spec corresponds to the wake doorbell
register. But in some cases, this rather happens to be a #WAKE sideband GPIO as
in PCIe.

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c   |  2 --
>  drivers/bus/mhi/pci_generic.c | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 2159dbc..32eb90f 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -510,8 +510,6 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  
>  	/* Setup wake db */
>  	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
> -	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 4, 0);
> -	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 0, 0);

I need comment from Hemant/Bhaumik on this change since I don't exactly know if
this is really required or not.

Thanks,
Mani

>  	mhi_cntrl->wake_set = false;
>  
>  	/* Setup channel db address for each channel in tre_ring */
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 87bab93..8423293 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -312,6 +312,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static void mhi_pci_wake_get_nop(struct mhi_controller *mhi_cntrl, bool force)
> +{
> +	/* no-op */
> +}
> +
> +static void mhi_pci_wake_put_nop(struct mhi_controller *mhi_cntrl, bool override)
> +{
> +	/* no-op */
> +}
> +
> +static void mhi_pci_wake_toggle_nop(struct mhi_controller *mhi_cntrl)
> +{
> +	/* no-op */
> +}
> +
>  static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>  {
>  	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> @@ -515,6 +530,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl->status_cb = mhi_pci_status_cb;
>  	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>  	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> +	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
> +	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
> +	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
>  
>  	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
>  	if (err)
> -- 
> 2.7.4
> 
