Return-Path: <linux-arm-msm+bounces-85665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D3CCB32D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 10:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07E5530813C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D903314C4;
	Thu, 18 Dec 2025 09:32:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580B2330D42;
	Thu, 18 Dec 2025 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766050339; cv=none; b=auMEbj295cFtQvwd6PhI7wIFcuSXxXONl0MYhhNFm9b8RmHU5FzVFgalo9xV3UV6lsDwZzHeGT7EZ07rqgEuSdVSgwuzH1jYwaw5o2+gj8qeJjbefuGCcpJe+rKERWMI86M9N9cG1eaHBpbVQL3Kz9sPf+ahfSrnAGkB905dbuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766050339; c=relaxed/simple;
	bh=TwO7+GLcv+AO8TPL9+vGTYjfBi6TdtGZ7btTxoeogYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7DiN9eVmtgJrGBfz9PvK9T3npgwBc09Job/B7YN9hv1/MI0i6rS5jPmWGR/RU+yMGDYqEbK7bMvr3iC2ckifrWgfFyadYgPvRlVF0iBOftg4Qi90PJN2PARl6J4jMkbxjlLXgiWbni5KIKS5EH0J0+YI8iJVyTU+sVEZEka9fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1B6FEC;
	Thu, 18 Dec 2025 01:32:09 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D542A3F762;
	Thu, 18 Dec 2025 01:32:13 -0800 (PST)
Message-ID: <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
Date: Thu, 18 Dec 2025 09:32:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
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
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Cc: Sudeep

On 18/12/2025 08:09, Yuanfang Zhang wrote:
> This patch series adds support for CoreSight components local to CPU clusters,
> including funnel, replicator, and TMC, which reside within CPU cluster power
> domains. These components require special handling due to power domain
> constraints.
> 
> Unlike system-level CoreSight devices, these components share the CPU cluster's
> power domain. When the cluster enters low-power mode (LPM), their registers
> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
> out of LPM, making standard register access unreliable.

Why ? AFAIU, we have ways to tie the power-domain to that of the cluster
and that can auto-magically keep the cluster power ON as long as you
want to use them.

Suzuki


> 
> To address this, the series introduces:
> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>    device tree property.
> - Implementing deferred probing: if associated CPUs are offline during
>    probe, initialization is deferred until a CPU hotplug notifier detects
>    the CPU coming online.
> - Utilizing `smp_call_function_single()` to ensure register accesses
>    (initialization, enablement, sysfs reads) are always executed on a
>    powered CPU within the target cluster.
> - Extending the CoreSight link `enable` callback to pass the `cs_mode`.
>    This allows drivers to distinguish between SysFS and Perf modes and
>    apply mode-specific logic.
> 
> Jie Gan (1):
>    arm64: dts: qcom: hamoa: add Coresight nodes for APSS debug block
> 
> Yuanfang Zhang (11):
>    dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>    coresight: Pass trace mode to link enable callback
>    coresight-funnel: Support CPU cluster funnel initialization
>    coresight-funnel: Defer probe when associated CPUs are offline
>    coresight-replicator: Support CPU cluster replicator initialization
>    coresight-replicator: Defer probe when associated CPUs are offline
>    coresight-replicator: Update management interface for CPU-bound devices
>    coresight-tmc: Support probe and initialization for CPU cluster TMCs
>    coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>    coresight-tmc: Update management interface for CPU-bound TMCs
>    coresight-tmc: Defer probe when associated CPUs are offline
> 
> Verification:
> 
> This series has been verified on sm8750.
> 
> Test steps for delay probe:
> 
> 1. limit the system to enable at most 6 CPU cores during boot.
> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
> 3. check whether ETM6 and ETM7 have been probed.
> 
> Test steps for sysfs mode:
> 
> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
> 
> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
> cat /dev/tmc_etf1 >/tmp/etf1.bin
> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
> 
> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
> cat /dev/tmc_etf2 >/tmp/etf2.bin
> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
> 
> Test steps for sysfs node:
> 
> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
> 
> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
> 
> cat /sys/bus/coresight/devices/replicator*/mgmt/*
> 
> Test steps for perf mode:
> 
> perf record -a -e cs_etm//k -- sleep 5
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Use the qcom,cpu-bound-components device tree property to identify devices
>    bound to a cluster.
> - Refactor commit message.
> - Introduce a supported_cpus field in the drvdata structure to record the CPUs
>    that belong to the cluster where the local component resides.
> - Link to v1: https://lore.kernel.org/r/20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com
> 
> ---
> Jie Gan (1):
>        arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block
> 
> Yuanfang Zhang (11):
>        dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>        coresight-funnel: Support CPU cluster funnel initialization
>        coresight-funnel: Defer probe when associated CPUs are offline
>        coresight-replicator: Support CPU cluster replicator initialization
>        coresight-replicator: Defer probe when associated CPUs are offline
>        coresight-replicator: Update management interface for CPU-bound devices
>        coresight-tmc: Support probe and initialization for CPU cluster TMCs
>        coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>        coresight-tmc: Update management interface for CPU-bound TMCs
>        coresight-tmc: Defer probe when associated CPUs are offline
>        coresight: Pass trace mode to link enable callback
> 
>   .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   5 +
>   .../arm/arm,coresight-dynamic-replicator.yaml      |   5 +
>   .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   5 +
>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 926 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
>   drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>   drivers/hwtracing/coresight/coresight-funnel.c     | 258 +++++-
>   drivers/hwtracing/coresight/coresight-replicator.c | 341 +++++++-
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 387 +++++++--
>   drivers/hwtracing/coresight/coresight-tmc-etf.c    | 106 ++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>   drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>   drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>   include/linux/coresight.h                          |   3 +-
>   14 files changed, 1902 insertions(+), 169 deletions(-)
> ---
> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
> 
> Best regards,


