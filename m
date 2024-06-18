Return-Path: <linux-arm-msm+bounces-22985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F90C90C865
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1770F1F21643
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C3F204EEC;
	Tue, 18 Jun 2024 09:47:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1205818036;
	Tue, 18 Jun 2024 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718704059; cv=none; b=KULPBsrTHyLTJ3v2CJivA47W5JvZL68giyvxIMNzsDVHYG4qWOYqHu2J46WYk9s4ZLlOXpvmHiSVVyiRvm9FYQCHAz0kIQsEbhHcORetur/zj9gC67yskolFMa2FYOiOp488LCN/cdzrbHahGedEiW4W9abH1mJepeAaT7m4Pw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718704059; c=relaxed/simple;
	bh=bvydH7RjBestTLmNs2zaUNf93eKOltBy+ZSBAHcAorQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5Z8b6Vl4pY8ZA+bbOpzwV3SCz5OfQAlIcscVFARJDgA7+23FVp7j5hy1q/qS7unAyaz32WCXQaumZxBuaLjzaUjMLBI612zMobNxTtrD0+MN4qIhuCviQpePpo4YyK/QzFfh1l4iPP421wLisZKJfOKTYgg2V134FI1cPeDSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D198DDA7;
	Tue, 18 Jun 2024 02:48:00 -0700 (PDT)
Received: from [10.57.72.20] (unknown [10.57.72.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB13B3F64C;
	Tue, 18 Jun 2024 02:47:32 -0700 (PDT)
Message-ID: <243098a9-296b-4cbc-9f48-d37ab3b94153@arm.com>
Date: Tue, 18 Jun 2024 10:47:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Add coresight slave register driver to support
 data filter function
Content-Language: en-GB
To: Jie Gan <quic_jiegan@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Mike Leach <mike.leach@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, quic_yijiyang@quicinc.com, quic_yuanjiey@quicinc.com,
 quic_liuxin@quicinc.com, quic_yanzl@quicinc.com, quic_xinlon@quicinc.com,
 quic_xueqnie@quicinc.com, quic_sijiwu@quicinc.com
References: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2024 08:27, Jie Gan wrote:
> The Coresight Slave Register(CSR) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CSR device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>               |ETR0|             |ETR1|
>                . \                 / .
>                .  \               /  .
>                .   \             /   .
>                .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CSR     ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.

What is the maximum number of connections possible for CSR ? 2 ETRs ?

> 
> Based on the trace id which is programed in CSR ATID register of
> specific ETR, trace data with that trace id can get into ETR's buffer

How do you handle cases where there are multiple TraceIDs in a the 
stream ? e.g., perf tracing a multi-threaded app ? Each ETM will have
a distinct traceid. Is there way to disable filtering by CSR ?

Side note, with James's trace id allocation per sink series makes this
easier for the ETR to know the trace ids allocated for the current
session. Works only for perf though.


> while other trace data gets ignored. CSR may contain several ATID registers.
> Each ATID register is associated with an ETR device.
> 
> To achieve this function, the trace id is obtained and stored in the related
> ETR device's driver data just before enabling the CSR. Then, the CSR
> device can easily obtain the trace ID from the ETR's driver data because the
> ETR's driver data is passed to the CSR's enable/disable functions.
> 
> Ensure that every source device has already allocated a trace ID in its probe
> session because the sink device should always be the first device to

How is that possible ? We are going backwards in the trace id allocation
with your proposal. What is the purpose of this hardware when you could 
use a replicator with trace filtering based on masks ?

> enable when operating coresight_enable_path function. As a helper device of the
> ETR, the CSR device will program the ATID register of a specific ETR according to
> the trace id to enable data filter function at a very early stage. Without the
> correct trace ID, the enablement session will not work.
> 
> Each CSR's enable session will set one bit in the ATID register.

So is this a bitmap of "enable/disable" ATID ? I really don't see the
usecase of the CSR "device" yet. Please could you share "usecase" ?

Suzuki


> Every CSR's disbale seesion will reset all bits of the ATID register.
> 
> This patch only supports sysfs mode. I will send the perf mode part patch
> once it is ready.
> 
> Looking forward to receiving comments as this is a new driver.
> 
> Thanks!
> 
> Jie Gan (3):
>    dt-bindings: arm: Add binding document for Coresight Slave Register
>      device.
>    coresight: Add coresight slave register driver to support data filter
>      function in sysfs mode
>    arm64: dts: qcom: Add CSR and ETR nodes for SA8775p
> 
>   .../bindings/arm/arm,coresight-tmc.yaml       |   8 +
>   .../bindings/arm/qcom,coresight-csr.yaml      |  49 +++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 167 ++++++++++
>   drivers/hwtracing/coresight/Kconfig           |   6 +
>   drivers/hwtracing/coresight/Makefile          |   1 +
>   drivers/hwtracing/coresight/coresight-core.c  |   6 +-
>   drivers/hwtracing/coresight/coresight-csr.c   | 315 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-csr.h   |  24 ++
>   .../coresight/coresight-etm4x-core.c          |   1 +
>   drivers/hwtracing/coresight/coresight-stm.c   |  50 ---
>   drivers/hwtracing/coresight/coresight-sysfs.c |  45 ++-
>   .../hwtracing/coresight/coresight-tmc-core.c  |   1 +
>   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
>   include/linux/coresight-stm.h                 |  44 +++
>   14 files changed, 665 insertions(+), 54 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
>   create mode 100644 drivers/hwtracing/coresight/coresight-csr.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-csr.h
> 


