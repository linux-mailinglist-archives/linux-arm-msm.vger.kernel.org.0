Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9343A31C6DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 08:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhBPHdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 02:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhBPHdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 02:33:24 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A36EC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 23:32:44 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id e9so5412065pjj.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 23:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xI5kCUUdTb6ugwIgRBi/7T1D30xpIfupxThF1TWagbM=;
        b=Vc7uIImEuipaRpVvntzFknVKQBariDezI5utMC5BK6OQu7XPudHTPTaHeNjCzSq+0t
         J2sGVfsrYgTJEgLfxRZ+bQ5LbqDX7sULq73IlZuo8FG1Hlb3P8KlkhedVChELPie6sP2
         HEe7nH0o/awUGatp852zxgrJ+UIEGI2rs1ft5i21VHScV+ZlpgkKS0iIyWaJUZ0/Ewiz
         jMA/eBcdF/IDaGZKXgwgGoefTzB5MQlmwqYODIOymAakPT+3Vpqcf+ygDSTR51cGgV7Q
         0az2jbndMfhrjS0UnwdlsN+zALqzexoIc2qO5ssz+NrunIy4Y49Yo5R9BydEWU5obS5/
         VK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xI5kCUUdTb6ugwIgRBi/7T1D30xpIfupxThF1TWagbM=;
        b=CxnsWpKWn4SFnY3Fg91/jHirpaFfz3GQAGsqu60o7fMk1pSdodoGbViNG9k2ZqF6Z4
         dL+gL27AXUw3uqtMTvbjMnXMuiippiO7O0oyWf8kT9SCwnkTB7v1iggZMVgg2SjO20mB
         WzmUYby8tpFSm62vHoOws5sC0gTCVlWU0p0Al39RY0ymVZ6xjiqZrKVGMNE4w5ijXnIT
         RPLG2KwTkKq1SxvbbWW3HTEPMVQWUGYfYl7QOEKNenZ3y9xK3Sv7bHen1N2IR/MTXr04
         STTusJdb92XfdIKzGTV3RxXHCfj5S0LEe6YrH49OHRjJF9VrWcnyvdBf8jyX+dwTfa63
         fPQA==
X-Gm-Message-State: AOAM5333e1fhN/Mhb0NUV8sgPNafqs4jKLQAUNtEsm3qEY4pxWKKcove
        i7nOZYk22Y4/9zNZ5pKOvtnZXWanyfP0
X-Google-Smtp-Source: ABdhPJyd/SO8hC0AKIUMnQw/h/PO12y7L+HT+/bdnSFoLIu6EbCzDx+q6ydNYCloA4YblH6zYsVWUQ==
X-Received: by 2002:a17:90a:6844:: with SMTP id e4mr2940563pjm.9.1613460763714;
        Mon, 15 Feb 2021 23:32:43 -0800 (PST)
Received: from thinkpad ([2409:4072:618e:567:b42:dd4b:9608:1db1])
        by smtp.gmail.com with ESMTPSA id x1sm21791858pgj.37.2021.02.15.23.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 23:32:43 -0800 (PST)
Date:   Tue, 16 Feb 2021 13:02:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Use current ee in intvec handler for
 syserr
Message-ID: <20210216073228.GD5082@thinkpad>
References: <1613176814-29171-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613176814-29171-1-git-send-email-jhugo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 12, 2021 at 05:40:14PM -0700, Jeffrey Hugo wrote:
> The intvec handler stores the caches ee in a local variable for use in
> processing the intvec.  When determining if a syserr is a fatal error or
> not, the intvec handler is using the cached version, when it should be
> using the current ee read from the device.  Currently, the device could
> be in the PBL ee as the result of a fatal error, but the cached ee might
> be AMSS, which would cause the intvec handler to incorrectly signal a
> non-fatal syserr.
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 4e0131b..f182736 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -448,7 +448,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  		wake_up_all(&mhi_cntrl->state_event);
>  
>  		/* For fatal errors, we let controller decide next step */
> -		if (MHI_IN_PBL(ee))
> +		if (MHI_IN_PBL(mhi_cntrl->ee))
>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>  		else
>  			mhi_pm_sys_err_handler(mhi_cntrl);
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
