Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74F6387BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 17:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349980AbhERPIy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 11:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343795AbhERPI0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 11:08:26 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32D2C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 08:07:05 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id z3so10043478oib.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+lBDaMrVcXCmNsGsG2GHtvXuohiK3y1fAq9YmDvlMUI=;
        b=TfFm6XUl8usCh+YDjlrfsKSJsgSrVFG2r9LmR7R1O2boLhrRI/yzD+CcQ7RfAWEW9G
         7G+47UqXAauSsG+54SqM9HVYBdDYo/eaoP/L5ii3Q9P2D/x3jy+65MFG9CAcg+6f7ubV
         nkteko1WvbfFYxK5vzaBCi9lyvCoyzi1EpfJWTaqsXcNJMfq5msijgBvR0LginJIqtXY
         iIVWtcx+P3Zhkr7PNkHKEqIKbEWdR8qPJWTdwUdouIt3Wyi3RVmKZibaZzUK7VO1HbJw
         mDXXeol1aIdYxWhMn9tiOg/8P1P1NQQ+rt0K9VZvIp38iHFX9yIqi/CTxb1kk56P5Jum
         rxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+lBDaMrVcXCmNsGsG2GHtvXuohiK3y1fAq9YmDvlMUI=;
        b=tDFBBwNBs1eT0qUjFFKxhFc890Ci6Gmn3p6b876apeldUbz4COWmMb+mYTwNyRuVCV
         UiLRw51i7UP+RN5i1Lbc+yP2O03ga29URFCdfv1EVutY9eWm/zg5uOfeL4I9nWKava1e
         hpf5/oPWdy0QeV1iKuMadMJp9dg1kcyFEH6efQohJS2P6LUX6dVLyRDJBdlLAAo6tc1/
         0dFykUPUqVPDOJpX55IwjxuSk5HYoUIlFKrqDMOW2wRQ5h/5nUTFJ+yyzrusHHgPGC74
         Vj5aQGhBndiEGVO0HYfFEhjaTWekPFUezStpBr3/FIFphk5v+a6luBZctIG+g0zakg8T
         1akA==
X-Gm-Message-State: AOAM533yIk/nNY7JUHY/r6HePrfqw20izlGnwfcOAID4meepL7Z5DdpK
        oELlRRZHrormkUnbfdNBY7bJeA==
X-Google-Smtp-Source: ABdhPJze1PGjl6NkBbu38cuIam83kD4ddjg9LMGeI1tzvfuEQnG7R6F7031etdypFyPiWOgWhRxTpQ==
X-Received: by 2002:a05:6808:8ee:: with SMTP id d14mr3858352oic.18.1621350424989;
        Tue, 18 May 2021 08:07:04 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h20sm3451707oie.33.2021.05.18.08.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 08:07:04 -0700 (PDT)
Date:   Tue, 18 May 2021 10:07:02 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH v2 09/17] crypto: qce: core: Add support to initialize
 interconnect path
Message-ID: <20210518150702.GW2484@yoga>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
 <20210505213731.538612-10-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505213731.538612-10-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 May 16:37 CDT 2021, Bhupesh Sharma wrote:

> From: Thara Gopinath <thara.gopinath@linaro.org>
> 
> Crypto engine on certain Snapdragon processors like sm8150, sm8250, sm8350
> etc. requires interconnect path between the engine and memory to be
> explicitly enabled and bandwidth set prior to any operations. Add support
> in the qce core to enable the interconnect path appropriately.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: bhupesh.linux@gmail.com
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> [Make header file inclusion alphabetical]
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

This says that you prepared the patch, then Thara picked up the patch
and sorted the includes. But somehow you then sent the patch.

I.e. you name should be the last - unless you jointly wrote the path, in
which case you should also add a "Co-developed-by: Thara".

> ---
>  drivers/crypto/qce/core.c | 35 ++++++++++++++++++++++++++++-------
>  drivers/crypto/qce/core.h |  1 +
>  2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 80b75085c265..92a0ff1d357e 100644
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
> @@ -21,6 +22,8 @@
>  #define QCE_MAJOR_VERSION5	0x05
>  #define QCE_QUEUE_LENGTH	1
>  
> +#define QCE_DEFAULT_MEM_BANDWIDTH	393600

Do we know what this rate is?

> +
>  static const struct qce_algo_ops *qce_ops[] = {
>  #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
>  	&skcipher_ops,
> @@ -202,21 +205,35 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	qce->mem_path = of_icc_get(qce->dev, "memory");

Using devm_of_icc_get() would save you some changes to the error path.

> +	if (IS_ERR(qce->mem_path))
> +		return PTR_ERR(qce->mem_path);
> +
>  	qce->core = devm_clk_get(qce->dev, "core");
> -	if (IS_ERR(qce->core))
> -		return PTR_ERR(qce->core);
> +	if (IS_ERR(qce->core)) {
> +		ret = PTR_ERR(qce->core);
> +		goto err_mem_path_put;
> +	}
>  
>  	qce->iface = devm_clk_get(qce->dev, "iface");
> -	if (IS_ERR(qce->iface))
> -		return PTR_ERR(qce->iface);
> +	if (IS_ERR(qce->iface)) {
> +		ret = PTR_ERR(qce->iface);
> +		goto err_mem_path_put;
> +	}
>  
>  	qce->bus = devm_clk_get(qce->dev, "bus");
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
>  	ret = clk_prepare_enable(qce->core);
>  	if (ret)
> -		return ret;
> +		goto err_mem_path_disable;
>  
>  	ret = clk_prepare_enable(qce->iface);
>  	if (ret)
> @@ -256,6 +273,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(qce->iface);
>  err_clks_core:
>  	clk_disable_unprepare(qce->core);
> +err_mem_path_disable:
> +	icc_set_bw(qce->mem_path, 0, 0);

When you icc_put() (or devm_of_icc_get() does it for you) the path's
votes are implicitly set to 0, so you don't need to do this.

And as such, you don't need to change the error path at all.

Regards,
Bjorn

> +err_mem_path_put:
> +	icc_put(qce->mem_path);
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
> -- 
> 2.30.2
> 
