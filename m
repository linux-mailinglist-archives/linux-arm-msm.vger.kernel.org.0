Return-Path: <linux-arm-msm+bounces-51708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 716EAA6724B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE00E165380
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 11:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8708A20966B;
	Tue, 18 Mar 2025 11:12:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0997209696;
	Tue, 18 Mar 2025 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296374; cv=none; b=ZrIqDlDQtVY1QDFDKq3wQFIV7luF+X3tdhSrHMRgViQEC8xNLD/xCCYfKwczfIFCX7YauPdrFI1szW5mkRiRPmvvbSN7Rk75qjploinCnxUcrlgO3M9ZPo09xABNiDl6i1h1ZKXFRcxekcIk2sE6/TcPs/poyOsibBIT5Uesgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296374; c=relaxed/simple;
	bh=9UrIRnOEexJiEpGUNEC3ds5vz80G5i/X5dIiR7KUgko=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ih0tXfYQHkNWSjtmeW77W7ZNV+pgMHyyPrCrlBBiViO+3m+sfYP1/MjJWldnCCOie8IpsyWjFwSx+a6JKKLYx6JOYMpb926LtFFNsBzn2AAkfZoEqGvwi5CzA/Quk4oiUInky/4EoTmLPjCskduh3THaarciZ+pHESNuvkbLrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZH8HW4vxNz6LDCB;
	Tue, 18 Mar 2025 19:09:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F53214050C;
	Tue, 18 Mar 2025 19:12:44 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 18 Mar
 2025 12:12:43 +0100
Date: Tue, 18 Mar 2025 11:12:42 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Saravana Kannan <saravanak@google.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Shawn
 Guo" <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 1/3] of: reserved_mem: Add functions to parse
 "memory-region"
Message-ID: <20250318111242.00007457@huawei.com>
In-Reply-To: <20250317232426.952188-2-robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
	<20250317232426.952188-2-robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Mon, 17 Mar 2025 18:24:21 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/of/of_reserved_mem.c    | 77 +++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h | 26 +++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 75e819f66a56..fd50038dff76 100644
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
> @@ -740,3 +741,79 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
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
> +int of_reserved_mem_region_to_resource(const struct device_node *np, unsigned int idx, struct resource *res)

Maybe wrap?
 
> +{


