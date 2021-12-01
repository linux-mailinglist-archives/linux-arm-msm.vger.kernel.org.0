Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC9A464DAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 13:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242668AbhLAMOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 07:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244299AbhLAMOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 07:14:10 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8370BC0613FD
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 04:10:46 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 207so47632268ljf.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 04:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W0kJqyc37bbbHViV4LcHXw2CKa8FmCmhGKxmED2s2So=;
        b=Gz4woK5qr89jZnNUbBzcuc4OBBIlQlajz9n0JOB+7qcmDsbz2IPy77u22ioWewcu66
         jTY1b9ePZcLJUJQaXPChclUHPMcEUze543NNmKGjnZ1n+O93O6UGBJ1l1MtusAt2RAuF
         Ge+x/9WgvRMettMLrV3VyHIr2f6zw/YmAQDJ4spX4RpCv44GHWJC2ems7NnTtJUPVC2J
         d/usnpa1KlTGk4Sf9EOzsv35z1ZFHmwY8d214lFM+LtV7EkwZ1lAI/MAHaWzmeWVfQTL
         8uTRYySxoEqwn2D6rrzHODPcayrhM5P8QFwO94jRxSol5tD2Sh5BjJN93+bLTSxoQdbX
         r0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W0kJqyc37bbbHViV4LcHXw2CKa8FmCmhGKxmED2s2So=;
        b=iOVoPzdb4vJDeeTNnWHDXGl4QdlLi9wdwW8QCzes9Oi9yGHR4B1ukx8MatYAHaqXwB
         owGpWgVQuaZVG5/3kZUS4KaxAZmB/YTcqU0ARxgZ7g0tD7jinFVfU3JzZHVnMO54hLEN
         nRbvk7miJoYZAUkbjGOxY4aau0j1zLtbTBWo3ebbya4pcjLOWZY5YE0TcDylXHOpbqEs
         +IgcpVK9c5yO8Eq3QZdIaqXqnCki0CwhL7kPMcGlyr1ncHyzqNO2aKiL5QUFlKMv9Tme
         hySwlxFgBw0/FJ4DG9UJxlVkB/LD82YK+kLkPDtvvu0J5yEgB3oRo8Q40+jKda7Klliz
         zMgA==
X-Gm-Message-State: AOAM533oM65ZRv0CFqkoGbkwTra1DteRkMzXLbNpUWgilEBWbLf49qno
        AYO546pX24YRUwzt2WtkiTEgUg==
X-Google-Smtp-Source: ABdhPJyEF2qyDbLNDxQhbZ+6mREN6XM1DNbXus3stsaBmnyvAW/BQzFn0OsHD1jEXT6eWF/8qPCQyg==
X-Received: by 2002:a2e:bc24:: with SMTP id b36mr5387099ljf.54.1638360644835;
        Wed, 01 Dec 2021 04:10:44 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a7sm2090907lfr.204.2021.12.01.04.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 04:10:44 -0800 (PST)
Subject: Re: [PATCH 2/2] iommu: arm-smmu-impl: Add SM8450 qcom iommu
 implementation
To:     Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211201073943.3969549-1-vkoul@kernel.org>
 <20211201073943.3969549-3-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <eaf8f0f2-2c12-f01d-36b8-165859a5487a@linaro.org>
Date:   Wed, 1 Dec 2021 15:10:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211201073943.3969549-3-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/12/2021 10:39, Vinod Koul wrote:
> Add SM8450 qcom iommu implementation to the table of
> qcom_smmu_impl_of_match table which brings in iommu support for
> SM8450 SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index ca736b065dd0..4aee83330629 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -415,6 +415,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>   	{ .compatible = "qcom,sm8150-smmu-500" },
>   	{ .compatible = "qcom,sm8250-smmu-500" },
>   	{ .compatible = "qcom,sm8350-smmu-500" },
> +	{ .compatible = "qcom,sm8450-smmu-500" },
>   	{ }
>   };
>   
> 


-- 
With best wishes
Dmitry
