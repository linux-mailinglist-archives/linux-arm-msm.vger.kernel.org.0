Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20ED69FA2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 18:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbjBVR3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 12:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjBVR3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 12:29:13 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8563212A0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:29:11 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b13so9588249ljf.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45x/yCivxi0bY+KeFqvEfjQJdJggSQUDL2JTnHKXlWE=;
        b=TId2kjgPqyrYhTb7hjUC3UIncHucbPPI+vmYFujidho4wZJ+TMyeHrTtV39wRZ6jPJ
         zqbdHhAFPS5B6Z2FkoCwQmtdg3lzNZHnT/BspWttEFeME0L+693slIjxz5Shok8IrmmQ
         5YzLXqIVRQB7jNtpmcby49IpxS2+J3/Jx+NuROMu9iW3yh/7bk829VGQE6GjzkJPXHQ0
         1YAOO4uFKIttIQgK32yJkwajkjkm2y4v2qdDkCeuSJ19MEgPJis37/tsOxbezWcuTBaL
         O/latFjsQmkrqvgisJSLCcbLMMhKiuEiZhUQxspMv+K9MOc6Xv3Ekzz8eHJeAPn6wpO+
         D7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45x/yCivxi0bY+KeFqvEfjQJdJggSQUDL2JTnHKXlWE=;
        b=pYsZB4dFhgFfVrRSmq9MVBlw73n0RuHQDmGpHuXJQlmr5QaZSjMaTbP0uCf5XUux5f
         H6QAbHP/qrG4C21uUvi7du68Lrzt4lI+GkLDqxLjqG504zJ/x2zrB9ylb71QW9/nQvlW
         b1Q4iCMHvyYqWAoVrm04vgH6AQU0VC12y7FchV7LnmZ5zng3n305pwrclrbg63O1fbP4
         B6RVXbSw819Hzz+ZHscTG89q2QCatZQkhqA5OhfWulVIjvGJNTzhPwsaNHeWSeHzDcdi
         umn7YQUg89FtjccUh+7TZ0yi4qD6ezZ297nTzS2yIsingxOJmk8lRkWviY0nFxaZz7rL
         efkA==
X-Gm-Message-State: AO0yUKVhEQk1XefrLJlvCBD7Owr+vOmtZFo236hNW8wt7A7Ix8qnjrxi
        tuwEmpcqyIXAQyMxdNNhjXc4mQ==
X-Google-Smtp-Source: AK7set/yRvoRFXWjEDei4ZujEE7oxX9Phpezq0Nt/e7wp2JqvJ1PH+gvaT5pTrVY5Xb0djUlFXJu4g==
X-Received: by 2002:a2e:8e7c:0:b0:294:6977:7b34 with SMTP id t28-20020a2e8e7c000000b0029469777b34mr2884429ljk.50.1677086949987;
        Wed, 22 Feb 2023 09:29:09 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id v15-20020a056512048f00b004d61af6771dsm352682lfq.41.2023.02.22.09.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 09:29:09 -0800 (PST)
Message-ID: <15ad12b3-60b1-85f0-d022-a463879458c4@linaro.org>
Date:   Wed, 22 Feb 2023 18:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 08/10] crypto: qce: core: Add support to initialize
 interconnect path
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Jordan Crouse <jorcrous@amazon.com>
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
 <20230222172240.3235972-9-vladimir.zapolskiy@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230222172240.3235972-9-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.02.2023 18:22, Vladimir Zapolskiy wrote:
> From: Thara Gopinath <thara.gopinath@gmail.com>
> 
> Crypto engine on certain Snapdragon processors like sm8150, sm8250, sm8350
> etc. requires interconnect path between the engine and memory to be
> explicitly enabled and bandwidth set prior to any operations. Add support
> in the qce core to enable the interconnect path appropriately.
> 
> Tested-by: Jordan Crouse <jorcrous@amazon.com>
> Signed-off-by: Thara Gopinath <thara.gopinath@gmail.com>
> [Bhupesh: Make header file inclusion alphabetical and use devm_of_icc_get()]
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> [vladimir: moved icc bandwidth setup closer to its acquisition]
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/crypto/qce/core.c | 16 +++++++++++++++-
>  drivers/crypto/qce/core.h |  1 +
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 74deca4f96e0..0654b94cfb95 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/interconnect.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> @@ -22,6 +23,8 @@
>  #define QCE_MAJOR_VERSION5	0x05
>  #define QCE_QUEUE_LENGTH	1
>  
> +#define QCE_DEFAULT_MEM_BANDWIDTH	393600
> +
>  static const struct qce_algo_ops *qce_ops[] = {
>  #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
>  	&skcipher_ops,
> @@ -218,10 +221,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	if (IS_ERR(qce->bus))
>  		return PTR_ERR(qce->bus);
>  
> -	ret = clk_prepare_enable(qce->core);
> +	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
> +	if (IS_ERR(qce->mem_path))
> +		return PTR_ERR(qce->mem_path);
> +
> +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
>  	if (ret)
>  		return ret;
>  
> +	ret = clk_prepare_enable(qce->core);
> +	if (ret)
> +		goto err_mem_path_disable;
> +
>  	ret = clk_prepare_enable(qce->iface);
>  	if (ret)
>  		goto err_clks_core;
> @@ -260,6 +271,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(qce->iface);
>  err_clks_core:
>  	clk_disable_unprepare(qce->core);
> +err_mem_path_disable:
> +	icc_set_bw(qce->mem_path, 0, 0);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
> index 085774cdf641..228fcd69ec51 100644
> --- a/drivers/crypto/qce/core.h
> +++ b/drivers/crypto/qce/core.h
> @@ -35,6 +35,7 @@ struct qce_device {
>  	void __iomem *base;
>  	struct device *dev;
>  	struct clk *core, *iface, *bus;
> +	struct icc_path *mem_path;
>  	struct qce_dma_data dma;
>  	int burst_size;
>  	unsigned int pipe_pair_id;
