Return-Path: <linux-arm-msm+bounces-22379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74098904C51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 650FA1C2178D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 07:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908FF16B743;
	Wed, 12 Jun 2024 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AqMuC+K6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299816B755;
	Wed, 12 Jun 2024 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718176044; cv=none; b=tTSH9/7UrB2sRJ/nSMhKwW1B4fvV58NRcGuPVT/wcS1lCYfgDMMmd3VPT2t0IMSSPRxZXvG39jNyZoB+howVDqph7BCkOlpRuco1AkRd/p124ujDRuGLXL8N2WZwwoP0pshty8yo9phlYR2kmdNvSSRKpMymerJjiJ7rW17SSYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718176044; c=relaxed/simple;
	bh=lArGn66nle1XMxFjFD+Z0TcsjJVfje2Mzuf04W7Hsxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nWZMFTddc+mzf6iIYOTHGlpSDDrZbvEX7g3Yrhjh0UA/6wof8b3jMW0aMVJh8/z8htD/2FNI1oOLzAyAQib/RO8882kHzcjPMpLYt6V0w5zP6SO7jc2JT4CO/YNrS3ksg5ia3kXTcvEHl9Js7n+R+IGKEvfhd/Mk70V1D4hpVnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AqMuC+K6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C6Fvwo002433;
	Wed, 12 Jun 2024 07:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKB4jSLL7SPrZFZZCzmdTJDNZl87xAWNfYLH20krfj8=; b=AqMuC+K6qp4M1gGa
	GMLpsqITwGL37DnDlUo6JgouiZKNjeBPJD7aOulw4HG+Uzm21KZcgYZUTI3kfbpf
	7BTXOSxrME0eWsTQpMkEboTGbEtBpYixvXDqTG6rKaJ73z7fDSLYotnJvRg36Wbu
	cqlPfapBDdPxc/wv47jra63A0pTaKr0CYvpHON7y/5gYIv6TA3Cu39wtNSQpPw1o
	Z/mttscS/h+UAAigeIm/Bf1T1L04oSZqe3COaTybw7U/RV3f9i5UFMaF3kdngrwY
	LaYOajBgPyv4gyA7f9vg+1I73dhaa2A2GeR6NmKr2B4lWXlPA1buFEvdTX6ngo3p
	F54pCA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yptuy1f0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 07:07:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C774cY025746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 07:07:04 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 00:06:56 -0700
Message-ID: <2ad59b57-7285-4c1e-af03-c3a0a1c8a1e6@quicinc.com>
Date: Wed, 12 Jun 2024 15:06:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
 <20240529100926.3166325-3-quic_tengfan@quicinc.com>
 <a95fed63-f48d-42c6-856b-0636a50c9dd4@linaro.org>
 <18ff1bf2-be4d-4d82-a4b3-28242b1d1d59@quicinc.com>
 <580f629d-6fae-4cf7-9137-f98b901ae29d@linaro.org>
 <5a3a7033-0cc3-40cd-8560-2dfa6939fe7f@quicinc.com>
 <4c03413b-34f4-44d3-8f12-786af265d59c@linaro.org>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <4c03413b-34f4-44d3-8f12-786af265d59c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h2-M1eB-Z8aEYmjkyXj2sr2RBU6mYNlZ
X-Proofpoint-ORIG-GUID: h2-M1eB-Z8aEYmjkyXj2sr2RBU6mYNlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_03,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120049



