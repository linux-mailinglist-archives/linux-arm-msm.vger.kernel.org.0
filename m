Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA5731D442
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 04:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhBQDbV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 22:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhBQDbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 22:31:20 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF40C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 19:30:40 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id u143so7545654pfc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 19:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=//JKKkqK8hIJmVonO4gVrXOWpYiQD6M2rXanNB4YrNQ=;
        b=u1Z67XuqoIFYu//KXg+uuZp6hBBBz8fjM0ReG8q9nPvJ6AhfQiOF1g2FgeW3JrYBgp
         pWltUwiZJ0UT/zDLKOzfUgaau30ltiPniGdG2SuVtcszxDnMBk5QoGhbAkp/fTj1KTjj
         I4XHb+adrWKLX6xZSDfgA3BFInrBbyfpUhIfrWd3NYrN1tn2e5dCWRHa+0GAKUTXUPge
         xYU3O+0u1QUh1/52KMvBsHdTk2bmrHB2354xKIRBlGU7+zbzREb0Xck9Zlmi66glVrPX
         uGLwG52iN3K1nBO9M2HeWN/R2CeXJmZT87zTprno6/4vi/P0MVlghnZY8GkYzFCIzDf0
         vUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=//JKKkqK8hIJmVonO4gVrXOWpYiQD6M2rXanNB4YrNQ=;
        b=eeQlPS/NfG0nblOYMidw0ki/lKUJRjDB2NuxHiG1N8t2b1y7vyEYdHwYJJIFWinSfN
         W9beFp1Uid9W56YyDLWnHSQdcQFxq8SYxb41qOzAGKNoNv1I0RDyYwq0cvPZe1QW0Hxv
         46dPo7uKDr43xiaFnVk2h3fU5YAur3fKTHyVXrRlg1+o4lpou9PWviH7id0ZtI5Bp5v/
         tLpCifPrbmnah9L8dI/sUpBXa24c3Nn3ENswfRQgr9n+65q024hsF9k2RdEikhXP1FNI
         sBfxeX3We4vXWfnOgNVJmzfE4mm8+StgQ5jHQnPsuw74sjnyBcIizNd4aKxOFljDJI9B
         9CVw==
X-Gm-Message-State: AOAM530gDtZ+zcgbQJCeTdGn7VMnkvi20cWXwjyo0rI48kihkZ0knQOF
        blquoybcMKgQ/bfeKpo9I8jZ6yW7OsH3
X-Google-Smtp-Source: ABdhPJzP/you8qPzpiTxW3UjofNWW/SUrLCj0ZrBueQNe5fgKWP+T4JANsRiwRvcvo8bQYBnjHKwEg==
X-Received: by 2002:a62:1c84:0:b029:1c4:f959:7b29 with SMTP id c126-20020a621c840000b02901c4f9597b29mr850391pfc.34.1613532639341;
        Tue, 16 Feb 2021 19:30:39 -0800 (PST)
Received: from thinkpad ([2409:4072:649c:b72c:a1c5:6cec:d098:f3f5])
        by smtp.gmail.com with ESMTPSA id e12sm365823pjj.23.2021.02.16.19.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 19:30:38 -0800 (PST)
Date:   Wed, 17 Feb 2021 09:00:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mhi_bus: core: Check state before processing power_down
Message-ID: <20210217033026.GB3967@thinkpad>
References: <1613511496-22271-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613511496-22271-1-git-send-email-jhugo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 16, 2021 at 02:38:16PM -0700, Jeffrey Hugo wrote:
> We cannot process a power_down if the power state is DISABLED.  There is
> no valid mhi_ctxt in that case, so attepting to process the power_down
> will likely result in a null pointer dereference.  If the power state is
> DISABLED, there is nothing to do anyways, so just bail early.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/pm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 56ba3ab..dc69074 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1144,6 +1144,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		mhi_deinit_dev_ctxt(mhi_cntrl);
>  
>  error_dev_ctxt:
> +	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  	mutex_unlock(&mhi_cntrl->pm_mutex);

pm_lock is supposed to protect the PM state. The current code needs a cleanup
interms of locking. It's been on my TODO list for sometime...

>  
>  	return ret;
> @@ -1155,6 +1156,12 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  
> +	mutex_lock(&mhi_cntrl->pm_mutex);
> +	cur_state = mhi_cntrl->pm_state;
> +	mutex_unlock(&mhi_cntrl->pm_mutex);

Same here.

Thanks,
Mani

> +	if (cur_state == MHI_PM_DISABLE)
> +		return; /* Already powered down */
> +
>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
>  	transition_state = (graceful) ? MHI_PM_SHUTDOWN_PROCESS :
>  			   MHI_PM_LD_ERR_FATAL_DETECT;
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
