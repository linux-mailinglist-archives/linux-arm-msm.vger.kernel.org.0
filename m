Return-Path: <linux-arm-msm+bounces-19802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D98C452D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 18:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60C9C2854B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 16:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AEF12B83;
	Mon, 13 May 2024 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V+E6KIUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207941C6A8;
	Mon, 13 May 2024 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715618270; cv=none; b=bOaIQOry4LWhuhLY7IJUSq7CSNYtjL6SyIYovI98nSsIdizD/Ei1KRl0s+bw14B2vZpnKyKdFOMvEdWl6PjfJmFbD4lpHP/D4Bve34ja6FHLMRZGvmd/fExZhUfPtra2/z46j/uxYh7eLOEu+EO238SE49t3DN5bGf/SrzWZm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715618270; c=relaxed/simple;
	bh=X18vwAxlVG0UKTCuKLQ28hp2uw3lgPZsOtm11sImz1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bbXH8x9W5KnKAJeLy5C1AhiPtAlB2e/ptLBHPwCcnMIu38qXdE/zfcyzu9HtcDN+N0GmCbRauVcYwZTftXey4mXElPp/QoheQJl9dIdaONJi3nQ4YKhZWX8LcXPaE8Cl/YWztGBtvSIfOqf0uj0zBiSCns57F3xSTXBsqAFxgSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V+E6KIUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DCVWWj017846;
	Mon, 13 May 2024 16:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=W5arlA8MXtY+9NSAQzAXJc9YmqjS5maGVc0JDRCzk00=; b=V+
	E6KIUqAqgoN65ziKpd/rqx3KKAvDaOueUKJsvLma69RgjmcJBwGGnVbrku14hh2/
	AxadMF6ikIxxw15UbWfdqlD0an8XhmMFYLaBYDF0cRSc6szyaTkw512MDBsriT/u
	LlnKgCSrY08KeDGyU753pPSniRiuYH8Gx3jzNBVAMhVceh9R7+smzucdsgYuQE6v
	7/+2sR5CNApV9kfpfcCgzeiVBgfSwwM0t5W2lSvajyysPyvLlzbTbKUMhxLg8H9d
	k+P/9YL8hcIvd7XfNR8dfgrS5OZtLmRHNiJmj3J80/zZ9/Fqdla5MVCd5GIFN9Hr
	bPUxbvrt1MQBlCfB6Vaw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21edby9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 16:37:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DGbV8t009351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 16:37:31 GMT
Received: from [10.110.48.61] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 09:37:27 -0700
Message-ID: <ce8bc51b-a8b3-259c-f70c-d240d7b166cc@quicinc.com>
Date: Mon, 13 May 2024 09:37:26 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
Content-Language: en-US
To: Tengfei Fan <quic_tengfan@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240513090735.1666142-1-quic_tengfan@quicinc.com>
 <20240513090735.1666142-3-quic_tengfan@quicinc.com>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20240513090735.1666142-3-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YjorLMcRRo1bcy5TzRutdL8oOvFAKhcn
X-Proofpoint-ORIG-GUID: YjorLMcRRo1bcy5TzRutdL8oOvFAKhcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_11,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130108

On 5/13/2024 2:07 AM, Tengfei Fan wrote:
> QCS8550 is derived from SM8550. The differnece between SM8550 and

spellcheck s/difference/difference 

> QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly used
> in IoT scenarios.

IoT products and not scenarios. 

> QCS8550 firmware has different memory map with SM8550 firmware. 

"QCS8550 firmware has different memory map compared to SM8550"


The
> memory map will be runtime added through bootloader.


> There are 3 types of reserved memory regions here:
> 1. Firmware related regions which aren't shared with kernel.
>     The device tree source in kernel doesn't need to have node to indicate
> the firmware related reserved information. OS bootloader conveys the

Just "Bootloader conveys the information by updating devicetree at runtime" ?

> information by update device tree in runtime.
>     This will be described as: UEFI saves the physical address of the
> UEFI System Table to dts file's chosen node. Kernel read this table and
> add reserved memory regions to efi config table. Current reserved memory
> region may have reserved region which was not yet used, release note of
> the firmware have such kind of information.

I understand what you are trying to explain below, but can we simplify further? I 
had to read multiple times to understand what you are trying to convey above. 

> 2. Firmware related memory regions which are shared with Kernel
>     Each region has a specific node with specific label name for later
> phandle reference from other driver dt node.
> 3. PIL regions.

Do we use the PIL - peripheral image loader in the upstream kernel or just remoteproc?
I am fine w/ PIL if it is used at other places in Qualcomm remoteproc. 

>     PIL regions will be reserved and then assigned to subsystem firmware
> later.
> Here is a reserved memory map for this platform:
> 0x100000000 +------------------+
>             |                  |
>             | Firmware Related |
>             |                  |
>  0xd4d00000 +------------------+
>             |                  |
>             | Kernel Available |

What is "kernel available" means? 

>             |                  |
>  0xa7000000 +------------------+
>             |                  |
>             |    PIL Region    |
>             |                  |
>  0x8a800000 +------------------+
>             |                  |
>             | Firmware Related |
>             |                  |
>  0x80000000 +------------------+

