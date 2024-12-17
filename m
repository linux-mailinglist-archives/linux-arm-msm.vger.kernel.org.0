Return-Path: <linux-arm-msm+bounces-42566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6C9F4EA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 15:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91C93188975D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D941F75B5;
	Tue, 17 Dec 2024 14:54:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B871F75BC;
	Tue, 17 Dec 2024 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447287; cv=none; b=buP9Y7f4l4Cp/Cgj/LiRuniWpNoMOyPuwNH3BL0m+3qGbhiD1A7rn6zIzxE5IzYXo5Pz/lEynS+xEw+cOY5tvsrkOsHIti6Mqlj2Pe1VTCloJ7eDFm2AMh2hbQITtpdvAU5BH167V/+Ukl6LWzp0yyHMvSiaTqp5wCci6UlAlY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447287; c=relaxed/simple;
	bh=PD/EQggTthvVj1/ihI6XNAR0OiMGcUR4E6BisG3pxsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmj12xwQh4yEgS4HJ7c2Dm7O/YZk8keiCNvJcz23Nfa35mOcuZRYKZcFa6SkB9QFH1aMXQZmCk97jnxw84ZTQILrd0pZYLMdPYVW7rEKwRk1LIEE6sadFwNrVWBy0HNcPBIwasVTvqhGc02GhNrGSp9sRsbT4Bcmt+CErZzz7ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531831063;
	Tue, 17 Dec 2024 06:55:11 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8EB33F528;
	Tue, 17 Dec 2024 06:54:41 -0800 (PST)
Message-ID: <fb0b26ca-8c0a-49ee-ad72-095c60070067@arm.com>
Date: Tue, 17 Dec 2024 14:54:41 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight-tpdm: Add support to select lane
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
 <20241105123940.39602-3-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241105123940.39602-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 12:39, Mao Jinlong wrote:
> From: Tao Zhang <quic_taozha@quicinc.com>
> 
> TPDM MCMB subunits supports up to 8 lanes CMB. For MCMB
> configurations, the field "XTRIG_LNSEL" in CMB_CR register selects
> which lane participates in the output pattern mach cross trigger
> mechanism governed by the M_CMB_DXPR and M_CMB_XPMR regisers.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  8 +++
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 51 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
>   3 files changed, 62 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index bf710ea6e0ef..e833edfec79e 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -257,3 +257,11 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
>   Description:
>   		(RW) Set/Get the MSR(mux select register) for the CMB subunit
>   		TPDM.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_trig_lane
> +Date:		Nov 2024
> +KernelVersion	6.13

6.14



Suzuki



