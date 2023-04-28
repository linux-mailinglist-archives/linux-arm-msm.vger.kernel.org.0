Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCC76F1C96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Apr 2023 18:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344447AbjD1Q3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 12:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjD1Q3j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 12:29:39 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051DA2D61
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 09:29:38 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f315735514so68225475e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682699376; x=1685291376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GlwYkULXBPy4OcdTr53UD+8dz+uvHO/2mc0S4p+P3I=;
        b=OqNrpR0KrU8mxcP4/MQWQl8UkwADPn2+wrbVkk96UxhhWitrk05uGWH2mKCRN+YfIE
         NAVeW8vXRCfykR5wkNxPSmAPVtbBX0gJeN3BU6ILBBf9kIGhBfMfPhsvvaIljn8F/VUz
         AG3bzpoqYB3fGRDKd5RHet9dyW1KfeegL9fF9PgWuyMR8u7RVMh5O5hpkyNAxKehWWMR
         3ZcsZIcMeu9pzwuHUsHnregEMNulqm6DMHqyS1gz8Trdm+edzvOO63WpGiC0onZpEFcK
         zYLJRFnGKlYZdeTVIKu4qFLgvFQs11UQuhL3MK3a5qurXnau9fyXf4/DBo2XdBwGuULr
         p2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682699376; x=1685291376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GlwYkULXBPy4OcdTr53UD+8dz+uvHO/2mc0S4p+P3I=;
        b=FBsrAlsHwQS1Eh10IWgfqfg9bR26uibHFMYZuMgQAbV2RmjdW3Nt2Zz06pQFWmWvwO
         iHCGmJDOlzYEKwkEBVax4A0OoHOekOGvpeqRp4u7sRzlyO9C8giHNG0vf7f3UE21x7bS
         /bJLeJoLg5DVpSbspmZ+WsVOoB+WZgPF662C40Koq9IumHeoMHZyQfhj68vwxEzhKfNY
         ooXm30cgzinM50IPzM5HGCYMYBb9vBKOPfh7jkZ9ek0kMo2ZZZI7k/6XAIiSa9ecFMka
         khnFdkKnmJb+uF+SZXCpi8bIa7TtvfZ72sMGmZ3sShbDWFcLKVnEFTbc9JEayNglS9Oi
         8Oxw==
X-Gm-Message-State: AC+VfDxO68ALxTDrWFVcOjFqL4pe6qwxn8WMsxVJfLGKhEqk0+bf1Hi9
        ox1WjhSXFCj0DBsteSw95ACIhDDam7rvp6ydED4=
X-Google-Smtp-Source: ACHHUZ7dEB1MfHEYZ34vE+ZyKHZF+NRR+d6I34/q3GHERKADwhW6hP/FPAgIUWj/3lV3Cwyx0Q9ykQ==
X-Received: by 2002:a05:600c:3103:b0:3f0:a095:7b9 with SMTP id g3-20020a05600c310300b003f0a09507b9mr8016575wmo.5.1682699376486;
        Fri, 28 Apr 2023 09:29:36 -0700 (PDT)
Received: from [192.168.125.234] (92.40.199.120.threembb.co.uk. [92.40.199.120])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c181000b003f046ad52efsm28067959wmp.31.2023.04.28.09.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 09:29:36 -0700 (PDT)
Message-ID: <4403b1fa-3bce-3f4f-183f-a8353df42dfd@linaro.org>
Date:   Fri, 28 Apr 2023 17:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH -next] bus: qcom: Use devm_platform_ioremap_resource()
To:     Yang Li <yang.lee@linux.alibaba.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230428065210.30095-1-yang.lee@linux.alibaba.com>
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230428065210.30095-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28/04/2023 07:52, Yang Li wrote:
> Convert platform_get_resource(),devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource(), as this is exactly what this
> function does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   drivers/bus/qcom-ebi2.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
> index c1fef1b4bd89..01e76bb05218 100644
> --- a/drivers/bus/qcom-ebi2.c
> +++ b/drivers/bus/qcom-ebi2.c
> @@ -294,7 +294,6 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
>   	struct device_node *np = pdev->dev.of_node;
>   	struct device_node *child;
>   	struct device *dev = &pdev->dev;
> -	struct resource *res;
>   	void __iomem *ebi2_base;
>   	void __iomem *ebi2_xmem;
>   	struct clk *ebi2xclk;
> @@ -325,15 +324,13 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
>   		goto err_disable_2x_clk;
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ebi2_base = devm_ioremap_resource(dev, res);
> +	ebi2_base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(ebi2_base)) {
>   		ret = PTR_ERR(ebi2_base);
>   		goto err_disable_clk;
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	ebi2_xmem = devm_ioremap_resource(dev, res);
> +	ebi2_xmem = devm_platform_ioremap_resource(pdev, 1);
>   	if (IS_ERR(ebi2_xmem)) {
>   		ret = PTR_ERR(ebi2_xmem);
>   		goto err_disable_clk;
