Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C3A2A0734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 14:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgJ3N4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 09:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgJ3N4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 09:56:38 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD844C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 06:56:36 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e7so5323781pfn.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aSHiPFU1PNrnVd14nC1sU5GQ+wrXJKS+FnkjSYfXuYg=;
        b=uKAnRtofJnQlPQ4F0mplXHKRqAwuFFHiMtK4LIIKVgLC4POIYgreSBMPH5rnKQh1fC
         5I2sQmr6nCAHW8K0egfuy9aw3mr3ZyESTpPsU2qVb6aXIllEWsVOY/FleGz+eslRN5OJ
         V/+ZKRiOezeHR9E0JgFH+wRQMWGh6suZN8s+etYPrVyY4Z03OUtUbGma1n1TAh3hRxA7
         O6cgFS/Hsdqd3nz8AKfYRRPyEg0tXrB+Vk1eY22Jn/ICFYw2wMUbGn0tPMXLxmPzEYV/
         SEmanWWQYR7eguGiwhz2iGewcDVPgeMi07LhgvaW0ZTkKd1WJQVoarn0wt8+aiUPUWbZ
         HIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aSHiPFU1PNrnVd14nC1sU5GQ+wrXJKS+FnkjSYfXuYg=;
        b=DfMQu92t+nEZ5ybR1zfvym+VeVAwIWRMISX84Bw8H5CqyFC54gRKPWz0WxGaoRy535
         0pWUBMmUgXRYuLhCQFjNtNJoF86gO0k36uv6miLCoaezJ6hQUbfL2jl/+6wOoCxDgkqK
         UZptIDrtm3mDEWJwQSU/iKHh0D3eBbOVRXeCfR+CONzew/T5xrXS6TBOVsUCRugKvEHs
         kUDvK4JNQsevzGS1q5X+0KCv1JJ92k6r4vZWwm0KMzuqdGa8fhs/RLEytsvvqkYjAGdu
         nuYGoxi+mKCO3xowmfI8jKQdXUpveKlLA37+RB++pXKc4FuPnPYwA26IwcIqrZCoEToL
         JAbQ==
X-Gm-Message-State: AOAM532xl2mv4CX6CI//tDmomA1uj6ywPpdW/B0ur00XaoaL9YmhN0jW
        ++dNyPZhj3nu2GTnhsTeqO7R
X-Google-Smtp-Source: ABdhPJzLy4XqCGGBATGas/Pt3Gei75Zask1U2mvffrW0Td4wwLYSA4pIMdguJ/pHvR+dbFyKGr3GDw==
X-Received: by 2002:a17:90b:3501:: with SMTP id ls1mr2954756pjb.26.1604066196343;
        Fri, 30 Oct 2020 06:56:36 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id b6sm3504041pjq.42.2020.10.30.06.56.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 06:56:35 -0700 (PDT)
Date:   Fri, 30 Oct 2020 19:26:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/12] bus: mhi: core: Prevent sending multiple RDDM
 entry callbacks
Message-ID: <20201030135629.GH3818@Mani-XPS-13-9360>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
 <1604031057-32820-6-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604031057-32820-6-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 09:10:50PM -0700, Bhaumik Bhatt wrote:
> If an mhi_power_down() is initiated after the device has entered
> RDDM and a status callback was provided for it, it is possible
> that another BHI interrupt fires while waiting for the MHI
> RESET to be cleared. If that happens, MHI host would have moved
> a "disabled" execution environment and the check to allow sending
> an RDDM status callback will pass when it is should not. Add a
> check to see if MHI is in an active state before proceeding.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 1f32d67..172b48b 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -399,6 +399,10 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  
>  	 /* If device supports RDDM don't bother processing SYS error */
>  	if (mhi_cntrl->rddm_image) {
> +		/* host may be performing a device power down already */
> +		if (!mhi_is_active(mhi_cntrl))
> +			goto exit_intvec;
> +
>  		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>  			wake_up_all(&mhi_cntrl->state_event);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
