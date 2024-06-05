Return-Path: <linux-arm-msm+bounces-21745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A071B8FCCB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 14:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2B80B23D69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 12:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A91194A7E;
	Wed,  5 Jun 2024 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3+v9x2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D7195380
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588866; cv=none; b=hTLG43n86HaiyACPEvNYIWSL7MTRdwnHHpNlQYFdYHPDmaHwj19rY744R/9U+Ftk5NfDSFHXsO1xklX0NAMFVxB2z+T0qJqYUvB1w0Y1vKox9jtEnaGwcDDhDbKAwkUj/sIP/AmxIwAV8A439UR86E0R9Qt0wg7B1+Mc4CtSN6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588866; c=relaxed/simple;
	bh=jIyUU59DZAt7C0fDQgDlifYDmnrLN7tFE788MNlGelk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHQrKQ0xKL5piEDKK1YSmF0sdTfk5dS5OHtLWJbjCasB1ahbwaswEctmJo1ed3RaZppgbRh/TFUH/wvMD06TGlNx1vBSUXGE52S5MWyXyO0SepAAb3+tB5PH4pZ+lSCXaKNNP8GreF2z2Kp0EOCmQKqHpYLf0LbQy1GS0xKgqyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3+v9x2Y; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a68bf84d747so432792466b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 05:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717588862; x=1718193662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtZPuGbN5FJZp332GFOYsfu9UIBITNXud+z1knBqYIg=;
        b=G3+v9x2Y69jxM3rOA3nIEH/iZRgLSn6AiL/kqmc7HMrHafV2CrJ7+TncbgUTMoEwCq
         va5xb9suxo3knlXZWOtudzX7P+SODPCPEfIhcHQR5zextmq8+GknbO5WauUWUpA1zgzJ
         fBOYI1z36uSmGDtf3zPwZWpe5jJDe+4DGwFXDDk9pG7kP3pEC9GZUDUjVvS8kUtBC+x7
         /Ro78UCllb9GtTIlNwaGeAKS2Tcrf6V2KNSOcrpvzY/gLadVeHbnU/xTJF2Z0RaiTNKR
         nJ5oW9avlXUAX6VaTQcphaXA82XB2nEjo7D4LLm7kJJ5zDarza6vKaPDyiRIcgmSm2xK
         OBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717588862; x=1718193662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtZPuGbN5FJZp332GFOYsfu9UIBITNXud+z1knBqYIg=;
        b=BMpKqcCW8RV2CjfJHL9+BDQAi9lLauQvt8Jt9213TMes855D1bNErlXTm4R+7vrMID
         SJImx0rUpBEmADQWW/FpITlC0ODIqVwVgB64eqXqPNt9w9TEkm+VF6KKKJNqxgL6TKIK
         sxQIZyco4ZwwCCcvM/WuAtqpyRAO37GXqejgg/fdFJQ2B7rdY3/9x39s4vZZqkhflNDE
         IQQ3ViOxzMpbSEVF6aOm/mBzsDhI87bSTGil9YwFTQjd51VtS+hkyzYNngF3kq811xr6
         jptetNNVZzLsLDAJ3IyqoUiTkJUSBGH/k2fAw7qev3fspbICvioHY6UG1cpRbssqAYGX
         d/iQ==
X-Gm-Message-State: AOJu0YzXUg9uueYBePhElgxOJkZfUwkd5k7xq4x7TY2O+rwgwzK8mtfN
	raFfpLRJO4usFs4I7pNvqpmIwgo+aT0MBsAGXudtvNhqKcztIgV2dGbPMLI0PCs=
X-Google-Smtp-Source: AGHT+IHQxgiHw4pJILZSkw1efA5uK/u4zeBO5ZvAJZbenRmHBgloTAKmqZhPSEASP0f7McU+TkIrlA==
X-Received: by 2002:a17:906:b09:b0:a69:24f:23e7 with SMTP id a640c23a62f3a-a699faccca8mr155597666b.19.1717588861886;
        Wed, 05 Jun 2024 05:01:01 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6992ab61c7sm141802766b.218.2024.06.05.05.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:01:01 -0700 (PDT)
