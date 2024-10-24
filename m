Return-Path: <linux-arm-msm+bounces-35669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E1E9AE126
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 11:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8862B285206
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 09:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A9A1B6D1F;
	Thu, 24 Oct 2024 09:38:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D942166F06;
	Thu, 24 Oct 2024 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729762682; cv=none; b=roDbCEIK0ppcbNGeQoEWOfMeJDPJtjEJ4lwoNjRV4oxxTGX+PXSNLShmM1pOmUgPhI9SVJ9r/Ci1nB2MAMRcmpTntfNa91KvsiI+qlZO/qvAMan4TMkyzENMUkIxsnWAbCZPks6lSU1iF2jcFv6mtZCu90EPHXLs0yNRGiCp7nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729762682; c=relaxed/simple;
	bh=pte4w+tFUA3cdE7BgTNEM+9YkmzsGDFT6x47dFFJpU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6W4At6Va4u92AmZVH00eEIu4ma6dGNNdwLGlcS0eq2YJrqXr2eJ8+N7BNQySVVwwxG9jXgLxpWrCVZiRaL9jncDOLKZB5od5wni8y4mFNmgsGOD1kuC8X79Aj3lo+TkF63+RiT3Gur8cfIGx3BxfepPPYaHstYFiP3CtjjyuTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C3F339;
	Thu, 24 Oct 2024 02:38:29 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1A0A3F73B;
	Thu, 24 Oct 2024 02:37:57 -0700 (PDT)
Message-ID: <59549abd-b94c-4ac0-a7ee-23b722001827@arm.com>
Date: Thu, 24 Oct 2024 10:37:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] coresight: Add a helper to check if a device is
 source
To: Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
 <20241024065306.14647-4-quic_taozha@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241024065306.14647-4-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2024 07:53, Tao Zhang wrote:
> Since there are a lot of places in the code to check whether the
> device is source, add a helper to check it.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>

You have introduced a similar check in PATCH 2. So why not move this 
patch up in the series and use this helper where you needed in patch2 ?


> ---
>   drivers/hwtracing/coresight/coresight-core.c     | 9 ++++-----
>   drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
>   drivers/hwtracing/coresight/coresight-tpda.c     | 2 +-
>   include/linux/coresight.h                        | 7 ++++++-
>   4 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index d9d256b3e8aa..e205a21f7078 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -83,7 +83,7 @@ static struct coresight_device *coresight_get_source(struct list_head *path)
>   		return NULL;
>   
>   	csdev = list_first_entry(path, struct coresight_node, link)->csdev;
> -	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE)
> +	if (!coresight_is_device_source(csdev))
>   		return NULL;
>   
>   	return csdev;
> @@ -976,9 +976,8 @@ static int coresight_orphan_match(struct device *dev, void *data)
>   		/* Fix filter source device before skip the port */
>   		if (conn->filter_src_fwnode && !conn->filter_src_dev) {
>   			if (dst_csdev && (conn->filter_src_fwnode
> -			    == dst_csdev->dev.fwnode)
> -			    && !WARN_ON_ONCE(dst_csdev->type
> -			    != CORESIGHT_DEV_TYPE_SOURCE))
> +			    == dst_csdev->dev.fwnode) && !WARN_ON_ONCE(

Please don't split it like that. Keep them in one line, it is OK for 
such lines to go beyond the limit.


Rest looks fine to me

Suzuki

> +			    !coresight_is_device_source(dst_csdev)))
>   				conn->filter_src_dev = dst_csdev;
>   			else
>   				still_orphan = true;
> @@ -1053,7 +1052,7 @@ static void coresight_remove_conns(struct coresight_device *csdev)
>   	int i, j;
>   	struct coresight_connection *conn;
>   
> -	if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE)
> +	if (coresight_is_device_source(csdev))
>   		bus_for_each_dev(&coresight_bustype, NULL, csdev,
>   				 coresight_clear_filter_source);
>   
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 6ef4b26f04bb..b6fec0c498dc 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -255,8 +255,8 @@ static int of_coresight_parse_endpoint(struct device *dev,
>   		else {
>   			conn.filter_src_dev =
>   			 coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
> -			if (conn.filter_src_dev && (conn.filter_src_dev->type
> -			    != CORESIGHT_DEV_TYPE_SOURCE))
> +			if (conn.filter_src_dev &&
> +				  !coresight_is_device_source(conn.filter_src_dev))
			    ^^align here

>   				dev_warn(&conn.filter_src_dev->dev,
>   				  "Filter source is not a source device\n");
>   		}
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index bfca103f9f84..ad023a2a99d1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -24,7 +24,7 @@ DEFINE_CORESIGHT_DEVLIST(tpda_devs, "tpda");
>   
>   static bool coresight_device_is_tpdm(struct coresight_device *csdev)
>   {
> -	return (csdev->type == CORESIGHT_DEV_TYPE_SOURCE) &&
> +	return (coresight_is_device_source(csdev)) &&
>   	       (csdev->subtype.source_subtype ==
>   			CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM);
>   }
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 52f05f01b287..f372c01ae2fc 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -593,9 +593,14 @@ static inline void csdev_access_write64(struct csdev_access *csa, u64 val, u32 o
>   }
>   #endif	/* CONFIG_64BIT */
>   
> +static inline bool coresight_is_device_source(struct coresight_device *csdev)
> +{
> +	return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE);
> +}
> +
>   static inline bool coresight_is_percpu_source(struct coresight_device *csdev)
>   {
> -	return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE) &&
> +	return csdev && coresight_is_device_source(csdev) &&
>   	       (csdev->subtype.source_subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_PROC);
>   }
>   


