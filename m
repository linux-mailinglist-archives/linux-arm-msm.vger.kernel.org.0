Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADBE3562CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 07:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344976AbhDGFCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 01:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244465AbhDGFCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 01:02:03 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D92C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 22:01:54 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so625863pjh.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 22:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JV4gU9KtuerS3kwpyMC3jvnXJHjjAgCdtm5t9mEPq44=;
        b=orUPA1Mn0VJuHkfBjJyu0xBoFgwEUB9BqU6lwUT5r46QbAmBqg6GDzBqtlan7nvzvo
         KthF3jA8vyuku21OenNJzWJOheGuLKKX+xSmNK9pDpkKydItFvogr+UP7bsP0TNQD7YR
         sitOOxvhERQeZSngPJvmiV5lfNTccmyUERU7e4QXBDoB97LJwSXsPsicCQogfprFwtdq
         tu4V/+xLnQMfADezSwLAxaQT5gwDcOdzANKHbMZzQTGhXgJQwMmiO9CHdaXxe5ZfCjpW
         K36x8WnO6qZmSSp3Czdx6GsTFsXbmmvAnPetSGLiakqg1fhmjcbRprQ9Us1QaBwYaWoN
         zlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JV4gU9KtuerS3kwpyMC3jvnXJHjjAgCdtm5t9mEPq44=;
        b=GTaWD5M6D9vFZXWsTBPcI4AdQD8WxFXJFwaApDvmbS4qC6bToRfK5b5tFFkt9fwdqJ
         Ln5KXGpvYx/7tnBD2oBrQDaY75KTPuOtUftav1KO0xokOSGL9QTZVApYGffSKnwurozl
         VfxLnkw+NVGmssrQXgf1vGBJvCfJYzcvmY5iTZt6O9RM58RavHzzggw4rU7Xo3EqANkp
         yN5hQq8BdqbGh4lYcoqqST5tVo5pRLCitEUIEDT75h0/ujBEvWi655ySY8Nc6OA3/4VK
         fJcTGzPMhm7dZyz6qYmFoz/u7ljQKYv9v8+J///HWryehJJhAYqbG6UP6HrYVJkWXmIC
         DFrA==
X-Gm-Message-State: AOAM533f0jwM9ipztEwdmWW1eINWf/G5a7iR4b9z4MPsGSmoFyfem/46
        SIIqIxVObedoxfsT1xU6GT3d
X-Google-Smtp-Source: ABdhPJyuczRFfqYIdXUuFhSvZkizUmaGsbgLQEK3GMfq6QAUP6Z2zI35Jp7L0qwPNrvdcNrJAphypw==
X-Received: by 2002:a17:902:9043:b029:e9:3900:5590 with SMTP id w3-20020a1709029043b02900e939005590mr1521242plz.76.1617771713510;
        Tue, 06 Apr 2021 22:01:53 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id js16sm3709276pjb.21.2021.04.06.22.01.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 22:01:52 -0700 (PDT)
Date:   Wed, 7 Apr 2021 10:31:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] bus: mhi: pm: reduce PM state change verbosity
Message-ID: <20210407050149.GA8675@work>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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

This could be "Waiting for M3 completion". But I'll change it while
applying.

Thanks,
Mani

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
