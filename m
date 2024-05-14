Return-Path: <linux-arm-msm+bounces-19810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2145B8C4AD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 03:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88BCFB2112B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 01:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9A91370;
	Tue, 14 May 2024 01:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MqgmIYax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A971EC5;
	Tue, 14 May 2024 01:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715649719; cv=none; b=S5ABY9IaAbIyV4la+Ni/kX50a0w5J4go4Gvqm9C2ATceqbgcbizKyJ0GwiELSnZhcz1R+dlHrZMmohdEWoG9WGgGdrKLOmuTL0xi50DXbK6ZM4u8xkJ6md4EXum29NwWIlpswgSKs8qPSvne9kwEWaJBkbmBFR4VneUuhdwik2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715649719; c=relaxed/simple;
	bh=w302w88fio2OlAGncVezMSzliGpIKfzdSquepcIBnFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NVlz0YKLwZA7DPI0CFonHf/yLM1wPH7om0N28ZIq5quHSRGp5Xy259SFZ0hHNxLwLWQo7q8I9LbmlZ0S2bVDGNOpcd8XFiVyPDoD0ouWSFgK8MXYmm3HqKNRiuiDOoM814slnxlKS+BcM5PCri5u9ooJhtxrgvAsDz96CIneDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MqgmIYax; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8X8F024006;
	Tue, 14 May 2024 01:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=05rRhDF8PO7g2B2jgcMpqNulSjQFCyn89LH0WUXSXa0=; b=Mq
	gmIYaxigesPL9nDAnczR12R/5d8qJEf4p2KcmmhheOUJxSxdJULbLOEFhGOeKEBf
	9fe80zoWuY0vDP5oD2KRexwez1fb1FbjE4wdbORY+FxswnCpJBjmlZpRa1Rn2tMr
	Dorr+wQIhYx0rts3tVJxdOpeU7bkR9lWLQiitgvD6r1Kd2Ygbv6V2RZz7iuQ40jS
	QQjmgJ8MCHJG7rEyyruIVP2MSSTYofbHfJ9XXscZDzMbMXa0Gix1ByOFjO+MPC2e
	tFUn4KwlXTZ5fuqPsYns6QHDZubBJfEBA9/AZWs+HqSROLqyt1pGyhZB5wXikq0/
	I3pNMtYqOAHS8ceRFPVQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125cx8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 01:21:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E1Lesn009539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 01:21:40 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 18:21:33 -0700
Message-ID: <4fe74490-b4ee-4462-b225-caf2bc01cde7@quicinc.com>
Date: Tue, 14 May 2024 09:21:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
To: Trilok Soni <quic_tsoni@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240513090735.1666142-1-quic_tengfan@quicinc.com>
 <20240513090735.1666142-3-quic_tengfan@quicinc.com>
 <ce8bc51b-a8b3-259c-f70c-d240d7b166cc@quicinc.com>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <ce8bc51b-a8b3-259c-f70c-d240d7b166cc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 74K93fgUI6EXM0VT5LL_cbQGO2_xBPYG
X-Proofpoint-ORIG-GUID: 74K93fgUI6EXM0VT5LL_cbQGO2_xBPYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140008



On 5/14/2024 12:37 AM, Trilok Soni wrote:
> On 5/13/2024 2:07 AM, Tengfei Fan wrote:
>> QCS8550 is derived from SM8550. The differnece between SM8550 and
> 
> spellcheck s/difference/difference 
> 
>> QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly used
>> in IoT scenarios.
> 
> IoT products and not scenarios. 
> 
>> QCS8550 firmware has different memory map with SM8550 firmware. 
> 
> "QCS8550 firmware has different memory map compared to SM8550"
> 
> 
> The
>> memory map will be runtime added through bootloader.
> 
> 
>> There are 3 types of reserved memory regions here:
>> 1. Firmware related regions which aren't shared with kernel.
>>     The device tree source in kernel doesn't need to have node to indicate
>> the firmware related reserved information. OS bootloader conveys the
> 
> Just "Bootloader conveys the information by updating devicetree at runtime" ?
> 
>> information by update device tree in runtime.
>>     This will be described as: UEFI saves the physical address of the
>> UEFI System Table to dts file's chosen node. Kernel read this table and
>> add reserved memory regions to efi config table. Current reserved memory
>> region may have reserved region which was not yet used, release note of
>> the firmware have such kind of information.
> 
> I understand what you are trying to explain below, but can we simplify further? I 
> had to read multiple times to understand what you are trying to convey above. 
> 
>> 2. Firmware related memory regions which are shared with Kernel
>>     Each region has a specific node with specific label name for later
>> phandle reference from other driver dt node.

