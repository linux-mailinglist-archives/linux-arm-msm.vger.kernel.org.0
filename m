Return-Path: <linux-arm-msm+bounces-75916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C46BB704E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B96F63BF652
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1CE134BD;
	Fri,  3 Oct 2025 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VTKAuHmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7941FBA3D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759498363; cv=none; b=AOhKtW3Vhfoi+664NQBQdVdRVOrhOP//4RmQtVhgDsx3KMwrPESjtCuR0kMnhMn0f6KxoP+k3+Ga1fQ2cKLAQwnOoK40XoYZDWnP6AJ+ve3zvt25hL8hdYBSCoD00rzgfCieziAOgzad7SibsQu2eNTTwSDg5NIujv9n+wtgdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759498363; c=relaxed/simple;
	bh=V1j7kJok6RKhJUiQdks/9FehDZjEU//ZdqIxE1faU2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZkpo0fovbwh30B4Rc2oysCQnDQ3MY87j3W+HgueQpr3u//RLpsKVMY1O9+AfbYM+9FNp5LroPMEr+F+E8JGnKYaF0IomE7RiPAuakeAHJmA82a5bI+YxXZPzHPS/mL8h1zt26RVZ0+E6DarQaDIih/uNbQGiyTPtWlIw9ka6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VTKAuHmt; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9155D4E40E9C;
	Fri,  3 Oct 2025 13:32:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F5E460683;
	Fri,  3 Oct 2025 13:32:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58A1C102F1C20;
	Fri,  3 Oct 2025 15:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759498357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=iozFpFYaZKSD23+QEqnOpovnNuv86N9KGqCqWElkBuQ=;
	b=VTKAuHmtxgyujEaNC8Ewq/1KOAAytiXK67xNcu2yreVBKKikYyOTsbf7c3YclMTtFnythb
	FlUIxfeSiqWd+DfYgU5qr/PFU2trrQcO+x6wH+DftiQHcNUejrK5S63vPviYOvOWOFexdM
	kzPZqL6SszQ2S8gVPtH0ly9/T8mBDwpSUQt57Qy/AIdcAFhM5QOe4GbuoLhRxeAswfTkyM
	KGcpHMTKo+MAtzPW4zuLPZdIhxY/Irgihbm7TtV/L4MHX3ygnaWk033IGQbxe+vw1yCGgx
	qkrDHZh3/ChQRmplaxDCnnIeV+D9v5DRUzuhqOj2R2F9XGoR1Jlgv1bfBbd60g==
Message-ID: <269f9150-8977-4862-b6c1-7a8f94776c59@bootlin.com>
Date: Fri, 3 Oct 2025 15:32:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2 0/19] net: stmmac: experimental PCS
 conversion
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Furong Xu <0x1207@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Simon Horman <horms@kernel.org>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vinod Koul <vkoul@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Yu-Chun Lin <eleanor15x@gmail.com>
References: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

On 28/09/2025 11:13, Russell King (Oracle) wrote:
> This series is radical - it takes the brave step of ripping out much of
> the existing PCS support code and throwing it all away.
> 
> I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> flag with Bartosz Golaszewski, and the conclusion I came to is that
> this is to workaround the breakage that I've been going on about
> concerning the phylink conversion for the last five or six years.
> 
> The problem is that the stmmac PCS code manipulates the netif carrier
> state, which confuses phylink.
> 
> There is a way of testing this out on the Jetson Xavier NX platform as
> the "PCS" code paths can be exercised while in RGMII mode - because
> RGMII also has in-band status and the status register is shared with
> SGMII. Testing this out confirms my long held theory: the interrupt
> handler manipulates the netif carrier state before phylink gets a
> look-in, which means that the mac_link_up() and mac_link_down() methods
> are never called, resulting in the device being non-functional.
> 
> Moreover, on dwmac4 cores, ethtool reports incorrect information -
> despite having a full-duplex link, ethtool reports that it is
> half-dupex.
> 
> Thus, this code is completely broken - anyone using it will not have
> a functional platform, and thus it doesn't deserve to live any longer,
> especially as it's a thorn in phylink.
> 
> Rip all this out, leaving just the bare bones initialisation in place.
> 
> However, this is not the last of what's broken. We have this hw->ps
> integer which is really not descriptive, and the DT property from
> which it comes from does little to help understand what's going on.
> Putting all the clues together:
> 
> - early configuration of the GMAC configuration register for the
>    speed.
> - setting the SGMII rate adapter layer to take its speed from the
>    GMAC configuration register.
> 
> Lastly, setting the transmit enable (TE) bit, which is a typo that puts
> the nail in the coffin of this code. It should be the transmit
> configuration (TC) bit. Given that when the link comes up, phylink
> will call mac_link_up() which will overwrite the speed in the GMAC
> configuration register, the only part of this that is functional is
> changing where the SGMII rate adapter layer gets its speed from,
> which is a boolean.
> 
>  From what I've found so far, everyone who sets the snps,ps-speed
> property which configures this mode also configures a fixed link,
> so the pre-configuration is unnecessary - the link will come up
> anyway.
> 
> So, this series rips that out the preconfiguration as well, and
> replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.
> 
> We then move the sole PCS configuration into a phylink_pcs instance,
> which configures the PCS control register in the same way as is done
> during the probe function.
> 
> Thus, we end up with much easier and simpler conversion to phylink PCS
> than previous attempts.
> 
> Even so, this still results in inband mode always being enabled at the
> moment in the new .pcs_config() method to reflect what the probe
> function was doing. The next stage will be to change that to allow
> phylink to correctly configure the PCS. This needs fixing to allow
> platform glue maintainers who are currently blocked to progress.
> 
> Please note, however, that this has not been tested with any SGMII
> platform.
> 
> I've tried to get as many people into the Cc list with get_maintainers,
> I hope that's sufficient to get enough eyeballs on this.
> 
> v2: numerous changes, too many to have kept track of, sorry. As one can
> see, the series has more than doubled in size. Some are not up to
> mainline submission quality, but I've included them as they give the
> full picture. b4 may be able to do a better job at identifying the
> differences between the two series than I could ever do.

I'm not sure if you're interested in a proper Tested-by tag at that 
point, but I tested that series on socfpga with :

  - 1 instance using RGMII, w/ a ksz9031 PHY, and it works well, traffic 
flows, ethtool seems to report correct data

  - 1 instance that has the Lynx PCS (DMA_HW_FEATURE[30:28] == 0)

This also works perfectly, switching between SGMII/1000BaseX dynamically 
by hotswapping SFP modules works well, no regression found at a first 
glance.

I haven't had time t take a deep look at the code itself, but at least 
it works :)

Thanks,

Maxime


