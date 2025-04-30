Return-Path: <linux-arm-msm+bounces-56297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E4AA4DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C97E3BDB75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A8A1B5EB5;
	Wed, 30 Apr 2025 13:51:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933A21E98E7;
	Wed, 30 Apr 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746021103; cv=none; b=CGCkpj9AnBBah7TPXavuwPLSx8usw+R9q5Sadf/yBLXjXPnkE6Oehw+HEOPC96uAK40NGfWHqwXJNgg6o0BOy+fI28+dh1xfdJ8IyVa4NWbplWLhZuDRh2WBAuV4nKvspYRQLtqNJqYCxRGH8HeLb5fafLnsQZR6vVZJBl+yO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746021103; c=relaxed/simple;
	bh=UIhg9oR0wVTRD36C+pR8L+b3uTqxZoo4MurjjgXJxBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8S+7/YIunD/f6ZeX61fp1XeQMBAlBGL3TUpmf1aInrQcKHb71P7cEl9KBJ7iP+t3PNpJUtIahaERG9Z8ZX8goIiwfyxrjgBJM5vGLxAiTfryRA7ztI266K02BeNzCj0nd1aStjzceLPYKGjyvd5777k9y+8EXaldAjaTZYYYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2326106F;
	Wed, 30 Apr 2025 06:51:33 -0700 (PDT)
Received: from [10.1.33.69] (Suzukis-MBP.cambridge.arm.com [10.1.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 934443F673;
	Wed, 30 Apr 2025 06:51:39 -0700 (PDT)
Message-ID: <1efe761e-964b-4b24-b1e3-dc33bf1749b7@arm.com>
Date: Wed, 30 Apr 2025 14:51:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Disable MMIO logging for coresight stm driver
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/04/2025 12:03, Mao Jinlong wrote:
> When read/write registers with readl_relaxed and writel_relaxed,
> log_read_mmio and log_write_mmio will be called. If mmio trace
> is enabled to STM, STM driver will write the register to send the
> trace and writel_relaxed will be called again. The circular call
> like callstack below will happen. Disable mmio logging for stm
> driver to avoid this issue.
> 

Thanks for the fix, looks good to me. However, I think the commit 
description is a bit cryptic. Could we say :

With MMIO logging enabled, the MMIO access are traced and could be
sent to an STM device. Thus, an STM driver MMIO access could create
circular call chain with MMIO logging. Disable it for STM driver.

Suzuki

> [] stm_source_write[stm_core]+0xc4
> [] stm_ftrace_write[stm_ftrace]+0x40
> [] trace_event_buffer_commit+0x238
> [] trace_event_raw_event_rwmmio_rw_template+0x8c
> [] log_post_write_mmio+0xb4
> [] writel_relaxed[coresight_stm]+0x80
> [] stm_generic_packet[coresight_stm]+0x1a8
> [] stm_data_write[stm_core]+0x78
> [] ost_write[stm_p_ost]+0xc8
> [] stm_source_write[stm_core]+0x7c
> [] stm_ftrace_write[stm_ftrace]+0x40
> [] trace_event_buffer_commit+0x238
> [] trace_event_raw_event_rwmmio_read+0x84
> [] log_read_mmio+0xac
> [] readl_relaxed[coresight_tmc]+0x50
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..f3158266f75e 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -22,6 +22,8 @@ condflags := \
>   	$(call cc-option, -Wstringop-truncation)
>   subdir-ccflags-y += $(condflags)
>   
> +CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
> +
>   obj-$(CONFIG_CORESIGHT) += coresight.o
>   coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
>   		coresight-sysfs.o coresight-syscfg.o coresight-config.o \


