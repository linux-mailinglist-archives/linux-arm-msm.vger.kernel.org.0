Return-Path: <linux-arm-msm+bounces-1610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF0E7F56AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 04:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88E37281356
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 03:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313F853B6;
	Thu, 23 Nov 2023 03:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rUhUJQzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D3C191;
	Wed, 22 Nov 2023 19:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Xptzas81N17YCuuLxBooSV9D0A5Kbw2K/uN1U+PXfjw=; b=rUhUJQzTP+xMnrOSIku0+NXS9e
	Vwx/yg9ArH/c7A/Hi97odu9Rty203sOPxQXXqHB8k+uJkoz6Jn6LRa5jL/aFAHtZpFI2e2AtHZ2Cb
	+WS/q/1vBCfgD+sp4sQuD362kTCVDKhoe31BMaeB8SMr1rrcM6TlTkqzK85s7wAbgJ4Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5zyH-000w18-Cr; Thu, 23 Nov 2023 04:01:41 +0100
Date: Thu, 23 Nov 2023 04:01:41 +0100
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
Subject: Re: [net-next RFC PATCH 11/14] dt-bindings: net: add QCA807x PHY
 defines
Message-ID: <e2e74e27-eb55-408e-8d0d-7fb15ebd13f9@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-12-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-12-ansuelsmth@gmail.com>

On Mon, Nov 20, 2023 at 02:50:38PM +0100, Christian Marangi wrote:
> From: Robert Marko <robert.marko@sartura.hr>
> 
> Add DT bindings defined for Qualcomm QCA807x PHY series related to
> calibration and DAC settings.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  include/dt-bindings/net/qcom-qca807x.h | 45 ++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 include/dt-bindings/net/qcom-qca807x.h
> 
> diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
> new file mode 100644
> index 000000000000..42c45c7d5210
> --- /dev/null
> +++ b/include/dt-bindings/net/qcom-qca807x.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Device Tree constants for the Qualcomm QCA807X PHYs
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_QCA807X_H
> +#define _DT_BINDINGS_QCOM_QCA807X_H
> +
> +#define PSGMII_QSGMII_TX_DRIVER_140MV	0
> +#define PSGMII_QSGMII_TX_DRIVER_160MV	1
> +#define PSGMII_QSGMII_TX_DRIVER_180MV	2
> +#define PSGMII_QSGMII_TX_DRIVER_200MV	3
> +#define PSGMII_QSGMII_TX_DRIVER_220MV	4
> +#define PSGMII_QSGMII_TX_DRIVER_240MV	5
> +#define PSGMII_QSGMII_TX_DRIVER_260MV	6
> +#define PSGMII_QSGMII_TX_DRIVER_280MV	7
> +#define PSGMII_QSGMII_TX_DRIVER_300MV	8
> +#define PSGMII_QSGMII_TX_DRIVER_320MV	9
> +#define PSGMII_QSGMII_TX_DRIVER_400MV	10
> +#define PSGMII_QSGMII_TX_DRIVER_500MV	11
> +/* Default value */
> +#define PSGMII_QSGMII_TX_DRIVER_600MV	12

Its not clear what these are used for. I think these are actually
package properties, so having the correctly documented in the binding
would help a lot understand why we need package properties.

Actually using #define like this is probably wrong. You should just
have a u32 tx_driver_mv property, and list [140, 160, 180, 200,
... 600] as valid values. The driver should then convert to whatever
value it should write into the register.

      Andrew

