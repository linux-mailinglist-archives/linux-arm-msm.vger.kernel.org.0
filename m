Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89185311687
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 00:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhBEXDp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 18:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbhBEMeu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 07:34:50 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28520C06178C
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 04:34:08 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id q131so4220354pfq.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 04:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DG6A7cLRlYKcReH5p+aAb1FVGOp48Z1XyHjIw8tPMw0=;
        b=gAzjMqy12rSQ0l12Kyt+k7cgjjBGTQIEWrvkmMHNJwma1Etc5Ljd0PkwRmfNyKnvvE
         Vzg872B7hzLZzZPaWeZWYKFJM+mw4n7wJ0ErIkv0GXTvWjkAmROh0WXaHNza5M+AXhz8
         Mp5p08suqdrJsLeM5AtRBgIKls+VQvfTLbs3drJkiNhq6qFSJvpNvdwynqRAU75DsNFI
         cFZTh6p+XM3PBPdKP0OGw1R4gsAJdOBaw7ubeR0gv6LQDNhajSkdprgWrPYHqQhFcvrW
         Cz+fuRIFat8/Jwo6TMEYvw20qxuQdtebFgPWwfXJnA68nrMMvG0PipLtUve6JBH1SDmv
         b1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DG6A7cLRlYKcReH5p+aAb1FVGOp48Z1XyHjIw8tPMw0=;
        b=KByXAYWpn9piN5nAZrc8KkC9Cvh/NGvAz//+ezWGDjbnq8NSTfa94njPD8ppG6j0Gr
         /4R/rK66iLd6h78jZULD4u3L2lsmAVyuS5Y6tyo9d/xxXR4hwAZ3eQcCbzEIWEA5n+p/
         LZ964PZDTUpvZpTdOWA/wLeo+GVcPScLXIEjBUZtrfdehOwyJhBDjp6fyvZFgNTPnAZF
         TLv8wqRwHQXIfR0jkAj4aRzdjuCbaMNwHuITK7GBvXc4wFbTIoQKlAdv9D8CgQYMg0lh
         WPV8MpMQCLLS/VgMifPzmt668wbdX6tubgeXrogJSVKdGI9B7rky39D0TbNappFTsCSf
         ulmw==
X-Gm-Message-State: AOAM5334K4YB0Qpwp4ASelHsrPYF2xmhxRrrAjFqHz51lhsMvAwVc1rK
        kOYslUEuvFUVZtpoyqyMLjEU
X-Google-Smtp-Source: ABdhPJz8IC03P3mdhKJnAfV+K4YTg8kf5Amtq50F+D3n/0yRrnQoNIocrF4+haW+IZwQJ4oZd+2GUw==
X-Received: by 2002:aa7:8f2a:0:b029:1d5:d250:9d40 with SMTP id y10-20020aa78f2a0000b02901d5d2509d40mr4293635pfr.46.1612528447669;
        Fri, 05 Feb 2021 04:34:07 -0800 (PST)
Received: from thinkpad ([2409:4072:6419:ab3e:3106:54ac:6216:6b24])
        by smtp.gmail.com with ESMTPSA id i10sm9630123pgt.85.2021.02.05.04.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:34:06 -0800 (PST)
Date:   Fri, 5 Feb 2021 18:04:00 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Increase num of elements in hw
 event ring
Message-ID: <20210205123400.GD3221@thinkpad>
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

Applied to mhi-next!

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
