Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7567542C9D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhJMTVj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhJMTVi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:21:38 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD06C061749
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 12:19:34 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x27so16184294lfa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+AcexaJ+rgtv/yakBs6TGaqPz081SnkKrIPwMz+w14Y=;
        b=CVHJY7EYtp00iSWw5aqa2NgaaWU8qEXJuk+OQqTkx8ySogOsyDa/Mwl3n9l8LV0wv8
         1y2axYXAT6/d7O5x4+rEj8O+k1GQhPfGyf2IvsoKq9oI98XiaSxMQjoX+5kiNUo/sNW9
         aqCO43VOqPx893RZDpJCMu88V02WWOf/pfj1Nv06acyFGGwOiYY/L5FkdEzwbMoySRIe
         /gGiSBKXxu9J23jVYc2bPUCOXiKRRIOYNKOJogOVfu3MTWH12O8WkzyADuBGsUMPZwLa
         qAd9MrIYBLHc34WM6dToGKxGVkiyiexW3EqTqaFoMO/7zkzlzs2r0QAM06BzT3JIxsqU
         znFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+AcexaJ+rgtv/yakBs6TGaqPz081SnkKrIPwMz+w14Y=;
        b=cU/R9OQzstHSlUXyPD9P9K+tOika0ivlcUuptF0cuRSO5eOxageh2dyJZA2EuZQap3
         q8KpHK2mx0KUQz9plZ87BVWy4uGlvDsZSFtTzUK2BQ+/E282Ggec7xriMgqnkj+Q5t7J
         XyFgXFbiWgp9cS+Lu44jpqCnHmmUFlupbt2S3lZI1pCVSNSo8BYHH74WTA6g3XcPQq2S
         h2BxTPWPnYcxiYZJWl5FyTx8sVdwMHkVsSVuO2XIPy6eEMu9H2IDrXUhBFhJa32ViaLb
         8sxy6sLRSXHq1i6kYcI1RB3uhF7B1pkhPYPHf2tlx/9Ryl/ZbC0/xPX95TVLGwaVWHtq
         c7mg==
X-Gm-Message-State: AOAM531Iop2n77v3I43VRjk0GRFy+iISTOkXwtD8La4K+/2mDRBFVf6m
        w+nkiOgq4I6WsMJn1Mz05l0gsg==
X-Google-Smtp-Source: ABdhPJy9CTZfpRRtRzPdMRIilVNtWA1m3Yh6dxpi0fTijyEEUd/0qb3zO42+Eif79BvrC+6Rk1wyKQ==
X-Received: by 2002:a05:651c:515:: with SMTP id o21mr1299427ljp.395.1634152773002;
        Wed, 13 Oct 2021 12:19:33 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id q14sm30500lfp.102.2021.10.13.12.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 12:19:32 -0700 (PDT)
Subject: Re: [PATCH v4 14/20] crypto: qce: core: Add support to initialize
 interconnect path
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-15-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <8f7eee67-7394-4938-7ace-f1dee397db2b@linaro.org>
Date:   Wed, 13 Oct 2021 22:19:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-15-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
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
> [Make header file inclusion alphabetical]
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>   drivers/crypto/qce/core.c | 35 ++++++++++++++++++++++++++++-------
>   drivers/crypto/qce/core.h |  1 +
>   2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index d3780be44a76..033c7278aa5d 100644
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
> +	qce->mem_path = of_icc_get(qce->dev, "memory");

Please consider to use devm_of_icc_get() here also.

> +	if (IS_ERR(qce->mem_path))
> +		return PTR_ERR(qce->mem_path);
> +
>   	qce->core = devm_clk_get(qce->dev, "core");
> -	if (IS_ERR(qce->core))
> -		return PTR_ERR(qce->core);
> +	if (IS_ERR(qce->core)) {
> +		ret = PTR_ERR(qce->core);
> +		goto err_mem_path_put;
> +	}
>   
>   	qce->iface = devm_clk_get(qce->dev, "iface");
> -	if (IS_ERR(qce->iface))
> -		return PTR_ERR(qce->iface);
> +	if (IS_ERR(qce->iface)) {
> +		ret = PTR_ERR(qce->iface);
> +		goto err_mem_path_put;
> +	}
>   
>   	qce->bus = devm_clk_get(qce->dev, "bus");
> -	if (IS_ERR(qce->bus))
> -		return PTR_ERR(qce->bus);
> +	if (IS_ERR(qce->bus)) {
> +		ret = PTR_ERR(qce->bus);
> +		goto err_mem_path_put;
> +	}
> +
> +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
> +	if (ret)
> +		goto err_mem_path_put;
>   
>   	ret = clk_prepare_enable(qce->core);
>   	if (ret)
> -		return ret;
> +		goto err_mem_path_disable;
>   
>   	ret = clk_prepare_enable(qce->iface);
>   	if (ret)
> @@ -260,6 +277,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	clk_disable_unprepare(qce->iface);
>   err_clks_core:
>   	clk_disable_unprepare(qce->core);
> +err_mem_path_disable:
> +	icc_set_bw(qce->mem_path, 0, 0);
> +err_mem_path_put:
> +	icc_put(qce->mem_path);
>   	return ret;
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
