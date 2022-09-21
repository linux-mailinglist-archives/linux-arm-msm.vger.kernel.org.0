Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62FF65E5386
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 21:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiIUTFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 15:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiIUTFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 15:05:10 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886827F0A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 12:05:09 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id s6so10798593lfo.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=gxyg5lejj145RAw8dOJUoYM2aA2Z4E6jQKaU5KUCwOA=;
        b=W7Yfd1ZATmMA7G1YK2gicGgV50uVo80uAOamqpGLjJEfhS1JRCNX9x8Y5KB0GQtpQk
         OVYR+g06bW/CBZDLyjzVL6l4cbSTQotfPxEMjXDUyzgeg6GeFUDqWRoPHyeEbBFqWRhP
         lXAu0/VecfTT8AqoFyKGwhrghhqdgcVqnNPf9OYmh8zCYgU98jEh3tRoxBzzY4+xEckI
         q+2Q0mH08bP91Ch7G7adxkV3hfLTi8w9omLYQ/dPm9qc9VXHjsn4E9uJtczEnspOqeNl
         gqRyq6hST2mEs0icD64kpPF3ytj2O9l3gEwD9sQvSFq10D+vK/hwVDxED2nzZ0M/htJK
         K0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gxyg5lejj145RAw8dOJUoYM2aA2Z4E6jQKaU5KUCwOA=;
        b=zb7SNPDgSb1wyzdMCw//I9BrEndk2VGw2Uhg6M7JjJVnSwCBoWj+by86Ji2+lqSJ2t
         G3K5ddPq550OsJqJGLPz0bsJe+YV2H7bl+IdDwR53XQRhewIPlUQNn/ykeMaQDPToBjh
         fKAUdk8RWH7oYgJjJgZfpVJupq2EtR6Qn44zs6I1XNrnk+nBpkiDBepxzDC1BUgT56rd
         Qlsd5UEs32MtYwVQa/vi5GLiLvanqvqV27fyiKGD4C1lI17yCzC5Im8uPycbQoHwBgy4
         OHeHSjNB+9VtDTPZWZpIsAyY0FoKRDGrE/jKZLFg/FLZRsc6La3U1k00zga3h7EGKuzt
         1l9g==
X-Gm-Message-State: ACrzQf2gWwvanzIe92fxbaMn1mFrCp9DfUORClhGV1XdJcCBoMmQSUiQ
        qvgmCqt/Yhi/w5CPx1D5d7ykbw==
X-Google-Smtp-Source: AMsMyM5H0SLOaDb4+Kn3R9mauXInzsOlfG1UxxCRVwrSauSrBw1qESQrhRRTmBu7Moy0Shv2Jikk0w==
X-Received: by 2002:a19:5f4f:0:b0:49f:543b:190e with SMTP id a15-20020a195f4f000000b0049f543b190emr9868333lfj.547.1663787107834;
        Wed, 21 Sep 2022 12:05:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm559227lfd.29.2022.09.21.12.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 12:05:06 -0700 (PDT)
Message-ID: <30980ac8-1386-d284-8452-fdc5b7da8343@linaro.org>
Date:   Wed, 21 Sep 2022 21:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] iommu: arm-smmu-qcom: add sdm670 compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20220920223955.151507-1-mailingradian@gmail.com>
 <20220920223955.151507-3-mailingradian@gmail.com>
 <77b7d58f-ba85-86de-8635-6efbb1354a08@linaro.org>
 <5c25dc95-d7a4-0b15-5514-6fe3a48e899c@somainline.org>
 <f98ccf6b-34e7-d15f-63f9-928827b52eb8@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f98ccf6b-34e7-d15f-63f9-928827b52eb8@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 20:48, Konrad Dybcio wrote:
> 
> 
> On 21.09.2022 20:47, Konrad Dybcio wrote:
>>
>>
>> On 21.09.2022 09:31, Krzysztof Kozlowski wrote:
>>> On 21/09/2022 00:39, Richard Acayan wrote:
>>>> The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string to
>>>> support it.
>>>>
>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>> ---
>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index b2708de25ea3..bf9653b9eb89 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -431,6 +431,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>>>  	{ .compatible = "qcom,sc8180x-smmu-500" },
>>>>  	{ .compatible = "qcom,sc8280xp-smmu-500" },
>>>>  	{ .compatible = "qcom,sdm630-smmu-v2" },
>>>> +	{ .compatible = "qcom,sdm670-smmu-500" },
>>>
>>> Why do we keep adding compatibles to the driver for apparently
>>> compatible devices?
>>
>> Because Linux has not funny run on bare Qualcomm hardware ever since at least msm8x60 times and
> s/funny/fully
> 
> unfortunate typo, this is not funny, quite the contrary..
> 
> Konrad
>> we are not interacting with real hardware, only with Qualcomm's flawed virtual implementation
>> of it, that's abstracted to us through various generations of their saddening software stack. This
>> is also the case for many more standard components, even as far as the GIC on recent boards..

Unfortunately I don't get this explanation... you mean some other
firmware requires Linux drivers to use specific compatibles instead of
one fallback?

All of these do not have driver data, so they are essentially compatible
for Linux driver. Growing this list in the driver seems pointless. What
is the benefit of growing driver with same entries, except more patches?

Best regards,
Krzysztof

