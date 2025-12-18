Return-Path: <linux-arm-msm+bounces-85735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE0CCCF08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 18:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07BF030191BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 17:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1554734D3B0;
	Thu, 18 Dec 2025 17:04:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB2434AB07;
	Thu, 18 Dec 2025 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766077458; cv=none; b=LNrmXkQHmI7/TlQyMBCGNblrf0GtawAjo8G9upES+dxJB9KQfPbRbYKMe+mHedfRwT9DOTrDSyMloIu3DgutUBeOEc72OUA1D2R/W3jPXAW4c+qZgKNb8IHVlicOz0W8CkNji6zbL030mAgjsFU98saun9PXi0Qo/kmOTl1nr/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766077458; c=relaxed/simple;
	bh=0qfzhWIRN/LX5OBVH0cKx+HcEmq870kWDLXVUz8oZH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVDiYP6RBf1UAh9GdnIT5zrjTHLqCOuBnegsCLgIsJ+YIDFdj3dsYL/F1xqhaTRceSd/LPbxVSUjlZ0WO28HUKOaG2PtnU19cdiGZwzHj8dr4t81yFQJA2fQmOrS0LQdfjEkgme5wBwgs37EDLifzNz87UnmE7Aymo1mPGUHyXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42A4AFEC;
	Thu, 18 Dec 2025 09:04:06 -0800 (PST)
Received: from [10.57.74.203] (unknown [10.57.74.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94D973F73F;
	Thu, 18 Dec 2025 09:04:09 -0800 (PST)
Message-ID: <3d4dd3d0-fca0-45ac-a833-e8f7f5d1aa95@arm.com>
Date: Thu, 18 Dec 2025 17:04:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
Content-Language: en-GB
To: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 maulik.shah@oss.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
 <8cb8fad9-c54e-43a3-a769-5452119cc2a1@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <8cb8fad9-c54e-43a3-a769-5452119cc2a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/12/2025 16:18, yuanfang zhang wrote:
> 
> 
> On 12/18/2025 5:32 PM, Suzuki K Poulose wrote:
>> Cc: Sudeep
>>
>> On 18/12/2025 08:09, Yuanfang Zhang wrote:
>>> This patch series adds support for CoreSight components local to CPU clusters,
>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>> domains. These components require special handling due to power domain
>>> constraints.
>>>
>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>>> power domain. When the cluster enters low-power mode (LPM), their registers
>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>>> out of LPM, making standard register access unreliable.
>>
>> Why ? AFAIU, we have ways to tie the power-domain to that of the cluster
>> and that can auto-magically keep the cluster power ON as long as you
>> want to use them.
>>
>> Suzuki
>>
> Hi Suzuki
> 
> Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
> CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
> cluster.
> It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
> implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
> the upstream Kernel.

Why does it need to wake up the CPU ? The firmware can power up the
cluster right? Anyways, to me this all looks like working around a
firmware issue. I will let you sort this out with Sudeep's response
, as I am not an expert on the cluster powermanagement and standards.

Suzuki



> 
> Yuanfang
> 
>>
>>>
>>> To address this, the series introduces:
>>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>>     device tree property.
>>> - Implementing deferred probing: if associated CPUs are offline during
>>>     probe, initialization is deferred until a CPU hotplug notifier detects
>>>     the CPU coming online.
>>> - Utilizing `smp_call_function_single()` to ensure register accesses
>>>     (initialization, enablement, sysfs reads) are always executed on a
>>>     powered CPU within the target cluster.
>>> - Extending the CoreSight link `enable` callback to pass the `cs_mode`.
>>>     This allows drivers to distinguish between SysFS and Perf modes and
>>>     apply mode-specific logic.
>>>
>>> Jie Gan (1):
>>>     arm64: dts: qcom: hamoa: add Coresight nodes for APSS debug block
>>>
>>> Yuanfang Zhang (11):
>>>     dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>>>     coresight: Pass trace mode to link enable callback
>>>     coresight-funnel: Support CPU cluster funnel initialization
>>>     coresight-funnel: Defer probe when associated CPUs are offline
>>>     coresight-replicator: Support CPU cluster replicator initialization
>>>     coresight-replicator: Defer probe when associated CPUs are offline
>>>     coresight-replicator: Update management interface for CPU-bound devices
>>>     coresight-tmc: Support probe and initialization for CPU cluster TMCs
>>>     coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>>     coresight-tmc: Update management interface for CPU-bound TMCs
>>>     coresight-tmc: Defer probe when associated CPUs are offline
>>>
>>> Verification:
>>>
>>> This series has been verified on sm8750.
>>>
>>> Test steps for delay probe:
>>>
>>> 1. limit the system to enable at most 6 CPU cores during boot.
>>> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
>>> 3. check whether ETM6 and ETM7 have been probed.
>>>
>>> Test steps for sysfs mode:
>>>
>>> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>>> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
>>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>>> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
>>> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>>>
>>> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>>> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
>>> cat /dev/tmc_etf1 >/tmp/etf1.bin
>>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>>> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>>>
>>> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>>> cat /dev/tmc_etf2 >/tmp/etf2.bin
>>> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
>>> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>>>
>>> Test steps for sysfs node:
>>>
>>> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
>>>
>>> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
>>>
>>> cat /sys/bus/coresight/devices/replicator*/mgmt/*
>>>
>>> Test steps for perf mode:
>>>
>>> perf record -a -e cs_etm//k -- sleep 5
>>>
>>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Use the qcom,cpu-bound-components device tree property to identify devices
>>>     bound to a cluster.
>>> - Refactor commit message.
>>> - Introduce a supported_cpus field in the drvdata structure to record the CPUs
>>>     that belong to the cluster where the local component resides.
>>> - Link to v1: https://lore.kernel.org/r/20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com
>>>
>>> ---
>>> Jie Gan (1):
>>>         arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block
>>>
>>> Yuanfang Zhang (11):
>>>         dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>>>         coresight-funnel: Support CPU cluster funnel initialization
>>>         coresight-funnel: Defer probe when associated CPUs are offline
>>>         coresight-replicator: Support CPU cluster replicator initialization
>>>         coresight-replicator: Defer probe when associated CPUs are offline
>>>         coresight-replicator: Update management interface for CPU-bound devices
>>>         coresight-tmc: Support probe and initialization for CPU cluster TMCs
>>>         coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>>         coresight-tmc: Update management interface for CPU-bound TMCs
>>>         coresight-tmc: Defer probe when associated CPUs are offline
>>>         coresight: Pass trace mode to link enable callback
>>>
>>>    .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   5 +
>>>    .../arm/arm,coresight-dynamic-replicator.yaml      |   5 +
>>>    .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   5 +
>>>    arch/arm64/boot/dts/qcom/hamoa.dtsi                | 926 +++++++++++++++++++++
>>>    arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
>>>    drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>>>    drivers/hwtracing/coresight/coresight-funnel.c     | 258 +++++-
>>>    drivers/hwtracing/coresight/coresight-replicator.c | 341 +++++++-
>>>    drivers/hwtracing/coresight/coresight-tmc-core.c   | 387 +++++++--
>>>    drivers/hwtracing/coresight/coresight-tmc-etf.c    | 106 ++-
>>>    drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>>>    drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>>>    drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>>>    include/linux/coresight.h                          |   3 +-
>>>    14 files changed, 1902 insertions(+), 169 deletions(-)
>>> ---
>>> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
>>> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
>>>
>>> Best regards,
>>
> 


