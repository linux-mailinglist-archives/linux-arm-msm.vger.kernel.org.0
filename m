Return-Path: <linux-arm-msm+bounces-73075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF5B52C5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 10:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00D435A27DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD1C2E62A1;
	Thu, 11 Sep 2025 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="LWPQrx41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294C329F09;
	Thu, 11 Sep 2025 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581113; cv=none; b=mKwtkw7/nZlIfpTDBu3pBFetC2epcIVEIXx4wp3MuLHIvGfPzjtuyqJOlIz2PkkOaJfe/BzsE/vof7s4jnqJFVKeh98Nd1tN7kKNqObjolliUlPIjb/LepNIu4/BgXbQaE3ePvVhvvCd5hn1iUSCwqa8NTJfIzzbKFcNyeoEI+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581113; c=relaxed/simple;
	bh=GD1F5c/GfNTnWRPnAjonwQ5ZTjazKOg/tPdnxdK9PSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csqqK7Kdfgc5YiLbXzB7NboTiI4FNdeviNlJO21unqEm9bIyxyLo2dUhywGDzHKGezJn/ATEXLQ4nm8hZLnpujKKjGUclAqHIT0GrIBFmXg019X78VOSEGLiPR5zBKrlu7Xk8ZpnU6EiV86sZePyc+/8JAfi5YJUiHJwPT/5wRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=LWPQrx41; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tPLuj/xTIdlTADyQSmFwiDNGb2wswqT9CA7Ixd8e3JM=; b=LWPQrx41+Rmfg6soc8oQ3DEebT
	bVi4OQPrsC+xG5p3CX+gQM//aAIc3Fnm7CMBogIaJolTkGVZpz2Pq+qCDdf6M9oASVduVjkTUMkDE
	tkqEKyQ4V0gmgNaLeX5b14pHDON4ar7eA4rlZSv0JkApnRdB5RIlEZRTj0D0s5cD2x/NFYbAvbAd3
	szZLZ1NVhaUdbLgJFt8OgaW3ECtv6UMA3JqySsjpdMqATN+8kKmDE9peKt/5dsZ6xXNmv93m5GeTg
	Hih91SSLoTQ4FYfTqr7bzcGsNJaSWHwmiZmVpQp+ElZ58lMPYeUOq0qVfZWAd/s5KzzoiEdSdGda8
	T5s8PQkA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55362)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uwd89-000000002hN-1Tq6;
	Thu, 11 Sep 2025 09:58:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uwd84-000000002Db-3VMI;
	Thu, 11 Sep 2025 09:58:08 +0100
Date: Thu, 11 Sep 2025 09:58:08 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
Message-ID: <aMKPIFmOS1riOajH@shell.armlinux.org.uk>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <24cd127d-1be7-42f4-a2ec-697c5e7554db@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24cd127d-1be7-42f4-a2ec-697c5e7554db@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Sep 10, 2025 at 06:04:28PM +0200, Andrew Lunn wrote:
> > +    ethernet: ethernet@7a80000 {
> > +        compatible = "qcom,sa8255p-ethqos";
> > +        reg = <0x23040000 0x10000>,
> > +              <0x23056000 0x100>;
> > +        reg-names = "stmmaceth", "rgmii";
> > +
> > +        iommus = <&apps_smmu 0x120 0x7>;
> > +
> > +        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names = "macirq", "sfty";
> > +
> > +        dma-coherent;
> > +
> > +        snps,tso;
> > +        snps,pbl = <32>;
> > +        rx-fifo-depth = <16384>;
> > +        tx-fifo-depth = <16384>;
> > +
> > +        phy-handle = <&sgmii_phy1>;
> > +        phy-mode = "2500base-x";
> 
> Nitpicking: It is clearly not an SGMII PHY if it support
> 2500BaseX. You might want to give the node a better name.
> 
> > +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> > +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> > +        snps,ps-speed = <1000>;
> 
> Since this MAC can do 2.5G, is 1000 correct here?

The driver only accepts 10, 100 and 1000 here. Not sure if that's
documented in the binding.

Also, does snps,ps-speed need to be set if we're not immitating a PHY
with the PCS? My understanding is that snps,ps-speed is only relevant
in that circumstance. (I suspect many DTS get this wrong.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

