Return-Path: <linux-arm-msm+bounces-48520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD1A3C124
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 15:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1E351894B45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 13:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC941E47D6;
	Wed, 19 Feb 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="J4MZNuAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB481EA7D3;
	Wed, 19 Feb 2025 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973565; cv=none; b=OQ0m9o9DGZVrAO0T6CIKMdBh3Zstazb+iZ3ACwllAk/gUXAaRWijYQCkSmoI1CXfnStQQ4GdxfgydTnu+kOmuwfMGF19T1T/ixY7msgI41UekzPqitUIpivFY3yEMRgSOK9Oo9zS68O+9KqniSxkTiFMIx8h4tZ8pPWwM7lUX8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973565; c=relaxed/simple;
	bh=MK0phgaQRCegH1J52fj+5zFrPM1/oWIfgyfvI6LyhN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPCXQV/uJ974kWGsX9tJY7mx6e18qHOQ7i564WNKEGPejVfX5Epp8j9PnJq4YJGiz0JRrviKXNR7PEQUYAejcmMklvb2SRn8uxp5//X0SApbCdedIbCQR3ATIVwj6bbg4t1ZbDj6J6i8LjPTK1los6k/Xh9QZHCjvR4LSrCIM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=J4MZNuAP; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AsVA/3+z052ckfhgFc5v/TCDxkTIXEIhkvdkXCOwYNo=; b=J4MZNuAPjx/9qckWvgiqDtcIn4
	NaIjNBnsK90wNUFMoWAK+bIBLQ2NcwSNXAkf3IG7kLjWkSrwwgr80fRHzNQe+IDmXCF7yzh3a5/8S
	snrRb6BMHHY9I3MWi9KdJO2UhnEICnAsiMHbZc9vNBecBYNZVVYgcZ6jqFtvoUCIDkLI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkkbW-00FeCA-6Z; Wed, 19 Feb 2025 14:59:10 +0100
Date: Wed, 19 Feb 2025 14:59:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	George Moussalem <george.moussalem@outlook.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [net PATCH] net: phy: qcom: qca807x fix condition for
 DAC_DSP_BIAS_CURRENT
Message-ID: <0c234dd4-6bc4-4cbc-acfd-0607d95308ec@lunn.ch>
References: <20250219130923.7216-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219130923.7216-1-ansuelsmth@gmail.com>

On Wed, Feb 19, 2025 at 02:09:21PM +0100, Christian Marangi wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> While setting the DAC value, the wrong boolean value is evaluated to set
> the DSP bias current. So let's correct the conditional statement and use
> the right boolean value read from the DTS set in the priv.
> 
> Cc: stable@vger.kernel.org
> Fixes: d1cb613efbd3 ("net: phy: qcom: add support for QCA807x PHY Family")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

