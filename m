Return-Path: <linux-arm-msm+bounces-59714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB0AC6C8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 17:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF0F54E4F38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 15:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327C228B7F9;
	Wed, 28 May 2025 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRjgWdwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDABE28B4FC;
	Wed, 28 May 2025 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444933; cv=none; b=lEWMqj7JwvRrhgSHf5zR8kn18nxDt5dh1t+fpebJIjqnzj/TYjulOg4RQezGoHmaeGYo2mcyRNr+mSGV/zgizUJpAzm2fRDNA7LnD0yYKX4+fNQtSTPnX3G9pO0yRU0Rpn/3jDBIwagFigBWboxaGnBD/0idJAN0mnG8/GYXRNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444933; c=relaxed/simple;
	bh=40UkgulLHp10KrkQG30f0FbnrUk5jZkaCVdd/+FO+ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msdHwIDiDAGkUkjEtWoNxGSw1ic4QasHEtDQOF+zf2nTMsJwaW9OSbllS+9klv1hHXp4C4USw5F+1Srz7DtwVCQMP+e13CEb1Y2esIiljj4/gkTV4gPR2GvDMckmWCff0epZe3itwV7ILZMl7nh0MpcV28sUeXMEqKfo99pvEA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRjgWdwq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE668C4CEE3;
	Wed, 28 May 2025 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748444932;
	bh=40UkgulLHp10KrkQG30f0FbnrUk5jZkaCVdd/+FO+ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRjgWdwqYvPjV98TTccLqsGfJyo55EH+l97/A0dyCPqZZw+fbX+pf9HcpNEC8Jtem
	 TPGSeay92lbEB58m4uBijF4vCTWImjZ5pzd4QP7z3qpS5R9QCJKmZvp1qUwt+XQ+RA
	 oUEeY+rw42FhD0vyBQmOJ62JlIHnt0pemRznLH8jKpbu+WDIWExx6w9QhtBRgnB79M
	 uJcr7sg3IwQg5zKmmR6ro53e8Je1Urihu9NSosZD/3NXYE1WUQeVoWYp6RITZV4tyD
	 L2nGNJo+N2RZ9OVp4mk3N6KgtdjH5bwRgnkk5uud71J6n4bp03m9IdxiD8lgpjOEKX
	 ctxnsJFFgTNww==
Date: Wed, 28 May 2025 16:08:45 +0100
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Alex Elder <elder@riscstar.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH net-next v2 3/3] net: ipa: Grab IMEM slice base/size from
 DTS
Message-ID: <20250528150845.GC1484967@horms.kernel.org>
References: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
 <20250527-topic-ipa_imem-v2-3-6d1aad91b841@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-ipa_imem-v2-3-6d1aad91b841@oss.qualcomm.com>

On Tue, May 27, 2025 at 01:26:43PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a detail that differ per chip, and not per IPA version (and
> there are cases of the same IPA versions being implemented across very
> very very different SoCs).
> 
> This region isn't actually used by the driver, but we most definitely
> want to iommu-map it, so that IPA can poke at the data within.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

...

> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c

...

> @@ -656,7 +659,23 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>  	ipa->mem_addr = res->start;
>  	ipa->mem_size = resource_size(res);
>  
> -	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
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
> +		/* Backwards compatibility for DTs lacking
> +		 * an explicit reference */
> +		imem_base = mem_data->imem_addr;
> +		imem_size = mem_data->imem_size;
> +	}
> +
> +	ret = ipa_imem_init(ipa, imem_base, imem_size);

Thanks for the update to use imem_base and imem_size on the line above.

Reviewed-by: Simon Horman <horms@kernel.org>

