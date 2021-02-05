Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF415310ADC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 13:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhBEMFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 07:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbhBEMDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 07:03:15 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA557C0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 04:02:34 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id z21so4406302pgj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 04:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IyTBwU14/Ce1zxbVwgI1MthqBNeYYFo6LGr4D+cEzEg=;
        b=E0llelTpAwXRFxIYv/mbCyEx65DSjruf05mpk22vOj+RkxxFWRrcfM6oWWnbZUaKQz
         HO2UCiCLt5M124HCmujRC3L2FYWf3nBAGfBogYQvBe9ajDAVRv2lMPkXc+AVyiAkTO96
         KCNKEJ2CwAkfZlPvC2HR5wG2ld1UkrhD1j0YQeebkEI73a+ty0vKrj7R0WuA1og57UdT
         j9gfydgs124FS2B1IQKeS79Ndqp/NIyWPVwEmoG0ybXrTup5kbV6CzcrOEiwsftIvlha
         AK6rmyq60LHZVJAclnV5J1KPBrTw8wQPEMVmIi7Ze3Rk+rK/Tul58MbLsaMbur4LVxEp
         +sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IyTBwU14/Ce1zxbVwgI1MthqBNeYYFo6LGr4D+cEzEg=;
        b=kGEVPwFi4x2y43lWBS22enRqkIjOOZ6KTrIw2dLqRVmomhKWECCxKcqjlw+Yb5kKwF
         rdUIP8ISGifE9gH7NYuqX9Fipj7OjcOZIjt2ai7TooQ3TNJEMg7wazpKVSTlW1YYGqnc
         UPtZI1EG60Q1gMNZwr6bGmFTFDQVbeUl/VjrvbSXL1428cVKNAHEBNT3SsqWF1gyj66v
         IGBIYpg8KTM5mhmD6siI9wjw/T2pJ5lZX0F9tNjIXq2GUerWgCe0HN16QqDS7eRWCdzM
         yWCezz7V4UcOLAjzoGTUdFP8v4DS6hDFOwTULQDL3BN4xHVp7ErZaz6+qB3zS6i3eJWY
         MwnA==
X-Gm-Message-State: AOAM533guBrAW/NINyv/F4t+cHuDea8WUbPfcXZjeV3XT+ifCY/gAz8U
        +z/GpnBNdsqaoE5PBF69bLAQ
X-Google-Smtp-Source: ABdhPJzKXqbQjFdL+4YDuZdba27xMQVKzrEG0vegu9nm+w/rIyUA4A4qgg+OWXDNFtqwAbzF15mAiA==
X-Received: by 2002:aa7:9538:0:b029:1d6:ccef:72ad with SMTP id c24-20020aa795380000b02901d6ccef72admr4160387pfp.64.1612526554121;
        Fri, 05 Feb 2021 04:02:34 -0800 (PST)
Received: from thinkpad ([2409:4072:6419:ab3e:3106:54ac:6216:6b24])
        by smtp.gmail.com with ESMTPSA id l190sm9074220pfl.205.2021.02.05.04.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:02:33 -0800 (PST)
Date:   Fri, 5 Feb 2021 17:32:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Increase num of elements in hw
 event ring
Message-ID: <20210205120227.GA3221@thinkpad>
References: <1612514195-8257-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612514195-8257-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 05, 2021 at 09:36:35AM +0100, Loic Poulain wrote:
> We met some sporadic modem crashes during high throughput testing, this
> has been root caused to a lack of elements in the event ring. Indeed,
> the modem is simply crashing when event ring becomes empty.
> 
> It appears that the total number event ring elements is too low given
> the performances of the modem (IPA hardware accelerator). This change
> increases the number of elements in the hardware event ring to 2048,
> which is aligned with what is defined in downstream version:
> https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/sm8150-mhi.dtsi?h=msm-4.14#n482
> 
> With this change, modem coes not crash anymore.
> 
> Note: An event ring element is 16-Byte, so the total memory usage of
> a hardware event ring is now 32KB.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 5b3a23a4..c20f59e 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -129,7 +129,7 @@ struct mhi_pci_dev_info {
>  
>  #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
>  	{					\
> -		.num_elements = 256,		\
> +		.num_elements = 2048,		\
>  		.irq_moderation_ms = 1,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
> -- 
> 2.7.4
> 
