Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073DA356485
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 08:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244028AbhDGGug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 02:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhDGGug (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 02:50:36 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5BBC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 23:50:25 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id d5-20020a17090a2a45b029014d934553c4so45993pjg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 23:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rz74F0kIsCAdV31GufRcdvTOIwmDrwgMtMe2+7RE4Hg=;
        b=aP+yJBoaceGoIK0q2XyGVKLKgft9WiVgJZL6j665vyUjfxnYYXBznI/cWuvd1dH/Mb
         nPcehMeVE7lNyk3adsh4Rx9FwzEUhZQuCRh3hZlLOnkj0w82oiPxxaX/CqvnVDjASqGI
         y3ZI+nHzrrzuH0ABbyz1owRybMkQtttaGMy4lx49InNpxQuLfT9cmJerteEeVdo/3JzN
         ZWR/zWf0wzCzc0i95ct8EV/gGAEQR9aIMUBMdg/p0vc4VjG5SuYQFTsrr1GA98DEzxJG
         FWt3UyE1X0j+GBCsX/eqPN2Cmmcr8au10Uz+XvkpMMFvUgKol1NjxCK8y+U3wNZltKJP
         3ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rz74F0kIsCAdV31GufRcdvTOIwmDrwgMtMe2+7RE4Hg=;
        b=JA8F10pURg4nXgaNGMedcuxRF5nz7alxiZ8hQpfnVij/AN5DjhJ0uADlxRwFrQz3J+
         MP7EHlIxEUX8Vg0HOfDx7r4N0odijpwq6vlbhXHLeNFUuO69T3EEaaPgJOusKWNcwBzT
         q18b5E2+BVh/ishyvimqfDZXjIn5PfBYmNhOiNBGIx/oXqEpVH9lzDsd7H6/nPr0eCET
         1JE1clHOEc62Gobjk9aSsHhdC5CIn4yTZTRwHfiRsFCRbj/65H8H7bZtn4v9HXSD9CN1
         Gn5yjzFMYyUb7FC4g4Ts2kCKVAj4DrPcbvenPfOAgBIXCJh2Pm06Fi/wqetGzOFksmpi
         sOlQ==
X-Gm-Message-State: AOAM532PuhCMHBahBLcyUMs1B7efF4wiRhzx/lLVc/CAhAY732VvYlae
        jGAeJvmeAV2fQDeXv/EAAXPG
X-Google-Smtp-Source: ABdhPJzJiLd6yY2WEnfvlsSIeRJcBVjhtGxwCzBk/xbOFxcjU+cg/+sqmaNIOCSKyscSvhuezSe6kg==
X-Received: by 2002:a17:90b:3c8:: with SMTP id go8mr1928073pjb.145.1617778225225;
        Tue, 06 Apr 2021 23:50:25 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id h18sm16717025pgj.51.2021.04.06.23.50.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 23:50:24 -0700 (PDT)
Date:   Wed, 7 Apr 2021 12:20:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] bus: mhi: pm: reduce PM state change verbosity
Message-ID: <20210407065022.GJ8675@work>
References: <1617700315-12492-1-git-send-email-loic.poulain@linaro.org>
 <1617700315-12492-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617700315-12492-2-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 06, 2021 at 11:11:55AM +0200, Loic Poulain wrote:
> Since M3 can be entered/exited quite a lot when used for runtime PM,
> keep the mhi suspend/resume transitions quiet.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: Coding style, adjust alignment of dev_dbg params
> 
>  drivers/bus/mhi/core/pm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index edd7794..6cbac21 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -858,7 +858,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>  		return -EBUSY;
>  	}
>  
> -	dev_info(dev, "Allowing M3 transition\n");
> +	dev_dbg(dev, "Allowing M3 transition\n");
>  	new_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_M3_ENTER);
>  	if (new_state != MHI_PM_M3_ENTER) {
>  		write_unlock_irq(&mhi_cntrl->pm_lock);
> @@ -872,7 +872,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>  	/* Set MHI to M3 and wait for completion */
>  	mhi_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
> -	dev_info(dev, "Wait for M3 completion\n");
> +	dev_dbg(dev, "Wait for M3 completion\n");
>  
>  	ret = wait_event_timeout(mhi_cntrl->state_event,
>  				 mhi_cntrl->dev_state == MHI_STATE_M3 ||
> @@ -906,9 +906,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>  	enum mhi_pm_state cur_state;
>  	int ret;
>  
> -	dev_info(dev, "Entered with PM state: %s, MHI state: %s\n",
> -		 to_mhi_pm_state_str(mhi_cntrl->pm_state),
> -		 TO_MHI_STATE_STR(mhi_cntrl->dev_state));
> +	dev_dbg(dev, "Entered with PM state: %s, MHI state: %s\n",
> +		to_mhi_pm_state_str(mhi_cntrl->pm_state),
> +		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
>  
>  	if (mhi_cntrl->pm_state == MHI_PM_DISABLE)
>  		return 0;
> -- 
> 2.7.4
> 
