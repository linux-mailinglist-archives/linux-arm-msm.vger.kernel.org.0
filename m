Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37EA620A268
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 17:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389963AbgFYPwN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 11:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389473AbgFYPwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 11:52:12 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302A5C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 08:52:12 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id s28so4584184edw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KXqoAfwqJjFswhwLZp3+6buwkSwmtb+FpqbKTmlJZoY=;
        b=iBMYAQ01jjIK2rgc9mVr+Yly8ObD4pm58VppkGjO71MrklExKxdwSKwWFuP9YkSMax
         vMiKxZI9B0EFAul7JTwn8UhhRGSpfvKL0+dtbk9Pa5T00iX7tBM0ceq9B81xzAEHeecb
         /gFnqMvJAhk4K2nj3CwK4jafNNa61MnrqJqWOhDmlRn4SsNOXBvB0SXoWY9RDcShQ5sf
         c5dIltSFrsuKw2h0e6D3zXXaJCXnuMOjyjMyN3XUk/mv3CfpMlt8GYket32jOOJfj/Cd
         erYnaLeELb5vAMrWYGVD5+F1x+gfPoqYphOQEtLZtVtu8GtkaljRimp7G7gL9CmUYHxH
         Rteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KXqoAfwqJjFswhwLZp3+6buwkSwmtb+FpqbKTmlJZoY=;
        b=ljmS9Jb86qTFohwm4CBepqSbqK7ULJlocc8W9ZQ2kyMTBRjSDN6mlzn7ZJEoLLxrV8
         X0yeiaETYl2oKDpdkvzFnz7UFRRjywnBfPNNCiKL5eAhmmTnu1zWCB8w7tI2dVi5h2wn
         rzJjBLiJwgBslBKUm+xfGzSLnnrDf/BYrzcYHVALntz/LszkbQXjOjx5w8X3UP9dIvyV
         4QRAsuR2vZWJob+a/NIN4fVVsdx8cRsnVmZbQXwIP6ntysdrM4+FU4TFKBef7VBj7H04
         rX3vfR4Pv+CZDf8tC8N23wNnUKUP3rTaq8vlEMA+Kfjaw1tdRRS6QgYlwKczgV97bjcH
         tDLQ==
X-Gm-Message-State: AOAM533ig4o+RjsS8iTjz2+88rK1hhv+gvQ7N3NQYS95I/gsbHqRxLPf
        a03olY3cV2Te0AV1eGrAMgy93g==
X-Google-Smtp-Source: ABdhPJwbt395lRqEkrc239QutfG7/2q46qATHxzzPM6+/whTFZe8sqUtd5p2MOO4Rt2ysNAmZ0Gz7A==
X-Received: by 2002:a50:9a82:: with SMTP id p2mr23429201edb.130.1593100330935;
        Thu, 25 Jun 2020 08:52:10 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-60.ip.btc-net.bg. [212.5.158.60])
        by smtp.googlemail.com with ESMTPSA id e1sm4809370edn.16.2020.06.25.08.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 08:52:10 -0700 (PDT)
Subject: Re: [PATCH] [v2] media: venus: core: Fix runtime PM imbalance in
 venus_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200624063024.17059-1-dinghao.liu@zju.edu.cn>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <812ead80-766b-1dad-1447-ffab5d7d2ee8@linaro.org>
Date:   Thu, 25 Jun 2020 18:52:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624063024.17059-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dinghao,

On 6/24/20 9:30 AM, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced. For other error
> paths after this call, things are the same.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
> 
> Changelog:
> 
> v2: - Add pm_runtime_get_noresume() on failure of
>       pm_runtime_put_sync() to balance PM counter instead of
>       releasing everything here.

You are adding pm_runtime_get_noresume in pm_runtime_put_sync error path
but the patch description is referring to pm_runtime_get_sync. I'm confused.

> ---
>  drivers/media/platform/qcom/venus/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c6538044f..b0b932bf8c02 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -287,8 +287,10 @@ static int venus_probe(struct platform_device *pdev)
>  		goto err_core_deinit;
>  
>  	ret = pm_runtime_put_sync(dev);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_get_noresume(dev);
>  		goto err_dev_unregister;
> +	}
>  
>  	return 0;
>  
> @@ -299,6 +301,7 @@ static int venus_probe(struct platform_device *pdev)
>  err_venus_shutdown:
>  	venus_shutdown(core);
>  err_runtime_disable:
> +	pm_runtime_put_noidle(dev);
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_disable(dev);
>  	hfi_destroy(core);
> 

-- 
regards,
Stan
