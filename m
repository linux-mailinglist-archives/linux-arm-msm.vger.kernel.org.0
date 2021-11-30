Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E71462C9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 07:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhK3GMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 01:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhK3GMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 01:12:18 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B58C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 22:09:00 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id np3so14508626pjb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 22:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N08U9q6AK1ucdiwypJ7HnJcj+bssdS5xiXKSKF3b9gI=;
        b=P8/yJ2dGo6QliJRyJuJak7f/PoVmx1F4Y4ZHx/NCjhNF77D5MAp3V8AongYDMDR2k7
         lMVOYyig+ptpOvNM6ThBgpWdZPtgHdg1ItSwynJEiol8xZRweDCiPGMZ7qk3xNeO0pnW
         3ZqKMY7e0MzUUFuHBq4q3w5fXybyCJE7hn4V9GTSHf5MEcuIlAxsi7oYvNR/aI27Kryc
         xDtgFXn5qtND5Ya8XNS33oBew3dpyQzyh2M2TErl4scTEfhdQR/hxNVC0wQdFV9viXAj
         bRxJa0oI3ONTmyLfwN2/A5XZhB65gnthR4Uj67wYwouhnGYg2zRUJRmIDphnlxWVeBfR
         zrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N08U9q6AK1ucdiwypJ7HnJcj+bssdS5xiXKSKF3b9gI=;
        b=Z13x/srP5jeibJQUZvSHq7rnyGN8wSmnh+kgfzxlh1THZf94oyeqrZ47TD1OYSmyeI
         fiXPNjWxhphak77p6RdyIgWpdiu/vUY2dgHge7JJqAmXUNnVB7c46L8AjAHlWCefVGIv
         GaUF1SGYrpWJMGrnITx+5bavlmUAtLtNR0c0p41ms/NxK83WKB38zkFal/ghmLJkl1wZ
         0r7NZOtXQ9gjvPtSyyUOV/6RwofVPyFrxYBxwesqZBNY8wYXRy8ZJIaOIoUHHljuuAv3
         wMrZU3v8nh3F3fyljUPfStOGmhgSMq6ZYSynoIlv0FBGvv/IrsrI9kaPa7+zHypSliuJ
         tcBg==
X-Gm-Message-State: AOAM530UEotix58hn+YEyYs+57tRg0Qj9cnokZRQbTOSpkBVinergpHR
        PuYwoPfm+KONuwsEiBuEo2gu
X-Google-Smtp-Source: ABdhPJyDJeDA8Qt/fhMY0xIMbX/S0EIp6j462zpZWe00ok7e22uauk7Qm2/sW8vfMQuJU027CZCljQ==
X-Received: by 2002:a17:903:41cb:b0:142:62a:4d86 with SMTP id u11-20020a17090341cb00b00142062a4d86mr66083571ple.43.1638252539519;
        Mon, 29 Nov 2021 22:08:59 -0800 (PST)
Received: from thinkpad ([202.21.42.3])
        by smtp.gmail.com with ESMTPSA id mg12sm1188257pjb.10.2021.11.29.22.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 22:08:58 -0800 (PST)
Date:   Tue, 30 Nov 2021 11:38:54 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Minor style and comment fixes
Message-ID: <20211130060854.GC205712@thinkpad>
References: <20211126031403.8075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126031403.8075-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 26, 2021 at 08:44:03AM +0530, Manivannan Sadhasivam wrote:
> This patch fixes the below checkpatch warnings in MHI bus:
> 
> WARNING: Possible repeated word: 'events'
> +	/* Process ctrl events events */
> 
> WARNING: Missing a blank line after declarations
> +			struct mhi_buf_info info = { };
> +			buf = kmalloc(len, GFP_KERNEL);
> 
> WARNING: Move const after static - use 'static const struct mhi_pm_transitions'
> +static struct mhi_pm_transitions const dev_state_transitions[] = {
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 3 ++-
>  drivers/bus/mhi/core/pm.c   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index b15c5bc37dd4..930aba666b67 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1065,7 +1065,7 @@ void mhi_ctrl_ev_task(unsigned long data)
>  		return;
>  	}
>  
> -	/* Process ctrl events events */
> +	/* Process ctrl events */
>  	ret = mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
>  
>  	/*
> @@ -1464,6 +1464,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  		while (nr_el--) {
>  			void *buf;
>  			struct mhi_buf_info info = { };
> +
>  			buf = kmalloc(len, GFP_KERNEL);
>  			if (!buf) {
>  				ret = -ENOMEM;
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 0bb8d77515e3..7464f5d09973 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -42,7 +42,7 @@
>   * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
>   *     LD_ERR_FATAL_DETECT -> DISABLE
>   */
> -static struct mhi_pm_transitions const dev_state_transitions[] = {
> +static const struct mhi_pm_transitions dev_state_transitions[] = {
>  	/* L0 States */
>  	{
>  		MHI_PM_DISABLE,
> -- 
> 2.25.1
> 
