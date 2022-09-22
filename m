Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82B385E6225
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 14:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiIVMSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 08:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiIVMSV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 08:18:21 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589ABE4DBE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:18:19 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id c7so10722575ljm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eFbO2zxPDG4cNkzA020Mk1PCKOXSgz/pWIlesT0voZs=;
        b=tUOYDrhZGOXV/H+DbIBohG6mr1YyRa1Z09io4EdAHSz7pO6AR5ESVQtx4dYTXO68QI
         Hc1+EXR2266vO26uVzkRG87kr0/4ZBdkFV6KEJHW+cpNqzDcM+lhrd8rh+WtbejHGcGj
         nwUV+yhdKIIur+LiQICRPItTHVodZAGB5bDIEayBfHtfZDG3uuemnFbzW0yHbwam3Czl
         mm2OCTsShxnjE6pSmo1KI9vJuQ+j0/LKy/Cwk01s1MWEWrEDkBoviHQDGcGNKu9zblFq
         HgWDmDEOvwJoJxdtzCQwi+C52aaUJ5rnF58Z8Mqi72ZoBLJTcka2HskELbXviUnVA9rR
         RB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eFbO2zxPDG4cNkzA020Mk1PCKOXSgz/pWIlesT0voZs=;
        b=6h2uTey9gT/iCFxvDo4SFU3sGv9FovA2qwpfS4PoUmFnf8Iv0V7ka4ijXQSNkcfuut
         vf6E/5RrIU5Q//3mDoRVsyJCDwaBrx4m4BztZ5OPkk/iFe2BV/5GgUjMA9MtIK0nJPos
         RezNyN8dof8Tkl6S59yF8GE4O9/a4jv4g5r8fju1J+7bWrR1LTJzzKfHHApCNl8BR1ae
         Tmz5ehZcfPXmBWLz5bbuqYLp3omqYmjiEz0jyq3cjO9gEtWnUn2RCp7EeGREl+3s3V7a
         sHuEFSpkYrTvuZY3UpqGzb8ADJk2/ObHOzqqbjZrKlFK/dM85sKC+2aS6vyDqyTjvXxn
         XdRw==
X-Gm-Message-State: ACrzQf3p3Eb8d/TB4OLBokeYlJ6gTDPAZJDfopzYqqeYGncH1n6UBI4W
        hbGC/xOBvTK1qNr4Mja6r/CtZA==
X-Google-Smtp-Source: AMsMyM61BBGFAwoVC5hNjlU2rAJ0VFcAFtOiQnB6ZeGAhRTtDc6QpmVRtCdRShd4BYRkqE5oBMRp+g==
X-Received: by 2002:a2e:bd0e:0:b0:267:fad4:7f72 with SMTP id n14-20020a2ebd0e000000b00267fad47f72mr1037194ljq.130.1663849097263;
        Thu, 22 Sep 2022 05:18:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u16-20020ac248b0000000b00498f871f33fsm916527lfg.86.2022.09.22.05.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:18:16 -0700 (PDT)
Message-ID: <f6c8e1d4-54bd-811c-7322-375f755ad460@linaro.org>
Date:   Thu, 22 Sep 2022 14:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] iommu: arm-smmu-qcom: add sdm670 compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
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
 <22acebd5-b900-9abd-67e6-522c351da342@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <22acebd5-b900-9abd-67e6-522c351da342@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 12:48, Konrad Dybcio wrote:
