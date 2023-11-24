Return-Path: <linux-arm-msm+bounces-1888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 028AD7F7EF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 19:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99DFCB21827
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 18:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F4535F1D;
	Fri, 24 Nov 2023 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hQEe5os3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E1B189;
	Fri, 24 Nov 2023 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gwmyJG9vbp3QOEoifoxISsT4fXojTNtLKYVLH+21FeI=; b=hQEe5os3F07048ijAtiZMvGGWh
	ZZmKad7TP8b2Xydt3N25pbnMjju/0738kGnsfpBCSSuZKnEnY5eSG8fzNl6FXigNaf5UzWr+EIasK
	8pLW/BaSuzKc/VrixnHCEr8hzWFrDhJE6USIRDu5odK2ahnDzPXwMEnM6Zo7NSK1vFxU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6b1b-0017zc-6B; Fri, 24 Nov 2023 19:35:35 +0100
Date: Fri, 24 Nov 2023 19:35:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <b8981dc4-5db0-4418-b47d-3e763e20beac@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <20231124165923.p2iozsrnwlogjzua@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124165923.p2iozsrnwlogjzua@skbuf>

> I think you are hitting some of the same points I have hit with DSA.
> The PHY package could be considered an SoC with lots of peripherals on
> it, for which you'd want separate drivers.

At least at the moment, this is not true. The package does just
contain PHYs. But it also has some properties which are shared across
those PHYs, e.g. reset. 

What you describe might become true in the future. e.g. The LED/GPIO
controller is currently part of the PHY, and each PHY has its own. I
could however imagine that becomes a block of its own, outside of the
PHY address space, and maybe it might want its own class LED
driver. Some PHYs have temperature sensors, which could be a package
sensor, so could in theory be an individual hwmon driver. However,
i've not yet seen such a package.

Do we consider this now? At the moment i don't see an MFD style system
is required. We could crystal ball gaze and come up with some
requirements, but i would prefer to have some real devices and
datasheets. Without them, we will get the requirements wrong.

I also think we are not that far away from it, in terms of DT, if you
consider the later comments. I suggested we need a phy package
specific compatible. At the moment, it will be ignored by the kernel,
the kernel does not need it, it probes the PHYs in the current way,
using the ID registers. But it could in future be used to probe a real
driver, which could be an MFD style driver. We need to see updated DT
binding examples, but i don't see why we cannot slot it in at a later
date.

	Andrew

