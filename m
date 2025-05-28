Return-Path: <linux-arm-msm+bounces-59689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3577AC68BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB91B173620
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2891B215789;
	Wed, 28 May 2025 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EAxqgP+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120B98F5B;
	Wed, 28 May 2025 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748433630; cv=none; b=Q8zOOtLwBGpG81I3AH/8qGXZqRjy6uHw+aGYg427I0SARc34UGfvRf3aEFOizg4/OUX3o5+8tH7vTCApIaIFH4xBrwKtum6Dm8CBbMIPen77X0cBlIoP3pWOUaNvw5sNVa1JOORfxK88I/16eDe5j0/bc4lMWj+FtwfyAZ9+ZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748433630; c=relaxed/simple;
	bh=SsIAmKmwkMtkSAd3QVrSPLF7Sp550ExJCVeSF0sol98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgwEgeJH/D1MaZYc4SapA8SxFO7cuuBde/1JDuYi4orcjmqUBmF0zWPnZ2vxzH2TCsElqHVvd1NXfli/xkB9NBeJ1deo9BZzqWVHnsqlrtbLoW8I31nKkeSKkg007cAJB/w9edMMQmxQg/ZEpczTykr3fidJMh644zagAtWUlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EAxqgP+1; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dV3eQpNExxrijyFxEV95kr4cl+TTrjeE1N0GDTs8/+8=; b=EAxqgP+1handHDv/C0kUYm2aph
	Bu9zbKLV03ttAqr7iWVXQfu+P6jEnNJ+HPXPQat9/dhigaLy0FrknLAbbAcnDjoX5Bzzkga8xHA/C
	hGfrSFVCIuON1HIiZkt0ti8vcXcIXJ2uv5IV+ExrbIhyyc5iE74446AAiDlsrj7xnTfw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKFSH-00EAiT-4p; Wed, 28 May 2025 14:00:21 +0200
Date: Wed, 28 May 2025 14:00:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: George Moussalem <george.moussalem@outlook.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>, linux-clk@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/5] Add support for the IPQ5018 Internal GE PHY
Message-ID: <33114549-39d4-4745-9100-5222c2753a50@lunn.ch>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <174836830808.840816.13708187494007888255.robh@kernel.org>
 <DS7PR19MB88839AC485C51FD2940BEE6D9D67A@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB88839AC485C51FD2940BEE6D9D67A@DS7PR19MB8883.namprd19.prod.outlook.com>

> > arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dtb: ethernet-phy@7: clocks: [[7, 36], [7, 37]] is too long
> > 	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
> > arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: ethernet-phy@7: clocks: [[7, 36], [7, 37]] is too long
> > 	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
> > 
> 
> These pop up as the phy needs to enable 2 clocks (RX and TX) during probe
> which conflicts with the restriction set in ethernet-phy.yaml which says:
> 
>   clocks:
>     maxItems: 1
> 
> Would you like me to add a condition in qca,ar803x.yaml on the compatible
> (PHY ID) to override it and set it to two?
> 
> Likewise on resets, right now we I've got 1 reset (a bitmask that actually
> triggers 4 resets) to conform to the bindings. If, as per ongoing
> discussion, I need to list all resets, it will also conflict with the
> restriction on resets of max 1 item.

You should describe the hardware. If the hardware has more than one
reset or clock, describe them all, and please fixup the binding to
suit.

	Andrew

