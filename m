Return-Path: <linux-arm-msm+bounces-1235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EB7F1F23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 22:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F36281253
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 21:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD8B374DC;
	Mon, 20 Nov 2023 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="LxeEzEeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD57C99;
	Mon, 20 Nov 2023 13:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vTiej26Yh66vUupMXOZ8FNGPsbQnKj9z0H8vgIBxYBg=; b=LxeEzEeSpN0Fpj0ZYVs+2MyM++
	NMvgFyArPgGSngt3mWVaHMhRnEUzvoPGekmJsYhOZyMaSqYEdUzNiE0qlvMSpLwsU3d72pBf2863c
	n3u2XkWDfI9BiRlKHJK2mD+1hPOzTWQhpTqTJCKOsLPUMEzkYu8wdHMC+pHcXfo+Udl0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5BlW-000h20-H5; Mon, 20 Nov 2023 22:25:10 +0100
Date: Mon, 20 Nov 2023 22:25:10 +0100
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
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <45784368-93e0-4d57-bb0c-5730f53f5a08@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <655bc8d6.050a0220.d22f2.315f@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655bc8d6.050a0220.d22f2.315f@mx.google.com>

> A real DT that use this is (ipq807x):
> 
> &mdio {
> 	status = "okay";
> 	pinctrl-0 = <&mdio_pins>;
> 	pinctrl-names = "default";
> 	reset-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
> 
> 	ethernet-phy-package {
> 		compatible = "ethernet-phy-package";
> 		phy-mode = "psgmii";
> 
> 		global-phys = <&qca8075_4>, <&qca8075_psgmii>;
> 		global-phy-names = "combo", "analog_psgmii";
> 
> 		qca8075_0: ethernet-phy@0 {
> 			compatible = "ethernet-phy-ieee802.3-c22";
> 			reg = <0>;
> 		};

...

> 	};
> 
> 	qca8081: ethernet-phy@28 {
> 		compatible = "ethernet-phy-id004d.d101";
> 		reg = <28>;
> 		reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> 	};

I've no idea if DT allows this. The issue is that reg is the same for
both nodes within the ethernet-phy-package container, and
ethernet-phy@28. They are all addresses on the same MDIO bus.  We are
parsing this bus structure ourselves in __of_mdiobus_register(), so we
could make it work, but i don't know if we should make it work.

      Andrew


