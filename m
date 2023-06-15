Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0B07315A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 12:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237768AbjFOKoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 06:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234125AbjFOKoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 06:44:11 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948DE1FE4
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 03:44:10 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-307d58b3efbso5631719f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686825849; x=1689417849;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IoxQThv70ZvlSNBsWXuuYR7HwAqAcGVXH7L/19+7jfE=;
        b=QPrvKx9E6EDGWiSGzBLYkQ5EHqmaxkyw709RU63hEVRbo0huaFtlUQzKfXuspyxWDt
         YIBwCx97Vt9gB2KwsMYRaL/F+KzyMAiNs+ywvAw9+nK67eUBB1lmtd9CqMt4hVUKNbVb
         h4PkfOJ6Zs3DBLN/yYaac1S80W2Cd7++2xkr0y9AgNsyPEGrQAIWzXqJRq2Re4NVc4CK
         revinKPQxbIphOPmAbkldUqjLZxlEZ6ikGWn0+sOdKhSbAoH5Xxfc8eDwTIUgo+QSHX6
         HTK9w/tdLBpxwJ5WmoFPTFzfeWYgiLE2pf/GNHblNIbqeuCgJzL1hK4EHOkJSjdOXoVc
         PkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686825849; x=1689417849;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoxQThv70ZvlSNBsWXuuYR7HwAqAcGVXH7L/19+7jfE=;
        b=HYNPHqLPc50a2t5Ks3ie+2JSjsojYA8flni3lEg5H/pxaz25vUk9WsZgXOFo6mtUZm
         2lGylw6wzsINO3mjjXMsPFlPM0xofWRcKJod29uJlURGxz8+5lwX+3qGMy2fsymo7ufT
         Y8pjGS7qSUGUBO/NXYKRwoHLU7iACRWzR/PP0QZD/cRCl6i5LzojqlHZy6okHkfOZ4UB
         B7hVnSbbgWqWzWYImOBzEbZfjV8rRBuXKeveYj+Pxv2sSmbNFwVbohTNiOfAXoDWKiQp
         K0HLz54vCqmkpjFH1z8HYpHrn3AqWPaFYOYXGNQwe3Vi6HkatE1eDrEhqc4UAho3lHNq
         KGxw==
X-Gm-Message-State: AC+VfDznIhsRpug5WO6G/akDcbA3ThnObNx0SzjbxmBTvZUTdrkA6wyU
        2F+VikW6nahnVs9Q/xBD10rZqg==
X-Google-Smtp-Source: ACHHUZ4kHCqQIeo4tRWR53xzL/JhFOyxaqYbFqchZgUhjTM/pxl2fvRZiZbvwnIr1c1aZZyONONk5w==
X-Received: by 2002:a5d:664d:0:b0:311:ac3:909f with SMTP id f13-20020a5d664d000000b003110ac3909fmr2922714wrw.56.1686825849041;
        Thu, 15 Jun 2023 03:44:09 -0700 (PDT)
Received: from [192.168.0.94] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d6311000000b0030fae360f14sm15281381wru.68.2023.06.15.03.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 03:44:08 -0700 (PDT)
Message-ID: <c3f59fb4-4dd8-f27a-d3f5-b1870006a75c@linaro.org>
Date:   Thu, 15 Jun 2023 11:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] remoteproc: qcom: Handle reserved-memory
 allocation issues
Content-Language: en-GB, en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230529-rproc-of-rmem-v2-0-95e39b959585@gerhold.net>
 <20230529-rproc-of-rmem-v2-1-95e39b959585@gerhold.net>
From:   Caleb Connolly <caleb.connolly@linaro.org>
Organization: Linaro
In-Reply-To: <20230529-rproc-of-rmem-v2-1-95e39b959585@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/14/23 17:31, Stephan Gerhold wrote:
> If Linux fails to allocate the dynamic reserved memory specified in the
> device tree, the size of the reserved_mem will be 0. Add a check for
> this to avoid using an invalid reservation.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Other uses of of_reserved_mem_lookup() also have unchecked uses of rmem 
[1], or check different things [2].

Does it make sense to put this check in the function itself?

I can't think of any obvious scenarios where it makes sense to 
differentiate between rmem being NULL vs having a size of zero at the 
time where a driver is fetching it.

As Bjorn described in the rmtfs patch, the memory allocation is 
essentially ignored, wouldn't it be better to print an error and 
invalidate the rmem in [3]?

[1]: 
https://elixir.bootlin.com/linux/v6.4-rc6/source/drivers/net/ethernet/mediatek/mtk_wed.c#L818
[2]: 
https://elixir.bootlin.com/linux/v6.4-rc6/source/drivers/remoteproc/rcar_rproc.c#L71
[3]: 
https://elixir.bootlin.com/linux/v6.4-rc6/source/drivers/of/of_reserved_mem.c#L276

// Caleb (they/them)
> ---
> New patch in v2, I wasn't aware of this until Bjorn posted a similar
> patch for rmtfs:
> https://lore.kernel.org/linux-arm-msm/20230530233643.4044823-4-quic_bjorande@quicinc.com/
> ---
>   drivers/remoteproc/qcom_q6v5_mss.c  | 2 +-
>   drivers/remoteproc/qcom_q6v5_wcss.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 70bffc9f33f6..a35ab6e860f3 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1932,7 +1932,7 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>   		return 0;
>   
>   	rmem = of_reserved_mem_lookup(node);
> -	if (!rmem) {
> +	if (!rmem || !rmem->size) {
>   		dev_err(qproc->dev, "unable to resolve metadata region\n");
>   		return -EINVAL;
>   	}
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index b437044aa126..9edab9d60c21 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -882,7 +882,7 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
>   		rmem = of_reserved_mem_lookup(node);
>   	of_node_put(node);
>   
> -	if (!rmem) {
> +	if (!rmem || !rmem->size) {
>   		dev_err(dev, "unable to acquire memory-region\n");
>   		return -EINVAL;
>   	}
> 
