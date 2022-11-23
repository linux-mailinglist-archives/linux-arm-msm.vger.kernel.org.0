Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5335A635A48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237586AbiKWKga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237228AbiKWKfG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:35:06 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF0A116A92
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:19:58 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id n7so1048579wrr.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xUMtL7H3c3DO9p5DLaMbmWt05FamHjUSHjK+GPYbYbs=;
        b=GWXJmhv9RRkTfuDucLKv79jWJ3qqFbPnXI9L1MYZikLIRHDQ23bM/NRybSEbWiRIrH
         HWorrH6MjWNaNt3Tc22d9IjuokOMvTBXHpZxqHM2QToqDOyErv5iK2Aupia8qZ9qjbo3
         6y8dOhiIJ3hr2eAn6dHGGoDHZQg7jtkbc0CRBCutY6BXUKLeyfu6nkWGJux/e4CU45oA
         YSB37iJGEdc6Z1uVtGkK6+z3+Y9bS1vxI6hYpjn0ClGPa/Bd+BACGQAx2krnDR6uvszi
         PFRNxRCtakRJRG65cKHmYUB7LhC3r4pdmi0erFoQzdEVgFxtPKQqzIZA46wvOUONKY2G
         5WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUMtL7H3c3DO9p5DLaMbmWt05FamHjUSHjK+GPYbYbs=;
        b=4TBsPAx5aj9zaqojxE+TH9NLyAA4EMuLlmLBpvjAvhb+k2St1wXqbjYHK5ih+9A3sl
         fygGAOzXfE8x4qjRWgpPrVXuK8TLwkPCdrVV+CADx1EedGOyYAFx3N6RKeuEYP+e5nDc
         Ssp1IHJ/4YwlRNl/nqHrjlUjRljXIzv2NOGGAT+1o0shZ53rc5eyKYGEyHjLCLJSUXJc
         hFr4stVSGcpa/YmdtKuwguZLvFN3/vyY7V1+Jpc8V7HtvKnwJTwniN2wpu8DzbG1tfRt
         21puKMasodANaaUzNMHFmjmsv/1aI39snF+n9FalaPwyzLuLqTfDTzVEMZ2E21ZIH2/F
         8lbA==
X-Gm-Message-State: ANoB5pla0rHxxG9QAmaQ3CzviDPLA7qqpk3dd0kOnKY7TYdxfFrzNVwS
        648r1pJN1p75q74YGtKhkrw5HA==
X-Google-Smtp-Source: AA0mqf7+7XdRjYWlx1ERsF6zZgwMQnB2L3pIgVwT3QuR3MeK03vAxVKy1MepVHSUAvcimfYXBqaugw==
X-Received: by 2002:a05:6000:1181:b0:22e:53c0:ead8 with SMTP id g1-20020a056000118100b0022e53c0ead8mr16793109wrx.210.1669198797422;
        Wed, 23 Nov 2022 02:19:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id g26-20020adfa49a000000b002366e3f1497sm16600418wrb.6.2022.11.23.02.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:19:57 -0800 (PST)
Message-ID: <eb577577-d4c9-1d68-f8f5-f42729155536@linaro.org>
Date:   Wed, 23 Nov 2022 11:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: reserved-memory: document Qualcomm MPSS
 DSM memory
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-0-158dc2bb6e96@linaro.org>
 <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-1-158dc2bb6e96@linaro.org>
 <38fff21b-3e75-13f9-664e-a115bc527b67@linaro.org>
 <9aa23650-6ae1-3844-7cf3-6812dc023c11@linaro.org>
 <dfec6a0b-86c6-fb61-51f6-d1e400a6f5ef@linaro.org>
 <ad9d2e4f-1d60-15e7-dc2d-e7e32b0ec855@linaro.org>
 <7b3356a9-8f2b-49de-7ad3-b01c3279eac0@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <7b3356a9-8f2b-49de-7ad3-b01c3279eac0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/11/2022 15:03, Krzysztof Kozlowski wrote:
> On 18/11/2022 14:30, neil.armstrong@linaro.org wrote:
>> On 18/11/2022 11:45, Krzysztof Kozlowski wrote:
>>> On 17/11/2022 10:47, Neil Armstrong wrote:
>>>>>
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: qcom,mpss-dsm-mem
>>>>>
>>>>> Why do we need dedicated binding and compatible for it instead of using
>>>>> memory-region phandle in the device?
>>>>
>>>> So like rmtfs, this memory zone is shared between APPS and the MPSS subsystem.
>>>>
>>>> Like rmtfs it makes no sense to link it to the MPSS PAS, since it's only a launcher,
>>>> it doesn't represent the MPSS subsystem.
>>>
>>> This also does not represent a device. Memory region is not a device, so
>>> this is as well not correct representation of hardware.
>>
>> I never used the term device so far, but a shared memory region with a platform
>> specific process to share the region between subsystems.
> 
> Yes, but you create a device in patch #2 for this binding.

Implementation details are out of scope here.

> 
>>
>>>
>>>>
>>>> In the PAS startup process, the resources are released from APPS once the MPSS subsystem
>>>> is running, which is not the case with the MPSS DSM where it must be shared during the whole
>>>> lifetime of the system.
>>>
>>> I don't think that PAS releases the region. I checked the
>>> qcom_q6v5_pas.c and there is only ioremap. The device stays loaded thus
>>> the memory stays mapped.
>> Yes PAS does release the firmware region when the firmware is started,
>> qcom_scm_pas_metadata_release() does that.
> 
> Indeed, I see it now.
> 
>>
>>>
>>> We have already three of such "memory region devices" and we keep
>>> growing it. It's not scalable.
>>
>> If we want to properly describe this, we must then represent the MPSS subsystem
>> and associate this memory region.
> 
> I don't see why. None of devices in your DTS reference this memory
> region, so it is purely to keep it mapped for Modem, right? In such case
> I still do not get why PAS/PIL, who starts and stops the remote
> processor, could not prepare the memory and share it with modem.

OK you've got a point, but this is still an implementation detail.

I got some more background about why this memory zone appeared, before it
was including in the modem reserved-memories, but for flexibility reasons
this is now in the hands of the APPS runtime (linux) to setup this memory
zone and share it to the MPSS subsystem.

So the only requirement for the PAS is to make sure this zone is shared
before starting the startup process, not to actually do the share setup.

The zone will need to be shared whatever the PAS state is (probe, startup, remove, ...).

> 
> The point is that this memory region is nothing special and does not
> deserve its own compatible. We keep adding here compatibles to fulfill
> some Linux implementation specifics, don't we?

Yes this memory region is now special since it has to be shared explicitly.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Neil
