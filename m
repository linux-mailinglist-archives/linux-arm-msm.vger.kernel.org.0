Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44D7378EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 15:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233874AbhEJNbA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 09:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242495AbhEJNYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 09:24:49 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9018C06138D
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 06:22:07 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id n22so11827362qtk.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GpFk/RkXBcsoO0wjPghj5V+HTZlbdeYCbg4hpqoR7F4=;
        b=Pil67YhbGH4k848YkpNUI7ff0wbhTu1avhC0npp39qUZd2aH6/Hvak9xaun3//Q1zI
         rppyLJC0n4yY6mid/0pUg/Ev7siK6oJEz/9AVk0n2YULFE292TUXNS30Jb0m7Rj012nu
         EvU404mZI+HFp2LeysmtuzV/IpDEKMgRdd5r0i7/hufWJQ7p+TK0CYiqcqFL3rYAZSrE
         V8h+B21x8mR+LKElImsMTmTa4vV3G1y7HzbpIBnt1QLnGNZEf6pLkq2pqlqZ/R9GHmwI
         QAqom9R8gbz1hMkIk6z8zIBfBW6oDhVVSNNlSHhIF0YdGUYi49sH+7ExsYxJUQJ7rUQS
         9CWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GpFk/RkXBcsoO0wjPghj5V+HTZlbdeYCbg4hpqoR7F4=;
        b=NBWfqUHp2M0UorqwThDJl0QQrPU+9MAfCASpqt9TJZVsv10FtFxcje1a15DK+Jxzua
         J02GSbzq5sFJ4XWxkNiddYQ5w9CFNJcsXEPk7J7LpPespO4ydZ2YMm8gXDXvdUk8l07u
         vxvvePpXcF35wm2UJQxQeVK4h7acxG+WGc/U0hom+wnFBBF+OhOMjh7PiNkO9MBnUTLM
         Klwz8F2mRJTG94Thw+Lh25+EfMdHUYboA3CmBbfBcDaTvsiTc60NUYogvWL/1djeuLzj
         +EZpTddLitiP45Pd6Bvof0ZHeT17hfyK/l7MjxkK1xNxIfubHjW4zE25wTzyoJcmsjZg
         1Q2g==
X-Gm-Message-State: AOAM531q2KKIryCR9zv4TjmVBbFs45XO2AcDRg/BRC8XPDjY3w47JIBq
        CNF/5Jk4W8s+L1Zf8VPuUJwufg==
X-Google-Smtp-Source: ABdhPJzfMtCtpMrBDgKuhauvsJ3pKVof7af9u5XGO1kS0J1bHHqd/zgau+HJQUh5MDDV6kHs27Ag4w==
X-Received: by 2002:a05:622a:2c9:: with SMTP id a9mr7875046qtx.38.1620652926969;
        Mon, 10 May 2021 06:22:06 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id m16sm11298430qkm.100.2021.05.10.06.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 06:22:06 -0700 (PDT)
Subject: Re: [PATCH v2 15/17] crypto: qce: Defer probing if BAM dma is not yet
 initialized
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
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
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
 <20210505213731.538612-16-bhupesh.sharma@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <7d8bc623-ef12-c7ae-0d12-16b0b1c48ffe@linaro.org>
Date:   Mon, 10 May 2021 09:22:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210505213731.538612-16-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/5/21 5:37 PM, Bhupesh Sharma wrote:
> Since the Qualcomm qce crypto driver needs the BAM dma driver to be
> setup first (to allow crypto operations), it makes sense to defer
> the qce crypto driver probing in case the BAM dma driver is not yet
> probed.
> 
> This fixes the qce probe failure issues when both qce and BMA dma
> are compiled as static part of the kernel.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
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
> ---
>   drivers/crypto/qce/core.c  | 4 ++++
>   drivers/dma/qcom/bam_dma.c | 7 +++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 9a7d7ef94687..3e742e9911fa 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -15,6 +15,7 @@
>   #include <linux/types.h>
>   #include <crypto/algapi.h>
>   #include <crypto/internal/hash.h>
> +#include <soc/qcom/bam_dma.h>
>   
>   #include "core.h"
>   #include "cipher.h"
> @@ -201,6 +202,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   			of_match_device(qce_crypto_of_match, &pdev->dev);
>   	int ret;
>   
> +	/* qce driver requires BAM dma driver to be setup first */
> +	if (!bam_is_probed())
> +		return -EPROBE_DEFER;

Hi Bhupesh,

You don't need this here. qce_dma_request returns -EPROBE_DEFER if the 
dma controller is not probed yet.

-- 
Warm Regards
Thara
>   
>   	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
>   	if (!qce)
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 2bc3b7c7ee5a..c854fcc82dbf 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -935,6 +935,12 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
>   	INIT_LIST_HEAD(&bchan->desc_list);
>   }
>   
> +bool bam_is_probed(void)
> +{
> +	return bam_probed;
> +}
> +EXPORT_SYMBOL_GPL(bam_is_probed);
> +
>   static const struct of_device_id bam_of_match[] = {
>   	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
>   	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
> @@ -1084,6 +1090,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_unregister_dma;
>   
> +	bam_probed = true;
>   	if (!bdev->bamclk) {
>   		pm_runtime_disable(&pdev->dev);
>   		return 0;
> 

