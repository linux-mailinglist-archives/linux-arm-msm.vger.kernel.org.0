Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C7145D451
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 06:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344051AbhKYFbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 00:31:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbhKYF3M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 00:29:12 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4FDC061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 21:26:01 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id o6-20020a17090a0a0600b001a64b9a11aeso4758238pjo.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 21:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pKb0nx+Hu4ztceBD/FWY+lSFgK6qIFH0VWnae1pJ9k4=;
        b=UF/K7vxIosmE4ndJpN3BBi0+CY/U9zAG5FJh0vJ3+rakD7sNAisfUBkoKIMhkqWhFw
         4TJ7Xns8yWALT9ulB6y15m3augMWA+wKJwsx2XnQFKAYluc5+7Syb4m5oV+Ypo6F6GYQ
         yZP8if83SQ+ZjmIY4KGpKDVAIYl7+yMtGDtoIa+ipPCsVTgo16uTdD7Xq9RK2nvC0cjk
         Gh2+KEIMIHwgacZck2QsoPjgxROpwpWp+Kwu0RxhSY3bMMkzddauSajc+HVBRoftmngd
         CS9XzlHOS+Y4OLbNhIJZs4z8O6bwBAAT/PW02tv+EbEkS3g4pem0RuQRkRJMG3TLZfE4
         hHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pKb0nx+Hu4ztceBD/FWY+lSFgK6qIFH0VWnae1pJ9k4=;
        b=2HcuDSOMI4OeK9+3jYoOsNUaX0AzyWGh36M7MCHkkxu1PXtK30azX18B5n7rEe++Jj
         QN2jYbEpwaRtnBb896iyKAjWpezttwa5iL1b1PHxP0/3P7deAn14ufJqBjCSrK4bZWGJ
         MQBKWUUBZQ+RB8jpIJ1+213bOmbp0tEwT91mJxvWV9IA55A4vwnlw2vEHLzKFtjL1tkT
         G6VC8un7vuthHvKqazc+0uAgRhZx7s/0rcd6aL8vUTThwLERs04D0iJqEwWkiZ74EFxj
         5449fKCKO0OwvjSMYj+6IYyg41RYYK4kPzKD8omHPNklHsZjntZlf7ddkoYz34ima6q6
         ilTA==
X-Gm-Message-State: AOAM5314SKO94EBugsTgP0JrQDVpInqRSE1u9vhCfwi919P6mTjLLdqW
        HEJRVcenKBA9vcUj0EEbDMSe
X-Google-Smtp-Source: ABdhPJyEbpF5PXnxrEzCJv3O8E3j9oCOFb1JqXSKZcTPdiDctIoBzYmiFePmNpq4U+3+vbFJ0VAMJw==
X-Received: by 2002:a17:90a:6b44:: with SMTP id x4mr3923879pjl.27.1637817960864;
        Wed, 24 Nov 2021 21:26:00 -0800 (PST)
Received: from thinkpad ([117.193.208.239])
        by smtp.gmail.com with ESMTPSA id s8sm337373pgl.77.2021.11.24.21.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 21:26:00 -0800 (PST)
Date:   Thu, 25 Nov 2021 10:55:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <quic_bbhatt@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, quic_hemantk@quicinc.com,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: [PATCH] bus: mhi: core: Use macros for execution environment
 features
Message-ID: <20211125052555.GB7290@thinkpad>
References: <1636409978-31847-1-git-send-email-quic_bbhatt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636409978-31847-1-git-send-email-quic_bbhatt@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 08, 2021 at 02:19:38PM -0800, Bhaumik Bhatt wrote:
> From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> The implementation for execution environment specific functionality
> is spread out. Use macros that help determine the paths to be taken.
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/boot.c     | 2 +-
>  drivers/bus/mhi/core/internal.h | 3 ++-
>  drivers/bus/mhi/core/pm.c       | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 0a97262..74295d3 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -417,7 +417,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	/* wait for ready on pass through or any other execution environment */
> -	if (mhi_cntrl->ee != MHI_EE_EDL && mhi_cntrl->ee != MHI_EE_PBL)
> +	if (!MHI_FW_LOAD_CAPABLE(mhi_cntrl->ee))
>  		goto fw_load_ready_state;
>  
>  	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 3a732af..9d72b1d1 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -390,7 +390,8 @@ extern const char * const mhi_ee_str[MHI_EE_MAX];
>  
>  #define MHI_IN_PBL(ee) (ee == MHI_EE_PBL || ee == MHI_EE_PTHRU || \
>  			ee == MHI_EE_EDL)
> -
> +#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS)
> +#define MHI_FW_LOAD_CAPABLE(ee) (ee == MHI_EE_PBL || ee == MHI_EE_EDL)
>  #define MHI_IN_MISSION_MODE(ee) (ee == MHI_EE_AMSS || ee == MHI_EE_WFW || \
>  				 ee == MHI_EE_FP)
>  
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index fb99e37..0bb8d77 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1068,7 +1068,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  
>  	/* Confirm that the device is in valid exec env */
> -	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
> +	if (!MHI_POWER_UP_CAPABLE(current_ee)) {
>  		dev_err(dev, "%s is not a valid EE for power on\n",
>  			TO_MHI_EXEC_STR(current_ee));
>  		ret = -EIO;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
