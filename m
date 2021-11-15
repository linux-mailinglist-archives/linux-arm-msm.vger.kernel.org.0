Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C110451529
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 21:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349683AbhKOU0R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 15:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344156AbhKOTXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 14:23:43 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A00C088892
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 10:29:16 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso29012069otj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 10:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S9JEaZ5BtOcabxLBRmUDBJQLkGUlrZ/MG6Txwkmqf+A=;
        b=OH/FizDobI3SZFXSTIcVA9637tP/HH/F9batz8Ro1DAOOjpp2sFrJuifRI/VVQxTXb
         acxkVRT6OBIam++W6Sgbi2uJhd+G+3f02qS40zWaDEFdnlONAGDyfaldyJ058Ln5GW45
         owLkEyombYcqMXBaX5OvYVwfSIKxcEZDsOUwZKH6UCodpnHraNXAgP2iEXUt2kZzJCY8
         KNXoWyEk4NLsoqwvuVQBLneAwdv8UdN/5y3qe+K72MXkIHY2BCAQadzLdLnW/GAbLoSC
         zoJwnhsS/MH7SsiS62bNPCrYTWSgoLKNiRzcnss2rwcTqDlYO6yZnT03S16dS9+0GgE5
         iahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S9JEaZ5BtOcabxLBRmUDBJQLkGUlrZ/MG6Txwkmqf+A=;
        b=muKsg7xCipo3jgkP2tGZa+MPICr6n/gk+pHHmd68NwlQDZWU9eKnb9yThhMNpU4TBO
         lQ+hLIx0koKhuJvFGA8JT2WjJNYnZimaAB6kDih7TubVzpVcM+CDf7Wp6Is4O3v0IeBi
         lB7rkHfeJmxhbzSS3Qj6gzcjPc2gg3NDRzrxwhA92SrAPWqIJrSt2a5n/3MV897UrOtC
         NJ39/8p/t6GYvvngFdzhNHT9ESLIV+mgtv7ER//MZr1DI6I5Dc8L6X1A1zidale9xT9w
         fgmp//YrlDqwjYLe2gkUQyIO0ZtM7RDltq525W9kKSdLC3PTsy/0LgYIm67QZoxdKOoA
         dIgg==
X-Gm-Message-State: AOAM531K9hPW/DZpcQTN8kmByFPrAbouBYQ8CzO8g4x17STc3QTsj6Fp
        GYEQk95uFz2hT96NKpCho76rtw==
X-Google-Smtp-Source: ABdhPJzXeGCcvSUHpRXfTznQBZg4X5ODF42zxT6tS11Jpzc1IWXFQKeX1uGVjWLEvA/NZCY9kYYmUg==
X-Received: by 2002:a9d:6394:: with SMTP id w20mr907316otk.248.1637000955996;
        Mon, 15 Nov 2021 10:29:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u13sm2713672oop.28.2021.11.15.10.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 10:29:15 -0800 (PST)
Date:   Mon, 15 Nov 2021 12:29:10 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH v5 18/22] crypto: qce: Defer probing if BAM dma channel
 is not yet initialized
Message-ID: <YZKm9gU4fPMbc291@builder.lan>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-19-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110105922.217895-19-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Nov 04:59 CST 2021, Bhupesh Sharma wrote:

> Since the Qualcomm qce crypto driver needs the BAM dma driver to be
> setup first (to allow crypto operations), it makes sense to defer
> the qce crypto driver probing in case the BAM dma driver is not yet
> probed.
> 

To me this sentence implies that qce_crypto_probe() doesn't return
-EPROBE_DEFER from qce_dma_request(), but looking at the code I don't
see why this would be...

> Move the code leg requesting dma channels earlier in the
> probe() flow. This fixes the qce probe failure issues when both qce
> and BMA dma are compiled as static part of the kernel.
> 

As far as I can tell the only actual difference is that you're moving
the qce_dma_request() above the icc_set_bw() call and the three
clk_prepare_enable() calls.

This is a very valid optimization, but where does qce_crypto_probe()
fail and why does it need the BAM driver to have probed before we try to
turn on the clocks and (our) interconnect vote?

> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  drivers/crypto/qce/core.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 7c90401a2ef1..84ed9e253d5d 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -209,9 +209,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	/* qce driver requires BAM dma driver to be setup first.
> +	 * In case the dma channel are not set yet, this check
> +	 * helps use to return -EPROBE_DEFER earlier.
> +	 */

This comment warrants the change, but I don't see that it will add value
in the code once the patch is merged. Please drop it.

> +	ret = qce_dma_request(qce->dev, &qce->dma);
> +	if (ret)

I presume this is where your added dev_err() in err: comes in handy. I
definitely think this warrants an error print; so return dev_err_probe()
here would be the right thing to do (in the previous patch).

> +		return ret;
> +
>  	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
> -	if (IS_ERR(qce->mem_path))
> -		return PTR_ERR(qce->mem_path);

But I see no reason for moving it above devm_of_icc_get() and the
devm_clk_get*() calls - as they don't actually do anything, but moving
qce_dma_request() above them forces the introduction of goto here.

Regards,
Bjorn

> +	if (IS_ERR(qce->mem_path)) {
> +		ret = PTR_ERR(qce->mem_path);
> +		goto err;
> +	}
>  
>  	qce->core = devm_clk_get_optional(qce->dev, "core");
>  	if (IS_ERR(qce->core)) {
> @@ -247,10 +257,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_clks_iface;
>  
> -	ret = qce_dma_request(qce->dev, &qce->dma);
> -	if (ret)
> -		goto err_clks;
> -
>  	ret = qce_check_version(qce);
>  	if (ret)
>  		goto err_clks;
> @@ -265,12 +271,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  
>  	ret = qce_register_algs(qce);
>  	if (ret)
> -		goto err_dma;
> +		goto err_clks;
>  
>  	return 0;
>  
> -err_dma:
> -	qce_dma_release(&qce->dma);
>  err_clks:
>  	clk_disable_unprepare(qce->bus);
>  err_clks_iface:
> @@ -280,6 +284,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  err_mem_path_disable:
>  	icc_set_bw(qce->mem_path, 0, 0);
>  err:
> +	qce_dma_release(&qce->dma);
>  	dev_err(dev, "%s failed : %d\n", __func__, ret);
>  	return ret;
>  }
> -- 
> 2.31.1
> 
