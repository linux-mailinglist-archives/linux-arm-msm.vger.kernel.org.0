Return-Path: <linux-arm-msm+bounces-59438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E9AC4086
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09F51899997
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 13:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0A020D51C;
	Mon, 26 May 2025 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="FHgAgwE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21C520CCE3;
	Mon, 26 May 2025 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266454; cv=none; b=CMQhuIA9I6M2R37/iJTX1oob8gqpx4f7qdirQth5jUueJ4lMh1zXZptU5BTRAyF0oKsZk0zH6qNR+QDkcP3TjuiF1690HQXYOYDksAzWUxXlvxzpFQksAaS/SI1oOmAswkEoUzfT2M1JIPcOyfKMmg8ygucI0ReYkd2e7Ycl0XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266454; c=relaxed/simple;
	bh=FRBuviFhvwRiqro8X8chmfWguThYA9CbrHVfEKsY1Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqQozdQooMXi2Jy5aMxjcuLAl9XcCh30PRm4dl8ex6qyFHIACtNHeJapG57slee8diCFMAkS+DY/cB6J6eXd+MTpB7XloEAY5v/014+R1l/4nFXhrpZrxy2tS820ZgsU9IYy4tg7rWnpO1c81QDI7eHXCzvsGDShGjXhsqYvZic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=FHgAgwE7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IZAn8xJlkBn0BeuCUV7NjDGcKQINtg4KUlNlcZZtIkU=; b=FHgAgwE7+cikHDPIChRxA1XoNl
	s/u1wQA0799Q8L6uMR8FSiEsNxcOYW7TWXC3UCZ+xCz0XyxovWF3G7slW41+3Cjks/Kn/Z916GOV9
	Ofr99MnqQnls8QFDChASchsHYgmaHo77Hlipq1zA9vv7B4YLuj/22rV0XCcG8eeI7wKg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJXxq-00E0DO-IG; Mon, 26 May 2025 15:34:02 +0200
Date: Mon, 26 May 2025 15:34:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <1a6caebd-251f-4929-a7cf-af7c38ca30ed@lunn.ch>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <579b0db7-523c-46fd-897b-58fa0af2a613@lunn.ch>
 <DS7PR19MB888348A90F59D8FEEBB0A9509D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB888348A90F59D8FEEBB0A9509D65A@DS7PR19MB8883.namprd19.prod.outlook.com>

> I couldn't agree more but I just don't know what these values are exactly as
> they aren't documented anywhere. I'm working off the downstream QCA-SSDK
> codelinaro repo. My *best guess* for the MDAC value is that it halves the
> amplitude and current for short cable length, but I don't know what
> algorithm is used for error detection and correction.
> 
> What I do know is that values must be written in a phy to phy link
> architecture as the 'cable length' is short, a few cm at most. Without
> setting these values, the link doesn't work.
> 
> With the lack of proper documentation, I could move the values to the driver
> itself and convert it to a boolean property such as qca,phy-to-phy-dac or
> something..

Making it a boolean property is good. Please include in the binding
the behaviour when the bool is not present.

What you are really describing here is a sort cable, not phy-to-phy,
since a PHY is always connected to another PHY. So i think the
property name should be about the sort cable/distance.

	Andrew

