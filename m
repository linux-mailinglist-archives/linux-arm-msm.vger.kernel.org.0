Return-Path: <linux-arm-msm+bounces-23314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AB90F9A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 01:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25F4A1C21F8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5946415B142;
	Wed, 19 Jun 2024 23:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HpiA7VKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41F4C2FC;
	Wed, 19 Jun 2024 23:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718838837; cv=none; b=nsTFFpkbPYr7IsYf+/BCe0r4siY/J2pHF63kCpROOowZxbgzT39AgdxikLJuRcWcW4oFY5zD8rNhZJRTP+5XPSLNcc7wVow9gWtK3rb5FoQy5u9T/C2gHQkEPYrOFWrsSPU7HtI05n3J9W21iuMIgzkDoDENYmowwACIm5a1Cv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718838837; c=relaxed/simple;
	bh=T/PslGIW1KV8oOz5+52ktPpAOmgftn6/F4FjPEI2Nt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOi2q8iLue4pJoG6yVjBbcGzpnWAU7it2rGcVeE9CNnB3O3HcVMfVnIcvpfxZGQJqI08/v9AGxmEC8FvV6WKOuYWRmSuM0wfvtwer74faFWFqadvPNjeGSQOC8PRK5ySq9NJJKXjrHebMwx/kro5IsV//YtsRPKIpBbN21oAzyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HpiA7VKV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Qj6mjjBSg8sx2QqOSj72ZERLwLtr27wz6L+Qn/QniuI=; b=HpiA7VKVLxR+26EUaKUgi4g6xT
	99NdHmfT2ejkpZthNu15wMhmWhaOei7+08Ph0J/jbz9ZQ9j6eQRoEZt73Md0HhMmdRjqaMpS+JLd+
	1SIH67tmEQ2uQnDygYet6csedm9moex3fXp/Q912vfhnj4obzvQCRZHmd3DCu33KjgnI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sK4Uf-000W73-R3; Thu, 20 Jun 2024 01:13:33 +0200
Date: Thu, 20 Jun 2024 01:13:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, kernel@quicinc.com,
	Andrew Halaney <ahalaney@redhat.com>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] net: stmmac: Add interconnect support in qcom-ethqos
 driver
Message-ID: <159700cc-f46c-4f70-82aa-972ba6e904ca@lunn.ch>
References: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
 <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>

On Wed, Jun 19, 2024 at 03:41:29PM -0700, Sagar Cheluvegowda wrote:
> Add interconnect support in qcom-ethqos driver to vote for bus
> bandwidth based on the current speed of the driver.
> This change adds support for two different paths - one from ethernet
> to DDR and the other from Apps to ethernet.

What do you mean by Apps?

> Vote from each interconnect client is aggregated and the on-chip
> interconnect hardware is configured to the most appropriate
> bandwidth profile.
> 
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e254b21fdb59..682e68f37dbd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -7,6 +7,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
>  #include <linux/phy/phy.h>
> +#include <linux/interconnect.h>

If you look at these includes, you should notice they are
alphabetical.

> +static void ethqos_set_icc_bw(struct qcom_ethqos *ethqos, unsigned int speed)
> +{
> +	icc_set_bw(ethqos->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
> +	icc_set_bw(ethqos->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
> +}
> +
>  static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct qcom_ethqos *ethqos = priv;
>  
>  	ethqos->speed = speed;
>  	ethqos_update_link_clk(ethqos, speed);
> +	ethqos_set_icc_bw(ethqos, speed);
>  	ethqos_configure(ethqos);
>  }
>  
> @@ -813,6 +824,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
>  				     "Failed to get link_clk\n");
>  
> +	ethqos->axi_icc_path = devm_of_icc_get(dev, "axi_icc_path");
> +	if (IS_ERR(ethqos->axi_icc_path))
> +		return PTR_ERR(ethqos->axi_icc_path);
> +
> +	ethqos->ahb_icc_path = devm_of_icc_get(dev, "ahb_icc_path");
> +	if (IS_ERR(ethqos->axi_icc_path))
> +		return PTR_ERR(ethqos->axi_icc_path);
> +

This all looks pretty generic. Any reason why this is just in the
Qualcomm device, and not at a higher level so it could be used for all
stmmac devices if the needed properties are found in DT?

       Andrew

