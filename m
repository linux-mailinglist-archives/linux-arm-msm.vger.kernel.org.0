Return-Path: <linux-arm-msm+bounces-77588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D733FBE39BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1811E358A8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6763132D458;
	Thu, 16 Oct 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1DghSIi6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AD32D430;
	Thu, 16 Oct 2025 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760620048; cv=none; b=B+5KIoAgL0YV6aS3tDaJf2YXqm45nINjXNW2CThRefFJplzhYtFW/cZzUq2EH2rOcutfpfHfIOfDlAxQi8i190/Q5WvT72bbSUIsk9YuEzfuGOEZgsjlf8wb8PEGEjqWHK5UohDvmExypMKJDJQ3W7bI155llhrTmKo4Eckzf/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760620048; c=relaxed/simple;
	bh=ONcEzksXvU0Hzsn1Zneiq4npucSOXSmSVnVeoTR6tGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WG90jvSI57xj7qr37m4WfYOcifgmO2JghdETpXXdhk7Mr/HhVbTKJsImVkbxxIkBjTeRpZopCG2pjDFpF6P+qlUVfImLanVHan+29FAYjELuA8o8cYzrojnXcsyoqTZ+dx5zwRsQ2lY+xQF9Nelz/vpQEsM0ix2OJCzRQxQYVg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1DghSIi6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bTX/SxuL6PMsQdK1U3XWoqoo19lAlZGpcm62kFUrRjY=; b=1DghSIi6UnO2MhInx1oOB3c3b9
	eck9TaS3dRL5XiHskCcpj+2DbG3l+ctf/6myn3ZfE5ADVigGhNfjK3I5YYsriwIpWsPIXenOW39Yo
	0r2H3B1UppJgOz4nK0opSVoSVgY3+vmgdSEeORq3dQIaca/45FCnUwagqURGB2Xsk344=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9NhD-00B9VF-En; Thu, 16 Oct 2025 15:07:07 +0200
Date: Thu, 16 Oct 2025 15:07:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 03/14] net: stmmac: remove SGMII/RGMII/SMII
 interrupt handling
Message-ID: <8e71c26c-49be-435b-8cde-0f2faf5b805e@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92MO-0000000AmGP-2hFV@rmk-PC.armlinux.org.uk>
 <51db1103-afd7-430d-9038-7094032347fc@lunn.ch>
 <aPAcRNeFa5heydq7@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPAcRNeFa5heydq7@shell.armlinux.org.uk>

> Sadly, it's not quite unused - see dwmac-sun8i.c:
> 
>         if (v & EMAC_RGMII_STA_INT)
>                 x->irq_rgmii_n++;

Ah, i missed that. So yes, it needs to stay.

Thanks
	Andrew

