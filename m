Return-Path: <linux-arm-msm+bounces-85728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86904CCCB2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 17:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 019F83009135
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 16:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE37382599;
	Thu, 18 Dec 2025 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELNv28mx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUpnggb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A534DB59
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766074724; cv=none; b=P4DS13IS3CxcQNbw487yXXcC08XSnhrR1Atq6vCxzjhLMxB4a55jzcinxZmNmk64EDaY77M+2HMGyrVclYAN0wUO3qX6/HuiORvWXBlpwz6EDjw7+PPuPASTay6Hev6gTgLtBh2upHkOpp/mU3RDH4H2bmijRDiFKSTBsTE3Ihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766074724; c=relaxed/simple;
	bh=9lwfQyGh9ICw26cZ+V5SaVhdjP6beNcTg0m82HeChCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKlzlM+Ao3pOgGl5XJ3oMzA4mo6GcUYLDi4m9Wyg0yGUdkziFtP69lDYCPkfA4+RSnJ6Xv6u1iRE0pnEqFArqx9qwv+GvdVI0NEjEcwwwplutfkhDup9cD+5OwuEWyZenoQ+pz90KPPMQ/dg7DM79QtORkSkq2VxNYt7WlKVlSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELNv28mx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUpnggb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8plOd813882
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 16:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49mhJQ/jrHbQv1dJMnM4FUPeTJrtrySwftZmt2C54xQ=; b=ELNv28mxwbt59oVf
	g2vH9JQvwMnss0etRZW6ftQap4CpS4Dx0MfkLJYGSxRZRu6wzmFFLRtiu0vWL+mf
	dPeumAfMu/Zo0JX9Q+atBtR43Zd3uuSgjFpkWpL8R0fXb7vgAZF8l0/65KW++73e
	jRiM0znuYjpqAlSu0ffmtBQGnayMVURY37VBq7Jkz1DumOfBiov0xdL8oNHugmGk
	RU4nYbH7J44LdW5UZz2S34DW91O8o4HQ0/Zd3ozb6peiu2wi+sg6sOWKuA/1eRiq
	FjRGYhxVxxv6derc+9XDA54OqQudLndGfugrxpVBDSkgqtnEZ+WoLIAgX5VJd2Xa
	nINu8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v7bqy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 16:18:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a089575ab3so11086845ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766074720; x=1766679520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49mhJQ/jrHbQv1dJMnM4FUPeTJrtrySwftZmt2C54xQ=;
        b=WUpnggb1Kxpoj5p7+tgeNCvCVEcQIT0+hR8We1fLD+xnmUfMyDwPdkqDirLbzV3Ob9
         +u7Di3a8M24NiP6sK6RbzsHNbJaDYWse8QhzKdgVnRojGRCv1trS81uiYchlGuhAIOpf
         Hvb6P2HPk/Xyxg23+rx7mulMlSHyRNjaPzXAZSwF7SqcE4IIjYdtPX2+oMFASpvSZN/t
         LzbRYTUzKC5zwRPwK09qRv2ehMT+IkBXaAnZKk4wGLGkHjHVBMdXbw/KM1nKRk5L1Pok
         CRDaYHcWogg1g9y0EnIjKpiIwEjapNHfHpuUkQAdU1jbBrWlrtBgsdvDjOJ6fJiEeXaZ
         J2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766074720; x=1766679520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49mhJQ/jrHbQv1dJMnM4FUPeTJrtrySwftZmt2C54xQ=;
        b=Uah3MZw7Z8B0zhtRj2XE7USX6qsTh5qV06s0I52lGnj5ltfRuS9rvwSpHpA3mKAX+o
         hx82N2/CwfSf4JPSmpYUuWvqs03PAUPkHDOumTiU2iEXNFgxNo8pc8hlE3p+Yzu9QhCq
         iu9OZQkQA0kZjYass4RMEXrG8hVdemXC2sVmXG9teIPe4+4oeHSdWAWH8Fx3RwjNJmNL
         F+4U0e5RvZTiFUxBADY0U2vP3QiCmRORHDtjtju8FD7PRor/kgqJ7gBaKFD4xrumqNlI
         gIl5LB8KR5JFXmowrRGk3ahpSQtqL9PARQtT0pQFaQUvfobcwxWEOnXTRicEZnO1bhZX
         uGzA==
