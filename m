Return-Path: <linux-arm-msm+bounces-71767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2DB4196C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AD11543346
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4308A2DAFC3;
	Wed,  3 Sep 2025 08:58:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50BE2D6619;
	Wed,  3 Sep 2025 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889890; cv=none; b=u3u9q9Zh8S42SSIC3qe+gDI2aAcUvKhJns1iGjd39RNAi0Tx/tzopnq4NVNPnfKXJhCdDA/O3lv7MXM2qH7BpjJXaUpY+VJ/B+6wrxPRRx1sAAY7s7UbqoSuosWpxCsYyZDtjB8tOkhJ0sXbPpIbWRg6Yf3pHMn/c+V+Y5HHimM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889890; c=relaxed/simple;
	bh=6MzgKNbuScRJZXqiJgxc5Uwwjp19TQ1t9AJ8gk3AJok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUwFuSjzP523zeBc7GWUYqlk6fUj8Cab7qV9JDUAjSG9LVwwVnU/LkEhHeo0StZa7Jb+i8TiiPuZTBNvpg7Zf3x3NEUitDUwCGHn4PUnXg2LeD9vvOiVZCb9US4ToiMdrm69xBJlzT/lt2ah6bH0fJj1EoQNLULaQR4W/2ygaQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CAC41688;
	Wed,  3 Sep 2025 01:57:53 -0700 (PDT)
Received: from [10.57.5.59] (unknown [10.57.5.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 182B03F694;
	Wed,  3 Sep 2025 01:57:59 -0700 (PDT)
Message-ID: <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
Date: Wed, 3 Sep 2025 09:57:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2025 09:09, Jie Gan wrote:
> Some TPDM devices support both CMB and DSB datasets, requiring
> the system to enable the port with both corresponding element sizes.
> 
> Currently, the logic treats tpdm_read_element_size as successful if
> the CMB element size is retrieved correctly, regardless of whether
> the DSB element size is obtained. This behavior causes issues
> when parsing data from TPDM devices that depend on both element sizes.
> 
> To address this, the function should explicitly fail if the DSB
> element size cannot be read correctly.

But what is the device only has CMB ? Back when this was originally 
merged, we raised this question and the answer was, "Only one is 
supported, not both." But this sounds like that is wrong.
Could we defer the "Warning" to the caller. i.e., Let the caller
figure out the if the DSB size is found and predicate that on the
DSB support on the TPDM.

Suzuki

> 
> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB element")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 0633f04beb24..333b3cb23685 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   	if (tpdm_data->dsb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
> +		if (rc)
> +			goto out;
>   	}
>   
>   	if (tpdm_data->cmb) {
> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   				"qcom,cmb-element-bits", &drvdata->cmb_esize);
>   	}
>   
> +out:
>   	if (rc)
>   		dev_warn_once(&csdev->dev,
>   			"Failed to read TPDM Element size: %d\n", rc);


