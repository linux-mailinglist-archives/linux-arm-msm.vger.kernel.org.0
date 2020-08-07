Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EB123E6F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 07:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgHGFN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 01:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgHGFN2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 01:13:28 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690C1C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 22:13:28 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o5so346458pgb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 22:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uAnbgsU1GSpEQ4EXCeXqJ7jCkqVhcQnpaY+MY+n8/v8=;
        b=LjgU+5BWSZ1UNfNTnyqZmTs9L/qKPPRyz0pg8z4KPCvRBmLtiTeWLidRK2+BrYROR5
         Cf6SE8yR9S9mK7xj+UQ9gEEcORT0hpDC2I/+Jn5vV985qV/YuRh6vS83NTXKf+LVu7+a
         69QX58e8oIaflUROpvjap27tqBbXkM9FCWvK3pYDox8/YYjqTO8C4lcR8RJm4u/MN9oK
         QfVKCACgT9l+bZc8tLDLjKS++aldCJuCchll//HS7aN8XCSLrupjdggFWxJm6n2jU8il
         dmNWY/7IuTl4Hf9Gqi9oX97jtWheYKNtueD0iKbo1U2o1q+X+aDc3ZdxgfwPC8A3aMsJ
         krrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uAnbgsU1GSpEQ4EXCeXqJ7jCkqVhcQnpaY+MY+n8/v8=;
        b=dtHdOA4FpDY6sh+hm/2j+siDkgNfsTx9wNk+ia2CJcZCFXzvGK/c/BVD8xdwFA6Alr
         GErCZLpa2Zud8fUmVEvupB8Mf1Mxctk36O2fldTipuV9me0e0W/IzK0Uu+FIVSnG2ejD
         ut4BELJPXzRoTYqR2vOU7ENxo8HszronPpmz0Jd95ULfjvliSlvlRU3gqvV9eEPyjH0A
         qU2jgRhTPGJBYcMFOowu5Ya6KtJa/1VwtaideIOud8D5xiMnVDv99D//PmBJOlBAgrjG
         jDlEg8kEgZQMNQx2jocWpiJHPHRePrkJVGYmQMAQ0bW47KlW6XJ7G8R3mLwdtikAAAMu
         23Ug==
X-Gm-Message-State: AOAM533UDjmFxtQIRTY2rrkfCwBFkfDUB9N42jkgCsV7uyhjF8WsTBqc
        nODJTlErT2zEZwlaU6ambP3q
X-Google-Smtp-Source: ABdhPJycjYPvIqzg3r8qcKyiRPDj3gTTTpsElNgjo8ekvep6m5VX5zr9yycMXTg9kgVIGUrsCj7kRg==
X-Received: by 2002:a62:7acb:: with SMTP id v194mr11379078pfc.302.1596777207672;
        Thu, 06 Aug 2020 22:13:27 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d15:d4c4:a84b:5551:d33e:ccd2])
        by smtp.gmail.com with ESMTPSA id na14sm9041540pjb.6.2020.08.06.22.13.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 22:13:26 -0700 (PDT)
Date:   Fri, 7 Aug 2020 10:43:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/11] bus: mhi: core: Introduce counters to track MHI
 device state transitions
Message-ID: <20200807051320.GB3230@Mani-XPS-13-9360>
References: <1595901740-27379-1-git-send-email-bbhatt@codeaurora.org>
 <1595901740-27379-8-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595901740-27379-8-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 07:02:16PM -0700, Bhaumik Bhatt wrote:
> Use counters to track MHI device state transitions such as those
> to M0, M2, or M3 states. This can help in better debug, allowing
> the user to see the number of transitions to a certain MHI state
> when queried using debugfs entries or via other mechanisms.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

A minor nit below...

> ---
>  drivers/bus/mhi/core/pm.c | 4 ++++
>  include/linux/mhi.h       | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 27bb471..ce4d969 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -256,6 +256,7 @@ int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl)
>  		dev_err(dev, "Unable to transition to M0 state\n");
>  		return -EIO;
>  	}
> +	mhi_cntrl->M0++;
>  
>  	/* Wake up the device */
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> @@ -326,6 +327,8 @@ void mhi_pm_m1_transition(struct mhi_controller *mhi_cntrl)
>  		mhi_cntrl->dev_state = MHI_STATE_M2;
>  
>  		write_unlock_irq(&mhi_cntrl->pm_lock);
> +
> +		mhi_cntrl->M2++;
>  		wake_up_all(&mhi_cntrl->state_event);
>  
>  		/* If there are any pending resources, exit M2 immediately */
> @@ -362,6 +365,7 @@ int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl)
>  		return -EIO;
>  	}
>  
> +	mhi_cntrl->M3++;
>  	wake_up_all(&mhi_cntrl->state_event);
>  
>  	return 0;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index a8379b3..e38de6d 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -328,6 +328,7 @@ struct mhi_controller_config {
>   * @dev_state: MHI device state
>   * @dev_wake: Device wakeup count
>   * @pending_pkts: Pending packets for the controller
> + * @M0, M2, M3, M3_fast: Counters to track number of device MHI state changes
>   * @transition_list: List of MHI state transitions
>   * @transition_lock: Lock for protecting MHI state transition list
>   * @wlock: Lock for protecting device wakeup
> @@ -407,6 +408,7 @@ struct mhi_controller {
>  	enum mhi_state dev_state;
>  	atomic_t dev_wake;
>  	atomic_t pending_pkts;
> +	u32 M0, M2, M3, M3_fast;

Are you using M3_fast anywhere in current series? If not, please drop it for
now.

Thanks,
Mani

>  	struct list_head transition_list;
>  	spinlock_t transition_lock;
>  	spinlock_t wlock;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