X-Forwarded-Encrypted: i=1; AJvYcCXVCQAG9irDfrMGqysftfbNHhlXM3iFsx2WL3Ti7lM8I/OVv+8fbBGF5Reg/a529OyXAssmFYpvz3fSqLDM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ynhD7A2QkHpEqD9dzsnlfJCGrD8nio1AAxUrnuL1c4Ry1gkD
	7pXZkmoHlPy2GxbKKwJm80jdClicxuImRIBmVVKfJ5LxgG09tOsRqgdD7O8izyLW0A100076Mra
	zHULrY+QBHHg0jhcIaHZMyoQG5V+K31Wssiddx5+a0M/dxHHbICurm1sxH6kdm473euk3
X-Gm-Gg: AY/fxX7nBMqeGaXjOTjPg1jHCZTCD1ndBdGR63Fx7SJQh3/OAr4wgHmr6I61z5TGKz3
	zdwj0+CZlsCwqIfZHKBVAipSVJ2PDWExLh0Iz/2pgv4V320/cFpPjBTU7ngSCtOSz43HZuny9BL
	TNRztPnnfm/MWjSG7Pvk9niufg4htjRsUebcWUg5/tBqRIt4UpEDbDLktHL07F3Mxi90iD9st+1
	HhOnZ6+iH6scRtxTLHNjPN8XvyLvtOiBXzWR2OmjwIUYMsC1YCDzvpOEETRj+80QXdjLfCF0gdH
	ZG+MLaFMdwkt3LEnOBWmJP5PWh8EZKVREy4LhSbp3SNPwAAcflFQ8rThOFjMdfCozSiIpnDeJj8
	pYG+awYeNR8X54jp+9g6Tdu+oFqXLVOIYMCQrP7JBztH34DGJxI09YXafkbNfH/gILAtjTD4DCu
	KGh/FszMg7
X-Received: by 2002:a17:902:e804:b0:29d:975a:2123 with SMTP id d9443c01a7336-29f23d26f90mr168085995ad.60.1766074720251;
        Thu, 18 Dec 2025 08:18:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh5u7nqq5MOGjpt/BJtl//yyvyTmIozQTr8L7eklbEPOpymsqTOe2aOb1H/oKVEEJWLJfxLA==
X-Received: by 2002:a17:902:e804:b0:29d:975a:2123 with SMTP id d9443c01a7336-29f23d26f90mr168085475ad.60.1766074719461;
        Thu, 18 Dec 2025 08:18:39 -0800 (PST)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d1926d0csm29852265ad.71.2025.12.18.08.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 08:18:38 -0800 (PST)
Message-ID: <8cb8fad9-c54e-43a3-a769-5452119cc2a1@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 00:18:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        maulik.shah@oss.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jRd7-44axe6ffBnBytEzwsS_vsNaMiCX
X-Proofpoint-GUID: jRd7-44axe6ffBnBytEzwsS_vsNaMiCX
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=69442961 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CQXatAnIE5CuAcsigYkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEzNSBTYWx0ZWRfXwILj9DyzT8+U
 6NLiY+0ihzT4i+0qman8qUSIMibuWnznwaD5vMiYJkxw8Mk18VdfbdQaga43DHc/uhHUTv1EFDl
 PkxULMmhBAfIzEjbCdZMSD4yXMv3i2ViQgkndRjz5YFALKsm/wl2voyUph4De2V01I7KIXM/nUn
 7WMpoOGr2+GFaQ4uQt2J2vupki0sb8jP4dBr7J7DDbq48jNQTrB5LzbMpo+XCzdV10LTlhxyERQ
 4I1KBXMts3YS7TsvyE9FKZJMZDQALsCTLG54+ctQsHWhe3/Yl9XNDm3TnhuqdZLp3kJDWIydEF+
 FehFqf6nPAbo5QLZnTRGYNecUzWSP+/mf3wrKDVU7zPc7FxbqZXs34FoaqkQYhzC61tDCI6KId6
 odzpEoVt7/AZzf4P9bAC8SZI8fGCIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180135



