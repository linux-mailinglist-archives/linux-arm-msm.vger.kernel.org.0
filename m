Return-Path: <linux-arm-msm+bounces-79692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995FC20844
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 133C54F166D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 14:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025BB20DD75;
	Thu, 30 Oct 2025 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Ptv1sTB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A47E126BF1;
	Thu, 30 Oct 2025 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833138; cv=none; b=Z/RWrUnXqXMD8mGCcqor0/GP8qixiycHf6r929P7UNuPDi+VDK5AFbSQFOZ85ofpH8ViU3JUxznT6qwCcRLbetNISiQ+siF5sqPOX1slPOCp4/H5+O3of7VGEtvcEJVynAZsg+wJ+OH8cMVqqQnIq13KCvLQLdsIBG71UKs1j74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833138; c=relaxed/simple;
	bh=gjIXAc75/RP5nZGnQMsx/No/z2gzGCR2Q47450c8ODc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2YOgxFOCW1+gHij7bqjmq3w1ONpfbncOzLAzH3ci52LquGokMLJTzvcaGDE4K8d5oBU90gVtj7MAO9aYzaDvjPTjDqMxfD8pO6cYpc60illsYLeB/aWWLOVYZ+SAEtOVAjNSXAdjs8Zf0SZO9cK8nyG7gbMbZnQZO93TEHoCAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Ptv1sTB1; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2OmzrOMSFDIHt90ET3ZkdRLGAdOyNAqOFwhfGMiqaV0=; b=Ptv1sTB1FvN4w3/AmTE+DHKcdJ
	9qbzUW9AZpfAEjAhGR4B7Mxo9VbsMsZZeU/g+Xopioag7LPZJW6zswEvZT7LL5b0M3HyeRwWOd2Kx
	VeT1LS1G6e9VtdAPVcxMn7UkX2ieaKKDvpyLYpEaB12LbmzqzX3fbD2Xo8BON616ymRPlZOnEwbux
	11G8K7GphKFonIV/DkS3TTKurtbfQtheo02WpqSVL5PIuAMDk7DyWsG0icfUk7qh/a8LxNzuo4FNs
	XIF//3ZZp5K5koXa+KtQTmd3nwuylHZ8Gn0K2yDwC/iSgQz8s8rtpHKaX33627Br6a50akKi03bsE
	nqwjJVcg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55264)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vETHH-000000005mZ-3F8U;
	Thu, 30 Oct 2025 14:05:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vETHE-000000008Vm-0rdp;
	Thu, 30 Oct 2025 14:05:20 +0000
Date: Thu, 30 Oct 2025 14:05:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
Message-ID: <aQNwoC6aMPMMk4M1@shell.armlinux.org.uk>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
 <aQNXTscqFcucETEW@shell.armlinux.org.uk>
 <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 30, 2025 at 02:08:41PM +0100, Konrad Dybcio wrote:
> On 10/30/25 1:17 PM, Russell King (Oracle) wrote:
> > Konrad, Ayaan,
> > 
> > Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
> > and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?
> > 
> > Specifically:
> > - why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
> >   speeds, but never be cleared for any other speed?
> 
> BIT(16) - "enable to transmit delayed clock in RGMII 100/10 ID Mode"

I guess that means that changing this bit is not relevant for the SGMII
path, and thus can be removed:

        switch (speed) {
        case SPEED_2500:
-               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-                             RGMII_IO_MACRO_CONFIG2);
                ethqos_set_serdes_speed(ethqos, SPEED_2500);
                ethqos_pcs_set_inband(priv, false);
                break;
        case SPEED_1000:
-               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-                             RGMII_IO_MACRO_CONFIG2);
                ethqos_set_serdes_speed(ethqos, SPEED_1000);
                ethqos_pcs_set_inband(priv, true);

> > - why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
> >   for 10M, but never set to any other value for other speeds?
> 
> [18:10] - In short, it configures a divider. The expected value is 0x13
> for 10 Mbps / RMII mode

This gets confusing. Is the "/" meaning "10Mbps in RMII mode" or "10Mbps
or RMII mode".

> which seems to have been problematic given:
> 
> https://lore.kernel.org/all/20231212092208.22393-1-quic_snehshah@quicinc.com/
> 
> But it didn't say what hardware had this issue.. whether it concerns a
> specific SoC or all of them..
> 
> A programming guide mentions the new 0x31 value for 10 Mbps in a
> SoC-common paragraph so I suppose it's indeed better-er.. Perhaps issues
> could arise if you switch back to a faster mode?

Could the 0x13 be a typo? Its suspicious that the two values are 0x13
vs 0x31. 0x13 = 19 vs 0x31 = 49. 0x31 makes more sense than 19.

The platform glue is required to supply clk_rx_i to the dwmac's MAC
receive path, deriving it from the 125MHz SGMII rx link clock divided
by 1, 5 or 50. Normally, this would be done by hardware signals output
from the dwmac.

This suggests that the value programmed is one less than the actual
divisor.

There's two possibilities why this value needs to be programmed:

1. the hardware doesn't divide the SGMII rx link clock according to
the hardware signals output from the dwmac, and needs the divisor to
be manually programmed. This would require the divisor to also be
programmed to 4 for 100M (but the driver doesn't do this.)

2. the hardware selects the clk_rx_i depending on the hardware
signals, and while 1G and 100M use a fixed divisor of 1 and 5, the
10M divisor needs to be manually programmed.

Any ideas what's really going on here?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

