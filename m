Return-Path: <linux-arm-msm+bounces-56885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE94AABA3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA4D23A427D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75662290D9A;
	Tue,  6 May 2025 04:16:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2473929E065;
	Tue,  6 May 2025 03:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746503862; cv=none; b=hkQiHiYTdc64dWiCknUrVei7VRPw+IEPTKz15dQWFjvJGA8XVW8pRqv+xR9HOpnnPx3zzRg/b+LFA/12Yp10UxsrBu9ofgNIakpzOydKf2DcbWzNlaNqlXyINNwHgKtgrdcMa5cTYjDMey6v7H/8WqI+Nm66bqmQWdqq5LsLXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746503862; c=relaxed/simple;
	bh=KHY2LYWhvi7hI1zrzp5zlq7DTsutWbotYkpqwJIlLMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDvocSyyq5meDbd0P//ydTfQFD0L8UQm5Rb9VVN/04u19CnMpNmWHOyRKlsYyh+mEFOD36kw6d7qlrhDVrKT8GGPv8q8Mtoj/BxMrLNJyO0Xajqr5IO9JBPiW8FbLIU6DjAhWEZTtHw1ge8ZpIk5XdiHPC47eNEcZwNBANzND0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36305113E;
	Mon,  5 May 2025 20:57:24 -0700 (PDT)
Received: from [10.163.54.208] (unknown [10.163.54.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38E4A3F673;
	Mon,  5 May 2025 20:57:28 -0700 (PDT)
Message-ID: <911d8ce8-9b2e-4c86-ac56-aae523adfe36@arm.com>
Date: Tue, 6 May 2025 09:27:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Disable MMIO logging for coresight stm driver
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/30/25 16:33, Mao Jinlong wrote:
> When read/write registers with readl_relaxed and writel_relaxed,
> log_read_mmio and log_write_mmio will be called. If mmio trace
> is enabled to STM, STM driver will write the register to send the
> trace and writel_relaxed will be called again. The circular call
> like callstack below will happen. Disable mmio logging for stm
> driver to avoid this issue.
> 
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
>  drivers/hwtracing/coresight/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..f3158266f75e 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -22,6 +22,8 @@ condflags := \
>  	$(call cc-option, -Wstringop-truncation)
>  subdir-ccflags-y += $(condflags)
>  
> +CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
> +
>  obj-$(CONFIG_CORESIGHT) += coresight.o
>  coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
>  		coresight-sysfs.o coresight-syscfg.o coresight-config.o \

As Suzuki mentioned, please do update the commit message.

Otherwise LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

