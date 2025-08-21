Return-Path: <linux-arm-msm+bounces-70039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C01B2EC00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 05:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38A2A24F95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 03:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA92E281353;
	Thu, 21 Aug 2025 03:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Hmv4e2X6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD62E7BC6;
	Thu, 21 Aug 2025 03:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755747216; cv=none; b=qCxUWBGRCvXFwjarXQQxK9oa5AiHUKwM/BmtlgwgR0gVzle2I7L/7l3ksX14I8a3GuCHeXVyXecxwbsv40I92Fpxed0rzgfByxENLbUd+vE1vy2VPZB9MlQ84E4Q5BsgBULA8ZX+hqQmwgLGvy9oUgTllr7rQAlHHtOowmMMxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755747216; c=relaxed/simple;
	bh=24BH5Rkal4AnYqqQtj74V/4hPzsLJlrlUZGruS4Dg3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCRdU5qC96Ql6SmPK/tGMLPr1eYwwWWe6t1R/oX5C8gzbDYJnu7ZhtVFRl3oUJuXmSZOd6TQyUROLN6mHiUBTNL5SQ5eIcbkhAn70nuD/tpOlC2rTPBDAnJcu1k+wFmsv1A0bajgjMclspA98o8mdVgxSMIboBvQWHp97nUf47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Hmv4e2X6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NhecIOpybuUkmVRn+RV36PWvwdJyuFnrfxzmzDFBna8=; b=Hmv4e2X61kfRt4AKpoofe646kq
	+OlNDQvtDGPXi8oms7OYJ/6oEIjEzhjsJL7A5gesXFfDlcKge+jHv9dBJY7j3XTHjRIhzF4LDk1xe
	gSVBZl88aCPwpRJU9bXmBTeLW2ajoPbGtz6VNWFLA7d3SqcqG1hM3eowksQ0wkAClWoE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uow3G-005P9K-PC; Thu, 21 Aug 2025 05:33:22 +0200
Date: Thu, 21 Aug 2025 05:33:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH v4 2/6] net: stmmac: Inverse the phy-mode definition
Message-ID: <f93d325f-2c04-49ab-ae92-b87ae88ab49d@lunn.ch>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
 <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
 <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>

On Thu, Aug 21, 2025 at 10:22:05AM +0800, Yijie Yang wrote:
> 
> 
> On 2025-08-20 00:20, Andrew Lunn wrote:
> > >   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> > >   {
> > >   	struct device *dev = &ethqos->pdev->dev;
> > > -	int phase_shift;
> > > +	int phase_shift = 0;
> > >   	int loopback;
> > >   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> > > -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
> > > -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> > > -		phase_shift = 0;
> > > -	else
> > > +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
> > >   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> > 
> > Does this one setting control both RX and TX delays? The hardware
> > cannot support 2ns delay on TX, but 0ns on RX? Or 2ns on RX but 0ns on
> > TX?
> > 
> 
> This setting is only for Tx delay. Rx delays are taken care separately with
> DLL delays.

If this is only for Tx delays, why is it also not used for
PHY_INTERFACE_MODE_RGMII_TXID?

It is simpler to just let the PHY add the delays, the PHY drivers get
this right, are well tested, and just work. MAC drivers often get
delays wrong.

	Andrew

