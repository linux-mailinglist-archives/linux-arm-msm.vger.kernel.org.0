Return-Path: <linux-arm-msm+bounces-21574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 713A68FB068
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22D1728204A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 10:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DF4144D0B;
	Tue,  4 Jun 2024 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OfhEwWKa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FEF144D00;
	Tue,  4 Jun 2024 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498286; cv=none; b=aJOmZV6qgBjz9WR4CrwTCHOjiwUBNnOz5Xgpgmbrl6VEL//8fgBuNFkRDSOCd+8s22vA5/87SRCacrPQj7moHyYDAPLeXbWDUJ9QTKXF7AYa3U4aDlC+GwktSwP1Mh3u36yAeuM2EZQGYb5PwipdKHtvUnP6o3HH3UGtBTtsGz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498286; c=relaxed/simple;
	bh=IH+XolWtqPFvFhWSO0d0H+xRzmkmbCi6g/vrcxlyvtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mg74mdLRe2rELhlLBqEwRczo8fOGZ0xhgQV0UBh7MqGfjR2G4apxmpG0PqeVU6ZpTXmkRDYEL9kOiTpGs5GOfMTj6btBdp9E6mpvY+N1aEQvqivfChJ1izlzduFmWBMXJJDYrRf/fy+w9fLq8++VjcBa6hde1nWIacMfWh7bi2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OfhEwWKa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454A4o04020058;
	Tue, 4 Jun 2024 10:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gk7zY2ZPeQyRtdCJQXxsfeqbBbyGIlxY6xUgeeqV1AY=; b=OfhEwWKahbWWxfPp
	JnmLzWzjD2wUiLK6NILDf5lWk20+ajS58+ncIZWFDj91fqIyNo5VK5feiBnuRw3l
	bT6iwzt2ntbfqUhz0a0fkvHWg91KLeYWATeeIXItcYn4y688rOUGNnhEqiMzglsb
	iPpOBOdQSj6D0Xz43gFDkQoyn2N7mohpcZhnrdKRAf0vSGjzDxzLZ3/OUkZ/hiK/
	LCayA6wxLvEc7aeTi/0Vn+ZxE118vRb+9EVIlS0L7ch/2KG8bAIiRrcRR6uIPilr
	pxOJPbF/yZlGUn16i3faPtO9FZaiiKVUS2LlS2npACMQPhM5ozzC7mEhPZAMXsKY
	gRzsZQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw6v6m94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 10:51:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454ApJie021037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 10:51:19 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 03:51:12 -0700
Message-ID: <18ff1bf2-be4d-4d82-a4b3-28242b1d1d59@quicinc.com>
Date: Tue, 4 Jun 2024 18:51:10 +0800
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
Content-Language: en-US
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
In-Reply-To: <a95fed63-f48d-42c6-856b-0636a50c9dd4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TLTaVQSmw2DZHDgnULcpj2v3uzMxBJXR
X-Proofpoint-ORIG-GUID: TLTaVQSmw2DZHDgnULcpj2v3uzMxBJXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406040088



On 6/3/2024 5:20 PM, Caleb Connolly wrote:
> Hi Tengfei,
> 
> On 29/05/2024 12:09, Tengfei Fan wrote:
>> QCS8550 is derived from SM8550. The difference between SM8550 and
>> QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly used
>> in IoT products.
>> QCS8550 firmware has different memory map compared to SM8550.
>> The memory map will be runtime added through bootloader.
>> There are 3 types of reserved memory regions here:
>> 1. Firmware related regions which aren't shared with kernel.
>>      The device tree source in kernel doesn't need to have node to
>> indicate
>> the firmware related reserved information. Bootloader converys the
>> information by updating devicetree at runtime.
>>      This will be described as: UEFI saves the physical address of the
>> UEFI System Table to dts file's chosen node. Kernel read this table and
>> add reserved memory regions to efi config table. Current reserved memory
>> region may have reserved region which was not yet used, release note of
>> the firmware have such kind of information.
> 
> Are you describing some particular quirk of the platform here, or just
> standard UEFI booting?

