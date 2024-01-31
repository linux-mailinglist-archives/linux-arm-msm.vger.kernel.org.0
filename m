Return-Path: <linux-arm-msm+bounces-9223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A04843DCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 12:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9CFF1C26C2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 11:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E98F78B45;
	Wed, 31 Jan 2024 11:07:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AD56DD18;
	Wed, 31 Jan 2024 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706699238; cv=none; b=ixMfCGznbWU5cx7gOKIzT5QB/QsFRDuER6r6jVQYtMvLdSTt4xiDGksn4/sEvlXfwwksCO2V0kadrStNysSruXLj9MoDPr2/obvxdkNhzcdXDYXYocCQCq1dIgb8ZNQtbqol+gn86mDQBJ/0n40rwQgbi8zvnVS5z3eC2IQCB6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706699238; c=relaxed/simple;
	bh=pL2CPOsXUeiloTv29Cpcz6EVbt2wtYLhQvcoZccEnc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GItJKyf1j0TnDvbtajqb3Gv/Zb0QyBTQiG9Sk7nB8Lm2Iuzo1tP48OliofXrt7X4nTDlyD+0JCNLM430i3F7NYJdBTUdRcDhV9D/iilR0VJpnen9ho/ToV8OawNbzxXCKPTo3UOyjoIp+ko32Sj9B3I3UpCCaRA+ZbxOgSF8Csw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCFDFDA7;
	Wed, 31 Jan 2024 03:07:58 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8DD13F762;
	Wed, 31 Jan 2024 03:07:12 -0800 (PST)
Message-ID: <77ebcfcc-c2b7-47ea-8647-065e23fe4689@arm.com>
Date: Wed, 31 Jan 2024 11:07:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm4x: Set skip_power_up in
 etm4_init_arch_data function
Content-Language: en-US
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240131105423.9519-1-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240131105423.9519-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/2024 10:54, Mao Jinlong wrote:
> skip_power_up is used in etm4_init_arch_data when set lpoverride. So
> need to set the value of it before calling using it.

Fixes:5214b563588e ("coresight: etm4x: Add support for sysreg only 
devices")

> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

I will queue this.

Suzuki


> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index c5ea808ea662..8afc07d1dd23 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1200,6 +1200,7 @@ static void etm4_init_arch_data(void *info)
>   	struct etm4_init_arg *init_arg = info;
>   	struct etmv4_drvdata *drvdata;
>   	struct csdev_access *csa;
> +	struct device *dev = init_arg->dev;
>   	int i;
>   
>   	drvdata = dev_get_drvdata(init_arg->dev);
> @@ -1213,6 +1214,10 @@ static void etm4_init_arch_data(void *info)
>   	if (!etm4_init_csdev_access(drvdata, csa))
>   		return;
>   
> +	if (!csa->io_mem ||
> +	    fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
> +		drvdata->skip_power_up = true;
> +
>   	/* Detect the support for OS Lock before we actually use it */
>   	etm_detect_os_lock(drvdata, csa);
>   
> @@ -2040,11 +2045,6 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
>   	if (!drvdata->arch)
>   		return -EINVAL;
>   
> -	/* TRCPDCR is not accessible with system instructions. */
> -	if (!desc.access.io_mem ||
> -	    fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
> -		drvdata->skip_power_up = true;
> -
>   	major = ETM_ARCH_MAJOR_VERSION(drvdata->arch);
>   	minor = ETM_ARCH_MINOR_VERSION(drvdata->arch);
>   


