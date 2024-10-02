Return-Path: <linux-arm-msm+bounces-32970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D863F98E54A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 23:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52DEB1F22791
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 21:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E892217332;
	Wed,  2 Oct 2024 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="cSbggjIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB7719412A;
	Wed,  2 Oct 2024 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727904560; cv=none; b=YgifW+Bdld4fwbmnaTPFTqmyC/hkSM0eYzIxYCM0cQRDHTUv0YqyiXoDEEiQPTP5+vP8ZSV93nf7wCtYdOsYvir9PcS1onqdGz3psutcMIlDDU55EOHmRpp3TrsDsyFdYVcNYNiKPPRebzf6wCxf0XetS1AsxSkZcjl6ntHeDqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727904560; c=relaxed/simple;
	bh=LSRi8HQOc2t+iujKkhsBhvvQdo4fdvBPPNW+FRNojNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqDCVM1KZYUWy+gKFMI0HBtHKO4/m3puqW2JKJ5n75+1dj2g2KUuxlJWN5w4XDIOBkHB6npR0bo4UaW64ZRmbrDD2XBYDjsOWWc7bKh1qkPGREnFLkLc4hZbYR6ddhincNQeawWWsuQFaM1ydJcHKHc0xPCSVXqYFo9RcTwLCYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=cSbggjIl; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CkRlXAuH+MkC2SxccdbvGHTypMvMNktESOzvO02IUGo=; b=cSbggjIl+Rzg+sxzVZGS8Ejs5y
	wLaCKqiGI2Rqt+usVoAsI41rwfQkAgygzPmVXlF2HRl22UrYriOzcAZsaLq5NDKokfuWp4CdJIHQJ
	lBldw9ivO4chOJvl7qmZe+kdh4hcmo8qx6BvwyNqhJ+ad9+yDYZZx4vEKJiyHAfSvuN4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sw6u3-008tcU-Qm; Wed, 02 Oct 2024 23:28:59 +0200
Date: Wed, 2 Oct 2024 23:28:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>
Cc: netdev@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
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
Message-ID: <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>

On Thu, Oct 03, 2024 at 02:07:10AM +0530, Kiran Kumar C.S.K wrote:
> Hello netdev,
> 
> We are planning to publish driver patches for adding Ethernet support
> for Qualcomm's IPQ9574 SoC, and looking for some advice on the approach
> to follow. There are two new drivers (described below) split across four
> patch series, totaling to 40 patches. These two drivers depend on a
> couple of clock controller drivers which are currently in review with
> the community.
> 
> Support is currently being added only for IPQ9574 SoC. However the
> drivers are written for the Qualcomm PPE (packet process engine)
> architecture, and are easily extendable for additional IPQ SoC (Ex:
> IPQ5332) that belong to the same network architecture family.
> 
> Given the number of patches for IPQ9574, we were wondering whether it is
> preferred to publish the four series together, since having all the code
> available could help clarify the inter-workings of the code. Or whether
> it is preferred to publish the patches sequentially, depending on the
> review progress?

Sequentially. You are likely to learn about working with mainline code
from the first patch series, which will allow you to improve the
following series before posting them.

>          +---------+
>          |  48MHZ  |
>          +----+----+
>               |(clock)
>               v
>          +----+----+
>   +------| CMN PLL |
>   |      +----+----+
>   |           |(clock)
>   |           v
>   |      +----+----+           +----+----+  clock   +----+----+
>   |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
>   |  |   +----+----+           +----+----+          +----+----+
>   |  |        |(clock & reset)      |(clock & reset)
>   |  |        v                     v
>   |  |   +-----------------------------+----------+----------+---------+
>   |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
>   |  |   |       | SCH |               +----------+          +---------+
>   |  |   |       +-----+                      |               |        |
>   |  |   |  +------+   +------+            +-------------------+       |
>   |  |   |  |  BM  |   |  QM  |            | L2/L3 Switch Core |       |
>   |  |   |  +------+   +------+            +-------------------+       |
>   |  |   |                                   |                         |
>   |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
>   |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
>   |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
>   |  |   |     |         |         |         |         |         |     |
>   |  |   +-----+---------+---------+---------+---------+---------+-----+
>   |  |         |         |         |         |         |         |
>   |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
>   +--+---->|             PCS0                    | |  PCS1 | | PCS2  |
>   | clock  +---+---------+---------+---------+---+ +---+---+ +---+---+
>   |            |         |         |         |         |         |
>   |        +---+---------+---------+---------+---+ +---+---+ +---+---+
>   | clock  +----------------+                    | |       | |       |
>   +------->|Clock Controller|   4-port Eth PHY   | | PHY4  | | PHY5  |
>            +----------------+--------------------+ +-------+ +-------+
> 
> 
> 1.1 PPE: Internal blocks overview
> =================================
> 
> The Switch core
> ---------------
> It has maximum 8 ports, comprising 6 GMAC ports and two DMA interfaces
> (for Ethernet DMA and EIP security processor) on the IPQ9574.

How are packets from the host directed to a specific egress port? Is
there bits in the DMA descriptor of the EDMA? Or is there an
additional header in the fields? This will determine if you are
writing a DSA switch driver, or a pure switchdev driver. 

> GMAC/xGMAC
> ----------
> There are 6 GMAC and 6 XGMAC in IPQ9574. Depending on the board ethernet
> configuration, either GMAC or XGMAC is selected by the PPE driver to
> interface with the PCS. The PPE driver initializes and manages these
> GMACs, and registers one netdevice per GMAC.

That suggests you are doing a pure switchdev driver.

> 2. List of patch series and dependencies
> ========================================
> 
> Clock drivers (currently in review)
> ===================================
> 1) CMN PLL driver patch series:
> 	Currently in review with community.
> 	https://lore.kernel.org/linux-arm-msm/20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com/
> 
> 
> 2) NSS clock controller (NSSCC) driver patch series
> 	Currently in review with community.
> 	https://lore.kernel.org/linux-arm-msm/20240626143302.810632-1-quic_devipriy@quicinc.com/
> 
> 
> Networking drivers (to be posted for review next week)
> ======================================================
> 
> The following patch series are planned to be pushed for the PPE and PCS
> drivers, to support ethernet function. These patch series are listed
> below in dependency order.
> 
> 3) PCS driver patch series:
>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
>         be enabled in drivers/net/pcs/
> 	Dependent on NSS CC patch series (2).

I assume this dependency is pure at runtime? So the code will build
without the NSS CC patch series?

This should be a good way to start, PCS drivers are typically nice and
simple.

	Andrew