It's standard UEFI booting efi config table.
> 
> When booting with UEFI, the memory map is passed via the ESRT, so having
> memory that the kernel shouldn't use it pretty simple (and typical).

yes. It is very simple. And the bootloader firmware config the
"reserved" region in the efi config table from the uefi firmware.
>> 2. Firmware related memory regions which are shared with Kernel
>>      The device tree source in the kernel needs to include nodes that
>> indicate fimware-related shared information. A label name is suggested
>> because this type of shared information needs to be referenced by
>> specific drivers for handling purposes.
> 
> Again, is there something non-standard here? If not I would suggest
> dropping these detail comments as they might be misleading.

Detailed comments is used to describe current device tree reserved
memory regions.

Current patch is not creating a new mechanism to have memory map
described. But it is the first time qcom device trees use this design,
and have a simplified(also more compatible) device tree reserved memory
region(memory map). Previously, bootloader(apps bootloader) only pass
the whole physical memory base and size, and use reserved memory nodes
only in device tree(which is also a standard choose).

So that's why it is detailed comments for other qcom platform reference.

> 
> Thanks and regards,
>> 3. Remoteproc regions.
>>      Remoteproc regions will be reserved and then assigned to subsystem
>> firmware later.
>> Here is a reserved memory map for this platform:
>> 0x100000000 +-------------------+
>>              |                   |
>>              | Firmware Related  |
>>              |                   |
>>   0xd4d00000 +-------------------+
>>              |                   |
>>              | Kernel Available  |
>>              |                   |
>>   0xa7000000 +-------------------+
>>              |                   |
>>              | Remoteproc Region |
>>              |                   |
>>   0x8a800000 +-------------------+
>>              |                   |
>>              | Firmware Related  |
>>              |                   |
>>   0x80000000 +-------------------+
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8550.dtsi | 167 ++++++++++++++++++++++++++
>>   1 file changed, 167 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>> b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>> new file mode 100644
>> index 000000000000..685668c6ad14
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>> @@ -0,0 +1,167 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All
>> rights reserved.
>> + */
>> +
>> +#include "sm8550.dtsi"
>> +
>> +/delete-node/ &reserved_memory;
>> +
>> +/ {
>> +    reserved_memory: reserved-memory {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        ranges;
>> +
>> +
>> +        /* These are 3 types of reserved memory regions here:
>> +         * 1. Firmware related regions which aren't shared with kernel.
>> +         *     The device tree source in kernel doesn't need to have
>> node to
>> +         * indicate the firmware related reserved information.
>> Bootloader
>> +         * conveys the information by updating devicetree at runtime.
>> +         *     This will be described as: UEFI saves the physical
>> address of
>> +         * the UEFI System Table to dts file's chosen node. Kernel
>> read this
>> +         * table and add reserved memory regions to efi config table.
>> Current
>> +         * reserved memory region may have reserved region which was
>> not yet
>> +         * used, release note of the firmware have such kind of
>> information.
>> +         * 2. Firmware related memory regions which are shared with
>> Kernel
>> +         *     The device tree source in the kernel needs to include
>> nodes
>> +         * that indicate fimware-related shared information. A label
>> name
>> +         * is suggested because this type of shared information needs to
>> +         * be referenced by specific drivers for handling purposes.
>> +         * 3. Remoteproc regions.
>> +         *     Remoteproc regions will be reserved and then assigned to
>> +         * subsystem firmware later.
>> +         * Here is a reserved memory map for this platform:
>> +         * 0x100000000 +-------------------+
>> +         *             |                   |
>> +         *             | Firmware Related  |
>> +         *             |                   |
>> +         *  0xd4d00000 +-------------------+
>> +         *             |                   |
>> +         *             | Kernel Available  |
>> +         *             |                   |
>> +         *  0xa7000000 +-------------------+
>> +         *             |                   |
>> +         *             | Remoteproc Region |
>> +         *             |                   |
>> +         *  0x8a800000 +-------------------+
>> +         *             |                   |
>> +         *             | Firmware Related  |
>> +         *             |                   |
>> +         *  0x80000000 +-------------------+
>> +         */
>> +
>> +        /*
>> +         * Firmware related regions, bootloader will possible reserve
>> parts of
>> +         * region from 0x80000000..0x8a800000.
>> +         */
>> +        aop_image_mem: aop-image-region@81c00000 {
>> +            reg = <0x0 0x81c00000 0x0 0x60000>;
>> +            no-map;
>> +        };
>> +
>> +        aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
>> +            compatible = "qcom,cmd-db";
>> +            reg = <0x0 0x81c60000 0x0 0x20000>;
>> +            no-map;
>> +        };
>> +
>> +        aop_config_mem: aop-config-region@81c80000 {
>> +            no-map;
>> +            reg = <0x0 0x81c80000 0x0 0x20000>;
>> +        };
>> +
>> +        smem_mem: smem-region@81d00000 {
>> +            compatible = "qcom,smem";
>> +            reg = <0x0 0x81d00000 0x0 0x200000>;
>> +            hwlocks = <&tcsr_mutex 3>;
>> +            no-map;
>> +        };
>> +
>> +        adsp_mhi_mem: adsp-mhi-region@81f00000 {
>> +            reg = <0x0 0x81f00000 0x0 0x20000>;
>> +            no-map;
>> +        };
>> +
>> +        /* PIL region */
>> +        mpss_mem: mpss-region@8a800000 {
>> +            reg = <0x0 0x8a800000 0x0 0x10800000>;
>> +            no-map;
>> +        };
>> +
>> +        q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
>> +            reg = <0x0 0x9b000000 0x0 0x80000>;
>> +            no-map;
>> +        };
>> +
>> +        ipa_fw_mem: ipa-fw-region@9b080000 {
>> +            reg = <0x0 0x9b080000 0x0 0x10000>;
>> +            no-map;
>> +        };
>> +
>> +        ipa_gsi_mem: ipa-gsi-region@9b090000 {
>> +            reg = <0x0 0x9b090000 0x0 0xa000>;
>> +            no-map;
>> +        };
>> +
>> +        gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
>> +            reg = <0x0 0x9b09a000 0x0 0x2000>;
>> +            no-map;
>> +        };
>> +
>> +        spss_region_mem: spss-region@9b100000 {
>> +            reg = <0x0 0x9b100000 0x0 0x180000>;
>> +            no-map;
>> +        };
>> +
>> +        spu_secure_shared_memory_mem:
>> spu-secure-shared-memory-region@9b280000 {
>> +            reg = <0x0 0x9b280000 0x0 0x80000>;
>> +            no-map;
>> +        };
>> +
>> +        camera_mem: camera-region@9b300000 {
>> +            reg = <0x0 0x9b300000 0x0 0x800000>;
>> +            no-map;
>> +        };
>> +
>> +        video_mem: video-region@9bb00000 {
>> +            reg = <0x0 0x9bb00000 0x0 0x700000>;
>> +            no-map;
>> +        };
>> +
>> +        cvp_mem: cvp-region@9c200000 {
>> +            reg = <0x0 0x9c200000 0x0 0x700000>;
>> +            no-map;
>> +        };
>> +
>> +        cdsp_mem: cdsp-region@9c900000 {
>> +            reg = <0x0 0x9c900000 0x0 0x2000000>;
>> +            no-map;
>> +        };
>> +
>> +        q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
>> +            reg = <0x0 0x9e900000 0x0 0x80000>;
>> +            no-map;
>> +        };
>> +
>> +        q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
>> +            reg = <0x0 0x9e980000 0x0 0x80000>;
>> +            no-map;
>> +        };
>> +
>> +        adspslpi_mem: adspslpi-region@9ea00000 {
>> +            reg = <0x0 0x9ea00000 0x0 0x4080000>;
>> +            no-map;
>> +        };
>> +
>> +        /*
>> +         * Firmware related regions, bootloader will possible reserve
>> parts of
>> +         * region from 0xd8000000..0x100000000.
>> +         */
>> +        mpss_dsm_mem: mpss_dsm_region@d4d00000 {
>> +            reg = <0x0 0xd4d00000 0x0 0x3300000>;
>> +            no-map;
>> +        };
>> +    };
>> +};
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu

