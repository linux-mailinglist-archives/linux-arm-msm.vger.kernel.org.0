Return-Path: <linux-arm-msm+bounces-60482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0FAAD02B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 15:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC88017549C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 13:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B734D1E3787;
	Fri,  6 Jun 2025 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TepEHMbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B8217BA6;
	Fri,  6 Jun 2025 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214901; cv=none; b=lxvvUigQDU/k2AqVhu1Q4r3X5kpjH4BYQwCaKt/sKyEuT2sP+J1Slz+fCl/Ss3tG8lAZRWowcUKBq985ovrDDmaQALzPZW2h5jdrRQqja4wnUnF9/CEs/rEJM/mVPw5yd+RRj3NMQlZn0/v5v/rCcM9HFnvw9TyqKM54Oge9mtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214901; c=relaxed/simple;
	bh=2hmfzLTFQoz+aXCgJgTLta5MXh4EJa7MD3vdn3sJZ0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bN7Spxz0IMOhN19DquD+d6F29znYM/gXbY25VkZTV9bI6n3K0GMj2EWY3MzZpbTOoLLf/VeK0hjEl0UZfiNF/dwHhJo5oJyxC56bCI+yjq+PFgNpmITm+CfbBy9sBUpcsTNNqwj0EXRF52RqWWuWuqHMqPWEl/lcTPv6GEROuXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TepEHMbD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=s3zv3PqwGPQB5IvLFRjdfPtcpTluyD2FX9XC997uiLM=; b=TepEHMbDSDCaHWfi/zvdx7+Lrc
	iJ/uecvTglspKsiExk7VVxrh9BdgQegRtdJCWh1eyjF3HeMSpDjtrV84biMU2o37MY5vSDuF+oUmX
	ISYzMR3r3wjh2E3mlmS04xytoRbLgQ7VRyFHNB1ACR38KF7fPxgRoPzvaDOwkmKu88kY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uNWhK-00Eto5-Hf; Fri, 06 Jun 2025 15:01:26 +0200
Date: Fri, 6 Jun 2025 15:01:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [PATCH v3 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018
 Internal GE PHY support
Message-ID: <23b92ed3-7788-4675-8f80-590e4337025c@lunn.ch>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-2-421337a031b2@outlook.com>
 <20250605181453.GA2946252-robh@kernel.org>
 <DS7PR19MB8883E074E64AC6FCAB1B1DE69D6EA@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883E074E64AC6FCAB1B1DE69D6EA@DS7PR19MB8883.namprd19.prod.outlook.com>

> Under 'properties' node:
>   compatible:
>     enum:
>       - ethernet-phy-id004d.d0c0
> 
> Q: do I need to add the PHY IDs of all PHYs that the qca803x driver covers
> or will this one suffice?

The history is complicated, because PHYs can be enumerated, which
makes compatible mean something different to the usual for devices
which cannot be enumerated.

I personally would search the in tree DT files and find any which list
a qca803x compatible, and add those.

	Andrew

