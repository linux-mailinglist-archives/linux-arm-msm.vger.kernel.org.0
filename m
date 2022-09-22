Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82AF05E5B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 08:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiIVGlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 02:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiIVGle (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 02:41:34 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053DCB6D21
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 23:41:33 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id p5so9728413ljc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 23:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=q1Nhh8Y3ghMdNF14WF4h80cKWD9P+ZXE/kGU5cQMHuA=;
        b=tUFf/NdqsJuEUshcz9IFGZdKlqgVJS4z8yBXdQRmy9HTThnjb+NarwLO8uIibSMFSB
         5nB0DhBt2KcHM7HmMPv1OTJq+f0XltvwVuwdz7oXAWMhqhOUR4OWlLPMmEFqmnDcBfJa
         OMEUgYqMDZp4FtVkkkTCDhkboCDKGFuKUFj7QOHglR3sxlIjCECEoRVglFLZsMG/kusy
         q2w6zUnzMsYO+T8Os59N+eF2jxRM0H7MT2lyly0laED4Ap0humOj4nQ6FrjMOtqDzQTp
         SZPAwBhHOkZjaQ6D9UEuv2uWbEVSizxcpP3HlG8bZWHpwROr3QhoE4QXxo3Ii/bRcENi
         WyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=q1Nhh8Y3ghMdNF14WF4h80cKWD9P+ZXE/kGU5cQMHuA=;
        b=BdmXUuR6ixCPciF0u5zYsEgRXWBj654geNIPguu2vjeLhD23AooZSLzhL3haktfupp
         pixY/WJO7JKJqfUDUAi/T61AqLY3vDipYg1ZIdbniTS4K7jz2bjcpeI5e39263eCC2SA
         /kAjNYg1vttiGz4FoUrzrtjK3QiNEDsReCrYN3P3U7fC0qAIqrM1SeGl9bTtULzZnZ0B
         UO4uY+NcuKua/EXb0vHekGFddB/sOh+vRSmA5rfz7vCM7Q6Qtdj3zpWwSgkyekAACMyK
         ZGlYd0VcIUmUcrlZdFEcnpaJBieKmYaVNJnO5wJuYVbTp94muBq6QC4YkqIQSsEJUz3b
         fmPg==
X-Gm-Message-State: ACrzQf2u8bReG1nOrhWwt2B9RnyZbIEK9bskY2tb5WYheF9BhPV3ewG7
        TfFUoxck7vk/ptINQVfPsiwwxQ==
X-Google-Smtp-Source: AMsMyM7B5jpo/w6nh6Z1jdivAu9XpSUBUtXUfUom8LtoKNl5aYbpR3MNKckhwp6RcCLYIBZVX/E+OQ==
X-Received: by 2002:a2e:9202:0:b0:26b:df14:cd with SMTP id k2-20020a2e9202000000b0026bdf1400cdmr545193ljg.212.1663828891176;
        Wed, 21 Sep 2022 23:41:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p20-20020a05651212d400b00492b0d23d24sm774268lfg.247.2022.09.21.23.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:41:30 -0700 (PDT)
Message-ID: <be7a2f12-d6bb-8193-2a56-c31e57f11ce6@linaro.org>
Date:   Thu, 22 Sep 2022 08:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] iommu: arm-smmu-qcom: add sdm670 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
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
References: <5f629a95-8ee4-7cf8-f471-0b50e311d3b7@somainline.org>
 <20220922023833.178076-1-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922023833.178076-1-mailingradian@gmail.com>
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

