Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38A62B43F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 13:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgKPMrO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 07:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgKPMrO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 07:47:14 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A578C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 04:47:14 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id i8so284124pfk.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 04:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hjz/pG1FXMNclKUbGQCgRGQRnKutMZdz2lW6yKssubA=;
        b=KooEXHpP9BPJzYOzg3A0MdhsS2deEHUEnnFU3BBIn+0iw+BBuocqupBgv382HXDzjQ
         Gg87WkmhmkusvAh1YDUCUAk4UKju5y3dFS+RrWOhAzfItdLmyTyQ2bOyKz9Zhy9iSsjA
         Tutdr1BfzWdNXAWkP6e3Z4xqdC+VmrUiaq0SS8aSk1VbRYpzIC+iId9moBFFc5z32NL8
         QGTJlU+LHD+hcWPOW5IYU1hVAViqVK2CGXOCXdMzPwQzMMtRidfgLL0YTzWQqlyqXrUR
         S8xFhXQufNm4Ck6TGCOoGwHylxrggHoXjkD2dr6vxHVuU/mxeh96WLMwAjoIz732k2Mh
         ICkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hjz/pG1FXMNclKUbGQCgRGQRnKutMZdz2lW6yKssubA=;
        b=hVaelZXG2e0GM7/762Hiy469KZr0HovgINFmc1ySNO0dXE4DqwKGGix2O2iBVH0rwG
         YbVYkHvEYxv/2VvA0BwnSkxrB/BF01fE8UibTQP22rmOE6eMLUJ63/7Nnhb2NWfDsQJU
         1lV2v+YcgbZAPeIJt7DSiCKj+jyzoIt5XO76YTa5X5LPeZDZz669TeK5WKxBX87rUl72
         P76OkQpgjT4AquUpng1qE0WFFD64WdufElmSOKDFUOj0QCYhi0Xvz0w9s8SgPZUGNtb3
         KsYUi0fp+Sm4oUda5/Fk0JOJdzNVs67XzNx/0iaXjhegLR/rszVR9AmC+FROFiVTMBRZ
         FUsw==
X-Gm-Message-State: AOAM53293AvQCns48uYGOo6ItU+Y3NND5VY43o/++aCvAFl3PniNhNU7
        Ef4zuwRa4C0sNupJvSQOnhDw
X-Google-Smtp-Source: ABdhPJxNw7SIpur2I8+FwPob3ZbSh0X23uAMFBndfW4XT94TUoy9uKQOmg+GNcS1lrfV8yUbuD/fvA==
X-Received: by 2002:a63:2cc3:: with SMTP id s186mr4008863pgs.230.1605530834088;
        Mon, 16 Nov 2020 04:47:14 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:9b0a:75fd:1290:bf5c:a350])
        by smtp.gmail.com with ESMTPSA id gx24sm18002561pjb.38.2020.11.16.04.47.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 04:47:13 -0800 (PST)
Date:   Mon, 16 Nov 2020 18:17:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] bus: mhi: core: Remove __ prefix for MHI channel
 unprepare function
Message-ID: <20201116124706.GL3926@Mani-XPS-13-9360>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-6-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605122473-12179-6-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 11, 2020 at 11:21:12AM -0800, Bhaumik Bhatt wrote:
> The __mhi_unprepare_channel() API does not require the __ prefix.
> Get rid of it and make the internal function consistent with the
> other function names.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index e8af85a..19156d4 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1312,8 +1312,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
>  	return -EINVAL;
>  }
>  
> -static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
> -				    struct mhi_chan *mhi_chan)
> +static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
> +				  struct mhi_chan *mhi_chan)
>  {
>  	int ret;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -1433,7 +1433,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  
>  error_pre_alloc:
>  	mutex_unlock(&mhi_chan->mutex);
> -	__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
> +	mhi_unprepare_channel(mhi_cntrl, mhi_chan);
>  
>  	return ret;
>  }
> @@ -1550,7 +1550,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
>  		if (!mhi_chan)
>  			continue;
>  
> -		__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
> +		mhi_unprepare_channel(mhi_cntrl, mhi_chan);
>  	}
>  
>  	return ret;
> @@ -1568,7 +1568,7 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  		if (!mhi_chan)
>  			continue;
>  
> -		__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
> +		mhi_unprepare_channel(mhi_cntrl, mhi_chan);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
