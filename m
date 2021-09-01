Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360BF3FDDD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 16:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244961AbhIAOc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 10:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244957AbhIAOcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 10:32:25 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6304C061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 07:31:28 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id s10so6757936lfr.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Sep 2021 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MyzTGgHBdb4UXbVsskL7/lTl0nOigmvBb/mL1uEUdQ8=;
        b=NGX5lM7/edC/Mh61QE7Tgdd3R6sEK9TJbozyAAqaY2gn8zbhcE+FS/LHoTFj6gZWEe
         pujif+8SdYUF6XrNvhc9hKIpC7wpRIw5k95GQonbDsii7WAwhHyTGGrdeQuAq7djx9Dt
         +xR8NmF4/pR/9ye1U98Nidg8oB0KaMBCwOkr7Y3/CS5Y2nT4mAExI0jlswROY/QffCe/
         ywCxWlWMVHO6OExgU3hxfg2D7Cfd26+DefC9qd66MUjg8vwCUNSRORiCgarfbgx/SU6L
         7BdS9swL5awlXII1UeP2Qo9mvaNuo1Ksh1yGzOdy0+XW7hgWTN33TdJOugGAQx9OeEdx
         6Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MyzTGgHBdb4UXbVsskL7/lTl0nOigmvBb/mL1uEUdQ8=;
        b=tFjuGJh6eqeBBydo7tTXQICyBnF3sfJusgYXrZ8KJeqzvw4x6CgXZiKny3sGLvv1kG
         js+iskDPlx7om/OGBFfG4ULirXieYsonthQxKGCEV1R4Aq/883IGPa+KfoYoLOPthcXH
         B6Q/lP+nzaO1Ccd3LxXL4SZcLkqtDOslLq+t7uzzItnQIm8l8wW4yQWx9TxZN3z1ncin
         BUgJ3VYxncCG/X2jCbz5uzHZkexqD9xf1NsMIS/1Ww4Z0rDDnYjy3OkVE+W9Xc+BtanQ
         n3Wn8UUq9EzY0J1iIW/yCVQjoOf9nLGBwoub+YPI9MksYJY0HSlyi4jyIZcC9VH3g7xp
         UYIQ==
X-Gm-Message-State: AOAM530jlxvvImMfHzU+wB1HSqk9FwPS5MirGJGm1mRFaHfj84H8n5CU
        LLVupSFEcPo5UNKB39zt7+q4Xw==
X-Google-Smtp-Source: ABdhPJyeI12ATjCWraagvCx3dR1wv6RJ23LEPdkRkdUEYHeG1MSn8VJusN+OtImL97jjZ9kLLy9RUQ==
X-Received: by 2002:a05:6512:ac4:: with SMTP id n4mr18982410lfu.237.1630506687231;
        Wed, 01 Sep 2021 07:31:27 -0700 (PDT)
Received: from [192.168.43.7] ([94.25.229.122])
        by smtp.gmail.com with ESMTPSA id k8sm4194lja.57.2021.09.01.07.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 07:31:26 -0700 (PDT)
Subject: Re: [PATCH] interconnect: qcom: sdm660: Correct NOC_QOS_PRIORITY
 shift and mask
To:     Shawn Guo <shawn.guo@linaro.org>, Georgi Djakov <djakov@kernel.org>
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20210823075405.382-1-shawn.guo@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <813898c9-5ad6-a98b-35a6-58f24a7cada2@linaro.org>
Date:   Wed, 1 Sep 2021 17:31:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210823075405.382-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2021 10:54, Shawn Guo wrote:
> The NOC_QOS_PRIORITY shift and mask do not match what vendor kernel
> defines [1].  Correct them per vendor kernel.
> 
> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/soc/qcom/msm_bus/msm_bus_noc_adhoc.c?h=LA.UM.8.2.r1-04800-sdm660.0#n37
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/interconnect/qcom/sdm660.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
> index ac13046537e8..c89c991a80a0 100644
> --- a/drivers/interconnect/qcom/sdm660.c
> +++ b/drivers/interconnect/qcom/sdm660.c
> @@ -44,9 +44,10 @@
>   #define NOC_PERM_MODE_BYPASS		(1 << NOC_QOS_MODE_BYPASS)
>   
>   #define NOC_QOS_PRIORITYn_ADDR(n)	(0x8 + (n * 0x1000))
> -#define NOC_QOS_PRIORITY_MASK		0xf
> +#define NOC_QOS_PRIORITY_P1_MASK	0xc
> +#define NOC_QOS_PRIORITY_P0_MASK	0x3
>   #define NOC_QOS_PRIORITY_P1_SHIFT	0x2
> -#define NOC_QOS_PRIORITY_P0_SHIFT	0x3
> +#define NOC_QOS_PRIORITY_P0_SHIFT	0x0
>   
>   #define NOC_QOS_MODEn_ADDR(n)		(0xc + (n * 0x1000))
>   #define NOC_QOS_MODEn_MASK		0x3
> @@ -624,13 +625,13 @@ static int qcom_icc_noc_set_qos_priority(struct regmap *rmap,
>   	/* Must be updated one at a time, P1 first, P0 last */
>   	val = qos->areq_prio << NOC_QOS_PRIORITY_P1_SHIFT;
>   	rc = regmap_update_bits(rmap, NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
> -				NOC_QOS_PRIORITY_MASK, val);
> +				NOC_QOS_PRIORITY_P1_MASK, val);
>   	if (rc)
>   		return rc;
>   
>   	val = qos->prio_level << NOC_QOS_PRIORITY_P0_SHIFT;
>   	return regmap_update_bits(rmap, NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
> -				  NOC_QOS_PRIORITY_MASK, val);
> +				  NOC_QOS_PRIORITY_P0_MASK, val);
>   }
>   
>   static int qcom_icc_set_noc_qos(struct icc_node *src, u64 max_bw)
> 


-- 
With best wishes
Dmitry
