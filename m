Return-Path: <linux-arm-msm+bounces-35423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C13969AA356
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782AC1F22204
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 13:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB3219F113;
	Tue, 22 Oct 2024 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="k9sNs1yk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94019E99E;
	Tue, 22 Oct 2024 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729604274; cv=none; b=m2RZV0BiVBqws681e9+dibY4ttY5lnrJ7c530NTY+ytWYHkK9vSS3bd8cnPj8rIcPpcatvieZ2I4PiMUg/2uXqtz1aDDw8NuZWJRHwiAjxorbAh6OFv2WOeKcC1vZqwo0GkL9ig7Xh25eRm4XyOJuQcILoKM1OxuCHRLUj64src=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729604274; c=relaxed/simple;
	bh=9g88+vo+w3pHcZYFTHanutEy/cUSfaKP7KjUnZfdDCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRwlD1js5xFeVLTFOCqPM6TzFg6PbEPe0YXymw2hjhuS179Z9esNQMhrTmxCaAHfo06Oh4FzObK59MWjSC06t2HIzJUd+kHQ9hZNUeNHTBTUPngc022cTZCBhNBDDnE3rFMGmnMvmqqVDzc1U4EojI+MUuYLxVZpep2qzMiYcaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=k9sNs1yk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2lLWUy23eHb4MgFna+aBGyb7zbgEcHoFz1AAK36qYiQ=; b=k9sNs1ykHFkSe7oZVo7n1QwwwI
	qkDWA7xTVJdC83jRqnoXHQGP2QQoeEL94aUL9RFKWalZtLdpEjqOLeg0PrHfvYkaivPJxzFfUCZSX
	VJuRKHmdypK5r5oG5p26eCmTQ4lCCFdmCt1rQ+8JPGDNEZj/vj+O16+Ro/ESmMHWHVnw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3F4q-00AqUR-33; Tue, 22 Oct 2024 15:37:36 +0200
Date: Tue, 22 Oct 2024 15:37:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org,
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
Message-ID: <7b5227fc-0114-40be-ba5d-7616cebb4bf9@lunn.ch>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv_6mf3uYcqtHC2j@shell.armlinux.org.uk>
 <ba1bf2a6-76b7-4e82-b192-86de9a8b8012@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba1bf2a6-76b7-4e82-b192-86de9a8b8012@quicinc.com>

> Apologies for the delay in response. I understand that the PCS<->PHY
> clocks may be out of the scope of PCS DT due to the reasons you mention.
> However would like to clarify that the MII clocks referred to here, are
> part of the connection between the MAC and PCS and not between PCS and PHY.
> 
> Below is a diagram that shows the sub-blocks inside the 'UNIPHY' block
> of IPQ9574 which houses the PCS and the serdes, along with the clock
> connectivity. The MII Rx/Tx clocks are supplied from the NSS CC, to the
> GMII channels between PCS and MAC. So, it seemed appropriate to have
> these clocks described as part of the PCS DT node.
> 
>               +-------+ +---------+  +-------------------------+
>    -----------|CMN PLL| |  GCC    |  |   NSSCC (Divider)       |
>    |25/50mhz  +----+--+ +----+----+  +--+-------+--------------+
>    |clk            |         |          ^       |
>    |       31.25M  |  SYS/AHB|clk  RX/TX|clk    +------------+
>    |       ref clk |         |          |       |            |
>    |               |         v          | MII RX|TX clk   MAC| RX/TX clk
>    |            +--+---------+----------+-------+---+      +-+---------+
>    |            |  |   +----------------+       |   |      | |     PPE |
>    v            |  |   |     UNIPHY0            V   |      | V         |
>   +-------+     |  v   |       +-----------+ (X)GMII|      |           |
>   |       |     |  +---+---+   |           |--------|------|-- MAC0    |
>   |       |     |  |       |   |           | (X)GMII|      |           |
>   |  Quad |     |  |SerDes |   |  (X)PCS   |--------|------|-- MAC1    |
>   |       +<----+  |       |   |           | (X)GMII|      |           |
>   |(X)GPHY|     |  |       |   |           |--------|------|-- MAC2    |
>   |       |     |  |       |   |           | (X)GMII|      |           |
>   |       |     |  +-------+   |           |--------|------|-- MAC3    |
>   +-------+     |              |           |        |      |           |
>                 |              +-----------+        |      |           |
>                 +-----------------------------------+      |           |

Thanks for the detailed diagram. That always helps get things
straight.

Im i correct in says that MII RX|TX is identical to MAC RX|TX? These
two clocks are used by the MAC and XPCS to clock data from one to the
other? If they are the exact same clocks, i would suggest you use the
same name, just to avoid confusion.

Both XPCS and PPE are clock consumers, so both will have a phandle
pointing to the NSSCC clock provider?

> We had one other question on the approach used in the driver for PCS
> clocks, could you please provide your comments.
> 
> As we can see from the above diagram, each serdes in the UNIPHY block
> provides the clocks to the NSSCC, and the PCS block consumes the MII
> Rx/Tx clocks. In our current design, the PCS/UNIPHY driver registers a
> provider driver for the clocks that the serdes supplies to the NSS CC.

That sounds reasonable.

> It also enables the MII Rx/Tx clocks which are supplied to the PCS from
> the NSS CC. Would this be an acceptable design to have the PCS driver
> register the clock provider driver and also consume the MII Rx/Tx
> clocks? It may be worth noting that the serdes and PCS are part of the
> same UNIPHY block and also share same register region.

Does the SERDES consume the MII Rx/Tx? Your diagram indicates it does
not. I'm just wondering if you have circular dependencies at runtime?

Where you will need to be careful is probe time vs runtime. Since you
have circular phandles you need to first create all the clock
providers, and only then start the clock consumers. Otherwise you
might get into an endless EPROBE_DEFER loop.

	Andrew

