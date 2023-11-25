Return-Path: <linux-arm-msm+bounces-1988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D67F8CC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 18:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1848BB20ECA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 17:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1D82C86E;
	Sat, 25 Nov 2023 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kp+5QG1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6DB12B;
	Sat, 25 Nov 2023 09:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VcPaglTJNXboIOVIfziLcej/MavQwgea6uWybKAiriA=; b=kp+5QG1EFMcBC/4ZwcOAIs+Cn/
	XHgPWllgKTp6orzQQEc3ucYuK7UEMRAwv5iNKKTvWilG/oCKXjVL1KBp7/aTx13dDz0r4Df3SmJgO
	4xqh4pdJvVD2kKqjnSWYgAzubijgqz/neja5zSTt1iwUGk/f/Z1tt9bz+uePf5kIxeqg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6wRq-001CWJ-5v; Sat, 25 Nov 2023 18:28:06 +0100
Date: Sat, 25 Nov 2023 18:28:06 +0100
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
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH v2 00/11] net: phy: Support DT PHY package
Message-ID: <bf26ba4b-ea21-450d-b2ce-0f68f2d2796a@lunn.ch>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>

> One example is this:
> 
>         ethernet-phy-package@0 {
>             #address-cells = <1>;
>             #size-cells = <0>;

Please extend this example with a compatible, and include a property
which is global.

> (For Andrew, we are looking intro making this in at803x PHY driver and see
> what functions can be reused, idea is to move the driver to a dedicated
> directory and create something like at803x-common.c as the at803x PHY
> driver is too bloated and splitting it it's a better approach)

This sounds good.

     Andrew
     