> 
> 
> On 22.09.2022 08:41, Krzysztof Kozlowski wrote:
>> On 22/09/2022 04:38, Richard Acayan wrote:
>>>> On 21.09.2022 21:05, Krzysztof Kozlowski wrote:
>>>>> On 21/09/2022 20:48, Konrad Dybcio wrote:
>>>>>>
>>>>>>
>>>>>> On 21.09.2022 20:47, Konrad Dybcio wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 21.09.2022 09:31, Krzysztof Kozlowski wrote:
>>>>>>>> On 21/09/2022 00:39, Richard Acayan wrote:
>>>>>>>>> The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string to
>>>>>>>>> support it.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>> index b2708de25ea3..bf9653b9eb89 100644
>>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>> @@ -431,6 +431,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>>>>>>>>  	{ .compatible = "qcom,sc8180x-smmu-500" },
>>>>>>>>>  	{ .compatible = "qcom,sc8280xp-smmu-500" },
>>>>>>>>>  	{ .compatible = "qcom,sdm630-smmu-v2" },
>>>>>>>>> +	{ .compatible = "qcom,sdm670-smmu-500" },
>>>>>>>>
>>>>>>>> Why do we keep adding compatibles to the driver for apparently
>>>>>>>> compatible devices?
>>>>>>>
>>>>>>> Because Linux has not funny run on bare Qualcomm hardware ever since at least msm8x60 times and
>>>>>> s/funny/fully
>>>>>>
>>>>>> unfortunate typo, this is not funny, quite the contrary..
>>>>>>
>>>>>> Konrad
>>>>>>> we are not interacting with real hardware, only with Qualcomm's flawed virtual implementation
>>>>>>> of it, that's abstracted to us through various generations of their saddening software stack. This
>>>>>>> is also the case for many more standard components, even as far as the GIC on recent boards..
>>>>>
>>>>> Unfortunately I don't get this explanation... you mean some other
>>>>> firmware requires Linux drivers to use specific compatibles instead of
>>>>> one fallback?
>>>> No, perhaps I misunderstood you.
>>>>
>>>>>
>>>>> All of these do not have driver data, so they are essentially compatible
>>>>> for Linux driver. Growing this list in the driver seems pointless. What
>>>>> is the benefit of growing driver with same entries, except more patches?
>>>> Compatible lists in smmu-impl files allow matching driver quirks for SMMUs themselves
>>>> and consumer devices (such as MDSS). The situation is more complicated, because some
>>>> qcom SMMUs also require more quirks than others (think 8974 vs 8994 vs 8996/pro&660&8998
>>>> vs 845+ vs adreno smmu in various flavours), so all qcom SMMUs need to use
>>>> `qcom_smmu_impl` and some others need even more quirks on top of that (that generally
>>>> hurt performance or functionality, so we don't want them when they're unnecessary).
>>>> If all generations of qcom SMMU implementation that bear the same name behaved anywhere
>>>> near consistent, there would be no need for keeping this around, instead requiring only
>>>> "qcom,broken-smmu" or something".
>>>
>>> Hi, just stopping by to share my own thoughts.
>>>
>>> First, I don't mind if this series doesn't get applied as-is. After seeing
>>> the eMMC driver in its current state:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/sdhci-msm.c?h=v6.0-rc6#n2437
>>>
>>> I can understand that the devicetree maintainers don't want to see new SoCs
>>> touching drivers unnecessarily. Second, I don't see enough quirks to
>>> justify needing all compatible strings in the driver (2 quirky SoCs
>>> compared to 16 total not counting adreno iommu):
>>>
>>>     $ grep qcom, drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>     	if (of_device_is_compatible(np, "qcom,msm8996-smmu-v2"))
>>>     	* All targets that use the qcom,adreno-smmu compatible string *should*
>>>     	{ .compatible = "qcom,adreno" },
>>>     	{ .compatible = "qcom,mdp4" },
>>>     	{ .compatible = "qcom,mdss" },
>>>     	{ .compatible = "qcom,sc7180-mdss" },
>>>     	{ .compatible = "qcom,sc7180-mss-pil" },
>>>     	{ .compatible = "qcom,sc7280-mdss" },
>>>     	{ .compatible = "qcom,sc7280-mss-pil" },
>>>     	{ .compatible = "qcom,sc8180x-mdss" },
>>>     	{ .compatible = "qcom,sm8250-mdss" },
>>>     	{ .compatible = "qcom,sdm845-mdss" },
>>>     	{ .compatible = "qcom,sdm845-mss-pil" },
>>>     	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
>>>     	{ .compatible = "qcom,msm8998-smmu-v2" },
>>>     	{ .compatible = "qcom,qcm2290-smmu-500" },
>>>     	{ .compatible = "qcom,sc7180-smmu-500" },
>>>     	{ .compatible = "qcom,sc7280-smmu-500" },
>>>     	{ .compatible = "qcom,sc8180x-smmu-500" },
>>>     	{ .compatible = "qcom,sc8280xp-smmu-500" },
>>>     	{ .compatible = "qcom,sdm630-smmu-v2" },
>>>     	{ .compatible = "qcom,sdm670-smmu-500" },
>>>     	{ .compatible = "qcom,sdm845-smmu-500" },
>>>     	{ .compatible = "qcom,sm6125-smmu-500" },
>>>     	{ .compatible = "qcom,sm6350-smmu-500" },
>>>     	{ .compatible = "qcom,sm6375-smmu-500" },
>>>     	{ .compatible = "qcom,sm8150-smmu-500" },
>>>     	{ .compatible = "qcom,sm8250-smmu-500" },
>>>     	{ .compatible = "qcom,sm8350-smmu-500" },
>>>     	{ .compatible = "qcom,sm8450-smmu-500" },
>>>     	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
>>>
>>> I don't know if it's better to get myself involved in fixing this, though.
>>> There is no fallback that encompasses qcom devices but not all arm devices.
>>> Either way, I'll have to add a new compatible string to the driver.
>>>
>>> If something like this is fine for now, I'll format it properly tomorrow:
>>
>> Please wait till we reach some conclusion otherwise your work might be
>> wasted.
>>
>>>
>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> @@ -48,6 +48,13 @@ properties:
>>>                - qcom,sm8350-smmu-500
>>>                - qcom,sm8450-smmu-500
>>>            - const: arm,mmu-500
>>> +
>>> +      - description: Qcom SoCs implementing "qcom,smmu-500"
>>> +        items:
>>> +          - enum:
>>> +              - qcom,sdm670-smmu-500
>>> +          - const: qcom,smmu-500
>>> +
>>
>> Someone would have to confirm that smmu-500 is a real device
>> spec/version. Otherwise this should be device-specific compatible (e.g.
>> earliest in family).
> In my view it's hard to name it, downstream uses bool properties for enabling/disabling
> certain quirks and on different generations there are different combinations of that.
> Interestingly enough, I vaguely remember that the same quirk names can mean different
> things on different msm-X.Y versions.. Add to that, different msm-X.Y versions can have
> different assumptions on what's the default (aka without taking the bool properties into
> account) behaviour for a given compatible. 