How about like this:
 2. Firmware related memory regions which are shared with Kernel
The device tree source in the kernel needs to include nodes that
indicate firmware-related shared information. A label name is suggested
because this type of shared information needs to be referenced by
specific drivers for handling purposes.

>> 3. PIL regions.
> 
> Do we use the PIL - peripheral image loader in the upstream kernel or just remoteproc?
> I am fine w/ PIL if it is used at other places in Qualcomm remoteproc. 
> 
>>     PIL regions will be reserved and then assigned to subsystem firmware
>> later.
>> Here is a reserved memory map for this platform:
>> 0x100000000 +------------------+
>>             |                  |
>>             | Firmware Related |
>>             |                  |
>>  0xd4d00000 +------------------+
>>             |                  |
>>             | Kernel Available |
> 
> What is "kernel available" means? 

It means not reserved memory, normal available memory from kernel point
of view.

> 
>>             |                  |
>>  0xa7000000 +------------------+
>>             |                  |
>>             |    PIL Region    |
>>             |                  |
>>  0x8a800000 +------------------+
>>             |                  |
>>             | Firmware Related |
>>             |                  |
>>  0x80000000 +------------------+
> 
>> Note that:
> 
> Do we need to write "Note that:" ? 
> 
>> 0xa7000000..0xA8000000 is used by bootloader, when kernel boot up,
>> it is available for kernel usage. This region is not suggested to be
>> used by kernel features like ramoops, suspend resume etc.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8550.dtsi | 169 ++++++++++++++++++++++++++
>>  1 file changed, 169 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>> new file mode 100644
>> index 000000000000..a3ebf3d4e16d
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>> @@ -0,0 +1,169 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "sm8550.dtsi"
>> +
>> +/delete-node/ &reserved_memory;
>> +
>> +/ {
>> +	reserved_memory: reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +
>> +		/* These are 3 types of reserved memory regions here:
>> +		 * 1. Firmware related regions which aren't shared with kernel.
>> +		 *     The device tree source in kernel doesn't need to have node to
>> +		 * indicate the firmware related reserved information. OS bootloader
>> +		 * conveys the information by update device tree in runtime.
>> +		 *     This will be described as: UEFI saves the physical address of
>> +		 * the UEFI System Table to dts file's chosen node. Kernel read this
>> +		 * table and add reserved memory regions to efi config table. Current
>> +		 * reserved memory region may have reserved region which was not yet
>> +		 * used, release note of the firmware have such kind of information.
>> +		 * 2. Firmware related memory regions which are shared with Kernel.
>> +		 *     Each region has a specific node with specific label name for
>> +		 * later phandle reference from other driver dt node.
>> +		 * 3. PIL regions.
>> +		 *     PIL regions will be reserved and then assigned to subsystem
>> +		 * firmware later.
>> +		 * Here is a reserved memory map for this platform:
> 
> Just check the comment above and it will apply here. 
> 
>> +		 * 0x100000000 +------------------+
>> +		 *             |                  |
>> +		 *             | Firmware Related |
>> +		 *             |                  |
>> +		 *  0xd4d00000 +------------------+
>> +		 *             |                  |
>> +		 *             | Kernel Available |
>> +		 *             |                  |
>> +		 *  0xa7000000 +------------------+
>> +		 *             |                  |
>> +		 *             |    PIL Region    |
>> +		 *             |                  |
>> +		 *  0x8a800000 +------------------+
>> +		 *             |                  |
>> +		 *             | Firmware Related |
>> +		 *             |                  |
>> +		 *  0x80000000 +------------------+
>> +		 * Note that:
>> +		 * 0xa7000000..0xA8000000 is used by bootloader, when kernel boot up,
>> +		 * it is available for kernel usage. This region is not suggested to
>> +		 * be used by kernel features like ramoops, suspend resume etc.
>> +		 */
>> +
>> +		/*
>> +		 * Firmware related regions, bootlader will possible reserve parts of
> 
> spellcheck s/bootlader/bootloader
> 
>> +		 * region from 0x80000000..0x8a800000.
>> +		 */
>> +		aop_image_mem: aop-image-region@81c00000 {
>> +			reg = <0x0 0x81c00000 0x0 0x60000>;
>> +			no-map;
>> +		};
>> +
>> +		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
>> +			compatible = "qcom,cmd-db";
>> +			reg = <0x0 0x81c60000 0x0 0x20000>;
>> +			no-map;
>> +		};
>> +
>> +		aop_config_mem: aop-config-region@81c80000 {
>> +			no-map;
>> +			reg = <0x0 0x81c80000 0x0 0x20000>;
>> +		};
>> +
>> +		smem_mem: smem-region@81d00000 {
>> +			compatible = "qcom,smem";
>> +			reg = <0x0 0x81d00000 0x0 0x200000>;
>> +			hwlocks = <&tcsr_mutex 3>;
>> +			no-map;
>> +		};
>> +
>> +		adsp_mhi_mem: adsp-mhi-region@81f00000 {
>> +			reg = <0x0 0x81f00000 0x0 0x20000>;
>> +			no-map;
>> +		};
>> +
>> +		/* PIL region */
>> +		mpss_mem: mpss-region@8a800000 {
>> +			reg = <0x0 0x8a800000 0x0 0x10800000>;
>> +			no-map;
>> +		};
>> +
>> +		q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
>> +			reg = <0x0 0x9b000000 0x0 0x80000>;
>> +			no-map;
>> +		};
>> +
>> +		ipa_fw_mem: ipa-fw-region@9b080000 {
>> +			reg = <0x0 0x9b080000 0x0 0x10000>;
>> +			no-map;
>> +		};
>> +
>> +		ipa_gsi_mem: ipa-gsi-region@9b090000 {
>> +			reg = <0x0 0x9b090000 0x0 0xa000>;
>> +			no-map;
>> +		};
>> +
>> +		gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
>> +			reg = <0x0 0x9b09a000 0x0 0x2000>;
>> +			no-map;
>> +		};
>> +
>> +		spss_region_mem: spss-region@9b100000 {
>> +			reg = <0x0 0x9b100000 0x0 0x180000>;
>> +			no-map;
>> +		};
>> +
>> +		spu_secure_shared_memory_mem: spu-secure-shared-memory-region@9b280000 {
>> +			reg = <0x0 0x9b280000 0x0 0x80000>;
>> +			no-map;
>> +		};
>> +
>> +		camera_mem: camera-region@9b300000 {
>> +			reg = <0x0 0x9b300000 0x0 0x800000>;
>> +			no-map;
>> +		};
>> +
>> +		video_mem: video-region@9bb00000 {
>> +			reg = <0x0 0x9bb00000 0x0 0x700000>;
>> +			no-map;
>> +		};
>> +
>> +		cvp_mem: cvp-region@9c200000 {
>> +			reg = <0x0 0x9c200000 0x0 0x700000>;
>> +			no-map;
>> +		};
>> +
>> +		cdsp_mem: cdsp-region@9c900000 {
>> +			reg = <0x0 0x9c900000 0x0 0x2000000>;
>> +			no-map;
>> +		};
>> +
>> +		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
>> +			reg = <0x0 0x9e900000 0x0 0x80000>;
>> +			no-map;
>> +		};
>> +
>> +		q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
>> +			reg = <0x0 0x9e980000 0x0 0x80000>;
>> +			no-map;
>> +		};
>> +
>> +		adspslpi_mem: adspslpi-region@9ea00000 {
>> +			reg = <0x0 0x9ea00000 0x0 0x4080000>;
>> +			no-map;
>> +		};
>> +
>> +		/*
>> +		 * Firmware related regions, bootlader will possible reserve parts of
> 
> Ditto. 
> 
>> +		 * region from 0xd8000000..0x100000000.
>> +		 */
>> +		mpss_dsm_mem: mpss_dsm_region@d4d00000 {
>> +			reg = <0x0 0xd4d00000 0x0 0x3300000>;
>> +			no-map;
>> +		};
>> +	};
>> +};

-- 
Thx and BRs,
Aiqun(Maria) Yu

