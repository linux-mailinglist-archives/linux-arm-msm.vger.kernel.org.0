Return-Path: <linux-arm-msm+bounces-59553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6933DAC4F52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28FB6188BD1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D582701D1;
	Tue, 27 May 2025 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gy7K2xp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBF1BF33F;
	Tue, 27 May 2025 13:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351314; cv=none; b=rJtfk94jRbhMCT2ZjPnasKayYekG4EYzTwrRKMwmg+g3NmjHq5S5aFzJcBd8725NKyq5L42L61MPRHX00lNLNQk+DXdd/KOxHUrPZHSi+JqoHJOFVNDXHx4jkzxYQv3w51oEXeaD03Lqp0BjSR1/o3MOo9nsI0kdhbDRXgS4CsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351314; c=relaxed/simple;
	bh=GyqnFA67vNMTN7nBS4yxcioiT5LHr0wB3N3vtXA1fCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kACdCE9Mcyd/VbTFrHXx+aXrTFbKUq8YOAodviUu4x85JEjurpIZDsHfxY2dEX1E166OilnWw3qRJ233TV0PKYVPS58kuy0PRJqgrpdveM1ZooTMz4wUwn2MU4jzbHQb/16rAQYjsuTS06L+JM/A7Yzk2bKeKsjetOe01PNUaec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=gy7K2xp2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4bN0OqR1WicbAsGpg+98F6Jxk6N5NYo/HvpHfvT3B+Y=; b=gy7K2xp2EulUgSavLtvFA+S4En
	PmyS+rHoXBivo3sZDakMNfe0jgxPTbD1PO7rEmmi8dvZ2cjCk5YBFZ9WJRiweg+8REBWi7AyI7TvY
	+DOro/bwZ30pjC4J3opv35bvs6p9t/p3sOJbYwHmgG6W1merhzgWmJ1r4QsM8Urt47uk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJu2V-00E4qc-Uh; Tue, 27 May 2025 15:08:19 +0200
Date: Tue, 27 May 2025 15:08:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal
 GE PHY support
Message-ID: <0c57cff8-c730-49cd-b056-ce8fd17c5253@lunn.ch>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
 <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>

> > > > > > Would qcom,phy-to-phy-dac (boolean) do?
> > > > > 
> > > > > Seems fine to me.
> > > > 
> > > > Can the driver instead check for a phy reference?
> > > 
> > > Do you mean using the existing phy-handle DT property or create a new DT property called 'qcom,phy-reference'? Either way, can add it for v2.
> > 
> > I'm not sure how this is all wired up. Do you have an example of a DT
> > with both configurations you described in your reply to Andrew?

When a SoC interface is connected to a switch, the SoC interface has
no real knowledge it is actually connected to a switch. All it knows
is it has a link peer, and it does not know if that peer is 1cm away
or 100m. It does nothing different.

The switch has a phandle to the SoC interface, so it knows a bit more,
but it would be a bit around about for the SoC interface to search the
whole device tree to see if there is a switch with a phandle pointing
to it. So for me, a bool property indicating a short 'cable' is the
better solution.

	Andrew

