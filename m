Return-Path: <linux-arm-msm+bounces-1609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D67F56A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 03:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE9C61F20E7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 02:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50DC46BE;
	Thu, 23 Nov 2023 02:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XdfIfnjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1375B191;
	Wed, 22 Nov 2023 18:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OquazO1sQ+hlt6OacUFPeKJSQFcf3TbpH59OwUObgWM=; b=XdfIfnjMs+I9Gtt2YRBuDhmDvE
	sstglqcfCEaaKc4H/4cQ1cJ4OyJiR8/BZYJG4V30j9LTaXp+kdB07rOVdGulo8um3Rka7Q4AbB8XN
	J48VPuxoeeGD8HzpzAR/AcadbwIKSQKvmEZqiH9Q/4CxbbZ+czYZpG3UjuDWWpda52ac=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5zsi-000vyt-3E; Thu, 23 Nov 2023 03:55:56 +0100
Date: Thu, 23 Nov 2023 03:55:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 13/14] net: phy: add Qualcom QCA807x driver
Message-ID: <e3fbd979-06d6-4323-ac13-93a4f7cf1a4d@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-14-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-14-ansuelsmth@gmail.com>

 On Mon, Nov 20, 2023 at 02:50:40PM +0100, Christian Marangi wrote:
> From: Robert Marko <robert.marko@sartura.hr>
> 
> This adds driver for the Qualcomm QCA8072 and QCA8075 PHY-s.
> 
> They are 2 or 5 port IEEE 802.3 clause 22 compliant 10BASE-Te,
> 100BASE-TX and 1000BASE-T PHY-s.
> 
> They feature 2 SerDes, one for PSGMII or QSGMII connection with
> MAC, while second one is SGMII for connection to MAC or fiber.
> 
> Both models have a combo port that supports 1000BASE-X and
> 100BASE-FX fiber.
> 
> Each PHY inside of QCA807x series has 4 digitally controlled
> output only pins that natively drive LED-s.
> But some vendors used these to driver generic LED-s controlled
> by userspace, so lets enable registering each PHY as GPIO
> controller and add driver for it.
> 
> These are commonly used in Qualcomm IPQ40xx, IPQ60xx and IPQ807x
> boards.

You need to justification why this is a whole new driver, rather than
just extending at803x.c.

I did a few quick checks. The Downshift code is identical, once you
take into account the different names. Interrupt handling looks very
similar.  MDIX looks the same, and Specific status looks similar, etc.
There are clear differences, but i think there is enough identical
code you should be sharing it.

     Andrew

