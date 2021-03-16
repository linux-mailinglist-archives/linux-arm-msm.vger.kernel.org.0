Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C6133CDE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 07:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbhCPGRO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 02:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbhCPGQv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 02:16:51 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B654CC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 23:16:51 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id r16so6783864pfh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 23:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7h2yXhFof54YGjMWDbaJozcTXrsSdqE/dyDBMyKGJ5Y=;
        b=QbzsDrIYg7eHAgh4pGB4AAmMnT1WVG9zZnAMCz9/f+XPsbeRlJvMiFQl0L3v3X0d+d
         6DllluutMlvH72r6ur/Wj4Mcl2cusydCWFJzfajjR5MUeK0gAYPoj3dGbCznqXe7potY
         j9iJhkostX06gSzSk2SvjNVshl8gTDHdVSmmn3i8XZnK3Tf+QlkgwsyInEwIZDDiOw/M
         IUYaJjw6YC2slzc+QiVQKeyDGlFcPq0eSIrJkQxoaa6bDtOwhbLm43yq+VLOyGItARVG
         9rn/gf5sZkstLMzwlcUuyFy1agBrcZRRK/RxcpENwQsVhJmMAnZjbGCg8mLp5rxXPKhk
         k1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7h2yXhFof54YGjMWDbaJozcTXrsSdqE/dyDBMyKGJ5Y=;
        b=AW7fe95e+L3uFvHNk6+g7Exi2lnm96IcPIEfx1VzXj94JFsQwSFyH1ImShWo4+lNnE
         OtryLiyM9CrOQg1JBdSDUczWvDRY1kuvS4EZ6tGHubJSl3EKN0Dv5LKxmBsNQffq8WEB
         rczawdVtSuc5319gprw+0BG5q+ZkqW/Y7fyY4QbtqygNH9MT1z9c0o8Wjg0E+eLOWFLH
         IE1h77Dh/tDKKjNNHkPFnETodsC72hV903D4jDuFdfkcs9u0+oQ4NCMWB639rNjb1B3W
         BT8Gw7cvlmVXybc2ncwSyFXA6rL8k0QPQuZxRij2YpEWmBqDoaNEcHPBsRyxd1YO9lCi
         7UIg==
X-Gm-Message-State: AOAM5311RKnAxpQh0WKK9motnJVYdv9VfJLDZcCNPxvcQT6oKbB7uW3m
        CGkVMO/K7B5g63sQG6ANhpGQ
X-Google-Smtp-Source: ABdhPJzbu3uIbNoqRjsPpFLMtZloQO2Rh2lDCvmacc2qKHwbpCQkpacd7bG1V4Ba8EAiFg3WpqBMvw==
X-Received: by 2002:a63:e22:: with SMTP id d34mr2552544pgl.264.1615875411306;
        Mon, 15 Mar 2021 23:16:51 -0700 (PDT)
Received: from thinkpad ([103.66.79.72])
        by smtp.gmail.com with ESMTPSA id gk12sm1545108pjb.44.2021.03.15.23.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 23:16:50 -0700 (PDT)
Date:   Tue, 16 Mar 2021 11:46:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] bus: mhi: core: Check state before processing
 power_down
Message-ID: <20210316061646.GH1798@thinkpad>
References: <1615409365-8165-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615409365-8165-1-git-send-email-jhugo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 10, 2021 at 01:49:25PM -0700, Jeffrey Hugo wrote:
> We cannot process a power_down if the power state is DISABLED.  There is
> no valid mhi_ctxt in that case, so attepting to process the power_down
> will likely result in a null pointer dereference.  If the power state is
> DISABLED, there is nothing to do anyways, so just bail early.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> 
> v3: Move the pm_lock use up
> v2: Fix subject and tweak the locking to avoid needless lock/unlock/relock
> 
>  drivers/bus/mhi/core/pm.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 414da4f..ea62549 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1149,6 +1149,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		mhi_deinit_dev_ctxt(mhi_cntrl);
>  
>  error_dev_ctxt:
> +	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  
>  	return ret;
> @@ -1160,12 +1161,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  
> +	mutex_lock(&mhi_cntrl->pm_mutex);
> +	write_lock_irq(&mhi_cntrl->pm_lock);
> +	cur_state = mhi_cntrl->pm_state;
> +	if (cur_state == MHI_PM_DISABLE) {
> +		write_unlock_irq(&mhi_cntrl->pm_lock);
> +		mutex_unlock(&mhi_cntrl->pm_mutex);
> +		return; /* Already powered down */
> +	}
> +
>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
>  	transition_state = (graceful) ? MHI_PM_SHUTDOWN_PROCESS :
>  			   MHI_PM_LD_ERR_FATAL_DETECT;
>  
> -	mutex_lock(&mhi_cntrl->pm_mutex);
> -	write_lock_irq(&mhi_cntrl->pm_lock);
>  	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
>  	if (cur_state != transition_state) {
>  		dev_err(dev, "Failed to move to state: %s from: %s\n",
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
