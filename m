Return-Path: <linux-arm-msm+bounces-79683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0EC1FF76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 13:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6A294E951E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5DF29ACD8;
	Thu, 30 Oct 2025 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="k48QOpUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30948213E9F;
	Thu, 30 Oct 2025 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761826653; cv=none; b=l+i37ROwyqR3Vel4yEknFCcz4XeyfmWdAlu2mJfFRDlhWmqyPC8TEQ1iAnzyhB9gK9xSLRFDo1ClzZzrOoyWeQM2yKBwgLGg7Ab8AQNXkKeLi1DhqtHVlyVVU9voJjYPwE7RpfH7ieHwWUza0GrgYdJ8fH6QDozbp64BmgrEPLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761826653; c=relaxed/simple;
	bh=qvWSYZdUv5qTWPhkk6lF2m3AuoqufdJYY9ixKPI1n1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sl6m9NKSgSjx3jVIAKOa5wGi1D8VS+Mrndx5+nnphHIXk1CiWzzwVuSOpoPYSdQ6Dov2a0OEK8FdN3abL7vnKk6UKFnVo5tSfEpuD4TExYdZgrL9xTKqplrUv2VI+v6v1+Nb5qVPfrRiIZu6wY+JTLT7um5/2wwQPcZD5Vd2m4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=k48QOpUw; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vuv1is53BAz60PbjKMm5symKbxvv81WCacTJbFJUDyo=; b=k48QOpUwrL1gnGYVyWCCPy5di3
	OfjNwahayNTD9Qjxdp8t0BmohEcGgeA0EyIutv2alMoQ4r0mr+X1E0qF6V0rrub7u3yvOVBNLghQa
	R7saTwU7H6zHqJrF4/uh3E40i+JFwDn0VsGBRkAiN8GbcASMVfdlbb8iEuN5wjyPmkhrmhzCyNTLn
	XmIpM+9Et00fSnSsv3gSbjKSVazcKSFyKtXKXX8KhEgvohafb7GE6ZBnRLcYhadeOHUWG4XZtbyNM
	yQcArPDqV0Igo+WR2YnF3GJSQLPfGBLHOwqZN4VMu/Ce2wFI+68pOJAq9qBM8nrNbtPNBXEnIIgxY
	hJ6NUXlg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59084)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vERak-000000005fN-0h0J;
	Thu, 30 Oct 2025 12:17:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vERag-000000008S2-1qDT;
	Thu, 30 Oct 2025 12:17:18 +0000
Date: Thu, 30 Oct 2025 12:17:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
Message-ID: <aQNXTscqFcucETEW@shell.armlinux.org.uk>
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

Konrad, Ayaan,

Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?

Specifically:
- why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
  speeds, but never be cleared for any other speed?

- why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
  for 10M, but never set to any other value for other speeds?

To me, this code looks very suspicious.

If you have time, please test with a connection capable of 1000BASE-T,
100BASE-TX and 10BASE-T, modifying the advertisement to make it
negotiate each of these, and checking that packet transfer is still
possible.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

