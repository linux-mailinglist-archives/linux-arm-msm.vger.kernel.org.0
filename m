Return-Path: <linux-arm-msm+bounces-68835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E427B22E6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 19:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D539189F7B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05ACF2FA0F7;
	Tue, 12 Aug 2025 16:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xGdc/awl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56932263F22;
	Tue, 12 Aug 2025 16:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755017664; cv=none; b=AwUeMrkGTyC2z6CJ51BfC63ykj3x59y1QIyaS/W89C5ds66Dh35vF/Am4MxTqeUMIQcfzrf4tQNjdPCImGdtEiNhFGbSii5asSaPRkk6KRs7vIt5RH/8IaVzQUtn8yV+yYJ3+qXdz0yUJ33ioBtojrqmv1pfpqHK/10QRzVaFgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755017664; c=relaxed/simple;
	bh=/qn5HyjejE8OObLaU00F8rwyy1m3kk48b055lsc1nYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmbwGPP5JgSdGWWUZvabJmF0MYMNS5sNLxh5NZlsm8IUY4js1RbWx/SWxDqh77+VUqtplnAEM94lvkiLpUMXu4wqnXRwdFcTx5uSGiQVI5sO6dNd7rhtXU9laNP8xCqelXEd6vPsLlu978WoxZk2Wt+wTY2r+16igcxs9ipss60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xGdc/awl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1SxDAKOHuKo6/4q/wwaqNCQYQq81PZ4obbS2L6Mwp/k=; b=xGdc/awlWFGNckXmwjToLVREYM
	a2X70y6ewzvP+SNCnkWmFdSGXtNGeG1Styz2eWfCXh8z0aCOSvkAV0LvKUN+W0kCKxEbbEIWW//eM
	Lmu5l/4u58fjz1aGM1MPHmugHnrvBwoco5EqxdaPTEYXWb31Bgx87KajikX6O49ubhQuhHPdzHhZk
	iQOv+PullK/SuJ01MEXALeRLUvJ0zi+B6WYBZ+tw0iQo6IBD4fiuWLFNQarf5QlyEFbSs2UHmx+ae
	s9/Jn7sN9SQ40iXD001VfLoiojhABmlzI9+aG4LR+w9mmZq+AZ6VuEPVdtCfdU6csZZPD8HqpeREP
	ZNGcsRgg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsGQ-0000000BU2A-0rUS;
	Tue, 12 Aug 2025 16:54:18 +0000
Message-ID: <5ee33ac3-c23e-4da7-87bc-2a5ea6e93afe@infradead.org>
Date: Tue, 12 Aug 2025 09:54:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
 Suruchi Agarwal <quic_suruchia@quicinc.com>,
 Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
 quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com>
 <20250812-qcom_ipq_ppe-v7-3-789404bdbc9a@quicinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250812-qcom_ipq_ppe-v7-3-789404bdbc9a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/25 7:10 AM, Luo Jie wrote:
> diff --git a/drivers/net/ethernet/qualcomm/Kconfig b/drivers/net/ethernet/qualcomm/Kconfig
> index a4434eb38950..6e56b022fc2d 100644
> --- a/drivers/net/ethernet/qualcomm/Kconfig
> +++ b/drivers/net/ethernet/qualcomm/Kconfig
> @@ -60,6 +60,21 @@ config QCOM_EMAC
>  	  low power, Receive-Side Scaling (RSS), and IEEE 1588-2008
>  	  Precision Clock Synchronization Protocol.
>  
> +config QCOM_PPE
> +	tristate "Qualcomm Technologies, Inc. PPE Ethernet support"
> +	depends on HAS_IOMEM && OF
> +	depends on COMMON_CLK
> +	select REGMAP_MMIO
> +	help
> +	  This driver supports the Qualcomm Technologies, Inc. packet
> +	  process engine (PPE) available with IPQ SoC. The PPE includes
> +	  the ethernet MACs, Ethernet DMA (EDMA) and switch core that

Please use ethernet or Ethernet consistently.

> +	  supports L3 flow offload, L2 switch function, RSS and tunnel
> +	  offload.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called qcom-ppe.
> +
-- 
~Randy


