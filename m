Return-Path: <linux-arm-msm+bounces-49425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED471A45654
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8A4170252
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 07:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEF126B958;
	Wed, 26 Feb 2025 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tg5eUGcg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56D326BD8C;
	Wed, 26 Feb 2025 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740553539; cv=none; b=h10oNBLV42S278mg8mvzC5WFgHuqJMz37H7i0jsPSqanhDtNGJMnXyq34StrYZ1kYP2ALsvXtIxjpPhwPBBu4+LBPka13pnVEHepyRNp7jGsY+iz2UuNQbEByCLtEpuBk5xfJ6/9MvOSNfmUsEf0Vn22dwkHDN8UiiWRo2OQ2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740553539; c=relaxed/simple;
	bh=tS6D1xM1KYuN66M1L4lMjCK+ICR/1V//u/PQCzNE6Vw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=dQ3wD6Ci125RvfpV+U/5U2pP71EeCU4iuEggEVwSyg4+tDopFM/ig45FvZfttmPXpR31tRdL+/upWmAcMWjHHSsHbyD9qUIwmmCpKD69OS3sblvmIawPeQ5jwsF85OtZwNXWv3qHz8sWWsqYUcSQZJRfHIUCn4Dsx3swSxjXhA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tg5eUGcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMXW9f025583;
	Wed, 26 Feb 2025 07:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaQzoCs3Zw9VXe/sQVOhnMVotHeAsAZdnujMalOQT8c=; b=Tg5eUGcghHb81LE2
	jKoC7vh4uo505lQrxDxDkTORAacXLN//hgtQC8EfITixgMOpanbEljWyaDbhNdXW
	P1alkCAv1W15K5cvMbwBAQeJmtOopAZc5vMfsVP4VA9/qZxXWPYpOQsE6dromzx1
	F/rmLQAFpHmYHfleSs2eyTiN4GQF8WKgKtfihsMWGZVyR/sX8eSheqXmMKFpXCsA
	MWId9PK6To4KDx1Qlo7mnsG3PItzJ6fHDeG+zepSPwAY2zEEO/PQBQ4QkS+nK0Pc
	IQyKHPBPAH5zAXAVpoSkhdP/l6uR+M6h6l3zBIPsM9xxUdZheAekYYcZIt0Gq71m
	nVGg0A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmh2ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:05:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q75LBZ004877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:05:21 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 23:05:16 -0800
Message-ID: <627fdd72-4383-4172-9a51-c77ea32b7c60@quicinc.com>
Date: Wed, 26 Feb 2025 15:05:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/10] Coresight: Add Coresight TMC Control Unit
 driver
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250226041342.53933-1-quic_jiegan@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250226041342.53933-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pRA4g7_k6bHbwcLYhmdR58Uz-2HvNgfo
X-Proofpoint-ORIG-GUID: pRA4g7_k6bHbwcLYhmdR58Uz-2HvNgfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260055



On 2/26/2025 12:13 PM, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 

[...]
Hi, James

Sorry for the mistake, I just found I forget to add the co-developed-by 
tag to patch(5/10), patch(6/10) after the division.

Do I need resend the patch series?

Jie

