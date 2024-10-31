Return-Path: <linux-arm-msm+bounces-36563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748EC9B7DA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F0DCB2251A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057041C463F;
	Thu, 31 Oct 2024 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SS/Cc20K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315E1BE251;
	Thu, 31 Oct 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386855; cv=none; b=uo+oSkEeXXnTniWTb3IOuWB4LLnprl0WaTPrvtLNLxC2IIU9kpOyYAujDj6CdS8Xg6oAWKHXHEeF6gH1IxKh97a92Nr9n+G0vj9QEqXstIwcZ1XPflfRdP9vKcR7NvnnTyWPkXXmx6CbX5w6RO9Ew+VkhCyXMvNXnx8/X1UQEs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386855; c=relaxed/simple;
	bh=+tmv06LQkli0snw8KI+ayhOvS0fqopLEcR1UVstfZx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvv1yzG7q1wPQ8VSgYM50PPWM3QOdR1q3WV3JQ+loFYKvf28HUWcy9wEDRmqYll3qtQzMkizBOrYwVl8MthwIspBgRaEL+1VgYj21yRn+NW0DWpQpt8smcWiP1aQgv52xy1ZWfZWYmmfVno/sJkCjA0PzrfiCjPsrvOJPeYkKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SS/Cc20K; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vH9IxEylnimSrP4rDt0pvOOOUMyhyk1CV6pRJ7l0cZ0=; b=SS/Cc20KOgLFEXcrxgamK0HYgr
	rMQxmIJBUVUd0lAhatW4oGY7oQuQOKyRgExfLLdXNr8GRtstsKpYGjRJMx4snhB1W/lbVWKnN46LF
	mpBd9u18hiTHO7ELPxr5iJdVKBG8Q+lTvphgJgWIBSC6W5tMlq8VqpdBSJvi3oh+oq0E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6Weq-00BnNn-Mu; Thu, 31 Oct 2024 16:00:20 +0100
Date: Thu, 31 Oct 2024 16:00:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
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
Subject: Re: [PATCH v4 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <a938f3cd-9c9c-43a6-8f06-760eec69e1d1@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>
 <erg5zzxgy45ucqv2nq3fkcv4sr7cxqzxz6ejdikafwfpgkkmse@7eigsyq245lu>
 <ZyOUSgMo0chsGnCa@lsv051416.swis.nl-cdc01.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyOUSgMo0chsGnCa@lsv051416.swis.nl-cdc01.nxp.com>

> They are compatible on current stage of driver implementation, the
> RGMII interface has no any difference. But later there shall be
> added SGMII and this provides some level of difference, at least
> from max-speed POV.
> 
> The S32R allows higher speed (2G5) on SGMII, but S32G2/S32G3 has
> 1G as maximum.

Please be careful with your naming. SGMII is defined by CISCO to only
support 10/100/1000Mbps. If you support more than 1G, it is not SGMII,
it is likely to be 2500BaseX, etc.

	Andrew


