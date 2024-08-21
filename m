Return-Path: <linux-arm-msm+bounces-29229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E5C95A3FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 19:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11131282961
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 17:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307B71B2EF1;
	Wed, 21 Aug 2024 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZenRI8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17EB1B2EC1;
	Wed, 21 Aug 2024 17:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724261856; cv=none; b=gwzjacILDnSF2DY+60i7A9ao2quzT2Cdx0a2SHwpu8KYSHCWG8COBbdTjEdURwA9WlSs2iwooZ6BGfHHhOr2BJ48oGKS6A3rWtLsAcJk+C9227qTlidAZJGL2Sh+lVMQMUTsDRi7GQRjA86g0sAWdHwi0XZFqEBes7X6PuUBKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724261856; c=relaxed/simple;
	bh=yzoAlBa7Gq7XplWHcp/NwfAfAm8mhCyPIfBsErv0xas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nn0ZRkTOgy2jssR4n2CXDpq2gsevgv0WtFgfbFkzbhvx2eO0Fv2Ye6AaARkep8u1vj3wxX6T+Q9f6GXQiud7P25H3zxQeAlZeB2yUao7K7BLJI1Ajy+obQmy90cQD0E1rkJhqFvqXYJnehu+N9vCht+E7N/FURHsQ5kP6YI0oKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZenRI8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E72C4AF11;
	Wed, 21 Aug 2024 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724261855;
	bh=yzoAlBa7Gq7XplWHcp/NwfAfAm8mhCyPIfBsErv0xas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZenRI8mrXmGOdE9wLzBrPC+GIuS/3NZMFBvcmYPDFXxRoeT0TMhEltitILBTWbF8
	 gHAy4bAW6cCCFArl1qPgYVxLpwlWnE3zvUh9Gn7dWfwXja1Tzz4u+fgMmkuSRV13zO
	 1sCnbUXxnr6sSH5tuulEutbHp61rWkLkqEyRz0W65MCIHkDdsjLuSLlWpU0UApnnmB
	 GCZYmuMu1/CKMNeAd437EZ0a6ltMJlVn9TE5qzAJMJ0Z6RuBZoTvTfyzmapUrtiH4h
	 n6e8ym0Zr45wayTUMeVfcb26aqaeNqHCZuh0NV//nuFXVCdJ7ov3AJafbi/raXkKYi
	 avf0T5uLR8sRQ==
Date: Wed, 21 Aug 2024 18:37:30 +0100
From: Simon Horman <horms@kernel.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: vkoul@kernel.org, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	niklas.cassel@linaro.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Check NULL ptr on lvts_data in
 qcom_ethqos_probe()
Message-ID: <20240821173730.GD2164@kernel.org>
References: <20240821131949.1465949-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821131949.1465949-1-make24@iscas.ac.cn>

On Wed, Aug 21, 2024 at 09:19:49PM +0800, Ma Ke wrote:
> of_device_get_match_data() can return NULL if of_match_device failed, and
> the pointer 'data' was dereferenced without checking against NULL. Add
> checking of pointer 'data' in qcom_ethqos_probe().
> 
> Cc: stable@vger.kernel.org
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Hi Ma Ke,

There is probably no need to repost just because of this.
But as a fix for Networking code it should be targeted at the net tree.

	Subject: [PATCH net] ...

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 901a3c1959fa..f18393fe58a4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -838,6 +838,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->mac_base = stmmac_res.addr;
>  
>  	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +

In this function dev_err_probe() is used, I assume in cases
where a function that returns an error does not emit any logs.

For consistency, perhaps that is appropriate here too?

>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
>  	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
> -- 
> 2.25.1