On 22/09/2022 04:38, Richard Acayan wrote:
>> On 21.09.2022 21:05, Krzysztof Kozlowski wrote:
>>> On 21/09/2022 20:48, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 21.09.2022 20:47, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 21.09.2022 09:31, Krzysztof Kozlowski wrote:
>>>>>> On 21/09/2022 00:39, Richard Acayan wrote:
>>>>>>> The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string to
>>>>>>> support it.
>>>>>>>
>>>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>>>> ---
>>>>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> index b2708de25ea3..bf9653b9eb89 100644
>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> @@ -431,6 +431,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>>>>>>  	{ .compatible = "qcom,sc8180x-smmu-500" },
>>>>>>>  	{ .compatible = "qcom,sc8280xp-smmu-500" },
>>>>>>>  	{ .compatible = "qcom,sdm630-smmu-v2" },
>>>>>>> +	{ .compatible = "qcom,sdm670-smmu-500" },
>>>>>>
>>>>>> Why do we keep adding compatibles to the driver for apparently
>>>>>> compatible devices?
>>>>>
>>>>> Because Linux has not funny run on bare Qualcomm hardware ever since at least msm8x60 times and
>>>> s/funny/fully
>>>>
>>>> unfortunate typo, this is not funny, quite the contrary..
>>>>
>>>> Konrad
>>>>> we are not interacting with real hardware, only with Qualcomm's flawed virtual implementation
>>>>> of it, that's abstracted to us through various generations of their saddening software stack. This
>>>>> is also the case for many more standard components, even as far as the GIC on recent boards..
>>>
>>> Unfortunately I don't get this explanation... you mean some other
>>> firmware requires Linux drivers to use specific compatibles instead of
>>> one fallback?
>> No, perhaps I misunderstood you.
>>
>>>
>>> All of these do not have driver data, so they are essentially compatible
>>> for Linux driver. Growing this list in the driver seems pointless. What
>>> is the benefit of growing driver with same entries, except more patches?
>> Compatible lists in smmu-impl files allow matching driver quirks for SMMUs themselves
>> and consumer devices (such as MDSS). The situation is more complicated, because some
>> qcom SMMUs also require more quirks than others (think 8974 vs 8994 vs 8996/pro&660&8998
>> vs 845+ vs adreno smmu in various flavours), so all qcom SMMUs need to use
>> `qcom_smmu_impl` and some others need even more quirks on top of that (that generally
>> hurt performance or functionality, so we don't want them when they're unnecessary).
>> If all generations of qcom SMMU implementation that bear the same name behaved anywhere
>> near consistent, there would be no need for keeping this around, instead requiring only
>> "qcom,broken-smmu" or something".
> 
> Hi, just stopping by to share my own thoughts.
> 
> First, I don't mind if this series doesn't get applied as-is. After seeing
> the eMMC driver in its current state:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/sdhci-msm.c?h=v6.0-rc6#n2437
> 
> I can understand that the devicetree maintainers don't want to see new SoCs
> touching drivers unnecessarily. Second, I don't see enough quirks to
> justify needing all compatible strings in the driver (2 quirky SoCs
> compared to 16 total not counting adreno iommu):
> 
>     $ grep qcom, drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>     	if (of_device_is_compatible(np, "qcom,msm8996-smmu-v2"))
>     	* All targets that use the qcom,adreno-smmu compatible string *should*
>     	{ .compatible = "qcom,adreno" },
>     	{ .compatible = "qcom,mdp4" },
>     	{ .compatible = "qcom,mdss" },
>     	{ .compatible = "qcom,sc7180-mdss" },
>     	{ .compatible = "qcom,sc7180-mss-pil" },
>     	{ .compatible = "qcom,sc7280-mdss" },
>     	{ .compatible = "qcom,sc7280-mss-pil" },
>     	{ .compatible = "qcom,sc8180x-mdss" },
>     	{ .compatible = "qcom,sm8250-mdss" },
>     	{ .compatible = "qcom,sdm845-mdss" },
>     	{ .compatible = "qcom,sdm845-mss-pil" },
>     	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
>     	{ .compatible = "qcom,msm8998-smmu-v2" },
>     	{ .compatible = "qcom,qcm2290-smmu-500" },
>     	{ .compatible = "qcom,sc7180-smmu-500" },
>     	{ .compatible = "qcom,sc7280-smmu-500" },
>     	{ .compatible = "qcom,sc8180x-smmu-500" },
>     	{ .compatible = "qcom,sc8280xp-smmu-500" },
>     	{ .compatible = "qcom,sdm630-smmu-v2" },
>     	{ .compatible = "qcom,sdm670-smmu-500" },
>     	{ .compatible = "qcom,sdm845-smmu-500" },
>     	{ .compatible = "qcom,sm6125-smmu-500" },
>     	{ .compatible = "qcom,sm6350-smmu-500" },
>     	{ .compatible = "qcom,sm6375-smmu-500" },
>     	{ .compatible = "qcom,sm8150-smmu-500" },
>     	{ .compatible = "qcom,sm8250-smmu-500" },
>     	{ .compatible = "qcom,sm8350-smmu-500" },
>     	{ .compatible = "qcom,sm8450-smmu-500" },
>     	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
> 
> I don't know if it's better to get myself involved in fixing this, though.
> There is no fallback that encompasses qcom devices but not all arm devices.
> Either way, I'll have to add a new compatible string to the driver.
> 
> If something like this is fine for now, I'll format it properly tomorrow:

Please wait till we reach some conclusion otherwise your work might be
wasted.

> 
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -48,6 +48,13 @@ properties:
>                - qcom,sm8350-smmu-500
>                - qcom,sm8450-smmu-500
>            - const: arm,mmu-500
> +
> +      - description: Qcom SoCs implementing "qcom,smmu-500"
> +        items:
> +          - enum:
> +              - qcom,sdm670-smmu-500
> +          - const: qcom,smmu-500
> +

Someone would have to confirm that smmu-500 is a real device
spec/version. Otherwise this should be device-specific compatible (e.g.
earliest in family).

Best regards,
Krzysztof

