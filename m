Return-Path: <linux-arm-msm+bounces-78173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E153BF6A63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 15:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C57819A4692
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34FC33373B;
	Tue, 21 Oct 2025 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hdMqbjlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49AF333457;
	Tue, 21 Oct 2025 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051754; cv=none; b=dugKL5iAXL77lw2PJ4Vrv+kx9cp+tkEkNyDMnoKGmriRkfB54jvioMg87aLiLevxXTS1aeaAP6r1+yCsfdFkJwRKDWcAhrVvAWJoKYfy0sYg64eOzbK1hpUqRTz/rFN8BXR/kr01MFUnX6OU+15lr7Ulv3p2kwSfK9PAZM17rTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051754; c=relaxed/simple;
	bh=X0layVXBUG0XRJKVKwkS3oOXCDrSUEoS8E5HiTHN52k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8/HbiistprdIoQUC9+X9olfAvrQ29xZol6xMFMvGsgFbmU7ldpdjMsY7ndQxRx4ocnkewVb1VgS1jeZVTG6L5JiG/YfE2BLGDHZHlEGDPPJVYnHn3zFaixf2136KriyplRWMmRIcIbMmu8cvmjmDKB2h5QCoSZ0HViK8GSYVQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=hdMqbjlV; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qGFQDK06oh6OLUShVkpRbJc+sQgtZHJKwB3osXf18fU=; b=hdMqbjlVBeNERiKKRmc4fxopEf
	7ijQKQJ25i4cUunwHzEDydRxnusbakgP7Nn4u6JcLFAAj4oZSOsqrGyLgKkPXpRu1jPHtbxUPiibN
	0zZYOSoq26JmtAlLEJdHkC62UwIB7hXtwDw2K4/dRZ7uLTb64PGB5VU/T+pWr344eiQJKaXF2eKdW
	44YDhyLkEPjdGPZLAh7w3SS0GIB+ZaRoN2FYmeQ/DLWniUE4U1Pfj24mHFtB/I7KVphFTTS6TahZP
	JMNlJXuue0hvv5+LfafQshiMC3ZaxV+M07HUVMJJesJ6DkC0TK7bAYWSd50O6iNTa0C4W65FfEuYC
	fhzXwVhQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56540)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBC0F-000000003iO-4C50;
	Tue, 21 Oct 2025 14:02:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBC0A-000000008Cd-1Yri;
	Tue, 21 Oct 2025 14:02:10 +0100
Date: Tue, 21 Oct 2025 14:02:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: replace has_xxxx with core_type
Message-ID: <aPeEUmHeQWh7ZuIU@shell.armlinux.org.uk>
References: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
 <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Oct 21, 2025 at 02:42:09PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 16, 2025 at 9:41 PM Russell King (Oracle)
> <rmk+kernel@armlinux.org.uk> wrote:
> >
> > Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> > can be set when matching a core to its driver backend, with an
> > enumerated type carrying the DWMAC core type.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > After the five patch cleanup has been merged, I will want to submit
> > this for merging.
> >
> > The problem:
> > - Any new stmmac glue code is likely to conflict with this.
> > - Bartosz Golaszewski's qcom-ethqos patches posted on 8th October
> >   will conflict with this if resubmitted (we're changing lines that
> >   overlap in diff context.)
> > - Maxime Chevallier's tiemstamping changes will conflict with this.
> >
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Please can you reply with your reviewed-by to the latest patch submitted
today, so your r-b gets picked up if netdev applies it? Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

