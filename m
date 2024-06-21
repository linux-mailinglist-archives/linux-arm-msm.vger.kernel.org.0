Return-Path: <linux-arm-msm+bounces-23484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995A9117E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 03:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 571B7281C07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 01:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DBE137E;
	Fri, 21 Jun 2024 01:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oeRHz/Sw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A1C625;
	Fri, 21 Jun 2024 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718932379; cv=none; b=R8IvqcyQKlDKvH+PCZdYls/VkfOzXxoDBNrAypLUMAL68hliN+gOU4tYMOL7XGN4sZGVHcykBkO900zp3VdFHtfrN2IYRWflfHeYScNo8WDrBwUUkTXAbuzj/DojCEy3kIcTL9OTWJRZGF8ZMEc6rlrmkmNpAvDOMcfnF8pB4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718932379; c=relaxed/simple;
	bh=5xIj8ZdN6fm2meqhGu5koAyyeTou/LauTgE4uR9OPqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OGBhSlZHMy8DYjnKxwioc+EQRv1YaZOnOuv9+RL1zaQvQPsoVCyaPDC8tKy4wt/yrYnerX54aLzw95ciTJMebP/UVbiRN7PSbTNmU0fM8ELQds4ZiekcqWMjkwWtI/T4HjxDsZIraDroNxETxndEoOchqIZpbsJgybYFn/GjtbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oeRHz/Sw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBr3Q020192;
	Fri, 21 Jun 2024 01:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcrF1zTlNw+NkGhvKNvx5YU1lGTRkQSYTMKj/OY9pPA=; b=oeRHz/Sw/MDzlF5a
	NYbmGGMlNHrtjBN79ZaRkKSCBAGYTQJG6DY71nKpLelk1jzNbjLWWBVaCg2TTy4c
	TE3fu5VZPPT5ExHfnaiU/G+1t6/6xRJMywGukx2L0EpAET/EkwEFBYSAP+1z7AVV
	de5j/x/fhznWmhu0sFSUcqSonzbjq90VG0AZL4P2IWMTxjigO7zN5mhO7IPjKxE5
	pCF3klQslUl23PH0E2r8m+M0dZKvo2qz3qAVgZFSyldAgIKSPyGqoNRi08nnd3/q
	wO82X+K2zFYu97Ge1Od4j6G9W7kUcPeIM856CtSl6g2dl55YhIWXV+XcnEb8LPIa
	j3WbLQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrkw90wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 01:12:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45L1Co3O028441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 01:12:50 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 18:12:44 -0700
Message-ID: <fe733f54-0a3f-4b01-a7e3-44608c2b02cf@quicinc.com>
Date: Fri, 21 Jun 2024 09:12:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
To: Caleb Connolly <caleb.connolly@linaro.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
 <20240618072202.2516025-3-quic_tengfan@quicinc.com>
 <44e24399-6efa-41ed-8871-12180dd03e10@linaro.org>
 <c265d22e-c246-4c9f-b6ff-7a350468e28c@quicinc.com>
 <c71e1543-6957-4aa6-98fa-160b3bd29c78@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <c71e1543-6957-4aa6-98fa-160b3bd29c78@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 352KV9kLrpAI6OdTp4iPJKf-h7N0LWsZ
X-Proofpoint-ORIG-GUID: 352KV9kLrpAI6OdTp4iPJKf-h7N0LWsZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_12,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210007



