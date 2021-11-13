Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F17D44F4A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 19:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235921AbhKMSzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 13:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235824AbhKMSzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 13:55:19 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9480C061766
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 10:52:26 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id bk14so25069900oib.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 10:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W7Ouma8tSTgUiYpXqnMuyuBo4P9VtTuXsFIf+PTLBNc=;
        b=oG6Aa9SNLnSMxzQz0Habx+WxoZG/qwhJ8XlFCQaBVfl/n2etPoqctiZrRwEdD3dj/a
         f9aBvZ+aEGOnMF5vUSfkYLmlwwp/hvwrqL6wWKYnd68x2QP1/E4ndU+YTnDp5f39bBXS
         3HvYrnbUDKTRTJHzGf9qmPJx6buzyV4xctjA9SWsZKUGiBu6M1Bqb8xdmF9CIqiYsQ7T
         vent+yJz8IHHZEcwX2XzQ/4Ix494ylKcgERqC07ycYPCZuEq5RN+KffVgssqk3UbY3iP
         8ExnMsum33XMQuktKkcLY0RyhctHa3eB3b2p8caljViURIwUMSb9RiYmph4IOcY86DES
         4AOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W7Ouma8tSTgUiYpXqnMuyuBo4P9VtTuXsFIf+PTLBNc=;
        b=k6In30MA428sz7NCyoSCruptLzJPhtAVjf3wLDF+4CzNA8WfF5pCkJl1yBIgNSaA3K
         a1rEwgNO2M7H2ugqCIaxSKsny+R1N8jrALpNHasMC2rCAPlSlzYOr3nbbCKwbxfe764K
         HhhYiUZpvkuGequwxaSt+LkoJd+rvWGx78Qiva35D7mxIraFnrNQQmT0WMbmfqVq+cD4
         /5AZ504FUCFPHtjDZnfihfo9Mt0ArgJBVVvGW3g3PzgdyjCcpaE1mEbmVlClUkiWQaq2
         kjZMFrhP2I6Myn86ziWRoZXs/nBTMJv6cqSfw6RPqY6p4uTTngYPiw/8KlLEgGjgvXRf
         +XIg==
X-Gm-Message-State: AOAM531V7q/n4GEIsVJ9Xdhk10Jr9Cy++XqSkIwT+aSidQrjYu9qPRhN
        BkX+yZA4vueTp4e1aLOgDNFLIA==
X-Google-Smtp-Source: ABdhPJz88Y9L1zbmFdODuCspmlMlWygSKADbROocByTQOPQKNwdTDRyf+yAa3UQvQy5pUdUJemhaow==
X-Received: by 2002:a05:6808:220f:: with SMTP id bd15mr29976335oib.12.1636829546261;
        Sat, 13 Nov 2021 10:52:26 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f7sm1712272ooo.38.2021.11.13.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 10:52:25 -0800 (PST)
Date:   Sat, 13 Nov 2021 12:52:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] cpufreq: qcom-hw: Fix probable nested interrupt
 handling
Message-ID: <YZAJZYNHyCUp2hKR@builder.lan>
References: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
 <20211111154808.2024808-3-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111154808.2024808-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Nov 09:48 CST 2021, Vladimir Zapolskiy wrote:

> Re-enabling an interrupt from its own interrupt handler may cause
> an interrupt storm, if there is a pending interrupt and because its
> handling is disabled due to already done entrance into the handler
> above in the stack.
> 
> Also, apparently it is improper to lock a mutex in an interrupt contex.

There shouldn't be, given that it's a threaded irq...

As a fix for the immediate problem, the change looks good. But I wonder
if we want to make sure the thermal pressure is updated in the irq
handler still? Perhaps it's not worth the resulting complexity of the
implementation...


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> 
> Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 3b5835336658..5d55217caa8b 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -343,9 +343,9 @@ static irqreturn_t qcom_lmh_dcvs_handle_irq(int irq, void *data)
>  
>  	/* Disable interrupt and enable polling */
>  	disable_irq_nosync(c_data->throttle_irq);
> -	qcom_lmh_dcvs_notify(c_data);
> +	schedule_delayed_work(&c_data->throttle_work, 0);
>  
> -	return 0;
> +	return IRQ_HANDLED;
>  }
>  
>  static const struct qcom_cpufreq_soc_data qcom_soc_data = {
> -- 
> 2.32.0
> 
