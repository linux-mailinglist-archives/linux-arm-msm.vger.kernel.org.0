Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 311F91A3BAF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 23:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgDIVIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 17:08:55 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39534 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbgDIVIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 17:08:55 -0400
Received: by mail-pl1-f194.google.com with SMTP id k18so4287219pll.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NcQsyYub/r8Q9+PaSLKRYTmg67Aka19WbBMxwbtUrmE=;
        b=CbcreuVCbg+sbqe4omyBRWJUQGrBEIHCOPij1b2Q/5qjmdYbytQ9SIZiNBTjqVWXiK
         p8Yf4tg5qhTITaK7x6sGtcEBhkQfiacxiGd7X1J7kEyQKENeI327lhL+XUZxo3uYT9Y7
         sKb5ySZ+4deaz++qsHAYi1FISa11OfjfjilKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NcQsyYub/r8Q9+PaSLKRYTmg67Aka19WbBMxwbtUrmE=;
        b=YGMma3TEShutIDJSslcnMFPXlJ/bV4KbL7NSHEbhf0bS/GoLv1jzMNH/nBm1xp7YoX
         EEiq8L4myR43XueaDMaJUn3yCdU61MxQB2h7oKZxkWDdTcnhYTO48j2zu/EKKzlLowiN
         qorWOP5uUbklZ0OryyFfkL4r8jpAtsWjoxnZ7aDOLW0KNpoFSbk5xInXAIuuopz+9X4C
         DFYH6hyAQyMLAJBOF36S8nMnsfLHHws1JKVlf11KIqfo5Tx2vpKqWvmgq2sT4DKTC4KZ
         u+7Vq2bKU/LaEPFmnValLICPMopjI1pDtsQW7qaLn1FhtT/CHHdBMnCrWuyhdZ4qiuyS
         avzg==
X-Gm-Message-State: AGi0PubicNcv45YdfnylaJ7PyNDRxCjW5/hi/UD0Z+zJ+Xf7/pcnQyBS
        q0r9NOw0x6tkM0DC3G79ylSIvS8CnMw=
X-Google-Smtp-Source: APiQypI+JLKnBNzx3vT/SrJu7AGoiJNMptA2tQDY3QvYF3NiPHoZnTNCYdr3+unc/KBmlGdCGN0IRA==
X-Received: by 2002:a17:902:9a8a:: with SMTP id w10mr1528326plp.218.1586466534558;
        Thu, 09 Apr 2020 14:08:54 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id e26sm13306pfi.84.2020.04.09.14.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 14:08:53 -0700 (PDT)
Date:   Thu, 9 Apr 2020 14:08:52 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Jeffrey Kardatzke <jkardatzke@google.com>,
        Atul Dhudase <adhudase@codeaurora.org>
Subject: Re: [PATCH] [PATCH] venus: core: remove CNOC voting while device
 suspend
Message-ID: <20200409210852.GU199755@google.com>
References: <1581940891-2376-1-git-send-email-mansur@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581940891-2376-1-git-send-email-mansur@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mansur,

do you still intend to land this patch? If so please re-spin it to address
Stanimir's feedback.

Thanks

Matthias

On Mon, Feb 17, 2020 at 05:31:31PM +0530, Mansur Alisha Shaik wrote:
> video driver is voting for CNOC during probe and not clear
> while device suspend. Because of which XO shutdown is
> happing(BCM42: VALID: 0x1 VOTE_X: 0x0000 VOTE_Y: 0x0004).
> 
> So, clearing CNOC voting while device suspend.
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index e7995cb..153effe 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -244,10 +244,6 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> -	if (ret)
> -		return ret;
> -
>  	ret = hfi_create(core, &venus_core_ops);
>  	if (ret)
>  		return ret;
> @@ -353,6 +349,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	ret = icc_set_bw(core->cpucfg_path, 0, 0);
> +	if (ret)
> +		return ret;
> +
>  	if (pm_ops->core_power)
>  		ret = pm_ops->core_power(dev, POWER_OFF);
>  
> @@ -371,6 +371,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  			return ret;
>  	}
>  
> +	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> +	if (ret)
> +		return ret;
> +
>  	return hfi_core_resume(core, false);
>  }
>  
