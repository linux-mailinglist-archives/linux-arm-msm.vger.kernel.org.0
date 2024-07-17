Return-Path: <linux-arm-msm+bounces-26478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DF933F70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 17:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CCFD284E3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 15:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7CA181315;
	Wed, 17 Jul 2024 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vii4OmRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF117F362;
	Wed, 17 Jul 2024 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721229620; cv=none; b=qO0dfNh8vEUVRUOnN5tw/uqyXjZTlf8eUGfYHjTJINFElrTJo8xvTiiWx/5PQJFM7Tr20Z6EFd7VFDkbYHCwp2+KkudfmdD+rUmgWSbfxIklqbwZikWKVgjbatmz68ABo4YnQHPN72v1JRvE6fWneq9gIeHMn2VUWaRgYaoyCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721229620; c=relaxed/simple;
	bh=pnXiXLSaX2ABPLNpss1hOFkqOgIAFE9q9JlGiNOvCz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjTkVT50rNDH6WFqUGSJZBMZxSsDwyywrPD+o7/gg3vae8v3oGCvfZiK8rwWpDiutomy69UHefY81/UmXeLA1JP9G4an7560cB2MPChL6patTRX5VBTYdsWGlULiXbsI2sMUZGGGAwUzrV2bXt0g7r+lM4I9tGxaToCr387fsvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vii4OmRl; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=t2xR2CTg4bBhSx3bvXeNIx/xqUp+eDY4v/gOEN5tLsA=; b=vii4OmRl4N5Z9uXHHzXQVzZks1
	j6452yuRPq1FVpRKpL7/3wLZ83VyDX7x2/gylgh+tfmVkpdheCOGB8vDStR+6PSp5yvWfcFNojLoe
	aCRJvE46sY7AFj1htPeNMCTo8ACpEA2IQ4EnOPtDFK7fyqichPNpT5veRUnpCo8DKEV0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sU6Rn-002ia3-6F; Wed, 17 Jul 2024 17:20:03 +0200
Date: Wed, 17 Jul 2024 17:20:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Timur Tabi <timur@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: qcom,emac: convert to dtschema
Message-ID: <cecaa6c3-adeb-489f-a9d2-0f43d089dd1d@lunn.ch>
References: <20240717090931.13563-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717090931.13563-1-rayyan.ansari@linaro.org>

On Wed, Jul 17, 2024 at 10:09:27AM +0100, Rayyan Ansari wrote:
> Convert the bindings for the Qualcomm EMAC Ethernet Controller from the
> old text format to yaml.
> 
> Also move the phy node of the controller to be within an mdio block so
> we can use mdio.yaml.

Does the MAC driver already support this?

When i look at the emacs-phy.c there is

	struct device_node *np = pdev->dev.of_node;

                ret = of_mdiobus_register(mii_bus, np);

I don't see anything looking for the mdio node in the tree.

	Andrew

