Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C54F5E602B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 12:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiIVKsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 06:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbiIVKsl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 06:48:41 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65A5CD1E7;
        Thu, 22 Sep 2022 03:48:39 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3295A3F77C;
        Thu, 22 Sep 2022 12:48:36 +0200 (CEST)
Message-ID: <22acebd5-b900-9abd-67e6-522c351da342@somainline.org>
Date:   Thu, 22 Sep 2022 12:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] iommu: arm-smmu-qcom: add sdm670 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>
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
 <be7a2f12-d6bb-8193-2a56-c31e57f11ce6@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <be7a2f12-d6bb-8193-2a56-c31e57f11ce6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.09.2022 08:41, Krzysztof Kozlowski wrote:
> On 22/09/2022 04:38, Richard Acayan wrote:
>>> On 21.09.2022 21:05, Krzysztof Kozlowski wrote:
>>>> On 21/09/2022 20:48, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 21.09.2022 20:47, Konrad Dybcio wrote:
>>>>>>
>>>>>>
>>>>>> On 21.09.2022 09:31, Krzysztof Kozlowski wrote:
>>>>>>> On 21/09/2022 00:39, Richard Acayan wrote:
>>>>>>>> The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string to
>>>>>>>> support it.
>>>>>>>>
>>>>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>>>>> ---
>>>>>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>> index b2708de25ea3..bf9653b9eb89 100644
>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>> @@ -431,6 +431,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>>>>>>>  	{ .compatible = "qcom,sc8180x-smmu-500" },
>>>>>>>>  	{ .compatible = "qcom,sc8280xp-smmu-500" },
>>>>>>>>  	{ .compatible = "qcom,sdm630-smmu-v2" },
>>>>>>>> +	{ .compatible = "qcom,sdm670-smmu-500" },
>>>>>>>
>>>>>>> Why do we keep adding compatibles to the driver for apparently
>>>>>>> compatible devices?
>>>>>>
>>>>>> Because Linux has not funny run on bare Qualcomm hardware ever since at least msm8x60 times and
>>>>> s/funny/fully
>>>>>
>>>>> unfortunate typo, this is not funny, quite the contrary..
>>>>>
>>>>> Konrad
>>>>>> we are not interacting with real hardware, only with Qualcomm's flawed virtual implementation
>>>>>> of it, that's abstracted to us through various generations of their saddening software stack. This
>>>>>> is also the case for many more standard components, even as far as the GIC on recent boards..
>>>>
>>>> Unfortunately I don't get this explanation... you mean some other
>>>> firmware requires Linux drivers to use specific compatibles instead of
>>>> one fallback?
>>> No, perhaps I misunderstood you.
>>>
>>>>
>>>> All of these do not have driver data, so they are essentially compatible
>>>> for Linux driver. Growing this list in the driver seems pointless. What
>>>> is the benefit of growing driver with same entries, except more patches?
>>> Compatible lists in smmu-impl files allow matching driver quirks for SMMUs themselves
>>> and consumer devices (such as MDSS). The situation is more complicated, because some
>>> qcom SMMUs also require more quirks than others (think 8974 vs 8994 vs 8996/pro&660&8998
>>> vs 845+ vs adreno smmu in various flavours), so all qcom SMMUs need to use
>>> `qcom_smmu_impl` and some others need even more quirks on top of that (that generally
>>> hurt performance or functionality, so we don't want them when they're unnecessary).
>>> If all generations of qcom SMMU implementation that bear the same name behaved anywhere
>>> near consistent, there would be no need for keeping this around, instead requiring only
>>> "qcom,broken-smmu" or something".
>>
>> Hi, just stopping by to share my own thoughts.
>>
>> First, I don't mind if this series doesn't get applied as-is. After seeing
>> the eMMC driver in its current state:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/sdhci-msm.c?h=v6.0-rc6#n2437
>>
>> I can understand that the devicetree maintainers don't want to see new SoCs
>> touching drivers unnecessarily. Second, I don't see enough quirks to
>> justify needing all compatible strings in the driver (2 quirky SoCs
>> compared to 16 total not counting adreno iommu):
>>
>>     $ grep qcom, drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>     	if (of_device_is_compatible(np, "qcom,msm8996-smmu-v2"))
>>     	* All targets that use the qcom,adreno-smmu compatible string *should*
>>     	{ .compatible = "qcom,adreno" },
>>     	{ .compatible = "qcom,mdp4" },
>>     	{ .compatible = "qcom,mdss" },
>>     	{ .compatible = "qcom,sc7180-mdss" },
>>     	{ .compatible = "qcom,sc7180-mss-pil" },
>>     	{ .compatible = "qcom,sc7280-mdss" },
>>     	{ .compatible = "qcom,sc7280-mss-pil" },
>>     	{ .compatible = "qcom,sc8180x-mdss" },
>>     	{ .compatible = "qcom,sm8250-mdss" },
>>     	{ .compatible = "qcom,sdm845-mdss" },
>>     	{ .compatible = "qcom,sdm845-mss-pil" },
>>     	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
>>     	{ .compatible = "qcom,msm8998-smmu-v2" },
>>     	{ .compatible = "qcom,qcm2290-smmu-500" },
>>     	{ .compatible = "qcom,sc7180-smmu-500" },
>>     	{ .compatible = "qcom,sc7280-smmu-500" },
>>     	{ .compatible = "qcom,sc8180x-smmu-500" },
>>     	{ .compatible = "qcom,sc8280xp-smmu-500" },
>>     	{ .compatible = "qcom,sdm630-smmu-v2" },
>>     	{ .compatible = "qcom,sdm670-smmu-500" },
>>     	{ .compatible = "qcom,sdm845-smmu-500" },
>>     	{ .compatible = "qcom,sm6125-smmu-500" },
>>     	{ .compatible = "qcom,sm6350-smmu-500" },
>>     	{ .compatible = "qcom,sm6375-smmu-500" },
>>     	{ .compatible = "qcom,sm8150-smmu-500" },
>>     	{ .compatible = "qcom,sm8250-smmu-500" },
>>     	{ .compatible = "qcom,sm8350-smmu-500" },
>>     	{ .compatible = "qcom,sm8450-smmu-500" },
>>     	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
>>
>> I don't know if it's better to get myself involved in fixing this, though.
>> There is no fallback that encompasses qcom devices but not all arm devices.
>> Either way, I'll have to add a new compatible string to the driver.
>>
>> If something like this is fine for now, I'll format it properly tomorrow:
> 
> Please wait till we reach some conclusion otherwise your work might be
> wasted.
> 
>>
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -48,6 +48,13 @@ properties:
>>                - qcom,sm8350-smmu-500
>>                - qcom,sm8450-smmu-500
>>            - const: arm,mmu-500
>> +
>> +      - description: Qcom SoCs implementing "qcom,smmu-500"
>> +        items:
>> +          - enum:
>> +              - qcom,sdm670-smmu-500
>> +          - const: qcom,smmu-500
>> +
> 
> Someone would have to confirm that smmu-500 is a real device
> spec/version. Otherwise this should be device-specific compatible (e.g.
> earliest in family).
In my view it's hard to name it, downstream uses bool properties for enabling/disabling
certain quirks and on different generations there are different combinations of that.
Interestingly enough, I vaguely remember that the same quirk names can mean different
things on different msm-X.Y versions.. Add to that, different msm-X.Y versions can have
different assumptions on what's the default (aka without taking the bool properties into
account) behaviour for a given compatible. So I suppose "first in the family" would be
the best way to go for mainline, though there are still quite a few families:

<earlier ones used qcom_iommu>
- 8996 with quirks that are already accounted for (or one may also say it works by miracle,
just like msm8916 - downstream adds more special handling, but looks like the fw is not as
restrictive)

- 8996pro + 660 + 8998 with serious unmerged ones [1]

- 845 which seems to be aok

- special case of chromebooks where they only have qcom TZ/XPUs and not the hypervisor to
fight with, so ma-a-aybe (no downstream reference & I don't have the hw to confirm) they
can get away with less things

- 8[1234]50 which seem to be a mix-and-match of less serious (read: not accounting for them
may hurt performance but will not make your device sepuku at SMMU probe) minor quirks
[2][3][4][5] (big warning: these may be overriden somewhere in other device tree fragments,
the surest option would be to take a compiled dtb and decompile it to be sure about it)

- 4xxx/6xxx series that mostly align with "whatever was there on the flagship soc released
a year before"


Konrad

[1] https://github.com/SoMainline/linux/commits/marijn/v5.19-ninges/drivers/iommu
[2] https://github.com/TeamWin/android_kernel_samsung_d2q/blob/master/arch/arm64/boot/dts/qcom/msm-arm-smmu-sm8150-v2.dtsi
[3] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/tags/android-11.0.0_r0.56/qcom/msm-arm-smmu-kona.dtsi
[4] https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/61.0.A.11.xxx/qcom/msm-arm-smmu-lahaina.dtsi
[5] https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/64.0.A.2.xxx/devicetree/qcom/msm-arm-smmu-waipio.dtsi
> 
> Best regards,
> Krzysztof
> 