Downstream does not care about ABI, coding style, reasonable approach,
so it should not wonder that they code things inconsistent.


> So I suppose "first in the family" would be
> the best way to go for mainline, though there are still quite a few families:
> 
> <earlier ones used qcom_iommu>
> - 8996 with quirks that are already accounted for (or one may also say it works by miracle,
> just like msm8916 - downstream adds more special handling, but looks like the fw is not as
> restrictive)
> 
> - 8996pro + 660 + 8998 with serious unmerged ones [1]
> 
> - 845 which seems to be aok
> 
> - special case of chromebooks where they only have qcom TZ/XPUs and not the hypervisor to
> fight with, so ma-a-aybe (no downstream reference & I don't have the hw to confirm) they
> can get away with less things
> 
> - 8[1234]50 which seem to be a mix-and-match of less serious (read: not accounting for them
> may hurt performance but will not make your device sepuku at SMMU probe) minor quirks
> [2][3][4][5] (big warning: these may be overriden somewhere in other device tree fragments,
> the surest option would be to take a compiled dtb and decompile it to be sure about it)
> 
> - 4xxx/6xxx series that mostly align with "whatever was there on the flagship soc released
> a year before"

If the devices are really different, even though it is not visible in
Linux driver, then indeed there is no point for fake compatibility. I
raised the question only because the driver does not customize the
variants, but that might be not enough.

Linked DTSI use different quirks (assuming quirks would have same
meaning...), plus they have sometimes different amount of clocks, so in
total maybe it is not reasonable to make them compatible. On the other
hand, maybe the programming model is very, very similar thus Linux could
bind to one fallback and few different bits would be customized with
specific compatible.

Best regards,
Krzysztof

