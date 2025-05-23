Return-Path: <linux-arm-msm+bounces-59226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3751AC2396
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 15:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 239D117350A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 13:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579BA29116E;
	Fri, 23 May 2025 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIRcSfX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223BC22A1FA;
	Fri, 23 May 2025 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006270; cv=none; b=QSnOosvlJORGJ35y2cIKsm/i97TNvLMPvYKC8s1BUlUodE3x/EbcE4Ga5+w162veaPl3AhRj7flQ00jcqLA8UCAdYYvhx8VX0fdC2eZpaDIwOk/tpX9lOP09VMlEP8J0o2xbnCtdqPHliwo96RUZlKC3//5SrUOudlADg3cmiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006270; c=relaxed/simple;
	bh=WfmGZAQo3wsig3eX3iDyV4RWHk0+I/HNvFEj1zWHGNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1yRzz2+k8zI8wh3b9RqHtFrucan7OqKlgMgc1XdRYNwSkJ9V/EoyPQ4Sje9O3o0P3taqsmFRXCzZ7QjN9qFocz4XuEQPqfFyVqTAKqWEc/oE0q3KFr5WtJNOTSHbC8L611Vtc/Vdn6QSfHkSRF73HoqLWBJs6gRF6YYsiRhurQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIRcSfX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77545C4CEE9;
	Fri, 23 May 2025 13:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748006269;
	bh=WfmGZAQo3wsig3eX3iDyV4RWHk0+I/HNvFEj1zWHGNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sIRcSfX1CYv1tmxeRycBUBqZh/m/OMEOLPDgNxPff4ovLTh/5Ckw1HwV48vtvu9se
	 bcfmn1oIenxAfT1vtX4IMt4Hvz9B5vnPqQfvBFd1UUAtl5hxOQMvY5vCZIUqT6fxf9
	 Mj57TOK8TiMW0Lgi3KoPWVGId5y5vuYvJb+1Cy3qypq//Mq5OgrS8lBvBNBp7d4vST
	 5jcMSomn6JXx1hEqoe3L1gc9AUpYe/0VgJYmw5RyZ4kUQPIX3Vy+RTbE2CsWfB7T6B
	 XwoWHWY0EKR6NFsUEUXFR0KtEUxSd4PDNGRmaEDCXDr4pYYL+1DfAVm0BmhByD58d+
	 JttUL1BYOqThA==
Date: Fri, 23 May 2025 14:17:44 +0100
From: Simon Horman <horms@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alex Elder <elder@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
Message-ID: <20250523131744.GU365796@horms.kernel.org>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>

On Fri, May 23, 2025 at 01:08:34AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a detail that differ per chip, and not per IPA version (and
> there are cases of the same IPA versions being implemented across very
> very very different SoCs).
> 
> This region isn't actually used by the driver, but we most definitely
> want to iommu-map it, so that IPA can poke at the data within.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It looks like these patches are for net-next. For future reference,
it's best to note that in the subject.

  Subject: [PATCH net-next 3/3 v2] ...

> ---
>  drivers/net/ipa/ipa_data.h |  3 +++
>  drivers/net/ipa/ipa_mem.c  | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
> index 2fd03f0799b207833f9f2b421ce043534720d718..a384df91b5ee3ed2db9c7812ad43d03424b82a6f 100644
> --- a/drivers/net/ipa/ipa_data.h
> +++ b/drivers/net/ipa/ipa_data.h
> @@ -185,8 +185,11 @@ struct ipa_resource_data {
>  struct ipa_mem_data {
>  	u32 local_count;
>  	const struct ipa_mem *local;
> +
> +	/* DEPRECATED (now passed via DT) fallback data, varies per chip and not per IPA version */

For Networking code, please restrict lines to 80 columns wide or less where
that can be done without reducing readability (which is the case here).

	/* DEPRECATED (now passed via DT) fallback data,
	 * varies per chip and not per IPA version */

>  	u32 imem_addr;
>  	u32 imem_size;
> +
>  	u32 smem_size;
>  };
>  
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 835a3c9c1fd47167da3396424a1653ebcae81d40..020508ab47d92b5cca9d5b467e3fef46936b4a82 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c
> @@ -7,6 +7,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/iommu.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
>  
> @@ -617,7 +618,9 @@ static void ipa_smem_exit(struct ipa *ipa)
>  int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>  		 const struct ipa_mem_data *mem_data)
>  {
> +	struct device_node *ipa_slice_np;
>  	struct device *dev = &pdev->dev;
> +	u32 imem_base, imem_size;
>  	struct resource *res;
>  	int ret;
>  
> @@ -656,6 +659,21 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>  	ipa->mem_addr = res->start;
>  	ipa->mem_size = resource_size(res);
>  
> +	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
> +	if (ipa_slice_np) {
> +		ret = of_address_to_resource(ipa_slice_np, 0, res);
> +		of_node_put(ipa_slice_np);
> +		if (ret)
> +			return ret;
> +
> +		imem_base = res->start;
> +		imem_size = resource_size(res);
> +	} else {
> +		/* Backwards compatibility for DTs lacking an explicit reference */

Ditto.

> +		imem_base = mem_data->imem_addr;
> +		imem_size = mem_data->imem_size;
> +	}
> +
>  	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);

I think you also need to update this line to use the local
variables imem_addr and imem_size.

>  	if (ret)
>  		goto err_unmap;

Please do observe the 24h rule [1] if you post a v2 of this patchset.

[1] https://docs.kernel.org/process/maintainer-netdev.html#resending-after-review