> Note that:

Do we need to write "Note that:" ? 

> 0xa7000000..0xA8000000 is used by bootloader, when kernel boot up,
> it is available for kernel usage. This region is not suggested to be
> used by kernel features like ramoops, suspend resume etc.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8550.dtsi | 169 ++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> new file mode 100644
> index 000000000000..a3ebf3d4e16d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "sm8550.dtsi"
> +
> +/delete-node/ &reserved_memory;
> +
> +/ {
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +
> +		/* These are 3 types of reserved memory regions here:
> +		 * 1. Firmware related regions which aren't shared with kernel.
> +		 *     The device tree source in kernel doesn't need to have node to
> +		 * indicate the firmware related reserved information. OS bootloader
> +		 * conveys the information by update device tree in runtime.
> +		 *     This will be described as: UEFI saves the physical address of
> +		 * the UEFI System Table to dts file's chosen node. Kernel read this
> +		 * table and add reserved memory regions to efi config table. Current
> +		 * reserved memory region may have reserved region which was not yet
> +		 * used, release note of the firmware have such kind of information.
> +		 * 2. Firmware related memory regions which are shared with Kernel.
> +		 *     Each region has a specific node with specific label name for
> +		 * later phandle reference from other driver dt node.
> +		 * 3. PIL regions.
> +		 *     PIL regions will be reserved and then assigned to subsystem
> +		 * firmware later.
> +		 * Here is a reserved memory map for this platform:

Just check the comment above and it will apply here. 

> +		 * 0x100000000 +------------------+
> +		 *             |                  |
> +		 *             | Firmware Related |
> +		 *             |                  |
> +		 *  0xd4d00000 +------------------+
> +		 *             |                  |
> +		 *             | Kernel Available |
> +		 *             |                  |
> +		 *  0xa7000000 +------------------+
> +		 *             |                  |
> +		 *             |    PIL Region    |
> +		 *             |                  |
> +		 *  0x8a800000 +------------------+
> +		 *             |                  |
> +		 *             | Firmware Related |
> +		 *             |                  |
> +		 *  0x80000000 +------------------+
> +		 * Note that:
> +		 * 0xa7000000..0xA8000000 is used by bootloader, when kernel boot up,
> +		 * it is available for kernel usage. This region is not suggested to
> +		 * be used by kernel features like ramoops, suspend resume etc.
> +		 */
> +
> +		/*
> +		 * Firmware related regions, bootlader will possible reserve parts of

spellcheck s/bootlader/bootloader

> +		 * region from 0x80000000..0x8a800000.
> +		 */
> +		aop_image_mem: aop-image-region@81c00000 {
> +			reg = <0x0 0x81c00000 0x0 0x60000>;
> +			no-map;
> +		};
> +
> +		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x81c60000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		aop_config_mem: aop-config-region@81c80000 {
> +			no-map;
> +			reg = <0x0 0x81c80000 0x0 0x20000>;
> +		};
> +
> +		smem_mem: smem-region@81d00000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x81d00000 0x0 0x200000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		adsp_mhi_mem: adsp-mhi-region@81f00000 {
> +			reg = <0x0 0x81f00000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		/* PIL region */
> +		mpss_mem: mpss-region@8a800000 {
> +			reg = <0x0 0x8a800000 0x0 0x10800000>;
> +			no-map;
> +		};
> +
> +		q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
> +			reg = <0x0 0x9b000000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: ipa-fw-region@9b080000 {
> +			reg = <0x0 0x9b080000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: ipa-gsi-region@9b090000 {
> +			reg = <0x0 0x9b090000 0x0 0xa000>;
> +			no-map;
> +		};
> +
> +		gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
> +			reg = <0x0 0x9b09a000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		spss_region_mem: spss-region@9b100000 {
> +			reg = <0x0 0x9b100000 0x0 0x180000>;
> +			no-map;
> +		};
> +
> +		spu_secure_shared_memory_mem: spu-secure-shared-memory-region@9b280000 {
> +			reg = <0x0 0x9b280000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		camera_mem: camera-region@9b300000 {
> +			reg = <0x0 0x9b300000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		video_mem: video-region@9bb00000 {
> +			reg = <0x0 0x9bb00000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		cvp_mem: cvp-region@9c200000 {
> +			reg = <0x0 0x9c200000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp-region@9c900000 {
> +			reg = <0x0 0x9c900000 0x0 0x2000000>;
> +			no-map;
> +		};
> +
> +		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
> +			reg = <0x0 0x9e900000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
> +			reg = <0x0 0x9e980000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		adspslpi_mem: adspslpi-region@9ea00000 {
> +			reg = <0x0 0x9ea00000 0x0 0x4080000>;
> +			no-map;
> +		};
> +
> +		/*
> +		 * Firmware related regions, bootlader will possible reserve parts of

Ditto. 

> +		 * region from 0xd8000000..0x100000000.
> +		 */
> +		mpss_dsm_mem: mpss_dsm_region@d4d00000 {
> +			reg = <0x0 0xd4d00000 0x0 0x3300000>;
> +			no-map;
> +		};
> +	};
> +};
-- 
---Trilok Soni


