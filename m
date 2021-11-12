Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89FE44E4C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 11:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbhKLKns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 05:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbhKLKns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 05:43:48 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B0CC0613F5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 02:40:57 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id y26so21200237lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 02:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GVudPWh9z7/9ROvJAujFUKtqeFkQkz4OzzMVyQLCtzo=;
        b=xUrEE+nZx0rXepYvGqn+YobNymOSxkeoTkZFzIZcIRY1XtRebBWiwo9DX0IX0Ita4Y
         S+WvHtxvVvCNiI4ooVfpLXR4RzB6lntJkq0OLzPqQ3vUL+cuRvdxfxzJlff15RuMH52a
         lyc6j3uLAvXPdqqSJ5d1x8Pr+7Ma0v7LW+iYduCPI1kc9Z9hltWLqRrp+khTTwraCyQ6
         8Emr1JI1aweSBbtv9uY25ZbP6QvOcX3felkWlj/MUVzUT1kjsly4FX1zC59ekz9zpcgM
         64vjDMfXoXtsbV/EFsh8Q2iMCVyIjkTtQmvXBAubVXaRDYc7TiSgbjKRdE+DtKcUuDJ0
         Z72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GVudPWh9z7/9ROvJAujFUKtqeFkQkz4OzzMVyQLCtzo=;
        b=yg1MweJFEGqkqIaKRgD6FNgKtUb4Dqp+XqpzbivoKq/ff6qc8gZuvJaVmW/m9E3NPL
         OOgDk1693eFMMvcfP1IEMm7aQLuSytABgHauzNBeZDbnKpY24mZXLdw91G2/SdGNCL3g
         iSFtCkODpf+NFOYu29q5B4+z8IhiX/hhb4haB0Yt3z2mIWt0vsLXhMM6xpATIUVgOb+k
         x6Rb/Kd74PYasolkCYw3ru4uybAivRzEy73xQPgWyq1DA+9edOZjYVvIknIUgOiyUxCt
         uGR+aXcTLG49K1LFEi76EGZkr/rDaLLOH7wbmjhAa/XDtj6+Vteg3E7nkAEwk4+uDQVK
         r8rA==
X-Gm-Message-State: AOAM531RG0KHNw60WLg+j90bvhPZGoH9PfHLsgWnO+pjpbPRhbYkai5k
        JYJWeGEJmRscFLR06N6N37OFsg==
X-Google-Smtp-Source: ABdhPJxLSJRXW0zwXqew1B9iaPPb1ofazypqUEOYB4QnZRXOyXeXReJ0GxqHvlKd2s4rWc8YL8/Scg==
X-Received: by 2002:ac2:42c5:: with SMTP id n5mr13054211lfl.511.1636713655951;
        Fri, 12 Nov 2021 02:40:55 -0800 (PST)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id o15sm524819lfu.283.2021.11.12.02.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 02:40:55 -0800 (PST)
Subject: Re: [PATCH v5 14/22] crypto: qce: core: Add support to initialize
 interconnect path
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-15-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <54178c8f-b9f9-1e8a-9a09-0e3ccaf6d5da@linaro.org>
Date:   Fri, 12 Nov 2021 12:40:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211110105922.217895-15-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 11/10/21 12:59 PM, Bhupesh Sharma wrote:
> From: Thara Gopinath <thara.gopinath@linaro.org>
> 
> Crypto engine on certain Snapdragon processors like sm8150, sm8250, sm8350
> etc. requires interconnect path between the engine and memory to be
> explicitly enabled and bandwidth set prior to any operations. Add support
> in the qce core to enable the interconnect path appropriately.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> [Make header file inclusion alphabetical and use devm_of_icc_get()]
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

similar SoB swap is expected above.

> ---
>   drivers/crypto/qce/core.c | 34 +++++++++++++++++++++++++++-------
>   drivers/crypto/qce/core.h |  1 +
>   2 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index d3780be44a76..89d9c01ba009 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/clk.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/interconnect.h>
>   #include <linux/interrupt.h>
>   #include <linux/module.h>
>   #include <linux/mod_devicetable.h>
> @@ -22,6 +23,8 @@
>   #define QCE_MAJOR_VERSION5	0x05
>   #define QCE_QUEUE_LENGTH	1
>   
> +#define QCE_DEFAULT_MEM_BANDWIDTH	393600
> +
>   static const struct qce_algo_ops *qce_ops[] = {
>   #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
>   	&skcipher_ops,
> @@ -206,21 +209,35 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> +	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
> +	if (IS_ERR(qce->mem_path))
> +		return PTR_ERR(qce->mem_path);
> +
>   	qce->core = devm_clk_get(qce->dev, "core");
> -	if (IS_ERR(qce->core))
> -		return PTR_ERR(qce->core);
> +	if (IS_ERR(qce->core)) {
> +		ret = PTR_ERR(qce->core);
> +		goto err;
> +	}
>   
>   	qce->iface = devm_clk_get(qce->dev, "iface");
> -	if (IS_ERR(qce->iface))
> -		return PTR_ERR(qce->iface);
> +	if (IS_ERR(qce->iface)) {
> +		ret = PTR_ERR(qce->iface);
> +		goto err;
> +	}
>   
>   	qce->bus = devm_clk_get(qce->dev, "bus");
> -	if (IS_ERR(qce->bus))
> -		return PTR_ERR(qce->bus);
> +	if (IS_ERR(qce->bus)) {
> +		ret = PTR_ERR(qce->bus);
> +		goto err;

formally all these changes from 'return' to 'goto err' are not needed,
the necessity of such a transition will be required in a later change.

Please consider to move addition of 'err' goto label directly into
patch v5 18/22 -- since I still think that v17/22 is not needed...

> +	}
> +
> +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
> +	if (ret)
> +		goto err;
>   
>   	ret = clk_prepare_enable(qce->core);
>   	if (ret)
> -		return ret;
> +		goto err_mem_path_disable;
>   
>   	ret = clk_prepare_enable(qce->iface);
>   	if (ret)
> @@ -260,6 +277,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	clk_disable_unprepare(qce->iface);
>   err_clks_core:
>   	clk_disable_unprepare(qce->core);
> +err_mem_path_disable:
> +	icc_set_bw(qce->mem_path, 0, 0);
> +err:
>   	return ret;

See my comment above.

>   }
>   
> diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
> index 085774cdf641..228fcd69ec51 100644
> --- a/drivers/crypto/qce/core.h
> +++ b/drivers/crypto/qce/core.h
> @@ -35,6 +35,7 @@ struct qce_device {
>   	void __iomem *base;
>   	struct device *dev;
>   	struct clk *core, *iface, *bus;
> +	struct icc_path *mem_path;
>   	struct qce_dma_data dma;
>   	int burst_size;
>   	unsigned int pipe_pair_id;
> 

--
Best wishes,
Vladimir