On 6/20/2024 9:49 PM, Caleb Connolly wrote:
> 
> 
> On 20/06/2024 15:40, Tengfei Fan wrote:
>>
>>
>> On 6/18/2024 6:06 PM, Caleb Connolly wrote:
>>> HI Tengfei,
>>>
>>> On 18/06/2024 09:22, Tengfei Fan wrote:
>>>> QCS8550 is derived from SM8550. The difference between SM8550 and
>>>> QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly used
>>>> in IoT products.
>>>> QCS8550 firmware has different memory map compared to SM8550.
>>>> The memory map will be runtime added through bootloader.
>>>> There are 3 types of reserved memory regions here:
>>>> 1. Firmware related regions which aren't shared with kernel.
>>>>      The device tree source in kernel doesn't need to have node to 
>>>> indicate
>>>> the firmware related reserved information. Bootloader converys the
>>>> information by updating devicetree at runtime.
>>>>      This will be described as: UEFI saves the physical address of the
>>>> UEFI System Table to dts file's chosen node. Kernel read this table and
>>>> add reserved memory regions to efi config table. Current reserved 
>>>> memory
>>>> region may have reserved region which was not yet used, release note of
>>>> the firmware have such kind of information.
>>>> 2. Firmware related memory regions which are shared with Kernel
>>>>      The device tree source in the kernel needs to include nodes that
>>>> indicate fimware-related shared information. A label name is suggested
>>>> because this type of shared information needs to be referenced by
>>>> specific drivers for handling purposes.
>>>>      Unlike previous platforms, QCS8550 boots using EFI and describes
>>>> most reserved regions in the ESRT memory map. As a result, reserved
>>>> memory regions which aren't relevant to the kernel(like the hypervisor
>>>> region) don't need to be described in DT.
>>>> 3. Remoteproc regions.
>>>>      Remoteproc regions will be reserved and then assigned to subsystem
>>>> firmware later.
>>>> Here is a reserved memory map for this platform:
>>>>   0x80000000 +-------------------+
>>>>              |                   |
>>>>              | Firmware Related  |
>>>>              |                   |
>>>>   0x8a800000 +-------------------+
>>>>              |                   |
>>>>              | Remoteproc Region |
>>>>              |                   |
>>>>   0xa7000000 +-------------------+
>>>>              |                   |
>>>>              | Kernel Available  |
>>>>              |                   |
>>>>   0xd4d00000 +-------------------+
>>>>              |                   |
>>>>              | Firmware Related  |
>>>>              |                   |
>>>> 0x100000000 +-------------------+
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs8550.dtsi | 162 
>>>> ++++++++++++++++++++++++++
>>>>   1 file changed, 162 insertions(+)
>>>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi 
>>>> b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>> new file mode 100644
>>>> index 000000000000..07b314834d88
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>> @@ -0,0 +1,162 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All 
>>>> rights reserved.
>>>> + */
>>>> +
>>>> +#include "sm8550.dtsi"
>>>> +
>>>> +/delete-node/ &reserved_memory;
>>>> +
>>>> +/ {
>>>> +    reserved_memory: reserved-memory {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +        ranges;
>>>> +
>>>> +
>>>> +        /* These are 3 types of reserved memory regions here:
>>>> +         * 1. Firmware related regions which aren't shared with 
>>>> kernel.
>>>> +         *     The device tree source in kernel doesn't need to 
>>>> have node to
>>>> +         * indicate the firmware related reserved information. 
>>>> Bootloader
>>>> +         * conveys the information by updating devicetree at runtime.
>>>> +         *     This will be described as: UEFI saves the physical 
>>>> address of
>>>> +         * the UEFI System Table to dts file's chosen node. Kernel 
>>>> read this
>>>> +         * table and add reserved memory regions to efi config 
>>>> table. Current
>>>> +         * reserved memory region may have reserved region which 
>>>> was not yet
>>>> +         * used, release note of the firmware have such kind of 
>>>> information.
>>>
>>> This is a lot of implementation detail about UEFI, I'd imagine that 
>>> anyone curious can go read the relevant docs instead. It's a lot of 
>>> words just to say "Firmware regions which the kernel doesn't need to 
>>> know about which are not included in the EFI provided memory map."
>>
>>
>> The following update will be applied to this point:
>>
>> 1. Firmware related regions which aren't shared with kernel.
>>       Firmware regions which the kernel doesn't need to know about 
>> which are not included in the EFI provided memory map.
>>
>>
>>>> +         * 2. Firmware related memory regions which are shared with 
>>>> Kernel
>>>> +         *     The device tree source in the kernel needs to 
>>>> include nodes
>>>> +         * that indicate fimware-related shared information. A 
>>>> label name
>>>> +         * is suggested because this type of shared information 
>>>> needs to
>>>> +         * be referenced by specific drivers for handling purposes.
>>>
>>> "Firmware regions the kernel DOES need to know about, which are 
>>> described in the reserved-memory node".
>>
>> The following update will be applied to this point:
>>
>> 2. Firmware related memory regions which are shared with Kernel
>>
>> Firmware regions the kernel does need to know about, which are 
>> described in the reserved-memory node.
>>
>>>> +         *     Unlike previous platforms, QCS8550 boots using EFI 
>>>> and describes
>>>> +         * most reserved regions in the ESRT memory map. As a 
>>>> result, reserved
>>>> +         * memory regions which aren't relevant to the kernel(like 
>>>> the hypervisor
>>>> +         ( region) don't need to be described in DT.
>>>
>>> These would fall under (1) "firmware the kernel doesn't need to know 
>>> about"
>>
>> This will be removed from its current position.
>>
>>>> +         * 3. Remoteproc regions.
>>>> +         *     Remoteproc regions will be reserved and then 
>>>> assigned to
>>>> +         * subsystem firmware later.
>>>
>>> How do these differ from those described in (2)?
>>
>> This point will do the following update:
>>
>> 3. Remoteproc regions
>>
>>     Remoteproc regions will be reserved and then assigned to subsystem 
>> firmware later.
>>
>>     Remoteproc regions can be loaded either in a fixed form or in a 
>> relocatable form, depending on the platform.
>>
>>>
>>> I think this comment is trying to describe too much at once. You're 
>>> trying to describe what the different types of reserved memory are, 
>>> how the kernel learns about them, and how this differs from previous 
>>> platforms all at once. I think you should tackle these points 
>>> separately:
>>>
>>> First describe the types of reserved memory and how the kernel learns 
>>> about them (my suggestions above). Then describe the differences with 
>>> previous platforms (like the hypervisor example)
>>>
>>> Thanks and regards,
>>
>> Your previous suggestion will be incorporated here as follows:
>>
>> Unlike previous platforms, QCS8550 boots using EFI and describes most 
>> reserved regions in the ESRT memory map. As a result, reserved memory 
>> regions which aren't relevant to the kernel(like the hypervisor 
>> region) don't need to be described in DT.
>>
>> Is it reasonable to place it here?
> 
> Thanks great, thanks a lot :)

Thank you for reviewing this patch series in detail!

>>
>> Thanks!
>>
>>>> +         * Here is a reserved memory map for this platform:
>>>> +         *  0x80000000 +-------------------+
>>>> +         *             |                   |
>>>> +         *             | Firmware Related  |
>>>> +         *             |                   |
>>>> +         *  0x8a800000 +-------------------+
>>>> +         *             |                   |
>>>> +         *             | Remoteproc Region |
>>>> +         *             |                   |
>>>> +         *  0xa7000000 +-------------------+
>>>> +         *             |                   |
>>>> +         *             | Kernel Available  |
>>>> +         *             |                   |
>>>> +         *  0xd4d00000 +-------------------+
>>>> +         *             |                   |
>>>> +         *             | Firmware Related  |
>>>> +         *             |                   |
>>>> +         * 0x100000000 +-------------------+
>>>> +         */
>>>> +
>>>> +        aop_image_mem: aop-image-region@81c00000 {
>>>> +            reg = <0x0 0x81c00000 0x0 0x60000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
>>>> +            compatible = "qcom,cmd-db";
>>>> +            reg = <0x0 0x81c60000 0x0 0x20000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        aop_config_mem: aop-config-region@81c80000 {
>>>> +            no-map;
>>>> +            reg = <0x0 0x81c80000 0x0 0x20000>;
>>>> +        };
>>>> +
>>>> +        smem_mem: smem-region@81d00000 {
>>>> +            compatible = "qcom,smem";
>>>> +            reg = <0x0 0x81d00000 0x0 0x200000>;
>>>> +            hwlocks = <&tcsr_mutex 3>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        adsp_mhi_mem: adsp-mhi-region@81f00000 {
>>>> +            reg = <0x0 0x81f00000 0x0 0x20000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        mpss_mem: mpss-region@8a800000 {
>>>> +            reg = <0x0 0x8a800000 0x0 0x10800000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
>>>> +            reg = <0x0 0x9b000000 0x0 0x80000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        ipa_fw_mem: ipa-fw-region@9b080000 {
>>>> +            reg = <0x0 0x9b080000 0x0 0x10000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        ipa_gsi_mem: ipa-gsi-region@9b090000 {
>>>> +            reg = <0x0 0x9b090000 0x0 0xa000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
>>>> +            reg = <0x0 0x9b09a000 0x0 0x2000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        spss_region_mem: spss-region@9b100000 {
>>>> +            reg = <0x0 0x9b100000 0x0 0x180000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        spu_secure_shared_memory_mem: 
>>>> spu-secure-shared-memory-region@9b280000 {
>>>> +            reg = <0x0 0x9b280000 0x0 0x80000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        camera_mem: camera-region@9b300000 {
>>>> +            reg = <0x0 0x9b300000 0x0 0x800000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        video_mem: video-region@9bb00000 {
>>>> +            reg = <0x0 0x9bb00000 0x0 0x700000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        cvp_mem: cvp-region@9c200000 {
>>>> +            reg = <0x0 0x9c200000 0x0 0x700000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        cdsp_mem: cdsp-region@9c900000 {
>>>> +            reg = <0x0 0x9c900000 0x0 0x2000000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
>>>> +            reg = <0x0 0x9e900000 0x0 0x80000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
>>>> +            reg = <0x0 0x9e980000 0x0 0x80000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        adspslpi_mem: adspslpi-region@9ea00000 {
>>>> +            reg = <0x0 0x9ea00000 0x0 0x4080000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        mpss_dsm_mem: mpss_dsm_region@d4d00000 {
>>>> +            reg = <0x0 0xd4d00000 0x0 0x3300000>;
>>>> +            no-map;
>>>> +        };
>>>> +    };
>>>> +};
>>>
>>
> 

-- 
Thx and BRs,
Tengfei Fan

