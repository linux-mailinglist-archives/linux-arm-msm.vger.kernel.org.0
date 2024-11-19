Return-Path: <linux-arm-msm+bounces-38365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7EE9D2BC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0D071F26ADD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4411D0E34;
	Tue, 19 Nov 2024 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gJuC4oUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72261D0B91;
	Tue, 19 Nov 2024 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732034935; cv=none; b=c0/LvLvN7r0p5J2fQeog4LdlItcIUR3C3q+THxTYVCzpBWMjHBTEQgHyUy/BQfNvEGNrHnsfdAMpdjIcci4SuPBJpwG/4XWXFBEyXTy06yf3frxcpbvseKzwGFIXefRBOuoH/ieM1haCfCVeTlfRMJXgpEx+EOoy1Yesw7eihGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732034935; c=relaxed/simple;
	bh=06NyFvjw2Q40R+hhk2MKIcCrfow60pW8VAFXwQATsuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQx1Yhau28AzUPQb/j6QWqEwShZiqh7Xl50IVwBdYz21JV/LNTMGrbBvi9CTjH/iWbxmxk9d55XggRjG0Y1iDXnOKm/0CyBJTdiZQP2216TBGChlytJ/TJl4tnsqfMseuupPleeUoUesvdeOgVALXD4JigZ4rtuipkj4uGSm8pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=gJuC4oUg; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3fvujAh94U3kGDVymnc9jtTk3gFEdDGf2+Wqo/Pnpo4=; b=gJuC4oUgF5yfaJf1hVqxnO4d/l
	nZwoni126YdD7HgeHlxvmxyw3d9qn8oLF6+lLaH8yFtFxQ3bgaydz3ByUBjOZZ7q3YMvIV1Wx4sAF
	oEWKn3V19Wxmg2ukOUOqO8sBYsaX7CIPNsHoAK0oKCEGSb1hZB2jj4dWmbdIvbFEiGmBBBJfK7OpE
	sinVcRn/ed+ur58P4MZhOaA3Z8X8cTstuwmTfMZHY9DXB+7ZSUN7EKaknxuyPlR3Q6jIWDWnrs2C/
	XbI7MA4r4eoXjzkLYZgcHMeyoLajQph4dcBob6+CslmzxPyUL0Cat1OoFgxeF06+8dZMT34FL+pcV
	tJEL/xjA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36672)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDROz-00042u-34;
	Tue, 19 Nov 2024 16:48:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDROx-0006Dy-36;
	Tue, 19 Nov 2024 16:48:32 +0000
Date: Tue, 19 Nov 2024 16:48:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH v5 12/16] net: dwmac-sti: Use helper rgmii_clock
Message-ID: <ZzzBXwZNpCTKvSTp@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-12-7dcc90fcffef@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-12-7dcc90fcffef@oss.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Nov 19, 2024 at 04:00:18PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

