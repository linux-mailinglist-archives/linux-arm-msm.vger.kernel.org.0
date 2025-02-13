Return-Path: <linux-arm-msm+bounces-47906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D422A348CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944AE1886C95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA78019AD93;
	Thu, 13 Feb 2025 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8mBk7lH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D1B6F099
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462484; cv=none; b=jHIDmJRd1Oxc/58mz+Cux+I42XNZZ5xs9BN7VGHt9nohYenb0PMOsSAh6MYCu0sCJLjnHJmGOpWr6WYDvgzTukOuX2f7zMrcvi+Kxm3MPE4tpVh+m4R7rMblZwrd58vaNyjWRb/pBwpdmHvXLFzmokxsDMaRkYKir+cTdgRI9Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462484; c=relaxed/simple;
	bh=gZrDut8sDs6gffrJLPSimvu/RTpt8eHhVRallwmt3WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ml2VrOB+BrhLYUGWE7IRfTP3LB4DYnbP9t8VgdN8Oq0q2n3Ub8DJrdzlNSQ1CheHXNAXcJnijKJNOXJAXQGgge1mZp5rRrsjyy+euiMqvJ544jh2hMb9G6HCR0WQco3vuX/bb65ygfZPEY/UD9K8yBl4ZpdP0l8SRAwIsKpBUz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8mBk7lH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so11808285e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739462481; x=1740067281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMCXuuWhvs80SUVrpcx0tfx4I7iY46SU/rJlaw9irZ0=;
        b=n8mBk7lHhqQa5F2AVo32RuQk0tRkiD3wtLAmtw8mXCivQCpf4ZZfT/tV87CMG/psRM
         atGE6veHdK3g3SF30jgQ0UUQ4F3oNep5pUH6MNzMdEX6zv+LZT5VQnTCHhWg5a3bw7T/
         8q32SaYUkkCHfQ9eie7HI9944DSkOFPiTTwZC3cEBlSF7dptm6rgRoa+3VrbaJwwXyih
         /GnJu5KYyEH+bNwcZSfGnqKWLpe0yhKVB3BS/Jikl8s4g+kzDMiAIIpw/NNxoIH0PCQk
         GuSYE5ghlgCL/4hMpbv2nhoqshmLv14Yh/FDwX5WfCgnkihxemKDroNeJH1OctelBxL0
         J1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739462481; x=1740067281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMCXuuWhvs80SUVrpcx0tfx4I7iY46SU/rJlaw9irZ0=;
        b=ukq9NG5YT8Jj3XMLYlBCGJoKsU5zW1u5xPYcFCgNGdb0t0SvYhGp7YsFrb7Oz0jYIz
         IKJceMieMv2NG89dKKKZ4vJWiv04RkcloHaGGlLQz2WfbYcLFU8UB/NcQIFmwxj12vxM
         3fPId6bdcTtRqhPgJR0Um5hrSm+r0MT0UShssvSvVUnAoYU25y0Z/fAHcbc0NROIbo04
         ya+Oha+cwISNK6gce12XHR3lw9GhlyOp42y7lu6/fxCVHgFVTN6cxSkiAdCiOtRXy8Xe
         2z/lXl+EdSkT8qrFahQJOTVeVawUd0YQ8BmO4QvmlQZzhmBP4WLh2X9bTXujAS8ja9c4
         6anQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYrweUvQWMIxPysJ/omEBz8wxaWScmEVKNKwhZDHJSMi+y4u+3i+Sh4JTwK3wWLfFFQxtPls/f4AyXmqT1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg3VCV6EPWifTEbvKmpyH3pGE/a8PHjhWkS7l01V5IdE4WZy70
	QYre/UIuTDEKiJi0fi7HGb1nkCZifzf7A2C5oHxJ0cSLXE3229oVaezE1IOn2q8=
X-Gm-Gg: ASbGncsswUNhXZlUemNBIvCX5xiQuOxwLsFAGu+ICHrMhvSR0lixKtMtJtElfpoSBdj
	OFczQs0K75iYUBezmeZGisVf9NA3n0k228f3mFdubyhSYN1ZJ6lSg8dk09Ymfjz+HjpIzggKu80
	yPA3OzcloXuA3qLZdD0rCMf1239MbW9KAY9mjishV3zjkTAEYgHFd6CMfqb7eZ8N4dc4p6yzgx8
	rKfTntmqfLIrz3wJJoikYrbYc/bRkbYrkOyoMyJ0pdirj7mJAEm8DEQUmqkE/sahB1RW5pVRcJq
	b9FwHanxBxBc6emDvtJ0K8Qz6Q==
X-Google-Smtp-Source: AGHT+IHXadwT9zoo54My1hxvFDl1i3QimhcQUXkZEa3t507OLocLzzGFtocOFYXp17+rEQxmKj0CxA==
X-Received: by 2002:a05:600c:46c7:b0:439:35bb:a5eb with SMTP id 5b1f17b1804b1-439581604d6mr85236315e9.4.1739462480296;
        Thu, 13 Feb 2025 08:01:20 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396180f231sm21319985e9.16.2025.02.13.08.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 08:01:19 -0800 (PST)
