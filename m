Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF786CD49C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 10:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjC2IbY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 04:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjC2IbX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 04:31:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C540D423F
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 01:31:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g17so19137202lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680078680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rkqB/pSe/Uf7R42daYkgCUwin72MjNO+JZK0n3K2tQ=;
        b=mK8OljvcAlXLRlURsbzrz8VLrh3qBax49hDLf23vpE/ew2aRk8mDd5l61Y+0vdZzC7
         a3Tvq3BTHwdduf7flFbMdePnsOzr6iACGE6x6vZi72ZeaOygZ58nDSYsNbIgsif6vsBA
         EgNtUmaJWp5zgQaoifJadboHZB0cTxPMnlSR6ugO7N7ICPPn5ZJqFx+ec2ml9dLRaM44
         FYUg5e7ZjdgYbviArSUQbM8dT4KjAHOhbmaMZibdXcer7ok6zvn1vWD7eSeObPlCGrYl
         LtI0pFu8cgB87X2DRgFh7c+pldh0D0uY5nZfWD3ySf54kt/2EY0Xxg1pdSTyNbtMzbPn
         b1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rkqB/pSe/Uf7R42daYkgCUwin72MjNO+JZK0n3K2tQ=;
        b=3+xaAHKMn3kqPDzAwo1oKYZjGU3TX8Wk+HK+RkclpYrNPSq+LxdTLynYJx8SpA3v7o
         Nh9ii7U+RGapjxmWvmOCdxn22+F4cGZuc6RAVk4LDovBqzyFJ8wKbd801S3R6wgOrOo/
         x4JsHKm8H3r2BgJcZJLRCFfe5cBgxRy11R1R9EFmpTha2BGhbFKr0/l2YZJNpwTGkWST
         pAqiuHO3kRQy9fEsL5tiOpbZVH7p7QULbrqeMNcjWe+hE6Il/FtoPcB6Pqdhlsr3HcdJ
         UlwyKWp9Spad1xKQ30DA0q9S/5CffEjkjbB+2sxPHhRBCGp1kuUlLGL0x481sMLa7O+V
         2tuQ==
X-Gm-Message-State: AAQBX9fRV80bsC7aOKKIvAk8letN5iEVjP7dA4of2kOXGVO6GP7ADDOd
        8C1Su/TdhaaGi4A461e8gUCmUQ==
X-Google-Smtp-Source: AKy350aLnZoE3VH5F+C9qZoroickOae9EztGyVhx2T4moZpvdDOO2NmhS3zjPSDiQb1l+vkSWljpNA==
X-Received: by 2002:ac2:5966:0:b0:4e9:d85d:9032 with SMTP id h6-20020ac25966000000b004e9d85d9032mr5581749lfp.54.1680078679782;
        Wed, 29 Mar 2023 01:31:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x6-20020a2e7c06000000b002a5f91380e2sm1030479ljc.84.2023.03.29.01.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:31:19 -0700 (PDT)
Message-ID: <14688a5c-c50a-4876-e7b7-565b106b431a@linaro.org>
Date:   Wed, 29 Mar 2023 10:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/7] dt-bindings: iommu: arm,smmu: enable clocks for
 sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20230328193632.226095-1-brgl@bgdev.pl>
 <20230328193632.226095-5-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328193632.226095-5-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/03/2023 21:36, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The KGSL iommu will require the clocks property to be set. Enable it for
> sa8775p in the bindings.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 807cb511fe18..74d5164ed1e8 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -375,7 +375,6 @@ allOf:
>                - nvidia,smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qdu1000-smmu-500
> -              - qcom,sa8775p-smmu-500

Then you need to describe them, like other variants are doing.

Best regards,
Krzysztof

