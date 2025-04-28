Return-Path: <linux-arm-msm+bounces-55871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD5FA9EA5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C599B171788
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 08:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B9822D79D;
	Mon, 28 Apr 2025 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QwoydfmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9223211476;
	Mon, 28 Apr 2025 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827891; cv=none; b=FS+W2UMCEtE8wt7lGdnBgTBWSg2AzahvqTUW2mOdcGGyo+xhfCvvyW6HmSOOx08yK612wJETmQida65VsURVF3/4UAU8o33sE4DDvnMukDWbYoOEIWeeIMBbFfBZ1Q0h3Qhvvq3PyTqK9G9Sj+cpG14cWTtQTMvaHVglUU3Ogew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827891; c=relaxed/simple;
	bh=RZNWauRBZ77xwItbGqA7HuXfhu0XZkIoQCM+78qY6HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eoZ7ZWH1JqWp0JIvYU+0xZ5pO8v++c64NujBhC23DJK0JfPedMKhwFBriv1kFPz/zV9pjgI8mU9S+TAYrt5tmvVdRXAmivrpEB9epC6Brk7QUimpURYO8Dw8V0MwKktYpULTNnfHjKBh0ExYHG0IY9paEwHEfufKgG6t3k2thyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QwoydfmJ; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S11XbV010761;
	Mon, 28 Apr 2025 10:10:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PQb6/JrtA/eLzoukWftU2fxvtoqJ28zJBaZAc0hVsHY=; b=QwoydfmJnqrIp1Bs
	q/5op7P9yWgVMKAfoFEU1jyURgEx+qPUDq86ch/CQCNROm4Mxk9HC6YD7MH4Xtmi
	3rQphDkC1+X5k47wruX25t+hfl48d3DGpsuF3Prb14wiAMj+EsbVHwphl0Fu3qJz
	SmEK1tY8GUZaWs/i9ClheBgwg8NcYqTGZ+VSKcG1b0C7i2O4SBvWc3y/7E+zvtYc
	NiEaxlGfyjdSwBnETaBtVc2kCpyyptb1Xq8l0qLOVuwN/IFbtdMo8w9pvWlHIbyO
	23nxIBPn1Iz2uNbsjaTymfeLeJPQ8YA5tJnyzsDOlcOhxPHwotSdRgbyLDKFfAI7
	tGWyzA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg5gx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:10:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EF3BA4004F;
	Mon, 28 Apr 2025 10:09:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8252A342DD;
	Mon, 28 Apr 2025 10:07:54 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:07:54 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:07:52 +0200
Message-ID: <4e6840e5-34a7-4f15-a13a-1ff1ea5eff85@foss.st.com>
Date: Mon, 28 Apr 2025 10:07:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] of: reserved_mem: Add functions to parse
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Saravana Kannan
	<saravanak@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
	<wens@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Daniel Baluta
	<daniel.baluta@nxp.com>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <20250423-dt-memory-region-v2-v2-1-2fbd6ebd3c88@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250423-dt-memory-region-v2-v2-1-2fbd6ebd3c88@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01

Hello Rob,

On 4/23/25 21:42, Rob Herring (Arm) wrote:
> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Wrap function parameters
> ---
>  drivers/of/of_reserved_mem.c    | 80 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h | 26 ++++++++++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index ee2e31522d7e..f87915cce961 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -12,6 +12,7 @@
>  #define pr_fmt(fmt)	"OF: reserved mem: " fmt
>  
>  #include <linux/err.h>
> +#include <linux/ioport.h>
>  #include <linux/libfdt.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> @@ -740,3 +741,82 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
> +
> +/**
> + * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
> + * @np:		node containing 'memory-region' property
> + * @idx:	index of 'memory-region' property to lookup
> + * @res:	Pointer to a struct resource to fill in with reserved region
> + *
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by index and return a struct resource for the entry.
> + *
> + * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
> + * is missing or unavailable, -EINVAL for any other error.
> + */
> +int of_reserved_mem_region_to_resource(const struct device_node *np,
> +				       unsigned int idx, struct resource *res)
> +{
> +	struct reserved_mem *rmem;
> +
> +	if (!np)
> +		return -EINVAL;
> +
> +	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
> +	if (!target || !of_device_is_available(target))
> +		return -ENODEV;
> +
> +	rmem = of_reserved_mem_lookup(target);
> +	if (!rmem)
> +		return -EINVAL;
> +
> +	resource_set_range(res, rmem->base, rmem->size);
> +	res->name = rmem->name;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource);
> +
> +/**
> + * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
> + * @np:		node containing 'memory-region' property
> + * @name:	name of 'memory-region' property entry to lookup
> + * @res:	Pointer to a struct resource to fill in with reserved region
> + *
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by name and return a struct resource for the entry.
> + *
> + * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
> + * is missing or unavailable, -EINVAL for any other error.

of_property_match_string() can return some other error values.

Thanks,
Arnaud

> + */
> +int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +					      const char *name,
> +					      struct resource *res)
> +{
> +	int idx;
> +
> +	if (!name)
> +		return -EINVAL;
> +
> +	idx = of_property_match_string(np, "memory-region-names", name);
> +	if (idx < 0)
> +		return idx;
> +
> +	return of_reserved_mem_region_to_resource(np, idx, res);
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_byname);
> +
> +/**
> + * of_reserved_mem_region_count() - Return the number of 'memory-region' entries
> + * @np:		node containing 'memory-region' property
> + *
> + * This function allows drivers to retrieve the number of entries for a node's
> + * 'memory-region' property.
> + *
> + * Returns the number of entries on success, or negative error code on a
> + * malformed property.
> + */
> +int of_reserved_mem_region_count(const struct device_node *np)
> +{
> +	return of_count_phandle_with_args(np, "memory-region", NULL);
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_count);
> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
> index e338282da652..f573423359f4 100644
> --- a/include/linux/of_reserved_mem.h
> +++ b/include/linux/of_reserved_mem.h
> @@ -7,6 +7,7 @@
>  
>  struct of_phandle_args;
>  struct reserved_mem_ops;
> +struct resource;
>  
>  struct reserved_mem {
>  	const char			*name;
> @@ -39,6 +40,12 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
>  void of_reserved_mem_device_release(struct device *dev);
>  
>  struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
> +int of_reserved_mem_region_to_resource(const struct device_node *np,
> +				       unsigned int idx, struct resource *res);
> +int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +					      const char *name, struct resource *res);
> +int of_reserved_mem_region_count(const struct device_node *np);
> +
>  #else
>  
>  #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
> @@ -63,6 +70,25 @@ static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np
>  {
>  	return NULL;
>  }
> +
> +static inline int of_reserved_mem_region_to_resource(const struct device_node *np,
> +						     unsigned int idx,
> +						     struct resource *res)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +							    const char *name,
> +							    struct resource *res)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int of_reserved_mem_region_count(const struct device_node *np)
> +{
> +	return 0;
> +}
>  #endif
>  
>  /**
> 

