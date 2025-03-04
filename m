Return-Path: <linux-arm-msm+bounces-50202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E751A4E261
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 16:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A03557A30F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E24C280A4C;
	Tue,  4 Mar 2025 15:00:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDAE280A31;
	Tue,  4 Mar 2025 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100402; cv=none; b=bBQJKL0A7D7jAJ6ygR4JrsRKVsfiBDaOmlw2uS+27YxE4uDB77CdyOixI8FDdRcbkHvsXp6XxZyd1Xq6kf5tDxtxC5SJGdCRyr/D8dIf9gwqerJCEOPNWIzxp90rzGtIbUIIokOKe9YBfu076npxkDu7yp6kIArA95xzAIa99rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100402; c=relaxed/simple;
	bh=LT3tlcioVSuYUwHNFA4Ry4nDQZttNNR1F/aD4cfqVsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6q2Xg0gz46qyMna8jJebZQR0GUT6ojmjCAUsXntwxmNRo26bL/7SQyPATzlBoPYU/IwKP0tLb0wAl6pyuJISq/wtHl/b/vBbHp0eRfuUirOoKdJ8gknoCLlwtI/2yiP2ifm0rZ7Qoj3q/Iw8rKRkto3HHLH6vEu0GXzICMOYr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CC13FEC;
	Tue,  4 Mar 2025 07:00:14 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FA383F66E;
	Tue,  4 Mar 2025 06:59:57 -0800 (PST)
Message-ID: <1b05e832-6d41-463a-a52a-6ff340d0d6f8@arm.com>
Date: Tue, 4 Mar 2025 14:59:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 09/10] Coresight: Add Coresight TMC Control Unit
 driver
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-10-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250303032931.2500935-10-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 03:29, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

...

> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _CORESIGHT_CTCU_H
> +#define _CORESIGHT_CTCU_H
> +#include "coresight-trace-id.h"
> +
> +/* Maximum number of supported ETR devices for a single CTCU. */
> +#define ETR_MAX_NUM 	2
> +

WARNING: please, no space before tabs
#413: FILE: drivers/hwtracing/coresight/coresight-ctcu.h:11:
+#define ETR_MAX_NUM ^I2$

total: 0 errors, 2 warnings, 397 lines checked

Another checkpatch warning. Please take care in the future.

Suzuki



