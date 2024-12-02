Return-Path: <linux-arm-msm+bounces-39971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A89E0EAA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 23:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0616165757
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 22:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBB11E0B62;
	Mon,  2 Dec 2024 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="P/y1nxVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D4B1E04AE;
	Mon,  2 Dec 2024 22:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177256; cv=none; b=LPXSGZff3MXn85zF8Xi3+bMYGgGQfrKR3L8xIjDGKCGXnYrCIzcHICqtYxOkEjXBCNwukCkwOrrS4n7Lqx3hTHXd7DqSEJJbUXEelEhsspWqGiwOjeXNK1jeD03iubn14AEildmFyiFTIUG3KzHZhZtLAkrUkPlGPdmVmvwpZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177256; c=relaxed/simple;
	bh=aMgTNU2yQUgiORpUOLaG95XWh8lcGtVhKx2wlzXx0UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGvfXH4tebQOXldDHGzcRhcNtBJNgSpESqh36Gt6SHm+cUJeR/pZAKgencbg7okAMiu7lyQ7G0pkSDuKvDZ6baj7JZBSgCN1l3F+89rq1WoAqbA1oBtrVV5MqaDJDX71sy6qWEn679lpiv/HbAfjhoxihNjy3G0xf/ufINkFhgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=P/y1nxVs; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DNZbvfSssXQBAkiV5QTgDDOLM6EYzMUfUsQTp9Qh59c=; b=P/y1nxVsQCqb6BHriX1MZF8U9a
	818SykCwB5uibSFiEL2BRG36HPz12PcI7MYGuwd/WD+uUtYnw443MuvK2vKIOZT97kvCoMrE1v9PL
	yTkjZ56zl9bgaudh/WxpsLHQb7tBabUB5cHL4cIunL1cujspL9Kczr+Xdw0eBro0HIwyB9ByTMmaj
	/HB/Q5We/yeyjL/HSatP3N1cCgi3nLQQhIw4V3g3/jsHCEv5DRjZGodJJE4nGVUh8eXBPsmxouuRe
	8JFq9jvxvY2KR+8SQ5teVspEdynY49lB8kVje7mRfh0MdAb+1gsYorFY99HwfFYNmAPaRhvpnznIH
	CA9whG8w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34274)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIEZF-0000rO-2S;
	Mon, 02 Dec 2024 22:06:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIEZ6-0003v0-1J;
	Mon, 02 Dec 2024 22:06:48 +0000
Date: Mon, 2 Dec 2024 22:06:48 +0000
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, 0x1207@gmail.com,
	fancer.lancer@gmail.com, Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v7 01/15] net: driver: stmmac: Fix CSR divider
 comment
Message-ID: <Z04veAM7wBJCLkhu@shell.armlinux.org.uk>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
 <20241202-upstream_s32cc_gmac-v7-1-bc3e1f9f656e@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-1-bc3e1f9f656e@oss.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

No need for "driver:" in the subject line.

On Mon, Dec 02, 2024 at 11:03:40PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The comment in declaration of STMMAC_CSR_250_300M
> incorrectly describes the constant as '/* MDC = clk_scr_i/122 */'
> but the DWC Ether QOS Handbook version 5.20a says it is
> CSR clock/124.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

With that fixed,

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

