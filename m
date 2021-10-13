Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E196542CBFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 22:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhJMUwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 16:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhJMUvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 16:51:41 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20450C061773
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 13:49:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so17496153lfu.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CQSzhxJdMMlkiP+vJlHdXSz2dxXmj0z6XpvWvx+79CI=;
        b=ly/twV2Ipv2Pynj1RbhppkQLB994l1s1z9XDRiWNBq6z77ItLNzN7Yd7jK3TC7n0ae
         fNntZJTcP31hK1KhNiPetQaq6RMuF0/OL0hozVivSxHXsHROXFccLQ9m4P3HBhBgNajB
         BpBLV1nVsED5s3ADcoWn6fmH23Oa3s/1LHCikLf5bI14xPoT0h19h+YbWimN5VYyjU5D
         kavi8WEla6n8oxOXvTrI9bY5F2EqiWUSPYl1uNTrIeNGbD9zmqCGoNsEm6aVL/9/gTu8
         omEv5BHb4QM5EuUTp0YxLXK2DfA3uWKEQUe5Iu3BP0CNRClzx/mKRAWrqXgOH+yT8lFS
         vcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CQSzhxJdMMlkiP+vJlHdXSz2dxXmj0z6XpvWvx+79CI=;
        b=ikYftUA7PbUc6GBu0bvf6WA/rgKK7dWs1nf8Q6DwqIvUgB1M1WvEZMRJ+xh62DbtrK
         npTREC8w7QnzyDS0fegh1m/DuEYarOSUNdD7vIqS58Br6dHPmvicivnrNVAaJ70ebLEa
         21b7PCR0+LReAzGC/jcPfTJf7h88ioqT2JkMH2Obe03z5q0sZs4cgf8QZeLlhbv6t4qu
         aZQ0FkELqNMSPv3LaBQcrfd6Una5Lhq2ubWVtf81eO7LW3j1Q3yrVCWmzBkYKoGKBl+B
         HERKsVfGgBAUAM1z8mKRfcsI6d+TXbc6jAA1MWtHWSXYVML9xGOqFrvH5pCa+qI0IDGS
         MMFw==
X-Gm-Message-State: AOAM532bKS4Pf+1M+d0LLN5tD9dSBHClx88jTE524iNjxKxmEIUeYcME
        Gnfn2jNYzQ/Vgw8/4/yEaUZSYA==
X-Google-Smtp-Source: ABdhPJy8nc4bwneUkjO24IdJ0xvl/U67WQrHK8RJvVdm0N1n1ZNhfIwm2+qr4zIzzA1KXlfQEwu7bA==
X-Received: by 2002:a2e:a26c:: with SMTP id k12mr1708496ljm.23.1634158172519;
        Wed, 13 Oct 2021 13:49:32 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id m4sm59808ljq.4.2021.10.13.13.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 13:49:32 -0700 (PDT)
Subject: Re: [PATCH v4 18/20] crypto: qce: Defer probing if BAM dma channel is
 not yet initialized
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-19-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <74893e20-3dd8-9b57-69bb-025264f51186@linaro.org>
Date:   Wed, 13 Oct 2021 23:49:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-19-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> Since the Qualcomm qce crypto driver needs the BAM dma driver to be
> setup first (to allow crypto operations), it makes sense to defer
> the qce crypto driver probing in case the BAM dma driver is not yet
> probed.
> 
> Move the code leg requesting dma channels earlier in the
> probe() flow. This fixes the qce probe failure issues when both qce
> and BMA dma are compiled as static part of the kernel.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   drivers/crypto/qce/core.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index cb8c77709e1e..c6f686126fc9 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -209,9 +209,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> +	/* qce driver requires BAM dma driver to be setup first.

I believe a multi-line block of comments should be started with '/*' line,
for reference please take a look at Documentation/process/coding-style.rst

> +	 * In case the dma channel are not set yet, this check
> +	 * helps use to return -EPROBE_DEFER earlier.
> +	 */
> +	ret = qce_dma_request(qce->dev, &qce->dma);
> +	if (ret)
> +		return ret;
> +
>   	qce->mem_path = of_icc_get(qce->dev, "memory");
> -	if (IS_ERR(qce->mem_path))
> +	if (IS_ERR(qce->mem_path)) {
> +		qce_dma_release(&qce->dma);
>   		return PTR_ERR(qce->mem_path);
> +	}
>   
>   	qce->core = devm_clk_get_optional(qce->dev, "core");
>   	if (IS_ERR(qce->core)) {
> @@ -247,10 +257,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_clks_iface;
>   
> -	ret = qce_dma_request(qce->dev, &qce->dma);
> -	if (ret)
> -		goto err_clks;
> -
>   	ret = qce_check_version(qce);
>   	if (ret)
>   		goto err_clks;
> @@ -265,12 +271,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   
>   	ret = qce_register_algs(qce);
>   	if (ret)
> -		goto err_dma;
> +		goto err_clks;
>   
>   	return 0;
>   
> -err_dma:
> -	qce_dma_release(&qce->dma);
>   err_clks:
>   	clk_disable_unprepare(qce->bus);
>   err_clks_iface:
> 

--
Best wishes,
Vladimir