On 6/5/2024 8:00 PM, Caleb Connolly wrote:
> Hi,
> 
> On 05/06/2024 06:51, Aiqun Yu (Maria) wrote:
>>
>>
>> On 6/4/2024 7:20 PM, Caleb Connolly wrote:
>>>
>>>
>>> On 04/06/2024 12:51, Aiqun Yu (Maria) wrote:
>>>>
>>>>
>>>> On 6/3/2024 5:20 PM, Caleb Connolly wrote:
>>>>> Hi Tengfei,
>>>>>
>>>>> On 29/05/2024 12:09, Tengfei Fan wrote:
>>>>>> QCS8550 is derived from SM8550. The difference between SM8550 and
>>>>>> QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly
>>>>>> used
>>>>>> in IoT products.
>>>>>> QCS8550 firmware has different memory map compared to SM8550.
>>>>>> The memory map will be runtime added through bootloader.
>>>>>> There are 3 types of reserved memory regions here:
>>>>>> 1. Firmware related regions which aren't shared with kernel.
>>>>>>        The device tree source in kernel doesn't need to have node to
>>>>>> indicate
>>>>>> the firmware related reserved information. Bootloader converys the
>>>>>> information by updating devicetree at runtime.
>>>>>>        This will be described as: UEFI saves the physical address
>>>>>> of the
>>>>>> UEFI System Table to dts file's chosen node. Kernel read this
>>>>>> table and
>>>>>> add reserved memory regions to efi config table. Current reserved
>>>>>> memory
>>>>>> region may have reserved region which was not yet used, release
>>>>>> note of
>>>>>> the firmware have such kind of information.
>>>>>
>>>>> Are you describing some particular quirk of the platform here, or just
>>>>> standard UEFI booting?
>>>>
>>>> It's standard UEFI booting efi config table.
>>>
>>> Ok, thanks for confirming.
>>>>>
>>>>> When booting with UEFI, the memory map is passed via the ESRT, so
>>>>> having
>>>>> memory that the kernel shouldn't use it pretty simple (and typical).
>>>
>>> woo! \o/
>>>>
>>>> yes. It is very simple. And the bootloader firmware config the
>>>> "reserved" region in the efi config table from the uefi firmware.
>>>>>> 2. Firmware related memory regions which are shared with Kernel
>>>>>>        The device tree source in the kernel needs to include nodes
>>>>>> that
>>>>>> indicate fimware-related shared information. A label name is
>>>>>> suggested
>>>>>> because this type of shared information needs to be referenced by
>>>>>> specific drivers for handling purposes.
>>>>>
>>>>> Again, is there something non-standard here? If not I would suggest
>>>>> dropping these detail comments as they might be misleading.
>>>>
>>>> Detailed comments is used to describe current device tree reserved
>>>> memory regions.
>>>>
>>>> Current patch is not creating a new mechanism to have memory map
>>>> described. But it is the first time qcom device trees use this design,
>>>> and have a simplified(also more compatible) device tree reserved memory
>>>> region(memory map). Previously, bootloader(apps bootloader) only pass
>>>> the whole physical memory base and size, and use reserved memory nodes
>>>> only in device tree(which is also a standard choose).
>>>>
>>>> So that's why it is detailed comments for other qcom platform
>>>> reference.
>>>
>>> Doesn't the rb3gen2 also use this design?
>>
>> Checked current qcs6490-rb3gen2.dts still use the device tree to have
>> all the reserved regions, even have detailed regions like "Firmware
>> related regions which aren't shared with kernel."
> 
> Right,
>>
>> Not sure current qcs6490 firmware efi config table looks like, if it
>> have all the reserved region marked carefully on efi config table, then
>> device tree don't need to mention the reserved regions which is not
>> shared to kernel.
> 
> That makes sense.
>>
>> The qcom memory map in device tree discussion was happened after qcs6490
>> rb3gen2 time frame. efi config table is standard. But we still need to
>> check what's the final config placed in the table for different
>> platforms. I will suggest to have current qcs8550 as an example to
>> config the current memory non-kernel needed to know region inside the
>> efi config table in bootloader, and have kernel shared reserved region
>> marked in the device tree.
> 
> Ok, thanks for explaining the context here. Using the ESRT for this
> certainly makes more sense to me.
> 
> So regarding the comment in the reserved-memory node below, I think this
> could be simplified to just a sentence or two explaining how this
> platform is different. Maybe something like:
> 
> /* Unlike previous platforms, QCS8550 boots using EFI and describes most
> reserved regions in the ESRT memory map. As a result, reserved memory
> regions which aren't relevant to the kernel (like the hypervisor region)
> don't need to be described in DT. */

The previous message still accounts per my understanding since it can be
referenced to others who are not familiar with the memory map change or
ESRT memory map solution.

