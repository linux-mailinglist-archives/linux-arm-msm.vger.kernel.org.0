Return-Path: <linux-arm-msm+bounces-60063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FAACAF8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 15:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76113B0A68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 13:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E920221F31;
	Mon,  2 Jun 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="NkckSpJA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B966F1DE2CC;
	Mon,  2 Jun 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872175; cv=none; b=iqH1zP361pcK7hjWxEDKqCBc0u2Dj02gzQm8ReiKam5bd9rgiiyKhwZrMt3KGf96I1csYiAbMfTsAnkrFtPvRKYvrF7kiyoc4+6adlqsQBv3oXXc0OJyD0XR5UMKx51KtE+ehv7vaBHQLd0MPbhCswcNxHLp6JHrESnyc4rODkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872175; c=relaxed/simple;
	bh=uUC0Tmx0QaerHMkNytkLZoq4sJKr8yMxwE6hyQWxQKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpvTJWnIde1SPr/qapSb+z9U5nY4UARMFvzCC+djLYnFtqcWobcgahd7t9DgfKPCBp5faLzwCCFzkrriRInJIOybWak1Py8sSo2oeH4s1aJYZx6MhiKhCgcS2rIKuf5PqiPKYpKMTGvMpgAcsj4eesywevAkbwkhWA+aS0npjWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=NkckSpJA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KClf/L5EO+Fw2bszJ2s3soremDMaf6aoB4Nu/1spgug=; b=NkckSpJAU2VS4CdB+rRmbjzTG2
	lhR7A+lZ/8EdGDqMJcnnejHhI14DpDzSdaIQ2LbYd1s3Qi801deLq7XcRD5khbjeaUhuuWGPuzNhe
	j7MGsj6PbNhWQ/n+I08WjrwI8rgYMCn4Xpd76L9TXel8l3jFHs6TTr8dZlcX3XUhXm5o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uM5XV-00EVR6-A8; Mon, 02 Jun 2025 15:49:21 +0200
Date: Mon, 2 Jun 2025 15:49:21 +0200
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
Subject: Re: [PATCH v3 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
Message-ID: <7b92f27b-3953-4673-a532-6671acdfd402@lunn.ch>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>
 <3704c056-91b9-464a-8bc8-7a98a9d9b7a7@lunn.ch>
 <DS7PR19MB8883B6501250F67CB83415BD9D62A@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883B6501250F67CB83415BD9D62A@DS7PR19MB8883.namprd19.prod.outlook.com>

> > So shouldn't there be an else clause here setting these two values to
> > their default, undoing what the bootloader might of done etc.
> 
> DAC values are only set if the property is set in the DTS. If the property
> is not set, the default values set by the PHY itself are used, and as you
> mentioned below, DAC values aren't modified by the driver.
> 
> > 
> > Or you can change the binding, and say something like:
> > 
> > +            If not set, DAC values are not modified.
> 
> sure, anything else you need changed for v4?

We have seen cases where the bootloader does the wrong thing, e.g. in
this case, hard coded for short cable. A DT developer than looks at
the binding, sees that the defaults should be used, and are confused.
By accurately wording the binding, that the values are left untouched,
it gives the DT developer a hint where to look, at the bootloader.

So in general, i tend to be picky about what does it mean if the
property is not present, because its a detail which is often
overlooked.

I did not notice anything else, but net-next is closed at the moment
for the merge window, so you need to wait a while before submitting it
for merging.

	Andrew

