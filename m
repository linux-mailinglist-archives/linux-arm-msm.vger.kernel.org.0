Return-Path: <linux-arm-msm+bounces-82672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6522C73BC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 89E2B2BD14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AD82E4266;
	Thu, 20 Nov 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="VxgBKxUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6A14A3C;
	Thu, 20 Nov 2025 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638270; cv=none; b=VnbiU6c89zs3ZxsGJegoE9sU55txjrdwiPOVxfCWxqoVBzmi6HwdJ5n9YiaDFGi4TGHy8MHBVtO+n1zIApYrsm+zUDt5nAvU7fuvcWjUZpQGfQJ3ITgVtBi4OWb8kt6dJo3Zm8E8fyyIAe7bjl2J7wY9T6U58OthPIzEseewgco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638270; c=relaxed/simple;
	bh=QJGUiA83Zy67wUbf2pESMCDtasYTZsnvSogijE02TjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iec8t78BZ25GfCrUZ7UlNtnpeRP/jPpir9ZEMQsvr8Jh7my9I2w1zc9IphlQ/H+UXyqNNx6ZwZKKjjI90yFosf/EsV1+5LBmzaR6efaQwcKwJvQw43MC5Mowq/VorTCEr9h/7oAc9531Vp69Qdnp3cJlJwm0VloX1rKkD1BDg6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=VxgBKxUq; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kiWH0/YZBx9aFxNDPIFdolJuvMUpl0yJwssz6YI10nY=; b=VxgBKxUq2Aq7FKSBV1RbjVUfju
	+zReZgekJzT9LDjDfe4qebH7lqQNCk7+WUnAV/ZO+7Qxnh5EBuxb8ZX6Z1jVpkGi4x/bc++LYkMVQ
	F35otdxM3SNxdjDcBH+5J6gAgmjqlNRsV4zD9R9QS9KsoWOA/VdMggGSKQfchF0R0y6QrN61nq2vQ
	LHH3nuW1mbDsOF9PT2srPRfQhpFUiVCvuep1RQnrQ/3Tk8vWY74m9wdgIA7/xP8CoqguR/mhEffIS
	Is28Cbajewd52w6d9Ky14ayNlSVvKFowAjsP2q07eCDZh11rPRLA8JCNmRefn87+4LlOWXhmTPzWP
	qqOt9epQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54204)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vM2sQ-000000006A3-0xfZ;
	Thu, 20 Nov 2025 11:31:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vM2sO-000000004LM-0FuK;
	Thu, 20 Nov 2025 11:31:00 +0000
Date: Thu, 20 Nov 2025 11:30:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 1/3] net: stmmac: qcom-ethqos: use u32 for
 rgmii read/write/update
Message-ID: <aR778ygQp-SZO19n@shell.armlinux.org.uk>
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
 <E1vM2mq-0000000FRTi-3y5F@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vM2mq-0000000FRTi-3y5F@rmk-PC.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 20, 2025 at 11:25:16AM +0000, Russell King (Oracle) wrote:
> readl() returns a u32, and writel() takes a "u32" for the value. These
> are used in rgmii_readl()() and rgmii_writel(), but the value and
> return are "int". As these are 32-bit register values which are not
> signed, use "u32".
> 
> These changes do not cause generated code changes.
> 
> Update rgmii_updatel() to use u32 for mask and val. Changing "mask"
> to "u32" also does not cause generated code changes. However, changing
> "val" causes the generated assembly to be re-ordered for aarch64.
> 
> Update the temporary variables used with the rgmii functions to use
> u32.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Konrad provided his reviewed-by in
https://lore.kernel.org/r/76d153cf-8048-4c6f-8765-51741de78298@oss.qualcomm.com
but for some reason I forgot to add it, so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

