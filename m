Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9D55E5501
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 23:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiIUVPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 17:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiIUVPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 17:15:00 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DA56F55D
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 14:14:58 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B097E3F651;
        Wed, 21 Sep 2022 23:14:56 +0200 (CEST)
Message-ID: <5f629a95-8ee4-7cf8-f471-0b50e311d3b7@somainline.org>
Date:   Wed, 21 Sep 2022 23:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] iommu: arm-smmu-qcom: add sdm670 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <30980ac8-1386-d284-8452-fdc5b7da8343@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <30980ac8-1386-d284-8452-fdc5b7da8343@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.09.2022 21:05, Krzysztof Kozlowski wrote:
> On 21/09/2022 20:48, Konrad Dybcio wrote:
>>
>>
>> On 21.09.2022 20:47, Konrad Dybcio wrote:
>>>
>>>
>>> On 21.09.2022 09:31, Krzysztof Kozlowski wrote:
>>>> On 21/09/2022 00:39, Richard Acayan wrote:
>>>>> The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string to
>>>>> support it.
>>>>>
>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>> ---
>>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> index b2708de25ea3..bf9653b9eb89 100644
>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> @@ -431,6 +431,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>>>>  	{ .compatible = "qcom,sc8180x-smmu-500" },
>>>>>  	{ .compatible = "qcom,sc8280xp-smmu-500" },
>>>>>  	{ .compatible = "qcom,sdm630-smmu-v2" },
>>>>> +	{ .compatible = "qcom,sdm670-smmu-500" },
>>>>
>>>> Why do we keep adding compatibles to the driver for apparently
>>>> compatible devices?
>>>
>>> Because Linux has not funny run on bare Qualcomm hardware ever since at least msm8x60 times and
>> s/funny/fully
>>
>> unfortunate typo, this is not funny, quite the contrary..
>>
>> Konrad
>>> we are not interacting with real hardware, only with Qualcomm's flawed virtual implementation
>>> of it, that's abstracted to us through various generations of their saddening software stack. This
>>> is also the case for many more standard components, even as far as the GIC on recent boards..
> 
> Unfortunately I don't get this explanation... you mean some other
> firmware requires Linux drivers to use specific compatibles instead of
> one fallback?
No, perhaps I misunderstood you.

> 
> All of these do not have driver data, so they are essentially compatible
> for Linux driver. Growing this list in the driver seems pointless. What
> is the benefit of growing driver with same entries, except more patches?
Compatible lists in smmu-impl files allow matching driver quirks for SMMUs themselves
and consumer devices (such as MDSS). The situation is more complicated, because some
qcom SMMUs also require more quirks than others (think 8974 vs 8994 vs 8996/pro&660&8998
vs 845+ vs adreno smmu in various flavours), so all qcom SMMUs need to use
`qcom_smmu_impl` and some others need even more quirks on top of that (that generally
hurt performance or functionality, so we don't want them when they're unnecessary).
If all generations of qcom SMMU implementation that bear the same name behaved anywhere
near consistent, there would be no need for keeping this around, instead requiring only
"qcom,broken-smmu" or something".

Konrad
> 
> Best regards,
> Krzysztof
> 