> 
> Sincere thanks to James Clark for providing an excellent idea to handle
> the trace_id of the path.
> 
> ---
> Changes in V14:
> 1. Drop the reviewed-by tag for previous patch: Coresight-Introduce-a-new-struct-coresight_path
>     due to a massive modification.
> 2. Split the patch, Coresight-Introduce-a-new-struct-coresight_path, into
>     four patches.
>     - Coresight-Introduce-a-new-struct-coresight_path
>     - Coresight-Allocate-trace-ID-after-building-the-path
>     - Coresight-Change-to-read-the-trace-ID-from-coresight_path
>     - Coresight-Change-functions-to-accept-the-coresight_path
> 3. Change the type of the coresight_path_assign_trace_id function to void.
> 4. Change the type of the path_list from struct list_head * to struct list_head to avoid
>     extra memory allocate/free.
> 5. Rename the file coresight-ctcu.c to coresight-ctcu-core.c to improve scalibility.
> 6. Add pm_ops for CTCU driver.
> 7. Rename the struct ctcu_atid_config to ctcu_etr_config to improve scalibility.
> 8. Optimize following functions of the CTCU driver to improve readability.
>     - ctcu_program_atid_register
>     - __ctcu_set_etr_traceid
> 9. Change the way to get the port number. The new solution is searching
>     the sink device from CTCU's view.
> 10. Add desc.access for CTCU driver.
> Link to V13 - https://lore.kernel.org/linux-arm-msm/20250221060543.2898845-1-quic_jiegan@quicinc.com/
> ---
> 
> ---
> Changes in V13:
> 1. Move the trace_id callback to coresight_ops to simplify the code.
> Link to V12 - https://lore.kernel.org/linux-arm-msm/20250217093024.1133096-1-quic_jiegan@quicinc.com/
> ---
> 
> ---
> Changes in V12:
> 1. Update the method for allocating trace_id for perf mode.
> Link to V11 - https://lore.kernel.org/linux-arm-msm/20250214024021.249655-1-quic_jiegan@quicinc.com/
> ---
> 
> ---
> Changes in V11:
> 1. Add reviewed-by tag to patch(2/7), (4/7), (6/7). Patch(3/7) is
>     contributed by James, so didnot add reviewed-by tag of James.
> 2. Fix warning reported by kernel bot and verified with build(W=1).
> 3. Restore to the original logic that responsible for allocate trace_id
>     of ETM device in perf mode according to James' comment.
> Link to V10 - https://lore.kernel.org/linux-arm-msm/20250207064213.2314482-1-quic_jiegan@quicinc.com/
> ---
> 
> ---
> Changes in V10:
> 1. Introduce a new API to allocate and read trace_id after path is built.
> 2. Introduce a new API to allocate and read trace_id of ETM device.
> 3. Add a new patch: [PATCH v10 3/7] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
> 4. Remove perf handle from coresight_path.
> 5. Use u8 instead of atomic_t for traceid_refcnt.
> 6. Optimize the part of code in CTCU drvier that is responsible for program atid register.
> Link to V9 - https://lore.kernel.org/all/20250124072537.1801030-1-quic_jiegan@quicinc.com/
> 
> Changes in V9:
> 1. Rebased on tag next-20250113.
> 2. Separate the previous trace_id patch (patch 2/5 Coresight: Add trace_id function to
>     retrieving the trace ID) into two patches.
> 3. Introduce a new struct coresight_path instead of cs_sink_data which was
>     created in previous version. The coresight_path will be initialized
>     and constructed in coresight_build_path function and released by
>     coresight_release_path function.
>     Detail of the struct coresight_path is shown below:
> /**
>   * struct coresight_path - data needed by enable/disable path
>   * @path:               path from source to sink.
>   * @trace_id:           trace_id of the whole path.
>   */
> struct coresight_path {
>          struct list_head                *path;
>          u8                              trace_id;
> };
> 
> 4. Introduce an array of atomic in CTCU driver to represent the refcnt or each
>     enabled trace_id for each sink. The reason is there is a scenario that more
>     than one TPDM device physically connected to the same TPDA device has
>     been enabled. The CTCU driver must verify the refcnt before resetting the
>     bit of the atid register according to the trace_id of the TPDA device.
> 5. Remove redundant codes in CTCU driver.
> 6. Add reviewed-by tag to the commit message for APB clock path(patch
>     1/5).
> Link to V8 - https://lore.kernel.org/all/20241226011022.1477160-1-quic_jiegan@quicinc.com/
> 
> Changes in V8:
> 1. Rebased on tag next-20241220.
> 2. Use raw_spinlock_t instead of spinlock_t.
> 3. Remove redundant codes in CTCU driver:
>     - Eliminate unnecessary parameter validations.
>     - Correct log level when an error occurs.
>     - Optimize codes.
> 4. Correct the subject prefix for DT patch.
> 5. Collected reviewed-by tag from Konrad Dybcib for DT patch.
> Link to V7 - https://lore.kernel.org/all/20241210031545.3468561-1-quic_jiegan@quicinc.com/
> 
> Changes in V7:
> 1. Rebased on tag next-20241204.
> 2. Fix format issue for dts patch.
>     - Padding the address part to 8 digits
> Link to V6 - https://lore.kernel.org/linux-arm-msm/20241009112503.1851585-1-quic_jiegan@quicinc.com/
> 
> Changes in V6:
> 1. Collected reviewed-by tag from Rob for dt-binding patch.
> 2. Rebased on tag next-20241008.
> 3. Dropped all depends-on tags.
> Link to V5 - https://lore.kernel.org/linux-arm-msm/20240909033458.3118238-1-quic_jiegan@quicinc.com/
> 
> Changes in V5:
> 1. Fix the format issue for description paragrah in dt binding file.
> 2. Previous discussion for why use "in-ports" property instead of "ports".
> Link to V4 - https://lore.kernel.org/linux-arm-msm/20240828012706.543605-1-quic_jiegan@quicinc.com/
> 
> Changes in V4:
> 1. Add TMC description in binding file.
> 2. Restrict the number of ports for the CTCU device to a range of 0 to 1 in the binding file,
>     because the maximum number of CTCU devices is 2 for existing projects.
> Link to V3 - https://lore.kernel.org/linux-arm-kernel/20240812024141.2867655-1-quic_jiegan@quicinc.com/
> 
> Changes in V3:
> 1. Rename the device to Coresight TMC Control Unit(CTCU).
> 2. Introduce a new way to define the platform related configs. The new
>     structure, qcom_ctcu_config, is used to store configurations specific
>     to a platform. Each platform should have its own qcom_ctcu_config structure.
> 3. In perf mode, the ETM devices allocate their trace IDs using the
>     perf_sink_id_map. In sysfs mode, the ETM devices allocate their trace
>     IDs using the id_map_default.
> 4. Considering the scenario where both ETR devices might be enabled simultaneously
>     with multiple sources, retrieving and using trace IDs instead of id_map is more effective
>     for the CTCU device in sysfs mode. For example, We can configure one ETR as sink for high
>     throughput trace data like ETM and another ETR for low throughput trace data like STM.
>     In this case, STM data won’t be flushed out by ETM data quickly. However, if we use id_map to
>     manage the trace IDs, we need to create a separate id_map for each ETR device. Addtionally, We
>     would need to iterate through the entire id_map for each configuration.
> 5. Add support for apb's clock name "apb". If the function fails to obtain the clock with
>     the name "apb_pclk", it will attempt to acquire the clock with the name "apb".
> Link to V2 - https://lore.kernel.org/linux-arm-msm/20240705090049.1656986-1-quic_jiegan@quicinc.com/T/#t
> 
> Changes in V2:
> 1. Rename the device to Coresight Control Unit.
> 2. Introduce the trace_id function pointer to address the challeng how to
>     properly collect the trace ID of the device.
> 3. Introduce a new way to define the qcom,ccu-atid-offset property in
> device tree.
> 4. Disabling the filter function blocked on acquiring the ATID-offset,
>     which will be addressed in a separate patch once it’s ready.
> Link to V1 - https://lore.kernel.org/lkml/20240618072726.3767974-1-quic_jiegan@quicinc.com/T/#t
> ---
> 
> James Clark (1):
>    Coresight: Use coresight_etm_get_trace_id() in traceid_show()
> 
> Jie Gan (9):
>    Coresight: Add support for new APB clock name
>    Coresight: Add trace_id function to retrieving the trace ID
>    Coresight: Introduce a new struct coresight_path
>    Coresight: Move trace_id to coresight_path and allocate it after
>      building the path
>    Coresight: Change to read the trace ID from coresight_path
>    Coresight: Change functions to accept the coresight_path
>    dt-bindings: arm: Add Coresight TMC Control Unit hardware
>    Coresight: Add Coresight TMC Control Unit driver
>    arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  84 +++++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 153 ++++++++
>   drivers/hwtracing/coresight/Kconfig           |  12 +
>   drivers/hwtracing/coresight/Makefile          |   2 +
>   drivers/hwtracing/coresight/coresight-core.c  | 122 +++++--
>   .../hwtracing/coresight/coresight-ctcu-core.c | 326 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  39 +++
>   drivers/hwtracing/coresight/coresight-dummy.c |  15 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  27 +-
>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>   .../coresight/coresight-etm3x-core.c          |  55 +--
>   .../coresight/coresight-etm3x-sysfs.c         |   3 +-
>   .../coresight/coresight-etm4x-core.c          |  55 +--
>   .../coresight/coresight-etm4x-sysfs.c         |   4 +-
>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>   drivers/hwtracing/coresight/coresight-priv.h  |  14 +-
>   drivers/hwtracing/coresight/coresight-stm.c   |  13 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 +-
>   drivers/hwtracing/coresight/coresight-tpda.c  |  11 +
>   drivers/hwtracing/coresight/coresight-tpdm.c  |   2 +-
>   include/linux/coresight.h                     |  27 +-
>   22 files changed, 824 insertions(+), 161 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-core.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
> 


