Return-Path: <linux-arm-msm+bounces-33138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF099905F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50B90280D43
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 14:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914F9216A3F;
	Fri,  4 Oct 2024 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="QetrKEKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B945212EEA;
	Fri,  4 Oct 2024 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051877; cv=none; b=cmkSpvimQC9fkzUdhHPK4AO6Yo+S1PXdiqV+fTGLBqM4yvZwNv6h4jXKIFW2muaklrPEqT+x0kwJleTSeVsdWMRQSpv2kOZOE2jzPPTg655mBG3/IgN+4jFEMUwwrO0lsYkKszbxYuYJgaEPXef6hLOlWYFeZv4fLeTmylB84L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051877; c=relaxed/simple;
	bh=k2Z8ShT2r7R8KmgI+SKVyfuHijsDXcJj/b/kQ+6RNpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ME4AiviWUPOYmdfLF/iyIDOvvwtaOC4n/7O3u5cIO++jZ3Z68ZgJLqiJlhYWTwJFn3yKY2TlH9Kw553+rYdB78KF8F/XJtBlRqMRGFMmRpA4Km5HWRYS/o/irZpa1lr+5pUYaxMlY14QVFRDB2bNwgMG3JJXEhfJDIBq1EFH3oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=QetrKEKQ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C6gDhg5uZqEI92mtooZVl3bYs4A2EKsq3515ZSfhgMM=; b=QetrKEKQfmTAf7eNdumMK32yJT
	lCznHpHmqOh21Kh9kf2THI1Ed+QeADXiV+OANcknL0D4GE6dwe9hTMuKZ5xvKU4C4PH2UHVkwoEwP
	62RQl8uR5EEfeIs8Vn37LefY0JhVRfVoRwet6yNckxjg6Tw3t0qtYTiG1BAjAjxcH0OHy5fVLsm6R
	VtbfoxwYs5CT6PYOPoY55zVfc937tt4inBgi9n0fhDJbxoq1MDwo0tFd5vRwg/ZvZg1pJjXe4h6pD
	oTuebIVrT4BTAV5s1SBygxaOJHjk6xYCH5Cq3SZ/NbeiLZSOCHkYHAJ83VoYLcD+UrFi0mZlSwFEP
	jg5IQjUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54974)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1swjEM-00026c-0K;
	Fri, 04 Oct 2024 15:24:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1swjEH-0001FE-13;
	Fri, 04 Oct 2024 15:24:25 +0100
Date: Fri, 4 Oct 2024 15:24:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vsmuthu@qti.qualcomm.com,
	arastogi@qti.qualcomm.com, linchen@qti.qualcomm.com,
	john@phrozen.org, Luo Jie <quic_luoj@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	"Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
Message-ID: <Zv_6mf3uYcqtHC2j@shell.armlinux.org.uk>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 03, 2024 at 11:20:03PM +0530, Kiran Kumar C.S.K wrote:
> >>          +---------+
> >>          |  48MHZ  |
> >>          +----+----+
> >>               |(clock)
> >>               v
> >>          +----+----+
> >>   +------| CMN PLL |
> >>   |      +----+----+
> >>   |           |(clock)
> >>   |           v
> >>   |      +----+----+           +----+----+  clock   +----+----+
> >>   |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
> >>   |  |   +----+----+           +----+----+          +----+----+
> >>   |  |        |(clock & reset)      |(clock & reset)
> >>   |  |        v                     v
> >>   |  |   +-----------------------------+----------+----------+---------+
> >>   |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
> >>   |  |   |       | SCH |               +----------+          +---------+
> >>   |  |   |       +-----+                      |               |        |
> >>   |  |   |  +------+   +------+            +-------------------+       |
> >>   |  |   |  |  BM  |   |  QM  |            | L2/L3 Switch Core |       |
> >>   |  |   |  +------+   +------+            +-------------------+       |
> >>   |  |   |                                   |                         |
> >>   |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
> >>   |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
> >>   |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
> >>   |  |   |     |         |         |         |         |         |     |
> >>   |  |   +-----+---------+---------+---------+---------+---------+-----+
> >>   |  |         |         |         |         |         |         |
> >>   |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
> >>   +--+---->|             PCS0                    | |  PCS1 | | PCS2  |
> >>   | clock  +---+---------+---------+---------+---+ +---+---+ +---+---+
> >>   |            |         |         |         |         |         |
> >>   |        +---+---------+---------+---------+---+ +---+---+ +---+---+
> >>   | clock  +----------------+                    | |       | |       |
> >>   +------->|Clock Controller|   4-port Eth PHY   | | PHY4  | | PHY5  |
> >>            +----------------+--------------------+ +-------+ +-------+
...
> >> 3) PCS driver patch series:
> >>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
> >>         be enabled in drivers/net/pcs/
> >> 	Dependent on NSS CC patch series (2).
> > 
> > I assume this dependency is pure at runtime? So the code will build
> > without the NSS CC patch series?
> 
> The MII Rx/Tx clocks are supplied from the NSS clock controller to the
> PCS's MII channels. To represent this in the DTS, the PCS node in the
> DTS is configured with the MII Rx/Tx clock that it consumes, using
> macros for clocks which are exported from the NSS CC driver in a header
> file. So, there will be a compile-time dependency for the dtbindings/DTS
> on the NSS CC patch series. We will clearly call out this dependency in
> the cover letter of the PCS driver. Hope that this approach is ok.

Please distinguish between the clocks that are part of the connection
between the PCS and PHY and additional clocks.

For example, RGMII has its own clocks that are part of the RGMII
interface. Despite DT having a way to describe clocks, these clocks
are fundamental to the RGMII interface and are outside of the scope
of DT to describe. Their description is implicit in the relationship
between the PHY and network driver.

Also, the PCS itself is a subset of the network driver, and we do
not (as far as I know) ever describe any kind of connection between
a PCS and PHY. That would be madness when we have situations where
the PHY can change its serdes mode, causing the MAC to switch
between several PCS - which PCS would one associate the PHY with in
DT when the "mux" is embedded in the ethernet driver and may be
effectively transparent?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

