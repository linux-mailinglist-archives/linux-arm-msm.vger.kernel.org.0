Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C4E3A0742
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 00:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhFHWp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 18:45:26 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:44554 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhFHWpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 18:45:25 -0400
Received: by mail-qk1-f182.google.com with SMTP id c18so6834400qkc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 15:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CiEH93oHxFAht+7aZTEKeBrzaSNOlcRE/Xf1r7kSjCA=;
        b=Zc3jz63eFflFy1UVb/XgVYb2q+Oj0swYgmxeHSt/JLKGSZW34UgF8esnYCsF0IP7gx
         YU/1cY18LflhO7EBiqBq0arSQMC9DhTbJaVS19hKY/kQBbib2GHX6bxhfNHBDOMHwXIJ
         +Y02rE+pMr9WPHLdF5yKRUD8W0fLg+DtMssTOi9lc7D4ZF4//Tiwk+ikn8EwHo8ipJQ9
         flXVXYyyE3u00z2Q3B/dYxtT5GP95yXptfiMLCMO+BazRWJv06zJgbfv5owqO+PRtPsJ
         zRe1Pk3TospkQb4K6oZvpsclNPN3Jm7db+KKGFp3PYvPGCLRwFc4/E8NLMJcDNOvAfxL
         ZXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CiEH93oHxFAht+7aZTEKeBrzaSNOlcRE/Xf1r7kSjCA=;
        b=atSewrc5/TactUKLpmCUEvVD4lcKdFcL9fpFu9+O4FJvg1qTNIRZ5McdGoPEJ/kS/b
         0Btx2wf7KNWHzO6Z+7FJd7WxMGcjvGcLTiXT9D721ZwZzuuUGeNfnTHVoHXuhq565emC
         xHAnD7/4i5sikPtwjcshU+Cz1KDOWNcWTF5bubVp5qDQjL+NQWIA1pNFlRxwd+GopI3+
         9U4LkDqQI0KF8h7+ajYwf5NgxmRpQPcBf00jQyrjet/x8vMXg10a2N/+mppsP3Tyd+lo
         xWOsLBCbBsX7MhwuObjRQOgrrJLFl0Vi3cDp8Xzb90q51436TrWVgNoongNfN4HG8yBY
         Zv6g==
X-Gm-Message-State: AOAM531/JmHLbFLNXV5WcRsX3VmQJJNmTQuAw5VGndfkAoSCSh5ogfDD
        3/C7epLglgfZf+2SWzV5+XH8cA==
X-Google-Smtp-Source: ABdhPJyU+QIql5Y85Kiw+E7Je6AmK+VfYGY88+WbqGXNVf3BQkCaeLT4cnYJP9HeCybWB7I3sWEiVQ==
X-Received: by 2002:a37:a80e:: with SMTP id r14mr24381754qke.386.1623192138166;
        Tue, 08 Jun 2021 15:42:18 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id p3sm11444145qti.31.2021.06.08.15.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 15:42:17 -0700 (PDT)
Subject: Re: [PATCH -next] crypto: qce: skcipher: fix error return code in
 qce_skcipher_async_req_handle()
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210602113645.3038800-1-weiyongjun1@huawei.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <09514ef3-183f-db3d-7525-aefcb1275383@linaro.org>
Date:   Tue, 8 Jun 2021 18:42:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210602113645.3038800-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/2/21 7:36 AM, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 1339a7c3ba05 ("crypto: qce: skcipher: Fix incorrect sg count for dma transfers")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>

-- 
Warm Regards
Thara

> ---
>   drivers/crypto/qce/skcipher.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
> index 259418479227..8ff10928f581 100644
> --- a/drivers/crypto/qce/skcipher.c
> +++ b/drivers/crypto/qce/skcipher.c
> @@ -124,13 +124,17 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
>   	rctx->dst_sg = rctx->dst_tbl.sgl;
>   
>   	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
> -	if (dst_nents < 0)
> +	if (dst_nents < 0) {
> +		ret = dst_nents;
>   		goto error_free;
> +	}
>   
>   	if (diff_dst) {
>   		src_nents = dma_map_sg(qce->dev, req->src, rctx->src_nents, dir_src);
> -		if (src_nents < 0)
> +		if (src_nents < 0) {
> +			ret = src_nents;
>   			goto error_unmap_dst;
> +		}
>   		rctx->src_sg = req->src;
>   	} else {
>   		rctx->src_sg = rctx->dst_sg;
> 


