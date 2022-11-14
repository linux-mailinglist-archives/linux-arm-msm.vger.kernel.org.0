Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D015627B58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 12:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236449AbiKNLBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 06:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236428AbiKNLBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 06:01:14 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5062E1E73D
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 03:01:13 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id b9so12658141ljr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 03:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z0K2PDFt9eg+OLvMvtV5tszL+A3jKSFv8/ermJSvM6I=;
        b=SKWEe4rvqLJRNVtWqBQfk1NKhxFf8kIc3YODoMj0UljFyOSVi7j17YCxNArprTIjx/
         JHJPUcYXwHqp2Tzsv2RTQ4hIwFt5VATCnE6Lb1riuALSsV1lul/31mqB9GEGgFYNYcwH
         /CYxP1zvZJlRtl4um28l6Lx5S7u+Bs8Askx+rKZke1tDpMisnZBpbuYYyShhfy4oJSwR
         qU+h/Ql/ef0xUuTKpv5DroMWWNiZqmyFA4Bl2vnR+aStS6sXCA6HGIZZK+E73/+aS16O
         WEGTNFxqcEX8PE6tHEFlyGmq8rwIly88mU+Z7QF/bN3gndPq9QXawan9IJ1V14XLQqjB
         vzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0K2PDFt9eg+OLvMvtV5tszL+A3jKSFv8/ermJSvM6I=;
        b=vTmH/bE8xTFtQzg1uuDdl9OYThE/YYXquV/U9Zm05grSEN1CbbaXxFks0Tf/ItZdxM
         Mk4Bv5Uq6k08ICi6gp2vhSCSi4pTChFLFzmV57iTB1/vWXzpNcUvUA8jCqrzl39LMGsq
         pifeWilFkCp91MXtPNMonTqE3mHaZc2gj49pzawiNHI1zycoxkwIhX/4f+Xz+OcWd0kr
         /fR+9uKOdugpJ9aBtrhc+0sTSv9/WWO7pYksG5YoQNGjjPZwo3ZNO6fTVxpKTrbc5CJf
         nHrH9rdi038v6zphAENd8lW4YnTZLhRgRwyGwA+dJKT20n0S9gIZyu9xGoTfKb1u4ynK
         Fd+w==
X-Gm-Message-State: ANoB5pmMP/9tsG3gw7RLim9qY4jOuMDxaYekdW68u+H5wdyXaDHdpFWY
        AYs7BFw6ORTkCDgtmRahM5Khaw==
X-Google-Smtp-Source: AA0mqf5ycgoBx4Z8VaCrIUY0xVHbM2bYVeNsPBV0K1lSLmoZB6Fpf2cQQT5MxKBnrnZby9GLMJXJpQ==
X-Received: by 2002:a05:651c:194f:b0:278:eef5:8d19 with SMTP id bs15-20020a05651c194f00b00278eef58d19mr2834105ljb.429.1668423671598;
        Mon, 14 Nov 2022 03:01:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p5-20020a2ea405000000b00278e9c0d3a2sm1753511ljn.33.2022.11.14.03.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 03:01:11 -0800 (PST)
Message-ID: <6fa8e3ea-2113-d930-96bc-3726d53e5bcd@linaro.org>
Date:   Mon, 14 Nov 2022 12:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/9] dt-bindings: arm-smmu: Allow up to 3 power-domains
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221114104222.36329-1-konrad.dybcio@linaro.org>
 <20221114104222.36329-2-konrad.dybcio@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114104222.36329-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/11/2022 11:42, Konrad Dybcio wrote:
> Some SMMUs require that a vote is held on as much as 3 separate PDs
> (hello Qualcomm). Allow it in bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes since v1:
> - Add minItems
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 9066e6df1ba1..82bc696de662 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -159,7 +159,8 @@ properties:
>            through the TCU's programming interface.
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 0

It cannot be 0.

minItems: 1

Anyway you still need to restrict it per variant, as I said in previous
version.

Best regards,
Krzysztof

