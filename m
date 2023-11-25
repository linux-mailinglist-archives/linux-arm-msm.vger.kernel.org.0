Return-Path: <linux-arm-msm+bounces-1990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E037F8CEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 18:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C38EDB20F8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 17:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13052D04C;
	Sat, 25 Nov 2023 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="urx7XhfB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765A611F;
	Sat, 25 Nov 2023 09:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MdVRObo32aWz8f8kgjwheJhKiMZUR4c7isPKuP93/wU=; b=urx7XhfBX0iP+Qbhwb87KAvF9k
	oQo7eZJ9HxvOzzfkiRwavlt3zCsDVtFbuWud3BdkXZGJLfR5/GXGMc9qrS2/pEMwWbwvuPnmIhzP8
	fY9q5+ZtkyA5T7nZGlIaXtmbC9z4j0XzrinGqYFBgcHUiaroB3sgoHUzeWj0JvQC0FTM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6wos-001Cba-Ao; Sat, 25 Nov 2023 18:51:54 +0100
Date: Sat, 25 Nov 2023 18:51:54 +0100
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
Subject: Re: [net-next RFC PATCH v2 01/11] net: phy: extend PHY package API
 to support multiple global address
Message-ID: <a8ce4503-c24d-4d6e-91ec-d03624b31fe0@lunn.ch>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
 <20231125001127.5674-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125001127.5674-2-ansuelsmth@gmail.com>

On Sat, Nov 25, 2023 at 01:11:17AM +0100, Christian Marangi wrote:
> Current API for PHY package are limited to single address to configure
> global settings for the PHY package.
> 
> It was found that some PHY package (for example the qca807x, a PHY
> package that is shipped with a bundle of 5 PHY) require multiple PHY
> address to configure global settings. An example scenario is a PHY that
> have a dedicated PHY for PSGMII/serdes calibrarion and have a specific
> PHY in the package where the global PHY mode is set and affects every
> other PHY in the package.
> 
> Change the API in the following way:
> - Make phy_package_join() require a list of address to be passed and the
>   number of address in the list
> - On shared data init, each address is the list is checked and added to
>   the shared struct.
> - Make __/phy_package_write/read() require an additional arg that
>   select what global PHY address to use in the provided list.

I think this is overly complex.

I would rename struct phy_package_shared addr to base_addr.
phy_package_join() would then pass the base address of the package,
which is the same as your reg property for the package in DT.

I think all current users of devm_phy_package_join() already do pass
the lowest address in the package, so this should not cause any
problems. Most drivers even call it base address, rather than cookie,
which the documentation uses.

I would then extend __phy_package_read() etc to take an offset, which
is added to base_addr, and the read is performed on that address. All
the existing users would pass 0, and your new driver can pass other
values.

I also think you can split this out from the DT binding. Make it two
patch sets. One patch set is about extended the package concept to
allow access to global registers at addresses other than the base. The
DT patch is about properties which are shared by the package. These
seems like two mostly orthogonal concepts.

    Andrew

