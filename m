Return-Path: <linux-arm-msm+bounces-50806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A9AA590E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23EB116BF6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F83225413;
	Mon, 10 Mar 2025 10:17:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7596921D3E3;
	Mon, 10 Mar 2025 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741601826; cv=none; b=u8Yt07PM28nq6lc34Ayu5EV2wTnykZQWtz0xrbtcxucXvKZuOkl9XLvUOiGohflJjcjlmJeifeerMCgjsKh0wI8ROCJvfSbVKodNZOOZWeIlx0lRd1GQccMq0ILgto1MdbgbmiHPfpOH+Q3f1OxSOI5Q/caUzqIvTQJpXuMNj0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741601826; c=relaxed/simple;
	bh=VdiFGG0LHyqR9ddNJJxQnF4BX6jvBn63DiEsNBQTkUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8L2R0EXoBsQIYHeemkRVFb29Rg+gmkpslmNg/ESn0feX9PyOviVBen548rNyB2bv7CSlIn7Ctaf6oczZw+QqksihB+18vooXOs5CCREt+EeiCrnJ76jc9C0u+J1O8t3l+bJ6sDmkewinR1Ol1zj7Tp3oOwe7WN2Cm3GQxNw4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3737E153B;
	Mon, 10 Mar 2025 03:17:16 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78ECD3F673;
	Mon, 10 Mar 2025 03:17:03 -0700 (PDT)
Message-ID: <23943463-94d0-4e37-b5fa-5efb20015063@arm.com>
Date: Mon, 10 Mar 2025 10:17:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: add verification process for
 coresight_etm_get_trace_id
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250310022348.1654501-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250310022348.1654501-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2025 02:23, Jie Gan wrote:
> The coresight_etm_get_trace_id function is a global function. The
> verification process for 'csdev' is required prior to its usage.
> 
> Fixes: c367a89dec26 ("Coresight: Add trace_id function to retrieving the trace ID")
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index bd0a7edd38c9..5a7cd2376e2d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1616,9 +1616,12 @@ EXPORT_SYMBOL_GPL(coresight_remove_driver);
>   int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
>   			       struct coresight_device *sink)
>   {
> -	int trace_id;
> -	int cpu = source_ops(csdev)->cpu_id(csdev);
> +	int cpu, trace_id;
> +
> +	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE && !source_ops(csdev)->cpu_id)

That must be :

	csdev->type != CORESIGHT_DEV_TYPE_SOURCE || !source_ops(csdev)->cpu_id)


Suzuki


> +		return -EINVAL;
>   
> +	cpu = source_ops(csdev)->cpu_id(csdev);
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
>   		trace_id = coresight_trace_id_get_cpu_id(cpu);