Message-ID: <4c03413b-34f4-44d3-8f12-786af265d59c@linaro.org>
Date: Wed, 5 Jun 2024 14:00:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
To: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
 Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
 <20240529100926.3166325-3-quic_tengfan@quicinc.com>
 <a95fed63-f48d-42c6-856b-0636a50c9dd4@linaro.org>
 <18ff1bf2-be4d-4d82-a4b3-28242b1d1d59@quicinc.com>
 <580f629d-6fae-4cf7-9137-f98b901ae29d@linaro.org>
 <5a3a7033-0cc3-40cd-8560-2dfa6939fe7f@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <5a3a7033-0cc3-40cd-8560-2dfa6939fe7f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/06/2024 06:51, Aiqun Yu (Maria) wrote:
> 
> 
> On 6/4/2024 7:20 PM, Caleb Connolly wrote:
>>
>>
>> On 04/06/2024 12:51, Aiqun Yu (Maria) wrote:
>>>
>>>
>>> On 6/3/2024 5:20 PM, Caleb Connolly wrote:
>>>> Hi Tengfei,
>>>>
>>>> On 29/05/2024 12:09, Tengfei Fan wrote:
>>>>> QCS8550 is derived from SM8550. The difference between SM8550 and
>>>>> QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly used
>>>>> in IoT products.
>>>>> QCS8550 firmware has different memory map compared to SM8550.
>>>>> The memory map will be runtime added through bootloader.
>>>>> There are 3 types of reserved memory regions here:
>>>>> 1. Firmware related regions which aren't shared with kernel.
>>>>>        The device tree source in kernel doesn't need to have node to
>>>>> indicate
>>>>> the firmware related reserved information. Bootloader converys the
>>>>> information by updating devicetree at runtime.
>>>>>        This will be described as: UEFI saves the physical address of the
>>>>> UEFI System Table to dts file's chosen node. Kernel read this table and
>>>>> add reserved memory regions to efi config table. Current reserved
>>>>> memory
>>>>> region may have reserved region which was not yet used, release note of
>>>>> the firmware have such kind of information.
>>>>
>>>> Are you describing some particular quirk of the platform here, or just
>>>> standard UEFI booting?
>>>
>>> It's standard UEFI booting efi config table.
>>
>> Ok, thanks for confirming.
>>>>
>>>> When booting with UEFI, the memory map is passed via the ESRT, so having
>>>> memory that the kernel shouldn't use it pretty simple (and typical).
>>
>> woo! \o/
>>>
>>> yes. It is very simple. And the bootloader firmware config the
>>> "reserved" region in the efi config table from the uefi firmware.
>>>>> 2. Firmware related memory regions which are shared with Kernel
>>>>>        The device tree source in the kernel needs to include nodes that
>>>>> indicate fimware-related shared information. A label name is suggested
>>>>> because this type of shared information needs to be referenced by
>>>>> specific drivers for handling purposes.
>>>>
>>>> Again, is there something non-standard here? If not I would suggest
>>>> dropping these detail comments as they might be misleading.
>>>
>>> Detailed comments is used to describe current device tree reserved
>>> memory regions.
>>>
>>> Current patch is not creating a new mechanism to have memory map
>>> described. But it is the first time qcom device trees use this design,
>>> and have a simplified(also more compatible) device tree reserved memory
>>> region(memory map). Previously, bootloader(apps bootloader) only pass
>>> the whole physical memory base and size, and use reserved memory nodes
>>> only in device tree(which is also a standard choose).
>>>
>>> So that's why it is detailed comments for other qcom platform reference.
>>
>> Doesn't the rb3gen2 also use this design?
> 
> Checked current qcs6490-rb3gen2.dts still use the device tree to have
> all the reserved regions, even have detailed regions like "Firmware
> related regions which aren't shared with kernel."

Right,
> 
> Not sure current qcs6490 firmware efi config table looks like, if it
> have all the reserved region marked carefully on efi config table, then
> device tree don't need to mention the reserved regions which is not
> shared to kernel.

That makes sense.
> 
> The qcom memory map in device tree discussion was happened after qcs6490
> rb3gen2 time frame. efi config table is standard. But we still need to
> check what's the final config placed in the table for different
> platforms. I will suggest to have current qcs8550 as an example to
> config the current memory non-kernel needed to know region inside the
> efi config table in bootloader, and have kernel shared reserved region
> marked in the device tree.

