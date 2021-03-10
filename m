Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81B8333F6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhCJNiF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233325AbhCJNho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:37:44 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08848C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:37:44 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so7247733pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g3TM2U/VrI0QDsaMYXzNAdTpAoOLLGwfKy03c6eGsbY=;
        b=pDuXhYqyRP/S6zH4rtR0/T4UmN1rxe0UMp3LYwmjaXDKr1QwnJJuqXKIaHoRRUY0O4
         bnoNZKGt546BTYo9Rbejg2uXXFi68HFXMGRWEslnfZ5oIGejmq3pL8+g1TGC47nQskqp
         MNCoubYdvyn2ilcITzL/kxSANDQPHvEePIZtbKja8dBrEaRTX1uuiD0FbuNf/dWtfLTr
         AoaVuz8N9+bMBgF+4Q7bLpy6U8UHa+FWuknTmul7bCcCMVfRKyOyvCG3YT4pUShW5JWz
         d1MUs6bBmqpTZOecmN/2UQP21In7z9v5W1lgHdra+q1bn8xt4YdWOiH6Y0cvUjiH3MA5
         6OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g3TM2U/VrI0QDsaMYXzNAdTpAoOLLGwfKy03c6eGsbY=;
        b=eCv7Rb9QE8DU2dK3NvcHtGWvkPuC3s9MuTiUu1guYAXz6s7PhcPOVl8/IDTOEYtb2P
         7dStqLoGd0bu3c5J5ZGApRXx7hwBDK1Z3iFx9KU+HeS+gTlCeIT0PMS382iqYQId+dXj
         nwC7Lc6TdpKtYZ3PnsiqX0m22dmmVOdK9k4v1gsQymu/anxknPExpZPjkVwcix78cMfq
         FiUd0cNpPZGfj0Oq40YOUg8i4pKDIh6kjjr1qzv0HrOqUVJm33seWmojkeSA4litzI3S
         jB8C872hEvK1wn8zt6fLZarnykumbgBVOFLwHdV/WqneCBmqDHqGIr2HEajZTvfL8WUq
         ZXZg==
X-Gm-Message-State: AOAM532hhbTK3lfc+RSC26bh59yTyQbV/E+NUKGc5bHixO16M70CbkKZ
        brlZTP5Vr8Dx9NEnF+M3BJ3+BlNahMz0ppI=
X-Google-Smtp-Source: ABdhPJy3iQCznr2ItkRG4AN+40h/wF/PpI0fYYkYCC5GZNXFYRsW+Vs2SDBYWlkqBUny4nslbeQLlw==
X-Received: by 2002:a17:90b:46d0:: with SMTP id jx16mr3700493pjb.3.1615383463541;
        Wed, 10 Mar 2021 05:37:43 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id 2sm16207827pfi.116.2021.03.10.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:37:42 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:07:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/6] mhi: pci_generic: No-Op for device_wake operations
Message-ID: <20210310133739.GF30275@thinkpad>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
 <1614971808-22156-4-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614971808-22156-4-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 08:16:46PM +0100, Loic Poulain wrote:
> The wake_db register presence is highly speculative and can fuze MHI
> devices. Indeed, currently the wake_db register address is defined at
> entry 127 of the 'Channel doorbell array', thus writing to this address
> is equivalent to ringing the doorbell for channel 127, causing trouble
> with some devics (e.g. SDX24 based modems) that get an unexpected
> channel 127 doorbell interrupt.
> 
> This change fixes that issue by setting wake get/put as no-op for
> pci_generic devices. The wake device sideband mechanism seems really
> specific to each device, and is AFAIK not defined by the MHI spec.
> 
> It also removes zeroing initialization of wake_db register during MMIO
> initialization, the register being set via wake_get/put accessors few
> cycles later during M0 transition.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: reword commit message
>  v3: no change
> 
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
>  	mhi_cntrl->wake_set = false;
>  
>  	/* Setup channel db address for each channel in tre_ring */
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index c274e65..4685a83 100644
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