On 12/18/2025 5:32 PM, Suzuki K Poulose wrote:
> Cc: Sudeep
> 
> On 18/12/2025 08:09, Yuanfang Zhang wrote:
>> This patch series adds support for CoreSight components local to CPU clusters,
>> including funnel, replicator, and TMC, which reside within CPU cluster power
>> domains. These components require special handling due to power domain
>> constraints.
>>
>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>> power domain. When the cluster enters low-power mode (LPM), their registers
>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>> out of LPM, making standard register access unreliable.
> 
> Why ? AFAIU, we have ways to tie the power-domain to that of the cluster
> and that can auto-magically keep the cluster power ON as long as you
> want to use them.
> 
> Suzuki
> 
Hi Suzuki

Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
cluster.
It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
the upstream Kernel.

Yuanfang

> 
>>
>> To address this, the series introduces:
>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>    device tree property.
>> - Implementing deferred probing: if associated CPUs are offline during
>>    probe, initialization is deferred until a CPU hotplug notifier detects
>>    the CPU coming online.
>> - Utilizing `smp_call_function_single()` to ensure register accesses
>>    (initialization, enablement, sysfs reads) are always executed on a
>>    powered CPU within the target cluster.
>> - Extending the CoreSight link `enable` callback to pass the `cs_mode`.
>>    This allows drivers to distinguish between SysFS and Perf modes and
>>    apply mode-specific logic.
>>
>> Jie Gan (1):
>>    arm64: dts: qcom: hamoa: add Coresight nodes for APSS debug block
>>
>> Yuanfang Zhang (11):
>>    dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>>    coresight: Pass trace mode to link enable callback
>>    coresight-funnel: Support CPU cluster funnel initialization
>>    coresight-funnel: Defer probe when associated CPUs are offline
>>    coresight-replicator: Support CPU cluster replicator initialization
>>    coresight-replicator: Defer probe when associated CPUs are offline
>>    coresight-replicator: Update management interface for CPU-bound devices
>>    coresight-tmc: Support probe and initialization for CPU cluster TMCs
>>    coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>    coresight-tmc: Update management interface for CPU-bound TMCs
>>    coresight-tmc: Defer probe when associated CPUs are offline
>>
>> Verification:
>>
>> This series has been verified on sm8750.
>>
>> Test steps for delay probe:
>>
>> 1. limit the system to enable at most 6 CPU cores during boot.
>> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
>> 3. check whether ETM6 and ETM7 have been probed.
>>
>> Test steps for sysfs mode:
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
>> cat /dev/tmc_etf1 >/tmp/etf1.bin
>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>> cat /dev/tmc_etf2 >/tmp/etf2.bin
>> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>>
>> Test steps for sysfs node:
>>
>> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
>>
>> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
>>
>> cat /sys/bus/coresight/devices/replicator*/mgmt/*
>>
>> Test steps for perf mode:
>>
>> perf record -a -e cs_etm//k -- sleep 5
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Use the qcom,cpu-bound-components device tree property to identify devices
>>    bound to a cluster.
>> - Refactor commit message.
>> - Introduce a supported_cpus field in the drvdata structure to record the CPUs
>>    that belong to the cluster where the local component resides.
>> - Link to v1: https://lore.kernel.org/r/20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com
>>
>> ---
>> Jie Gan (1):
>>        arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block
>>
>> Yuanfang Zhang (11):
>>        dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>>        coresight-funnel: Support CPU cluster funnel initialization
>>        coresight-funnel: Defer probe when associated CPUs are offline
>>        coresight-replicator: Support CPU cluster replicator initialization
>>        coresight-replicator: Defer probe when associated CPUs are offline
>>        coresight-replicator: Update management interface for CPU-bound devices
>>        coresight-tmc: Support probe and initialization for CPU cluster TMCs
>>        coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>        coresight-tmc: Update management interface for CPU-bound TMCs
>>        coresight-tmc: Defer probe when associated CPUs are offline
>>        coresight: Pass trace mode to link enable callback
>>
>>   .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   5 +
>>   .../arm/arm,coresight-dynamic-replicator.yaml      |   5 +
>>   .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   5 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 926 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
>>   drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>>   drivers/hwtracing/coresight/coresight-funnel.c     | 258 +++++-
>>   drivers/hwtracing/coresight/coresight-replicator.c | 341 +++++++-
>>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 387 +++++++--
>>   drivers/hwtracing/coresight/coresight-tmc-etf.c    | 106 ++-
>>   drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>>   drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>>   drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>>   include/linux/coresight.h                          |   3 +-
>>   14 files changed, 1902 insertions(+), 169 deletions(-)
>> ---
>> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
>> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
>>
>> Best regards,
> 


