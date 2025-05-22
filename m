Return-Path: <linux-arm-msm+bounces-59051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CAAAC0C73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 15:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653211892E3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 13:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD4528C2AA;
	Thu, 22 May 2025 13:13:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8948228BABF;
	Thu, 22 May 2025 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919596; cv=none; b=bAdNK27E000uyJWJWKElpImH0+QCdELPpW8on8WDI9ikVwSbUZ2tPbmX65hAt2sOeaqOPIIINAR82PgtOSpbahUaXthLO5yg5BBfsTg2O0/4f1iwlYty2We6oDg0dvqx793DZFD5+gHPLG03xM1rtYWh9dWti8pcQtea5eaMgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919596; c=relaxed/simple;
	bh=ojaEYbHKRXXsIj+zDQcGY8mxSaM1irlEaXB+KfhBWb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jh6Jw599Du7gEiSRR2I2itgyXbbhWpm1Za5BC+gK8mLb2dLiP3d9mjyjmP0i7zo1ePo5LJ/msS6+bw1MHvkMFprerZjMuW8fwKEhhdFYnxLbqdvIlr0qkkM9GB4ELdzOvWJxvjozbE/euzRlA7ElzYVq0Tl1BJ0qXPGRyVsFVj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC5241A32;
	Thu, 22 May 2025 06:12:59 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5982D3F673;
	Thu, 22 May 2025 06:13:12 -0700 (PDT)
Message-ID: <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
Date: Thu, 22 May 2025 14:13:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2025 09:07, Yuanfang Zhang wrote:
> Add a driver to support Coresight device Trace Network On Chip (TNOC),
> which is an integration hierarchy integrating functionalities of TPDA
> and funnels. It aggregates the trace and transports to coresight trace
> bus.
> 
> Compared to current configuration, it has the following advantages:
> 1. Reduce wires between subsystems.
> 2. Continue cleaning the infrastructure.
> 3. Reduce Data overhead by transporting raw data from source to target.
> 
>    +------------------------+                +-------------------------+
>    | Video Subsystem        |                |Video Subsystem          |
>    |       +-------------+  |                |       +------------+    |
>    |       | Video TPDM  |  |                |       | Video TPDM |    |
>    |       +-------------+  |                |       +------------+    |
>    |            |           |                |              |          |
>    |            v           |                |              v          |
>    |   +---------------+    |                |        +-----------+    |
>    |   | Video funnel  |    |                |        |Video TNOC |    |
>    |   +---------------+    |                |        +-----------+    |
>    +------------|-----------+                +------------|------------+
>                 |                                         |
>                 v-----+                                   |
> +--------------------|---------+                         |
> |  Multimedia        v         |                         |
> |  Subsystem   +--------+      |                         |
> |              |  TPDA  |      |                         v
> |              +----|---+      |              +---------------------+
> |                   |          |              |   Aggregator  TNOC  |
> |                   |          |              +----------|----------+
> |                   +--        |                         |
> |                     |        |                         |
> |                     |        |                         |
> |              +------v-----+  |                         |
> |              |  Funnel    |  |                         |
> |              +------------+  |                         |
> +----------------|-------------+                         |
>                   |                                       |
>                   v                                       v
>        +--------------------+                    +------------------+
>        |   Coresight Sink   |                    |  Coresight Sink  |
>        +--------------------+                    +------------------+
> 
>         Current Configuration                            TNOC
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>


> +
> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> +{
> +	int atid;
> +
> +	atid = coresight_trace_id_get_system_id();
> +	if (atid < 0)
> +		return atid;
> +
> +	drvdata->atid = atid;

Do you need to expose this via sysfs ? Otherwise, how can you map
a trace to a TNOC at decoding ?

Suzuki

