Return-Path: <linux-arm-msm+bounces-59567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6A4AC51B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB0E3B763C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9549E27A440;
	Tue, 27 May 2025 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XUDlofJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD86C27A115;
	Tue, 27 May 2025 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358752; cv=none; b=kmUMos5gknE8HJxJXvGiu3eYGzS0VwgAsEJMFpFGp+qzYa7n+Njoufv2lLIh7yhw4BfiCyqT1jxfV5X4QpwwS6V/fyrnPrtQ8bz7NQy9XSRiMH0esaT5XZDda6QAsYFHUqXVEY9MRPy2/+1kx6fEGAipuy0uoWJzbMJ109KvVZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358752; c=relaxed/simple;
	bh=i1izgY4AdPBoA/aLpjd0mqVJLxQxVt8v1Sb/555Jx7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFB2H90qo9GrSVYPcqPvcP+IW6OVezAz8+Q6g6VQQ45eUmxzi4Sc+GbnO5fwJS2LJb/8kSBsSazDMAhWzLQwTTUQRTlc7BgarUW+STNZeKSV3gx1YvN7p6wlr8IUlZHyek6srnUvEi6QXWFJSe1RU1Rl/rKfXYCCpqiy67yEBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=XUDlofJk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=II+rQXL66g1YBKsr0ptDpu6PhCQVdvx2KUk/dBD6RzQ=; b=XUDlofJkY1O+4ZG5zB9Jbly2/d
	0FmWWE1V14IDeX8wKhLcXZhzX4T8Kc1H4KWadvDaoqWgqR26GUXS4QnpPVrX24sqFgvnJYxsnPIta
	Tg/Pkf0fHXMs3ouhyvAN5N5xraf/sWtU+HpUbSIczf8COW+YOFJtC6yhW5xI+Qpzx4Uc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJvyT-00E5Ue-If; Tue, 27 May 2025 17:12:17 +0200
Date: Tue, 27 May 2025 17:12:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: George Moussalem <george.moussalem@outlook.com>,
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
Message-ID: <44988e1e-3ccb-4840-aa39-f28331d3c340@lunn.ch>
References: <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
 <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <0c57cff8-c730-49cd-b056-ce8fd17c5253@lunn.ch>
 <061032a4-5774-482e-ba2e-96c3c81c0e3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <061032a4-5774-482e-ba2e-96c3c81c0e3a@oss.qualcomm.com>

> does this sound like a generic enough problem to contemplate something
> common, or should we go with something like qcom,dac-preset-short-cable

I've seen a few other boards with back to back PHYs like this, and
they did not need any properties.

It could be this PHY does not conform to the standard, does not have
the needed dynamic range, and is getting saturated.

What we do have is:

  tx-amplitude-100base-tx-percent:
    description:
      Transmit amplitude gain applied for 100BASE-TX. 100% matches 2V
      peak-to-peak specified in ANSI X3.263. When omitted, the PHYs default
      will be left as is.

This is intended for actually boosting the amplitude, to deal with
losses between the PHY and the RJ-45 connector. So this is the
opposite.

The description of what the magic value does on this PHY suggests it
does more, and it cannot be represented as a percent. So i think a
vendor property is O.K.

   Andrew

