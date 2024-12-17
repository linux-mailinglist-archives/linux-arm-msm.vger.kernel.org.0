Return-Path: <linux-arm-msm+bounces-42511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E09F48B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFCBE16802B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88D91E048B;
	Tue, 17 Dec 2024 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gWGmhB3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A2C1DF992;
	Tue, 17 Dec 2024 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430739; cv=none; b=rsOlpNANwLQZFWotnaRCm/IRyZzWQ9sUSMAPteEO+pxapmGxpPZhk793oBonmvNYKof3/E2+K6SKbJuO6EMDG2Hg2PIlitE9XffN7EY9Vu+9IE9egT39r7fnamopnhiK33g/7+IXxND5KPYlfg4ytT4WZ2XKFuqV1ByvJbLdgf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430739; c=relaxed/simple;
	bh=99auG3P/2zP4yZZELzY0QJT/m1W4Mqi1G40vtU5hTp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsjZIDlH0P42IMzqgu9KdkNT1cuiA0p+lA+86sXju9IPkalgfEupuH/g/9em1bl7owjPEOIEvP6UMuF/lQ/SHIugkixnKrAOkRSn2/m5Y2jBiGdSEemXLNyCxwgeXahdtTQM5jalu4px5OMtAfj8tiuGeo/r5/eIqzj5S/AoOs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=gWGmhB3g; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=08bNYq74WR4+X/zvkYA910qgBONyz0O6+aeo/BmZhEQ=; b=gWGmhB3gUZtO5up22sRxE/m+ly
	shOSuRC0OwLZQcV51/Kg2/lWWxl8r1BuXPz8LoNSO9B4HT1q6hFnDh6tEBXEwPYOf4F4ibwkedwD8
	pcBj7+V6yF+RTdcBzdIJqW8KJKsK2j5lsy8RmMbUfIjDHFNDk2SFqpttMgote3V371BM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tNUfB-000upE-5H; Tue, 17 Dec 2024 11:18:49 +0100
Date: Tue, 17 Dec 2024 11:18:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
Message-ID: <8acf4557-ac10-43f1-b1ab-7ae63f64401f@lunn.ch>
References: <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
 <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
 <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>
 <31a87bd9-4ffb-4d5a-a77b-7411234f1a03@lunn.ch>
 <581776bc-f3bc-44c1-b7c0-4c2e637fcd67@quicinc.com>
 <174bd1a3-9faf-4850-b341-4a4cce1811cb@lunn.ch>
 <d711ee4b-b315-4d34-86a6-1f1e2d39fc8d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d711ee4b-b315-4d34-86a6-1f1e2d39fc8d@quicinc.com>

On Tue, Dec 17, 2024 at 10:26:15AM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-16 17:18, Andrew Lunn wrote:
> > > I intend to follow these steps. Could you please check if they are correct?
> > > 1. Add a new flag in DTS to inform the MAC driver to include the delay when
> > > configured with 'rgmii-id'. Without this flag, the MAC driver will not be
> > > aware of the need for the delay.
> > 
> > Why do you need this flag?
> > 
> > If the phy-mode is rgmii-id, either the MAC or the PHY needs to add
> > the delay.
> > 
> > The MAC driver gets to see phy-mode first. If it wants to add the
> > delay, it can, but it needs to mask out the delays before passing
> > phy-mode to the PHY. If the MAC driver does not want to add the
> > delays, pass phy-mode as is the PHY, and it will add the delays.
> 
> In this scenario, the delay in 'rgmii-id' mode is currently introduced by
> the MAC as it is fixed in the driver code. How can we enable the PHY to add
> the delay in this mode in the future (If we intend to revert to the most
> common approach of the Linux kernel)? After all, the MAC driver is unsure
> when to add the delay.

You just take out the code in the MAC driver which adds the delay and
masks the phy-mode. 2ns should be 2ns delay, independent of who
inserts it. The only danger is, there might be some board uses a PHY
which is incapable of adding the 2ns delay, and such a change breaks
that board.

But i assume Qualcomm RDKs always make use of a Qualcomm PHY, there is
special pricing if you use the combination, so there is probably
little incentive to use somebody elses PHY. And i assume you can
quickly check all Qualcomm PHYs support RGMII delays. PHYs which don't
support RGMII delays are very rare, it just happened that one vendors
RDK happened to use one, so they ended up with delays in the MAC being
standard for their boards.

	Andrew


