Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189E617EA92
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 21:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgCIU4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 16:56:37 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43835 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgCIU4h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 16:56:37 -0400
Received: by mail-pg1-f194.google.com with SMTP id u12so5258690pgb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U5ll+F45+gp5tDit4vjDwxtlVejpB5f+KEOORoRWtRY=;
        b=YUf1pYvgkc3NWHezfnVPtbOZcluXoyPBiV9ZvG53sPI98VPN/NliABEMtV4hCj1O0y
         wlM27CDuwQO4feW9FS4WEgo99lE4sn5mOcwjZ7XqURDwGCjzOaAZ31yiiobhvEDYXQ6R
         AQz+R0xHDnvsEEcbACDAEx2S6UhPt0DQflpjkE6iKwrqH9j1LM7fVkkJZ7FwnIS7zxBm
         PTMORckzKMVDkkI08QrXzVn01t1HSSCRBnPawzD2KXlvopIhTmcvGvGJ/4UWRg+CxbfR
         8vYwpAEKHxwL6AMIUUsBrHFdVNINbNBVv0p1wETfRCLerTLEKootDPNoWcEhwqQJYYMn
         AFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U5ll+F45+gp5tDit4vjDwxtlVejpB5f+KEOORoRWtRY=;
        b=rSPYIjdB+hiBt6Ju6MkJ+ymQDAI0t7/YLfWioVKPUR+U9zkOfeFeIB022ZRBTNpqaN
         oPzeQdfamP7fm5wnGCwWG4XpqoYyDhDlxZU+sZ221Y9nRkwJSLDBzBh1qoiEipv0i/DL
         nXnO9w7Tlvkm4gNJtcA4jr9y8AGGTGSrg/BDESAwCed0rglK/ceRl7LRjP6GyL1oJAKM
         6vSDUSKyNgzGsuTXoHLGJsS7ijiwGV5visfxx3n/M2wNjtA0PXiM1Yrju0SNhgmQxPDi
         C7ZLMpIawRL8Em8hc7SmRZtlwAJLisGQZw003umIVYtYZiy89lCEKPmJFXGVMUihTRcV
         pemA==
X-Gm-Message-State: ANhLgQ2JfWJrIhGeUcnmWTWNoUBdQOJscuSAH51qLOq8P21uunXjQAzR
        hs30RxFaBEdBhgrDY7i+jUn0zQ==
X-Google-Smtp-Source: ADFU+vukIGxG4H2/2KRwkjbRv/cc8CLgKoIL2IICKTc5ELJFOXIuLqIEwvntOepL7MfuxYuGq1TS3g==
X-Received: by 2002:a63:d658:: with SMTP id d24mr18336312pgj.340.1583787395782;
        Mon, 09 Mar 2020 13:56:35 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id f3sm37932570pgg.46.2020.03.09.13.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 13:56:35 -0700 (PDT)
Date:   Mon, 9 Mar 2020 14:56:33 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] remoteproc: re-check state in
 rproc_trigger_recovery()
Message-ID: <20200309205633.GF1399@xps15>
References: <20200228183359.16229-1-elder@linaro.org>
 <20200228183359.16229-2-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228183359.16229-2-elder@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 28, 2020 at 12:33:56PM -0600, Alex Elder wrote:
> Two places call rproc_trigger_recovery():
>   - rproc_crash_handler_work() sets rproc->state to CRASHED under
>     protection of the mutex, then calls it if recovery is not
>     disabled.  This function is called in workqueue context when
>     scheduled in rproc_report_crash().
>   - rproc_recovery_write() calls it in two spots, both of which
>     the only call it if the rproc->state is CRASHED.
> 
> The mutex is taken right away in rproc_trigger_recovery().  However,
> by the time the mutex is acquired, something else might have changed
> rproc->state to something other than CRASHED.

I'm interested in the "something might have changed" part.  The only thing I can
see is if rproc_trigger_recovery() has been called from debugfs between the time
the mutex is released but just before rproc_trigger_recovery() is called in
rproc_crash_handler_work().  In this case we would be done twice, something your
patch prevents.  Have you found other scenarios?

Thanks,
Mathieu

> 
> The work that follows that is only appropriate for a remoteproc in
> CRASHED state.  So check the state after acquiring the mutex, and
> only proceed with the recovery work if the remoteproc is still in
> CRASHED state.
> 
> Delay reporting that recovering has begun until after we hold the
> mutex and we know the remote processor is in CRASHED state.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..d327cb31d5c8 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1653,12 +1653,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	ret = mutex_lock_interruptible(&rproc->lock);
> +	if (ret)
> +		return ret;
> +
> +	/* State could have changed before we got the mutex */
> +	if (rproc->state != RPROC_CRASHED)
> +		goto unlock_mutex;
> +
>  	dev_err(dev, "recovering %s\n", rproc->name);
>  
> -	ret = mutex_lock_interruptible(&rproc->lock);
> -	if (ret)
> -		return ret;
> -
>  	ret = rproc_stop(rproc, true);
>  	if (ret)
>  		goto unlock_mutex;
> -- 
> 2.20.1
> 
