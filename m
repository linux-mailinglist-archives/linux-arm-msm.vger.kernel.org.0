Return-Path: <linux-arm-msm+bounces-34245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C25499C1EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A20A1C2313F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 07:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F4214A629;
	Mon, 14 Oct 2024 07:49:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BF3146D6F;
	Mon, 14 Oct 2024 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892140; cv=none; b=hDeI2tLq8L9w3OSX3+zS64uoszoouJeYQhZZSB9ykQxSLG18I9RA/RgFdDzsoBssdJfbK3XE8sOxB2bbEdA6Z1Yj/a1xaasSZ6oscM3fz3dX/PysxZlOdNQFcB2BeC6FEJD/igor4dAIqqijVDAMjOSqz399zKhvRMzx0CIrYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892140; c=relaxed/simple;
	bh=3rkZwtyh6Rfwszh3yxvTLn4jOr2u46BL520LAHsC2bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnXTTWSE8gvMB4lR/KfgjFRYqfPKDdHmNPPohEwdGLUABUJM7HA9pWK7Uz38k2UodGksp4nnaVlYS3D1qLC1st271PWHfnDpov+Fr12w/QXJPZTo9IwmilVcqt5R/KZAXuqEJeEfwHDJPjM9L3mI/kt+xdnxT44BBkni44dYxvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A57920083D;
	Mon, 14 Oct 2024 09:48:50 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 892942021D8;
	Mon, 14 Oct 2024 09:48:50 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3319B20327;
	Mon, 14 Oct 2024 09:48:51 +0200 (CEST)
Date: Mon, 14 Oct 2024 09:48:50 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH v3 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <ZwzM4tx3zj8+M/Om@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
 <20241013-upstream_s32cc_gmac-v3-13-d84b5a67b930@oss.nxp.com>
 <44745af3-1644-4a71-82b6-a33fb7dc1ff4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44745af3-1644-4a71-82b6-a33fb7dc1ff4@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Oct 14, 2024 at 08:56:58AM +0200, Krzysztof Kozlowski wrote:
> On 13/10/2024 23:27, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 97 ++++++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
> >  2 files changed, 98 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > new file mode 100644
> > index 000000000000..4c65994cbe8b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2021-2024 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> > +
> > +maintainers:
> > +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > +
> > +description:
> > +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,s32g2-dwmac
> 
> Where are the other compatibles? Commit msg mentions several devices.

Well, I removed other compatibles thinking we can re-use this only one
also for other SoCs as, on currect stage, we don't need to do any
SoC specific setup.

Is it ok or shall I reinsert them?

> 
> > +
> > +  reg:
> > +    items:
> > +      - description: Main GMAC registers
> > +      - description: GMAC PHY mode control register
> > +
> 
> ...
> 
> > +
> > +        mdio {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +          compatible = "snps,dwmac-mdio";
> > +
> > +          phy0: ethernet-phy@0 {
> > +              reg = <0>;
> > +          };
> > +
> 
> Stray blank line.
> 

Ah, missed it. Thanks. Will fix it in v4.

/Jan

