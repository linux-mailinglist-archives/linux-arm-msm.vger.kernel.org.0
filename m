Return-Path: <linux-arm-msm+bounces-37062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B29BCE33
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 14:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5630428367F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 13:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DA71D6DB1;
	Tue,  5 Nov 2024 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWpB+y9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F31D1738;
	Tue,  5 Nov 2024 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814135; cv=none; b=Ot9BM7m4H0PpuVSxkIGe4UwCOyBAWbCV/3fjrwFrXJ+U0gn6PP5VqnbRPjPMX4Wgz0LUKunAEhE1269Hcijp6Cva8lzyKc1IP0jki9g92AHSWNQeE4tWCxvUFZS9Nw5VeXItBxHRkhAsuihKVhXFaZCPy+irbkQ801feEWi4MtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814135; c=relaxed/simple;
	bh=uBjQq4vty/Kv54JBAzOzZbTnfWxAOZe08zjGZl2RRng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGTdcgecMqb4CgSLihzCyQbL4SQOWH8hk5LD3fxusIgqmrFHe6qMtTe6kyzschKFFkB82P7t5wRbDQYlsajdPb5jjMV4tGsekzYLXG2Zy3kYC2xlNwJTbs5yOWjG7bbjCuZYyUpkHa/00LM9pzvHX9LtiNvC1vpwYM0YTF+02fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWpB+y9G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388F7C4CED0;
	Tue,  5 Nov 2024 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730814134;
	bh=uBjQq4vty/Kv54JBAzOzZbTnfWxAOZe08zjGZl2RRng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWpB+y9GcHXvT6oCWVyQ/KVxxHgXagZzJhtB/rfYNtMNty1iyCdFcWBawsmHe2GHs
	 /oTty3u03wYvChtzTrj7ABQRgGmKSeSEsg6PKeVxsM63iUvWYSVjrSRx7oPzvLWrE4
	 3R2OTW65d/wL7l3BXcIsIbnD4Ct6ssJICt7sm86tunxRKeLQeDP5WBxMpuvOGSwm1k
	 IhdX4TOeybsLfPve1laLWr9W7bkOTJQOtdVBiQZSdidZtjMdUySDM4TmnGtJumra6/
	 pMWHB1C7E4ZJCpuCmZKBJ3X8UvXUyG1o7TgGQxrl5n0halO9aMvptdfoXz9azqoEx0
	 H7ztw+sM68i3Q==
Date: Tue, 5 Nov 2024 13:42:06 +0000
From: Simon Horman <horms@kernel.org>
To: jan.petrous@oss.nxp.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v4 05/16] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
Message-ID: <20241105134206.GE4507@kernel.org>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>

On Mon, Oct 28, 2024 at 09:24:47PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index ec924c6c76c6..5080891c33e0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -181,24 +181,19 @@ static void dwc_qos_remove(struct platform_device *pdev)
>  static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct tegra_eqos *eqos = priv;
> -	unsigned long rate = 125000000;
> +	long rate = 125000000;
>  	bool needs_calibration = false;
>  	u32 value;
>  	int err;

Hi Jan,

As it seems that there will be another revision anyway,
please update the above so that the local variable declarations
are in reverse xmas tree order - longest line to shortest.

Likewise in s32_dwmac_probe() in the patch
"net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver".

...

