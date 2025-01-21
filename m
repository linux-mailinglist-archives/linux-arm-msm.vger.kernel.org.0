Return-Path: <linux-arm-msm+bounces-45694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71EA17E28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 13:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98898188AC0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 12:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9BE1F237D;
	Tue, 21 Jan 2025 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mdoYhlVk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C601F2378;
	Tue, 21 Jan 2025 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737464297; cv=none; b=q4BdXkB4AoiBmRxu6mgCN7J1iEbyWEyLBX5m5kaZX/z21K1AdixohzyunmcfPKFAUCQEPXi9TnT7m+z0rH5m8H0mHHiamxx8/aCzfNjBBM3qlscUL3jaQqf16Pq8uZxLtzEE4++SAbcokUfnt7PrhlTgLQsJiMScwZrXfniwOOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737464297; c=relaxed/simple;
	bh=PPii/DSZi8Y6tW+al9kSUvbfV1GK4RQWD3uMG6/ihvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4WitBTm3LZo5kMsMQ3S9jkQ9bTfHpNQNmOIEysLFc22kGqRd3OkGjUMRKS9QdoVpO2kbcio30MwkeJuylPcRSQB2vgfWm+7AM6RVGXOc7FqVPWCq5BEI+x2GjuL3+6HHBrEe+u3KbCbOVbVBb5cp9exjeZrqtdfmYRU/OhHKM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mdoYhlVk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uA940mkLL9KHlcuBfwiSIb3vbphWe9IhllR+VjD8CvI=; b=mdoYhlVkty1GpM8FmQVp5QiD8B
	Ey/KgEeTwABBdYcLZ8oufPHyJNj06JsuXdwDZ2At1jFQYoY8NSrNxToQMKjJJgXDVmAte4E5SWw4j
	/PwfJf345eUnb/jLHwSizUujKKl1TbDiLYZ6wB2+ZT7TPBSNq3R/ozp9G9Wa7k7zovVTx6XoIFOFA
	a6P2hkmZ+NpyKk1TU2ThKzoUm4aDcZzWLwM/L92ii27ehWKOJlgO+d9B64cqK0IP+3Gq7cfxMCcon
	urxGSXPMgPVEoj5FX0zOmw9JlirdcMaDtjWzgNZAujqR3hMI7qoY8WW3vlSBsPqlLbRuvgalgAsJn
	OGHodGUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60812)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1taDpM-0007FN-2u;
	Tue, 21 Jan 2025 12:57:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1taDpI-0003uT-0r;
	Tue, 21 Jan 2025 12:57:52 +0000
Date: Tue, 21 Jan 2025 12:57:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yijie Yang <quic_yijiyang@quicinc.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
Message-ID: <Z4-Z0CKtiHWCC3TM@shell.armlinux.org.uk>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 21, 2025 at 01:47:55PM +0100, Krzysztof Kozlowski wrote:
> On 21/01/2025 08:54, Yijie Yang wrote:
> > The Qualcomm board always chooses the MAC to provide the delay instead of
> > the PHY, which is completely opposite to the suggestion of the Linux
> > kernel.

You still need to explain why it's preferable to match this in the mainline
kernel. Does it not work when you use the phylib maintainers suggestion
(if that is so, you need to state as much.)

> How does the Linux kernel suggest it?

It's what phylib maintainers prefer, as documented in many emails from
Andrew Lunn and in Documentation/networking/phy.rst:

"Whenever possible, use the PHY side RGMII delay for these reasons:

* PHY devices may offer sub-nanosecond granularity in how they allow a
  receiver/transmitter side delay (e.g: 0.5, 1.0, 1.5ns) to be specified. Such
  precision may be required to account for differences in PCB trace lengths

* PHY devices are typically qualified for a large range of applications
  (industrial, medical, automotive...), and they provide a constant and
  reliable delay across temperature/pressure/voltage ranges

* PHY device drivers in PHYLIB being reusable by nature, being able to
  configure correctly a specified delay enables more designs with similar delay
  requirements to be operated correctly
"

> > The usage of phy-mode in legacy DTS was also incorrect. Change the
> > phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
> > to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
> > the definition.

If the delays dependent on the phy-mode are going to be implemented at
the MAC end, then changing the PHY mode indicated to phylink and phylib
to PHY_INTERFACE_MODE_RGMII is the right thing to be doing. However,
as mentioned in the documentation and by Andrew, this is discouraged.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

