Return-Path: <linux-arm-msm+bounces-56267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AC0AA4C19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 14:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52CC39C7B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4808625C6EF;
	Wed, 30 Apr 2025 12:55:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F932DC768;
	Wed, 30 Apr 2025 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017749; cv=none; b=TxuRAKJo5p7JnaCyOQjbnFxwJ+djyFqTTW20OV3Vq5bLIhUncmlOrsn1GUQIcGvyu8GRXzSTHnaA4Y/j70jSZOnsM9OdfbMPWtBHT0gSkCYx8ueSIUteYyqghbk3NtW0SmtRRNEl05uslnHEbCKon3yh9ILng6iJne8vnmjdVFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017749; c=relaxed/simple;
	bh=IIhm4u71VhCRr4Hr4OezOcTOn3FNdjGi8HgkI2i13kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAAyD+VoLlvprxj2tFWkP0GsaK/X6z68wRYjEKgkdsKaA3BXXVYG6Cmfy0kg0pAzarf6IBfeYpiNA7y2d5mi0B5yxTIWDyitOej3vsMANim/HGM9ulXmNYuz8jNTmEvdfFGD5Nb0z3M1uA/ECiIjGi4Fp7PxVMoopr5KV8Jhqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A10FB106F;
	Wed, 30 Apr 2025 05:55:39 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 599C23F5A1;
	Wed, 30 Apr 2025 05:55:46 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:55:41 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] coresight: Disable MMIO logging for coresight stm driver
Message-ID: <20250430125541.GJ551819@e132581.arm.com>
References: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>

On Wed, Apr 30, 2025 at 04:03:47AM -0700, Mao Jinlong wrote:
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

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

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
> -- 
> 2.25.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

