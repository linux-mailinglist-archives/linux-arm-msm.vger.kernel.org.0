Return-Path: <linux-arm-msm+bounces-79642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F123C1F7BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 65E5E4E40DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC56E34DB5B;
	Thu, 30 Oct 2025 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="IoRXrcFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD031F130B;
	Thu, 30 Oct 2025 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819431; cv=none; b=crBym9YkUW/3bTdl2zP5r5dN63kU0sXVm9WWqsBkIqVxzZXdAymwRTbxEZXPyaRm78l79mqqVB9w61iIV9noUEdd9RNWFAlKNRCIh0GZh/3gQ+jwSwba4xdLQ0crY6IACGx/hHAGzSOyBwo1joXDQsg9+6O0JpWimeoS88Hr0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819431; c=relaxed/simple;
	bh=fovlRIr1YTZu5Qpcow2iQG10TttYPcgYSbpgXIp1N84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHyKjvSd42zOpQnlipkRcY7Hwnjwt9cc16M68urTqPsyHZt74GIaZXNlQU43zs2ebnoWNnTLKo8a+rEwYh3RcLXh2ANhdhsGlZq38ZGu2oGUdYn00c2M6eAqedaYVZqEVRvjarwQQqm9rt+z0/rLR54ryzg8hFATz9u7supFqEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=IoRXrcFR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T3J3PZ9sZgj309/9WKHqysIytic0WUh2G18+w7Qekg4=; b=IoRXrcFRaFvVL7yx4rn28Pyyv4
	/oxQjShGlkiqn1aLKuTSkN2WMdzHrB6Jn/g1UjHlhaI6PaVCV4aVvmsmf9akOkqZSDGgnrAx8pW7d
	9nxPzk0tkrG+qVZmfswvl3izhs8gUUClescS8svZhzsavm+XN4w744XdDNBF8NAIaAqSYC6JX5hdu
	jitqfBmXesDgPRHGOBomWxLLROXXjxShFPGN+yJhiKMTNNgacg7UeQzyTEA8I4oB+QuFKDcIXIwYf
	U6PepcdtlSl8QMJqPnNf23LO7lYCD8GfTMXkIioVp3oIqwmkZMV6Ah4TEp+lxyi4dCAmXzmDdpnZ4
	uX7rCuow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60374)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vEPiG-000000005VC-3Ry1;
	Thu, 30 Oct 2025 10:17:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vEPiE-000000008NB-08sQ;
	Thu, 30 Oct 2025 10:16:58 +0000
Date: Thu, 30 Oct 2025 10:16:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
Message-ID: <aQM7GVhaK2fhckKF@shell.armlinux.org.uk>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 30, 2025 at 11:01:48AM +0100, Konrad Dybcio wrote:
> On 10/29/25 11:18 AM, Russell King (Oracle) wrote:
> > Whereas ethqos_configure_sgmii():
> > 2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> > 1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> > 100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
> >           ETHQOS_MAC_CTRL_SPEED_MODE
> > 10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
> >     clears ETHQOS_MAC_CTRL_SPEED_MODE
> > 
> > Thus, they appear to be doing very similar, with the exception of the
> > FES bit (bit 14) for 1G and 2.5G speeds.
> 
> Without any additional knowledge, the register description says:
> 
> 2500: B14=1 B15=0
> 1000: B14=0 B15=0
>  100: B14=1 B15=1
>   10: B14=0 B15=1
> 
> (so the current state of this driver)
> 
> and it indeed seems to match the values set in dwmac4_setup()
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks Konrad. I've included an extract from your reply in the commit
description as well, thanks for referring back to the documentation.

Note that B14 is not explicitly configured by ethqos_configure_sgmii()
for 1G and 2.5G speeds which is a harmless bug in this glue driver,
and an additional reason to get rid of this code!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

