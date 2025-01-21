Return-Path: <linux-arm-msm+bounces-45698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35164A17FE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 15:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F9218843A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 14:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CE11F3D59;
	Tue, 21 Jan 2025 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gEupoOAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD491F1508;
	Tue, 21 Jan 2025 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737470077; cv=none; b=WG9ke0W0UWrUixmEMeECZujHxFDEQdGIDjvE8vYPxJGcmxa3sv98jfI+wIE+yVVSPFQXyVlU1ljYpBKdubeVkn2DcuEzoPBcGKgMgNKcqA/ThlE2/JQBtaXpN8lXUqy75pm5j3UWVpjDOKv1wiK5qfFIhmjSZMjqR9azMn7yxm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737470077; c=relaxed/simple;
	bh=KI4hyPnJz8LjTimAis5H99w6OwrSz7DrW76BQAXYScM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=airL7Y/IZCiso/uP5Fv/UZ/mIgqYRI/A5ViWXfOpX4sx9fxnz5v4dsAC7bFaWdfevGpa0YDN1NG7R7XPxpQYNN8RjJLJ71du1dyZNc3Yggf9rHwrqUTtvMfSKfvszsTD8/m9sA+aK2BsJ8wSltA6SdkiLyxeFGqCIAeTPOY9U6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=gEupoOAP; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5MfTDBXKnfQgtBuHJqYH787sbTmGoB/81OUCCryIhhg=; b=gEupoOAP7LxUmTZs8ih/lPQx+i
	wUawPIwk0bYMEQK3Z66L6KQowqftXS6uuEiU2QO1fkwWu50PRRBamuVf7fcweqfXwhjeG5q6Jeh5m
	VdhQUHHCvED6l70O75wAiLkX4ycCNm0PkyBRgKonlciLC0XgnteJFOioUSjqJPK7akWo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taFKd-006enL-3z; Tue, 21 Jan 2025 15:34:19 +0100
Date: Tue, 21 Jan 2025 15:34:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable
 swap on qcs615
Message-ID: <ebf3238c-12ec-4da7-bcdf-594bbe070a82@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
 <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
 <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
 <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>
 <0fe23cfd-9326-4664-9c94-cf010aec882c@lunn.ch>
 <89d4df79-a202-407a-bcfd-6af5315c403c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89d4df79-a202-407a-bcfd-6af5315c403c@quicinc.com>

> > Maybe you should go read the RGMII standard, and then think about how
> > your hardware actually works.
> > 
> > RGMII always has a variable clock, with different clock speeds for
> > 10/100/1G. So your board design is just plain normal, not
> > special. Does the standard talk about different delays for different
> > speeds? As you say, other drivers apply the same delay for all
> > speeds. Why should your hardware be special?
> > 
> > RGMII has been around for 25 years. Do you really think your RGMII
> > implementation needs something special which no other implementation
> > has needed in the last 25 years?
> 
> I do not intend to violate the regulations of the RGMII standard and aim to
> maintain the same delay across all speeds. But the RX programming swap bit
> can only introduce a delay of 180 degrees. Should I assume the 1G speed
> clock to calculate and determine if this bit should be enabled for all
> speeds?

Lets rewind a bit.

The RGMII standard specified which edge you sample on. Since it is
defined, no other driver has a configuration like this, they just
setup there hardware to be standards compliant.

Why do you need the ability to break the standard, and sample on the
wrong edge?

I can think of two reasons:

1) You have a PHY which is broken, it also samples on the wrong
edge. This is a workaround for that broken PHY.

2) You have a board with a clock line driver inserted between the
RGMII output pins and the PHY, and this line driver includes a NOT?
This line driver is causing the clocking to break the RGMII
standard. You are working around this broken board design by getting
the MAC to invert the clock.

Is there a third reason?

Lets first understand the details of why you need to be able to invert
the clock.

	Andrew

