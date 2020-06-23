Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BA1204E66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 11:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732056AbgFWJso (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 05:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731947AbgFWJsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 05:48:43 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC64C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 02:48:43 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id w6so9635765ejq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q4jVaWpguKb4wIDBu2aOCbZiTv7NHrn+B+ZyCfKbtz0=;
        b=eW+IWeXZh6UMpEKL9wHQ312VdhLJxp0auXZKSwzzfwKhNvgTQjkMOQM84C+eITDBnB
         TNXzueWsW1s0oQNlwj8cl20QTubYXABBJRgiUeTSdDaacV+i29hTXe1CZxU6lGnyWweG
         1arUrkw5rDyUrugqmA9FXmvdj8AZkAzXJNdjMPbJC2LPceI/9J8eohL2QbOo8X5O0IuM
         L4mShDmo0lmp1UDhwsXQWSKKVkVI5f1mM9xqFy1yMvlJq+YTe1lsMrgAmeycyOhboOTe
         Ekq43Q5q5e9w5tjiWo6VeOkBU4XeNvTlwO3rlI/eLfEaZ0rgLK8Z0AKhiFIN5xIm3Yct
         iI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q4jVaWpguKb4wIDBu2aOCbZiTv7NHrn+B+ZyCfKbtz0=;
        b=sXkZdfTCUYsbygjjMPZo38pkPCNJ6YEl0DTQZ0Ox/Xe5O0ZxPlUb3lJKOX1q+aYVFv
         ZCK5awcizjoCbzt7lH7aZlrtKGuuq+NaNKyFsoRSq2YRF+6lnZlkd3vsCPgxeRMp6ANM
         hIq/JpraB7J1dUdkmOEihONXJOhiYI2+cVbx26q/X8GIpv6HXgpjeLb3RXn18unKDw82
         ccvDNN+RUaJp4AlzHb1HGDyKFZezogwTzv2FoNCWl4FB+AmAkekkXQIgOAcodbCfM29w
         +//LxWMUcaeDlJTNvI5pMpN89ti0QHy5fisDzDRLQ4bOfmqZLAwN8KaKg9no3AXIwMTG
         jEeQ==
X-Gm-Message-State: AOAM533E/7adS+acc9fZ3jv9RaLhVT/n/WScySe+pUIGhFw9/WZdpG3V
        KUaZbnXaRslq9kJuV6n+lxebWQ==
X-Google-Smtp-Source: ABdhPJyuOibMlHoW5wRpraQXcfJd4ITJb+x/LHRNCMQZ7+wcZugXF/4czVK4tQ2WZe37YmpJEe2wuA==
X-Received: by 2002:a17:906:3483:: with SMTP id g3mr19113692ejb.373.1592905722243;
        Tue, 23 Jun 2020 02:48:42 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-249.ip.btc-net.bg. [212.5.158.249])
        by smtp.googlemail.com with ESMTPSA id s14sm5505620edq.36.2020.06.23.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 02:48:41 -0700 (PDT)
Subject: Re: [PATCH] media: venus: core: Fix runtime PM imbalance in
 venus_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200524052933.10529-1-dinghao.liu@zju.edu.cn>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <42a2a6cc-d873-1ec6-daaa-a4d5aebe619f@linaro.org>
Date:   Tue, 23 Jun 2020 12:48:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200524052933.10529-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dinghao,

Thanks for the patch!

On 5/24/20 8:29 AM, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced. For other error
> paths after this call, things are the same.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/qcom/venus/core.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 194b10b98767..37db3b594dca 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -289,18 +289,24 @@ static int venus_probe(struct platform_device *pdev)
>  		goto err_core_deinit;
>  
>  	ret = pm_runtime_put_sync(dev);
> -	if (ret)
> -		goto err_dev_unregister;
> +	if (ret) {
> +		v4l2_device_unregister(&core->v4l2_dev);
> +		hfi_core_deinit(core, false);
> +		venus_shutdown(core);
> +		pm_runtime_set_suspended(dev);
> +		pm_runtime_disable(dev);
> +		hfi_destroy(core);
> +		return ret;

Could you just reorder error labels below instead of releasing
everything here?

> +	}
>  
>  	return 0;
>  
> -err_dev_unregister:
> -	v4l2_device_unregister(&core->v4l2_dev);
>  err_core_deinit:
>  	hfi_core_deinit(core, false);
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