I think we can add your above message into the commit message to have
more information. Appreciate the comments if others have similar doubts
as you have.
> 
> A few more comments in-line.
>>
>>>>
>>>>>
>>>>> Thanks and regards,
>>>>>> 3. Remoteproc regions.
>>>>>>        Remoteproc regions will be reserved and then assigned to
>>>>>> subsystem
>>>>>> firmware later.
>>>>>> Here is a reserved memory map for this platform:
>>>>>> 0x100000000 +-------------------+
>>>>>>                |                   |
>>>>>>                | Firmware Related  |
>>>>>>                |                   |
>>>>>>     0xd4d00000 +-------------------+
>>>>>>                |                   |
>>>>>>                | Kernel Available  |
>>>>>>                |                   |
>>>>>>     0xa7000000 +-------------------+
>>>>>>                |                   |
>>>>>>                | Remoteproc Region |
>>>>>>                |                   |
>>>>>>     0x8a800000 +-------------------+
>>>>>>                |                   |
>>>>>>                | Firmware Related  |
>>>>>>                |                   |
>>>>>>     0x80000000 +-------------------+
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/qcs8550.dtsi | 167
>>>>>> ++++++++++++++++++++++++++
>>>>>>     1 file changed, 167 insertions(+)
>>>>>>     create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>>> b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>>> new file mode 100644
>>>>>> index 000000000000..685668c6ad14
>>>>>> --- /dev/null
>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>>>>> @@ -0,0 +1,167 @@
>>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>>> +/*
>>>>>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All
>>>>>> rights reserved.
>>>>>> + */
>>>>>> +
>>>>>> +#include "sm8550.dtsi"
>>>>>> +
>>>>>> +/delete-node/ &reserved_memory;
>>>>>> +
>>>>>> +/ {
>>>>>> +    reserved_memory: reserved-memory {
>>>>>> +        #address-cells = <2>;
>>>>>> +        #size-cells = <2>;
>>>>>> +        ranges;
>>>>>> +
>>>>>> +
>>>>>> +        /* These are 3 types of reserved memory regions here:
>>>>>> +         * 1. Firmware related regions which aren't shared with
>>>>>> kernel.
>>>>>> +         *     The device tree source in kernel doesn't need to have
>>>>>> node to
>>>>>> +         * indicate the firmware related reserved information.
>>>>>> Bootloader
>>>>>> +         * conveys the information by updating devicetree at
>>>>>> runtime.
>>>>>> +         *     This will be described as: UEFI saves the physical
>>>>>> address of
>>>>>> +         * the UEFI System Table to dts file's chosen node. Kernel
>>>>>> read this
>>>>>> +         * table and add reserved memory regions to efi config
>>>>>> table.
>>>>>> Current
>>>>>> +         * reserved memory region may have reserved region which was
>>>>>> not yet
>>>>>> +         * used, release note of the firmware have such kind of
>>>>>> information.
>>>>>> +         * 2. Firmware related memory regions which are shared with
>>>>>> Kernel
>>>>>> +         *     The device tree source in the kernel needs to include
>>>>>> nodes
>>>>>> +         * that indicate fimware-related shared information. A label
>>>>>> name
>>>>>> +         * is suggested because this type of shared information
>>>>>> needs to
>>>>>> +         * be referenced by specific drivers for handling purposes.
>>>>>> +         * 3. Remoteproc regions.
>>>>>> +         *     Remoteproc regions will be reserved and then
>>>>>> assigned to
>>>>>> +         * subsystem firmware later.
>>>>>> +         * Here is a reserved memory map for this platform:
>>>>>> +         * 0x100000000 +-------------------+
>>>>>> +         *             |                   |
>>>>>> +         *             | Firmware Related  |
>>>>>> +         *             |                   |
>>>>>> +         *  0xd4d00000 +-------------------+
>>>>>> +         *             |                   |
>>>>>> +         *             | Kernel Available  |
>>>>>> +         *             |                   |
>>>>>> +         *  0xa7000000 +-------------------+
>>>>>> +         *             |                   |
>>>>>> +         *             | Remoteproc Region |
>>>>>> +         *             |                   |
>>>>>> +         *  0x8a800000 +-------------------+
>>>>>> +         *             |                   |
>>>>>> +         *             | Firmware Related  |
>>>>>> +         *             |                   |
>>>>>> +         *  0x80000000 +-------------------+
> 
> I guess this is quite subjective, but this diagram looks "upside down"
> to me. I think it's generally more popular to have the lower addresses
> at the top.

ack.
> 
>>>>>> +         */
>>>>>> +
>>>>>> +        /*
>>>>>> +         * Firmware related regions, bootloader will possible
>>>>>> reserve
>>>>>> parts of
>>>>>> +         * region from 0x80000000..0x8a800000.
> 
> This is just duplicating info from the table, please drop this comment
> (it should be obvious from the above explanation).

ack.
>>>>>> +         */
>>>>>> +        aop_image_mem: aop-image-region@81c00000 {
>>>>>> +            reg = <0x0 0x81c00000 0x0 0x60000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
>>>>>> +            compatible = "qcom,cmd-db";
>>>>>> +            reg = <0x0 0x81c60000 0x0 0x20000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        aop_config_mem: aop-config-region@81c80000 {
>>>>>> +            no-map;
>>>>>> +            reg = <0x0 0x81c80000 0x0 0x20000>;
>>>>>> +        };
>>>>>> +
>>>>>> +        smem_mem: smem-region@81d00000 {
>>>>>> +            compatible = "qcom,smem";
>>>>>> +            reg = <0x0 0x81d00000 0x0 0x200000>;
>>>>>> +            hwlocks = <&tcsr_mutex 3>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        adsp_mhi_mem: adsp-mhi-region@81f00000 {
>>>>>> +            reg = <0x0 0x81f00000 0x0 0x20000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        /* PIL region */
> 
> Drop this comment

ack.
>>>>>> +        mpss_mem: mpss-region@8a800000 {
>>>>>> +            reg = <0x0 0x8a800000 0x0 0x10800000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
>>>>>> +            reg = <0x0 0x9b000000 0x0 0x80000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        ipa_fw_mem: ipa-fw-region@9b080000 {
>>>>>> +            reg = <0x0 0x9b080000 0x0 0x10000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        ipa_gsi_mem: ipa-gsi-region@9b090000 {
>>>>>> +            reg = <0x0 0x9b090000 0x0 0xa000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
>>>>>> +            reg = <0x0 0x9b09a000 0x0 0x2000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        spss_region_mem: spss-region@9b100000 {
>>>>>> +            reg = <0x0 0x9b100000 0x0 0x180000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        spu_secure_shared_memory_mem:
>>>>>> spu-secure-shared-memory-region@9b280000 {
>>>>>> +            reg = <0x0 0x9b280000 0x0 0x80000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        camera_mem: camera-region@9b300000 {
>>>>>> +            reg = <0x0 0x9b300000 0x0 0x800000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        video_mem: video-region@9bb00000 {
>>>>>> +            reg = <0x0 0x9bb00000 0x0 0x700000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        cvp_mem: cvp-region@9c200000 {
>>>>>> +            reg = <0x0 0x9c200000 0x0 0x700000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        cdsp_mem: cdsp-region@9c900000 {
>>>>>> +            reg = <0x0 0x9c900000 0x0 0x2000000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
>>>>>> +            reg = <0x0 0x9e900000 0x0 0x80000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
>>>>>> +            reg = <0x0 0x9e980000 0x0 0x80000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        adspslpi_mem: adspslpi-region@9ea00000 {
>>>>>> +            reg = <0x0 0x9ea00000 0x0 0x4080000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        /*
>>>>>> +         * Firmware related regions, bootloader will possible
>>>>>> reserve
>>>>>> parts of
>>>>>> +         * region from 0xd8000000..0x100000000.
>>>>>> +         */
> 
> The address specified in this comment (0xd8000000) doesn't match the
> mpss_dsm_mem region OR the diagram above. I would suggest dropping this
> comment too.

ack.
>>>>>> +        mpss_dsm_mem: mpss_dsm_region@d4d00000 {
>>>>>> +            reg = <0x0 0xd4d00000 0x0 0x3300000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +    };
>>>>>> +};
>>>>>
>>>>
>>>
>>
> 
> Kind regards,

-- 
Thx and BRs,
Aiqun(Maria) Yu

