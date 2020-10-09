Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A548288D63
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 17:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389451AbgJIPy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 11:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389436AbgJIPy3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 11:54:29 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC936C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 08:54:27 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a200so7207090pfa.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uERIsFjLxSpIumqYQ34ZUtGRak+qAJmNwV+CRdkKhOg=;
        b=nwFmEY9Y1azbNajgqxXZNTRvgg/Y/VRmhXjzcuDfInVsM8JWmOzm/dS+kZCCF+cnBG
         +QMmH30haWxNer8j0eqsAzeQvwlFvDjkhCdhoP23nW5C9DsTh9BUmXwC+2OWDIGt2k4F
         lAbFYboVGKgT9oD9TgGB6vCquf87KL75/8zuwJtEoQJNPyGhztqEHMurHqR20KJearHc
         CDrm2ZyT3QasyxlffmL/gkeYtZZvq1091Wad3XR8ZGZxk9MUhtqlsYH+zGV/nyPbLvsQ
         4b8pnI+SZBIeuv+e3FFxiOwQXDFy2XTPjYocxfMqKgvQfhELn4VRHXMBv0sF2eObXy4d
         K7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uERIsFjLxSpIumqYQ34ZUtGRak+qAJmNwV+CRdkKhOg=;
        b=cjH4Avj2xDZcOTOCbqCBGfxsIouugiK7MWZV9Gnkpj+YRYzqh1RJfWFJ8reLb8mslf
         yg5Q3qSbDlatc4N8+pBt9OaoDdg3+tVzhLNq1iiLRPmzeQRHBSo/flP7mMrr61/s49la
         lC3dym1m+5CHW0HTQT3EALTSD4rQriVxVz9PYx5ZiEJ0gY0WAQUJ+IArkUBAEu5p6AOI
         rRHTw3Dp/acVPwHrWnEdPhAn9ifRUwjVFLhdOhDdcHfKTpYhHZ7URy0MPvQ/Q2O6NNaL
         gf+15EaFj7BE2XjH9JEhmJKP7DbxPQmesV/YIHKOFjGgtDFsBty6BK9p4Z21kZuX6t73
         Z8Pw==
X-Gm-Message-State: AOAM532Z+31k6/ciJJ6010VWyu849lPwyUK5PF9WObbrvGVQ0SUUhcV7
        sgRDIytZxPKnPoHZcT10OxiXIeQN4C86
X-Google-Smtp-Source: ABdhPJwB1a4NUY4HOjYXKNo/YUjryno5nG19O/IcGdj2ZO2kGYQ18WjEH8F4L/kmDUCvVxKf4xKQRA==
X-Received: by 2002:a17:90b:1541:: with SMTP id ig1mr5538596pjb.125.1602258867418;
        Fri, 09 Oct 2020 08:54:27 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6292:5a21:d5ff:f3e8:fcf2:ccc7])
        by smtp.gmail.com with ESMTPSA id g4sm11608844pgh.65.2020.10.09.08.54.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 08:54:26 -0700 (PDT)
Date:   Fri, 9 Oct 2020 21:24:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/10] bus: mhi: core: Skip device wake in error or
 shutdown states
Message-ID: <20201009155419.GD4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480955-16827-4-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 07:02:28PM -0700, Bhaumik Bhatt wrote:
> MHI clients can request a device wake even if the device may be in an
> error state or undergoing shutdown. To prevent unnecessary device wake
> processing, check for the device state and bail out early so that the
> clients are made aware of the device state sooner.
> 

Please use the term "client drivers" everywhere. With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/pm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 9d4789d..1862960 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -827,6 +827,10 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
>  
>  	/* Wake up the device */
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> +	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> +		read_unlock_bh(&mhi_cntrl->pm_lock);
> +		return -EIO;
> +	}
>  	mhi_cntrl->wake_get(mhi_cntrl, true);
>  	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>  		mhi_trigger_resume(mhi_cntrl);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
