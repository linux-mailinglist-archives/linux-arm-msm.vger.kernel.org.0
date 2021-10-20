Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6F5434D29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 16:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhJTOND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 10:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhJTONB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 10:13:01 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE32C061753
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 07:10:46 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id y11so3062951qtn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A+7/tYuokduAraYDaM/MNqe/qPgiHwjLTlChysTQILI=;
        b=Fd6AaurLzQDPJogWpED/+njhBQ3CRKq0XqHJwDRFZWQ6++ZyhNIOta2z/xbkRQWN73
         Dt/hkKIQHIsJIZlgJaOzu6TtOwOphlh4L0nL0a5Rjkj71JRtxOzu2MgCELlSWZia5B4G
         ZY/dv+KrrG/F4NX21qGOVdjQBY6LhhwK/4gfO/geSIG0dpF4HSanqLU3H+NEoqCe8z5K
         iGi/bVr+7ikhfTxSVXfaYkH0N3v6AZn8ODXM2R9A1hdySqkTflzY5xIHG7zSc6wQhXuc
         JiKJPtF9GbXSBhYis/cLGOHAasts6knNp+ZGoFjrZgBtG0W8ZIUveGsZ320+8GkiU53u
         xFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A+7/tYuokduAraYDaM/MNqe/qPgiHwjLTlChysTQILI=;
        b=d0r363nbRA7FrNeO/ccpeApifg8tiOND350X2ODqphC4XN99Y4V1mx0njanDDNLX/r
         7MtLq7RA2dSSE1/Kcb0myosOXkEe0iAcrllFFBt7KxbFvmktkHukGOCzv4eb8xuq5yND
         ez62PeiGZKzyYjGUKEAHrtQF/SnD5rrME7TFWlb6T4b+lBsuP1mCOu4xhk1LL/+XaCvW
         OCpoqVKmqs5tPhrJo5YdFLZGdhMB9GDJjrb0J4eAJm31+VN9jhj38876tioSy2+vtnsT
         tQPVa1GQo412vSUQgZap2sKtfqtzEwSB8rJS6SW3ENaBPWGC5u7tcRcw13O1lxm1LHhr
         6Usw==
X-Gm-Message-State: AOAM533fYVrbDaYW5raLYbo//6BpgKP95TW8x0E8SZp7qJjgThMJK5FE
        KoqY6DRZqRcXcAr0dXoYAG/zmA==
X-Google-Smtp-Source: ABdhPJx7I22ooxQS73u+v3KsAR5e7TFQY8Rkzqi72g9Uw/1EzI7OgcXfSVXv9rzTTxjKU8fevvIqNQ==
X-Received: by 2002:ac8:5903:: with SMTP id 3mr195093qty.74.1634739040791;
        Wed, 20 Oct 2021 07:10:40 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id m16sm1119634qkn.15.2021.10.20.07.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 07:10:40 -0700 (PDT)
Subject: Re: [PATCH v4 18/20] crypto: qce: Defer probing if BAM dma channel is
 not yet initialized
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-19-bhupesh.sharma@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <c6df4da4-3d50-5592-1036-b9a8cebb79d9@linaro.org>
Date:   Wed, 20 Oct 2021 10:10:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-19-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/21 6:55 AM, Bhupesh Sharma wrote:
> Since the Qualcomm qce crypto driver needs the BAM dma driver to be
> setup first (to allow crypto operations), it makes sense to defer
> the qce crypto driver probing in case the BAM dma driver is not yet
> probed.
> 
> Move the code leg requesting dma channels earlier in the
> probe() flow. This fixes the qce probe failure issues when both qce
> and BMA dma are compiled as static part of the kernel.

Hi Bhupesh,

I am quite curious to know the nature of probe failure you are seeing 
with the current sequence.  I am not against changing the sequence but 
for me when a driver is enabled, it is clocks first, interconnect next 
and then dma. Also I have tested the current sequence on sm8150 with 
both the modules built in as static and I have not seen the failure.

-- 
Warm Regards
Thara (She/Her/Hers)
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