Message-ID: <b921e582-fa82-4b97-a5fd-29f52f4c7a85@linaro.org>
Date: Thu, 13 Feb 2025 16:01:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/02/2025 6:42 am, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>               |ETR0|             |ETR1|
>                . \                 / .
>                .  \               /  .
>                .   \             /   .
>                .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> Based on the trace id which is programed in CTCU ATID register of
> specific ETR, trace data with that trace id can get into ETR's buffer
> while other trace data gets ignored. The number of CTCU ATID registers
> depends on the number of defined TMC ETR devices. For example, two TMC
> ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
> and ETR1 with ETR1ATID0-ETRATID3.
> 
> The significant challenge in enabling the data filter function is how
> to collect the trace ID of the source device. The introduction of
> trace_id callback function addresses this challenge. The callback function
> collects trace ID of the device and return it back. The trace ID will be
> stored in the structure called coresight_path and transmitted to helper
> and sink devices.
> 
> The coresight_path structure is created to address how to transmit
> parameters needs by coresight_enable_path/coresight_disbale_path
> functions.
> 
> Here is the definition of the struct coresight_path:
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
> The atid_offset mentioned before is the offset to ATID register in CTCU
> device.
> 
> Enabling the source device will configure one bit in the ATID register based
> on its trace ID.
> Disabling the source devices will reset the bit in the AITD register
> based on its trace ID.
> 
> Useage:
> Enable:
> STM device with trace ID 5 and ETR0 is activated.
> Bitmap before the enablement:
> ETR0ATID0:
> 31..................543210
> ==========================
> 0000000000000000000000...0
> ==========================
> 
> Bitmap after the enablement:
> 31..................543210
> ==========================
> 0000000000000...0000100000
> ==========================
> 
> The bit 5 of the ETR0ATID0 register is configured to 1 when enabling the
> STM device.
> 
> Disable:
> STM device with trace ID 5 and ETR0 is activated.
> Bitmap before the disablement:
> ETR0ATID0:
> 31................6543210
> =========================
> 000000000010111...0100000
> =========================
> 
> Bitmap after the disablement
> ETR0ATID0:
> 31................6543210
> =========================
> 000000000010111...0000000
> =========================
> 
> The bit 5 of the ETR0ATID0 register is reset to 0 when disabling the STM
> device.
> 
> Sincere thanks to James Clark for providing an excellent idea to handle
> the trace_id of the path.
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
> Changes in V4:
> 1. Add TMC description in binding file.
> 2. Restrict the number of ports for the CTCU device to a range of 0 to 1 in the binding file,
>     because the maximum number of CTCU devices is 2 for existing projects.
> Link to V3 - https://lore.kernel.org/linux-arm-kernel/20240812024141.2867655-1-quic_jiegan@quicinc.com/
> 
> Changes in V5:
> 1. Fix the format issue for description paragrah in dt binding file.
> 2. Previous discussion for why use "in-ports" property instead of "ports".
> Link to V4 - https://lore.kernel.org/linux-arm-msm/20240828012706.543605-1-quic_jiegan@quicinc.com/
> 
> Changes in V6:
> 1. Collected reviewed-by tag from Rob for dt-binding patch.
> 2. Rebased on tag next-20241008.
> 3. Dropped all depends-on tags.
> Link to V5 - https://lore.kernel.org/linux-arm-msm/20240909033458.3118238-1-quic_jiegan@quicinc.com/
> 
> Changes in V7:
> 1. Rebased on tag next-20241204.
> 2. Fix format issue for dts patch.
>     - Padding the address part to 8 digits
> Link to V6 - https://lore.kernel.org/linux-arm-msm/20241009112503.1851585-1-quic_jiegan@quicinc.com/
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
> Changes in V10:
> 1. Introduce a new API to allocate and read trace_id after path is built.
> 2. Introduce a new API to allocate and read trace_id of ETM device.
> 3. Add a new patch: [PATCH v10 3/7] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
> 4. Remove perf handle from coresight_path.
> 5. Use u8 instead of atomic_t for traceid_refcnt.
> 6. Optimize the part of code in CTCU drvier that is responsible for program atid register.
> Link to V9 - https://lore.kernel.org/all/20250124072537.1801030-1-quic_jiegan@quicinc.com/
> 
> Jie Gan (7):
>    Coresight: Add support for new APB clock name
>    Coresight: Add trace_id function to retrieving the trace ID
>    Coresight: Use coresight_etm_get_trace_id() in traceid_show()
>    Coresight: Introduce a new struct coresight_path
>    dt-bindings: arm: Add Coresight TMC Control Unit hardware
>    Coresight: Add Coresight TMC Control Unit driver
>    arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  84 ++++++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 153 ++++++++++
>   drivers/hwtracing/coresight/Kconfig           |  12 +
>   drivers/hwtracing/coresight/Makefile          |   1 +
>   drivers/hwtracing/coresight/coresight-core.c  | 133 +++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.c  | 268 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  24 ++
>   drivers/hwtracing/coresight/coresight-dummy.c |  16 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +-
>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>   .../coresight/coresight-etm3x-core.c          |  55 +---
>   .../coresight/coresight-etm3x-sysfs.c         |   3 +-
>   .../coresight/coresight-etm4x-core.c          |  55 +---
>   .../coresight/coresight-etm4x-sysfs.c         |   4 +-
>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>   drivers/hwtracing/coresight/coresight-stm.c   |  14 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 +-
>   drivers/hwtracing/coresight/coresight-tpda.c  |  11 +
>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>   include/linux/coresight.h                     |  30 +-
>   22 files changed, 765 insertions(+), 164 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
> 

Just one small comment, and the kernel test bot report to fix. Otherwise 
looks good to me.

Reviewed-by: James Clark <james.clark@linaro.org>


