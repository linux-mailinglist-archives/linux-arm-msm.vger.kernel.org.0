Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61756687F78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbjBBOBS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjBBOBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:01:17 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB25E43447
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 06:01:15 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id t18so1815810wro.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 06:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GR8KgSL36Lkyc27jhe9VelRangL80momgo8oQ8ZkJ3E=;
        b=PbfB2SCfdyo87K53ROkt1vXqLqNSCVF3uzv0x98v0Jezk1m5kgz4qiJzhkqFP5iEdc
         wgDU7Wab/UGF2LM91NjKXvkNFau7YeVo+dW88/zx6IPUULOTLblnRIHX1KwnIYkegLm5
         EmXtfY0LaAxTFEXZwegvisGONRnE7XjQXhGncrc5m2i9dlwxcIGdVg4uq1e5nBQFpP36
         /NUlZusWUV55NMN5Hob6/I/+UrQdkWH8dAsAMaDwU3pFDSnCGxJqLOr5alUPVEr/D7+B
         lIwOfTZ00y9lx0OWHuXmk13p3lOe6iD6+fggffj6w+CBASBEW1wBgbuGsSPf5M25kYf3
         2/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GR8KgSL36Lkyc27jhe9VelRangL80momgo8oQ8ZkJ3E=;
        b=7AJyGCNZc+MPe//OpTOT9WACyTJShlgrfW7pFQkHKspe2vjcCgJQVk0Ry9OGdEqcD8
         db12mbM4DeyHQ6Mw4+PhVcTqFfjaPDqFBAycBgm26CAuUslyTz5uzfbfKU5lNXmdCnGY
         Yfs0Ydbl0/XBevETE3njbj0lG1IOaRwbBdVxgljKdPMkuxu18+4pOCKBTNMZwTfK+qeZ
         eINL6atSBfV/qIv7+CmosENzmjrfDtIqnAvkJqRg3ekSpfhxzJljBn85F7KJYtBeuBBm
         7PO3TX2rOcJoHTFEfRkoyovon/x1+X3CAot379I5dteOh+LvRtrbbopdlWJ8EiYh5Nub
         bYkw==
X-Gm-Message-State: AO0yUKUwyB6wD08eJOmwLEWEvYd1FtnTscuOzbk0MmCQ1To62u4jyZ0/
        GvPE51kpImr0rR7JyEqCVM82mg==
X-Google-Smtp-Source: AK7set9/JLUR+StvC64CszQqDkQBR15P3RrIfhgfe8877fqoj5oa4e40mUa3+jZywiWu8SKojqmURA==
X-Received: by 2002:a5d:6203:0:b0:2bf:ed6c:2344 with SMTP id y3-20020a5d6203000000b002bfed6c2344mr5722157wru.9.1675346474323;
        Thu, 02 Feb 2023 06:01:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w10-20020adfcd0a000000b002bff7caa1c2sm9024426wrm.0.2023.02.02.06.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:01:13 -0800 (PST)
Message-ID: <6577abf2-7717-b952-13d7-9143200f24fc@linaro.org>
Date:   Thu, 2 Feb 2023 15:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 9/9] crypto: qce: core: Add new compatibles for qce
 crypto driver
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jordan Crouse <jorcrous@amazon.com>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-10-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202135036.2635376-10-vladimir.zapolskiy@linaro.org>
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

On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> Since we decided to use soc specific compatibles for describing
> the qce crypto IP nodes in the device-trees, adapt the driver
> now to handle the same.
> 
> Keep the old deprecated compatible strings still in the driver,
> to ensure backward compatibility.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: herbert@gondor.apana.org.au
> Tested-by: Jordan Crouse <jorcrous@amazon.com>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> [vladimir: added more SoC specfic compatibles]
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/crypto/qce/core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 8e496fb2d5e2..2420a5ff44d1 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -291,8 +291,20 @@ static int qce_crypto_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id qce_crypto_of_match[] = {
> +	/* Following two entries are deprecated (kept only for backward compatibility) */
>  	{ .compatible = "qcom,crypto-v5.1", },
>  	{ .compatible = "qcom,crypto-v5.4", },
> +	/* Add compatible strings as per updated dt-bindings, here: */
> +	{ .compatible = "qcom,ipq4019-qce", },
> +	{ .compatible = "qcom,ipq6018-qce", },
> +	{ .compatible = "qcom,ipq8074-qce", },
> +	{ .compatible = "qcom,msm8996-qce", },
> +	{ .compatible = "qcom,sdm845-qce", },
> +	{ .compatible = "qcom,sm8150-qce", },
> +	{ .compatible = "qcom,sm8250-qce", },
> +	{ .compatible = "qcom,sm8350-qce", },
> +	{ .compatible = "qcom,sm8450-qce", },
> +	{ .compatible = "qcom,sm8550-qce", },
I did not agree with this at v7 and I still do not agree. We already did
some effort to clean this pattern in other drivers, so to make it clear
- driver does not need 10 compatibles because they are the same. And
before anyone responds that we need SoC-specific compatibles, yes, we
need them, its is obvious, but in the bindings. Not in the driver.

Please go with SoC compatible fallback, as many times encouraged by Rob.
Worst case go with generic fallback compatible.

Best regards,
Krzysztof

