Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55129288F18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 18:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389610AbgJIQmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 12:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgJIQmw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 12:42:52 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE223C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 09:42:51 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g9so7614223pgh.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 09:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yhRF4Bf0Fxw8uBmUilMjScUgjc5ToacEwGW5jec2Co0=;
        b=E3Lv+fddMEZ8IA3+gHF2Qkff/JeWnRJiKJciN62IaAcoIJYnS7ZdzfGJeu0MraFDsn
         xbk6CDyxVVSm/XzwUnrCM8HelV47RdveluFynfnkzklgyOWCTH9rFcCTKYcZOSxwcsT+
         athO2itK4OSekxnku90VmCgBt51SXZoAbWvfGgOE4W6EqgH/ntb/0c/BPIBjioatOP0K
         YXB6XdOQFgw37fHSmKE+ggNq9UhxDnlkEEpcGAmhaM+DnLIAyaI2xNz/+O0YE1F1aemx
         P7ixk0f8dmkbgDf1dOp/tkLP4YBk/WzOGbHlPxGCAQBIlXgoeHKfsywlLHEn69mMc7nN
         40xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yhRF4Bf0Fxw8uBmUilMjScUgjc5ToacEwGW5jec2Co0=;
        b=fUvk1l03cjknzgGHchvgUKyGBzeR6BDAe+kYV9RcnjrPwIa8z+Zyhoyl9Jr/+uzQbf
         lKm1qofaYweNrNpbPvwXi94VWEzrvdIPdQjVaaOkFpMr6gSAd7ZiSQyrhWi8dgAqKK4/
         e+BUY5n638v8uOyLuKGEKg2iarK303s3WP9osLT/8iOEW7Eo1o986DYV1qY45mMBJFFl
         iT3/XcFpR1vH2Bv+iYQg64bsktErizAphWhD65cDjyMjmYUwuO8G1YoaEofc2hCBPsI1
         GutHfiNJU4yMKbYzeKW9b5P0/fR00jF5MNlceLJOcsEJJg8rGNKJlbN3PnfRSTnxEK3L
         LWzA==
X-Gm-Message-State: AOAM533nqDvTHXrAt9Tn90v2fCJdrvQFFhIWI1IwF+CXjtVIpGp7Q4RF
        O/srxXy+mha23PvDtazrR6vn
X-Google-Smtp-Source: ABdhPJwI1/Z0b9digdvNs3D5Sn+3/hVStc5r71EndANo8iNe9eCHZKVzD0IjBfCON+crmTfzxlDFQQ==
X-Received: by 2002:a62:78d5:0:b029:154:ebc0:c92c with SMTP id t204-20020a6278d50000b0290154ebc0c92cmr13464865pfc.24.1602261771314;
        Fri, 09 Oct 2020 09:42:51 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6292:5a21:d5ff:f3e8:fcf2:ccc7])
        by smtp.gmail.com with ESMTPSA id t13sm11616763pfc.1.2020.10.09.09.42.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 09:42:50 -0700 (PDT)
Date:   Fri, 9 Oct 2020 22:12:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/10] bus: mhi: core: Move to an error state on any
 firmware load failure
Message-ID: <20201009164235.GI4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-9-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480955-16827-9-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 07:02:33PM -0700, Bhaumik Bhatt wrote:
> Move MHI to a firmware download error state for a failure to find
> the firmware files or to load SBL or EBL image using BHI/BHIe. This
> helps detect an error state sooner and shortens the wait for a
> synchronous power up timeout.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/boot.c | 43 +++++++++++++++++++++++++------------------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 92b8dd3..fcc71f2 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c

[...]

> -error_read:
> +error_ready_state:
>  	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  	mhi_cntrl->fbc_image = NULL;
>  
> -error_alloc_fw_table:
> -	release_firmware(firmware);
> +error_fw_load:
> +	write_lock_irq(&mhi_cntrl->pm_lock);
> +	mhi_cntrl->pm_state = MHI_PM_FW_DL_ERR;
> +	wake_up_all(&mhi_cntrl->state_event);

Do you really need pm_lock for this?

Thanks,
Mani

> +	write_unlock_irq(&mhi_cntrl->pm_lock);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