Ok, thanks for explaining the context here. Using the ESRT for this 
certainly makes more sense to me.

So regarding the comment in the reserved-memory node below, I think this 
could be simplified to just a sentence or two explaining how this 
platform is different. Maybe something like:

/* Unlike previous platforms, QCS8550 boots using EFI and describes most 
reserved regions in the ESRT memory map. As a result, reserved memory 
regions which aren't relevant to the kernel (like the hypervisor region) 
don't need to be described in DT. */

A few more comments in-line.
> 
>>>
>>>>
>>>> Thanks and regards,
>>>>> 3. Remoteproc regions.
>>>>>        Remoteproc regions will be reserved and then assigned to
>>>>> subsystem
>>>>> firmware later.
>>>>> Here is a reserved memory map for this platform:
>>>>> 0x100000000 +-------------------+
>>>>>                |                   |
>>>>>                | Firmware Related  |
>>>>>                |                   |
>>>>>     0xd4d00000 +-------------------+
>>>>>                |                   |
>>>>>                | Kernel Available  |
>>>>>                |                   |
>>>>>     0xa7000000 +-------------------+
>>>>>                |                   |
>>>>>                | Remoteproc Region |
>>>>>                |                   |
>>>>>     0x8a800000 +-------------------+
>>>>>                |                   |
>>>>>                | Firmware Related  |
>>>>>                |                   |
>>>>>     0x80000000 +-------------------+
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/qcom/qcs8550.dtsi | 167
>>>>> ++++++++++++++++++++++++++
>>>>>     1 file changed, 167 insertions(+)
>>>>>     create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>> b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>> new file mode 100644
>>>>> index 000000000000..685668c6ad14
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>> @@ -0,0 +1,167 @@
>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>> +/*
>>>>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All
>>>>> rights reserved.
>>>>> + */
>>>>> +
>>>>> +#include "sm8550.dtsi"
>>>>> +
>>>>> +/delete-node/ &reserved_memory;
>>>>> +
>>>>> +/ {
>>>>> +    reserved_memory: reserved-memory {
>>>>> +        #address-cells = <2>;
>>>>> +        #size-cells = <2>;
>>>>> +        ranges;
>>>>> +
>>>>> +
>>>>> +        /* These are 3 types of reserved memory regions here:
>>>>> +         * 1. Firmware related regions which aren't shared with
>>>>> kernel.
>>>>> +         *     The device tree source in kernel doesn't need to have
>>>>> node to
>>>>> +         * indicate the firmware related reserved information.
>>>>> Bootloader
>>>>> +         * conveys the information by updating devicetree at runtime.
>>>>> +         *     This will be described as: UEFI saves the physical
>>>>> address of
>>>>> +         * the UEFI System Table to dts file's chosen node. Kernel
>>>>> read this
>>>>> +         * table and add reserved memory regions to efi config table.
>>>>> Current
>>>>> +         * reserved memory region may have reserved region which was
>>>>> not yet
>>>>> +         * used, release note of the firmware have such kind of
>>>>> information.
>>>>> +         * 2. Firmware related memory regions which are shared with
>>>>> Kernel
>>>>> +         *     The device tree source in the kernel needs to include
>>>>> nodes
>>>>> +         * that indicate fimware-related shared information. A label
>>>>> name
>>>>> +         * is suggested because this type of shared information
>>>>> needs to
>>>>> +         * be referenced by specific drivers for handling purposes.
>>>>> +         * 3. Remoteproc regions.
>>>>> +         *     Remoteproc regions will be reserved and then
>>>>> assigned to
>>>>> +         * subsystem firmware later.
>>>>> +         * Here is a reserved memory map for this platform:
>>>>> +         * 0x100000000 +-------------------+
>>>>> +         *             |                   |
>>>>> +         *             | Firmware Related  |
>>>>> +         *             |                   |
>>>>> +         *  0xd4d00000 +-------------------+
>>>>> +         *             |                   |
>>>>> +         *             | Kernel Available  |
>>>>> +         *             |                   |
>>>>> +         *  0xa7000000 +-------------------+
>>>>> +         *             |                   |
>>>>> +         *             | Remoteproc Region |
>>>>> +         *             |                   |
>>>>> +         *  0x8a800000 +-------------------+
>>>>> +         *             |                   |
>>>>> +         *             | Firmware Related  |
>>>>> +         *             |                   |
>>>>> +         *  0x80000000 +-------------------+

I guess this is quite subjective, but this diagram looks "upside down" 
to me. I think it's generally more popular to have the lower addresses 
at the top.

>>>>> +         */
>>>>> +
>>>>> +        /*
>>>>> +         * Firmware related regions, bootloader will possible reserve
>>>>> parts of
>>>>> +         * region from 0x80000000..0x8a800000.

This is just duplicating info from the table, please drop this comment 
(it should be obvious from the above explanation).
>>>>> +         */
>>>>> +        aop_image_mem: aop-image-region@81c00000 {
>>>>> +            reg = <0x0 0x81c00000 0x0 0x60000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
>>>>> +            compatible = "qcom,cmd-db";
>>>>> +            reg = <0x0 0x81c60000 0x0 0x20000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        aop_config_mem: aop-config-region@81c80000 {
>>>>> +            no-map;
>>>>> +            reg = <0x0 0x81c80000 0x0 0x20000>;
>>>>> +        };
>>>>> +
>>>>> +        smem_mem: smem-region@81d00000 {
>>>>> +            compatible = "qcom,smem";
>>>>> +            reg = <0x0 0x81d00000 0x0 0x200000>;
>>>>> +            hwlocks = <&tcsr_mutex 3>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        adsp_mhi_mem: adsp-mhi-region@81f00000 {
>>>>> +            reg = <0x0 0x81f00000 0x0 0x20000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        /* PIL region */

Drop this comment
>>>>> +        mpss_mem: mpss-region@8a800000 {
>>>>> +            reg = <0x0 0x8a800000 0x0 0x10800000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
>>>>> +            reg = <0x0 0x9b000000 0x0 0x80000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        ipa_fw_mem: ipa-fw-region@9b080000 {
>>>>> +            reg = <0x0 0x9b080000 0x0 0x10000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        ipa_gsi_mem: ipa-gsi-region@9b090000 {
>>>>> +            reg = <0x0 0x9b090000 0x0 0xa000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
>>>>> +            reg = <0x0 0x9b09a000 0x0 0x2000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        spss_region_mem: spss-region@9b100000 {
>>>>> +            reg = <0x0 0x9b100000 0x0 0x180000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        spu_secure_shared_memory_mem:
>>>>> spu-secure-shared-memory-region@9b280000 {
>>>>> +            reg = <0x0 0x9b280000 0x0 0x80000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        camera_mem: camera-region@9b300000 {
>>>>> +            reg = <0x0 0x9b300000 0x0 0x800000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        video_mem: video-region@9bb00000 {
>>>>> +            reg = <0x0 0x9bb00000 0x0 0x700000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        cvp_mem: cvp-region@9c200000 {
>>>>> +            reg = <0x0 0x9c200000 0x0 0x700000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        cdsp_mem: cdsp-region@9c900000 {
>>>>> +            reg = <0x0 0x9c900000 0x0 0x2000000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
>>>>> +            reg = <0x0 0x9e900000 0x0 0x80000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
>>>>> +            reg = <0x0 0x9e980000 0x0 0x80000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        adspslpi_mem: adspslpi-region@9ea00000 {
>>>>> +            reg = <0x0 0x9ea00000 0x0 0x4080000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        /*
>>>>> +         * Firmware related regions, bootloader will possible reserve
>>>>> parts of
>>>>> +         * region from 0xd8000000..0x100000000.
>>>>> +         */

The address specified in this comment (0xd8000000) doesn't match the 
mpss_dsm_mem region OR the diagram above. I would suggest dropping this 
comment too.
>>>>> +        mpss_dsm_mem: mpss_dsm_region@d4d00000 {
>>>>> +            reg = <0x0 0xd4d00000 0x0 0x3300000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +    };
>>>>> +};
>>>>
>>>
>>
> 

Kind regards,
-- 
// Caleb (they/them)

