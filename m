Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9895B62BF12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbiKPNJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:09:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233533AbiKPNJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:09:29 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F43E21835
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:09:25 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b9so21771655ljr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WbWsVVvvla4ZyjvxuI958uCgMeUv+QgqXIjV0v5B5j8=;
        b=hlT+0awlk21JqAY0t7sdACERZ/Rh/3WbdNwQmbuJoz+9ZcWm/dYyLXunZTEx4z9qD0
         HaARc+hXgplE3+b64yWyOSKmlt4qLzpCVGG8R1b/hi+qS51ISsPLljWWr5ZjBGzdK2xG
         gBLoS3BFdjARCGCGVBZKqbN/nvALcjcVnE7dOXCe7TQylMyJMdaauJZL1C76hEloWObk
         yiPw6mgx8dOwsBSwB6nzBkjvhTW6G5nSYr776EGGwsYgctnSIh/jezuxBVg8Y3UrEZVp
         c0kcn0aK6eCi+ec5qzxwkCfcGwM16BXeN4H3lGq42niBH8oHs83j5LeKPPVPDOATJzaN
         2u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbWsVVvvla4ZyjvxuI958uCgMeUv+QgqXIjV0v5B5j8=;
        b=s30aaHoc0kDqOeIw6FPuJ1ybklHuc0P6VeXFAGaoGrRIEwUXVeAQSe3Jz9mi6Cktpu
         Gw2u2cXoF1aflktwwlXEYBvrvc9KN6lH5q7pIVX9K4Fx6IQW3IyjCTwKJM/i1dBGQGDe
         JKbXHFgvVx8f8afhPuAQWB0y0SX1ttFpAxMuzvHHPzGvxLkV8LJjL1H04BOe30FvdQzb
         73FH4+xR+TNuhfnHKDhGrDNKB8rtEQNqDhQ+H9fMh1Ern0AJNzEGnkxK53N44Vn4uHXT
         r7HlralNce3NteUK24YNpCp/GWbbbn4wzV9uXoG+m8wjl1esnaJ0eBfvByO+nBySlLjO
         29Gg==
X-Gm-Message-State: ANoB5plWDqlMiNHNuUMpvHwDdCsIbTaBMC6mNhHH5o/CDNLSTFF3rY1m
        kpoEl2MGvJj7Ht/JwOwUMpdPKQ==
X-Google-Smtp-Source: AA0mqf6dSXETAjpox56eXLxZovfOBRxk/X/cGShtHWKRxaNtWZBHRFLmuAmvWniTTBdFrnwmg7FMIA==
X-Received: by 2002:a2e:7314:0:b0:277:9c2:7c3e with SMTP id o20-20020a2e7314000000b0027709c27c3emr7230435ljc.99.1668604163626;
        Wed, 16 Nov 2022 05:09:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bp3-20020a056512158300b00494643db68fsm2590049lfb.81.2022.11.16.05.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:09:23 -0800 (PST)
Message-ID: <5dc315c8-fc59-3aab-88c8-b95b6d9d5267@linaro.org>
Date:   Wed, 16 Nov 2022 14:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] iommu: arm-smmu-impl: Add SM8550 qcom iommu
 implementation
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221116114001.2669003-1-abel.vesa@linaro.org>
 <20221116114001.2669003-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116114001.2669003-2-abel.vesa@linaro.org>
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

On 16/11/2022 12:40, Abel Vesa wrote:
> Add SM8550 qcom iommu implementation to the table of
> qcom_smmu_impl_of_match table which brings in iommu support for
> SM8550 SoC
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index b2708de25ea3..3a029f26642d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -439,6 +439,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ .compatible = "qcom,sm8250-smmu-500" },
>  	{ .compatible = "qcom,sm8350-smmu-500" },
>  	{ .compatible = "qcom,sm8450-smmu-500" },
> +	{ .compatible = "qcom,sm8550-smmu-500" },

This should be rebased on Dmitry's refactor.

Best regards,
Krzysztof

