Return-Path: <linux-arm-msm+bounces-43266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF59FBFB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 16:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17213164CB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 15:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7851D6DCC;
	Tue, 24 Dec 2024 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="6RkFbR//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB441BC3C;
	Tue, 24 Dec 2024 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735054912; cv=none; b=QroNPGvKQ3teKkhvVG/5funwzY08vWIZv4pGSKfkQIMbjD+TuD5IJ8vGe7Vn7eH1TB3BJoVPBXDjapOszGu+qQvwnnVcyfHyo9laLv697WOX0b62qMYAsyqWSiZR+zD8z3g6njCe69Yd9uLnqeHDFI5H0dowRBtvTfBm8Qx5bdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735054912; c=relaxed/simple;
	bh=yOgkjKVNtaobqrUkNZRT8A8qmcVQEZTQucVKdcE7eRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izrsMcxO90rxsNNxJteEPDo+Kpgpe5IbbyYtwVicsLq2APQNg/ESxj9wJCIf8KBprUr43bWfa4aBdob5L6EGAuq6uCtzx11Gp6PQGIvZTu5Ttt4N8Ze9KYiIrCV0xNX56UXxhxIGCn25dukDumAXEzJShiw0tarc63m9IeWyXuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=6RkFbR//; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zMq0rP8PmA2bT7MNqp6i+Yh8RUZKOT3MQ++m1J8pGSI=; b=6RkFbR//fKYUmEMFj4hYgUvvHg
	pqmDwnCX0VlOnJGHuB4+GJwxIhwGH293E+PjCikZrJVNnZmaNigswQMoJqVUK9ROlO8jyybkXNWT9
	1kiXKU2NcPFBsI5vt33IHKmV//UdrsBt+2cEk3ivBy3QwTftjtzOCywRPo6YrBTFKWJo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQ72O-00FsLg-Os; Tue, 24 Dec 2024 16:41:36 +0100
Date: Tue, 24 Dec 2024 16:41:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: Lei Wei <quic_leiwei@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
	quic_linchen@quicinc.com, quic_luoj@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	vsmuthu@qti.qualcomm.com, john@phrozen.org
Subject: Re: [PATCH net-next v3 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
Message-ID: <efb47edb-0229-46cc-a6cb-8fff8168a55e@lunn.ch>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
 <20241216-ipq_pcs_6-13_rc1-v3-3-3abefda0fc48@quicinc.com>
 <d278ad9a-5d23-4cb8-9de7-5a51d838ba5d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d278ad9a-5d23-4cb8-9de7-5a51d838ba5d@quicinc.com>

> > +static int ipq_pcs_create_miis(struct ipq_pcs *qpcs)
> > +{
> > +	struct device *dev = qpcs->dev;
> > +	struct ipq_pcs_mii *qpcs_mii;
> > +	struct device_node *mii_np;
> > +	u32 index;
> > +	int ret;
> > +
> > +	for_each_available_child_of_node(dev->of_node, mii_np) {
> > +		ret = of_property_read_u32(mii_np, "reg", &index);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to read MII index\n");
> > +			of_node_put(mii_np);
> 
> Assume, the second child node failed here.
> Returning without calling the first child node of_node_put().
> 
> Please clear the previous child nodes resources before return.
> 
> Thanks & Regards,
> Manikanta.


Please always trim the text when reviewing. It can be hard to find the
comments, and they can be missed when there is 300 lines of quoted
text you need to page down/page down/page down...

	Andrew

