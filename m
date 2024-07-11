Return-Path: <linux-arm-msm+bounces-25981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F14692E97B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 15:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A891FB2565F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 13:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A69015ECD9;
	Thu, 11 Jul 2024 13:25:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1B715ECDB;
	Thu, 11 Jul 2024 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704331; cv=none; b=TUG2y3edrmj9YYDVocAxe5leAts80cCCif6lRcNvS+7/fZCOE/qC+ItUyA4z08/GjLxEabtFw1olw/4OGVtWHAiprh0cL8+7AUupI+GVqjDEbdTQUZYg06XJULm7cVmLsrH5jnkF2oVH2ZoHljWV27P96YeE0gDwTPcYDup7okw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704331; c=relaxed/simple;
	bh=9lnylkJI3VcnqkZ07Ys/34YoTSZS84BQBBbwjQq2eBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0BK/nB9W/FtZUyNKieKDOum6ytKnC0P5zyO66J3crxexsxl5ce+dYmX6qb7y05zZoBh1kISpCybxP94OEXWtZR++CHYDuiHLBrppvWJgm1zc4XwQmN6co2GYeOOO2WpWs9XQS4JYN1pn//vCGBRrkRXzERplnyB3daTtDsF5gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37CADFEC;
	Thu, 11 Jul 2024 06:25:55 -0700 (PDT)
Received: from [10.57.74.191] (unknown [10.57.74.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4C193F766;
	Thu, 11 Jul 2024 06:25:27 -0700 (PDT)
Message-ID: <5d285a7e-d762-4c8c-8128-bb3b543f6423@arm.com>
Date: Thu, 11 Jul 2024 14:25:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight-tpda: Optimize the function of reading
 element size
Content-Language: en-GB
To: Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240711081750.21792-1-quic_taozha@quicinc.com>
 <20240711081750.21792-4-quic_taozha@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240711081750.21792-4-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 09:17, Tao Zhang wrote:
> Since the new funnel device supports multi-port output scenarios,
> there may be more than one TPDM connected to one TPDA. In this
> way, when reading the element size of the TPDM, TPDA driver needs
> to find the expected TPDM corresponding to the filter source.
> When TPDA finds a TPDM or a filter source from a input connection,
> it will read the Devicetree to get the expected TPDM's element
> size.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index bfca103f9f84..4936ba4a7625 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -110,6 +110,8 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
>   		    csdev->pdata->in_conns[i]->dest_port != inport)
>   			continue;
>   
> +		if (csdev->pdata->in_conns[i]->filter_src_dev)
> +			in = csdev->pdata->in_conns[i]->filter_src_dev;

Actually, this may not be complete, if the device was removed. Also add
a comment here.

		/*
		 * If this port has a hardcoded filter, use the source
		 * device directly.
		 */
		if (csdev->pdata->in_conns[i]->filter_src_fwnode) {
			in = csdev->pdata->in_conns[i]->filter_src_dev;
			if (!in)
				continue;
		}


Suzuki

>   		if (coresight_device_is_tpdm(in)) {
>   			if (drvdata->dsb_esize || drvdata->cmb_esize)
>   				return -EEXIST;
> @@ -124,7 +126,6 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
>   		}
>   	}
>   
> -

>   	return rc;
>   }
>   


