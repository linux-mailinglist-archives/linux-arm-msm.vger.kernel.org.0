Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26CC4276E1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 05:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhJIDT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 23:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244025AbhJIDT6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 23:19:58 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902F4C061755
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 20:18:02 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id o83so8782502oif.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 20:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gNhGn3g6n3gMQ9G8iAXR+9nLlZJH5jA/zH8qZm9egMc=;
        b=iCi28xaiB3OafSfaNp7alys1F5aNoCP30I6BjnNumSWzOkv8sp42L9ZX82RVYeo83r
         K8ZvzOOq+mbOqYsddydS4fgQa0leKQkQ8Kncm9GdHsj4tSpH9Uvv7na2CIZzVRV8rVq3
         vwPz6+XavkNyhGkRAV5GqSff0TaYliCQPwEGbmLDxcxK7HNEU2ZVWcfyRWKJU3wB9N3D
         LrIc1ZQEjD3qKyFJUBufBJM2YF8FeQ5prVCFbvVU1zQJDu2xBNTXkJTUFV74JVpeYHUn
         kvi6oWv0JN9Ra/EfymqI3dk7URuP8pKWK8ZGKJCiN5JPM8XXm1WYjHekkV3O6dArYsUb
         5svQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gNhGn3g6n3gMQ9G8iAXR+9nLlZJH5jA/zH8qZm9egMc=;
        b=F3rEJ1Pq7UH5I9Po0waTO8s24iYmq3VXHuPqv/AihX0LjqlX7tvFr1AYKD+CICDxNA
         nadb9hJjQY4y1z8hwVtmGH5sfcGSA3LtOaAiYqlce6bnJEMMehhLo0mv+ScLvinG33cU
         ARlfdJ9Sf9MyGlPn+RlDB4ypsZhk4BlRLxxs7tlq9oPsAPSGU0Kk2IiFWV5W24WYc5z9
         /CAZOQcByEqMHr5aqBOq2qhQD/Ag893/2KzK5wOKv61ebpz0qF+1xQzxV2Tu/wEwBDUd
         S15QLQPOZhn2sfQnSRoSONfqFAvDRai1lzXBas7T7jCl3/ac0UONAjwkNkYDe1mVa0v5
         Y1Xw==
X-Gm-Message-State: AOAM531r84CUrEDsj/GMvqOu5D/+ZfXkKG+UZo7Hvc7GYcFZUhyOaFeI
        eamrQ7SD65E2t2395k4aBnGnBA==
X-Google-Smtp-Source: ABdhPJxXstOhM+ddFjQvsSVaa9sRFDTKCu6vJRb14e80L1q0CTMDfiRQz1hcZ6oQVzW9ZpwVdnZKAA==
X-Received: by 2002:aca:bb07:: with SMTP id l7mr18547596oif.83.1633749481737;
        Fri, 08 Oct 2021 20:18:01 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id z15sm232341oot.45.2021.10.08.20.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 20:18:01 -0700 (PDT)
Date:   Fri, 8 Oct 2021 22:17:59 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org, ohad@wizery.com,
        mathieu.poirier@linaro.org
Subject: Re: [PATCH -next] remoteproc: qcom_wcnss: Add missing of_node_put()
 in qcom_iris_probe()
Message-ID: <YWEJ5yKDTdliWS+I@builder.lan>
References: <20210911081347.33929-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911081347.33929-1-cuibixuan@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 11 Sep 03:13 CDT 2021, Bixuan Cui wrote:

> Add missing of_node_put() in qcom_iris_probe() before return.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/remoteproc/qcom_wcnss_iris.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
> index 09720ddddc85..f77ab49a9cae 100644
> --- a/drivers/remoteproc/qcom_wcnss_iris.c
> +++ b/drivers/remoteproc/qcom_wcnss_iris.c
> @@ -140,6 +140,7 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
>  	ret = device_add(&iris->dev);
>  	if (ret) {
>  		put_device(&iris->dev);
> +		of_node_put(of_node);

We store "of_node" in iris->dev, so put_device() will invoke
qcom_iris_release() which of_node_put(iris->dev.of_node);

So I think this is a false alarm, but please correct me if I'm wrong.

Thanks,
Bjorn

>  		return ERR_PTR(ret);
>  	}
>  
> @@ -192,10 +193,12 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
>  
>  	*use_48mhz_xo = data->use_48mhz_xo;
>  
> +	of_node_put(of_node);
>  	return iris;
>  
>  err_device_del:
>  	device_del(&iris->dev);
> +	of_node_put(of_node);
>  
>  	return ERR_PTR(ret);
>  }
> -- 
> 2.17.1
> 
