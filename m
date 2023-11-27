Return-Path: <linux-arm-msm+bounces-2048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B6A7F9BED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 09:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A8D1C20939
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 08:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BAAD281;
	Mon, 27 Nov 2023 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="C2BtYh9y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA08182;
	Mon, 27 Nov 2023 00:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5IBxJUyumk6/mKDWskjGhd0clOsoL+q4Mz9y2RERiQ8=; b=C2BtYh9yswivE/kuyvVCd51YWc
	TBZFrc0S2cJ0/S7mtr5axjCOuLrJm7Sd8TcEQLjwSOxvvUXoqyIF9rZWjKMjCz1yV7YBtza3apSJZ
	6aqRRB6V1VLobG26Qs4lVG3VMa9dI72LzU9M7Fk6cEmq6+56yqIuXpcUYHKNdWPk3mngYbqkYU2II
	dFm7ViUx11fSe/bDwhv15gFJsQbVGJCa5CEUAbSNkbSSk9FQDxsXJvS7idTiQF8D4/6k9yZ+gkTCi
	N/gFa5D0dqhZJ0XCeiFUSEBV/J0ixdCYRIk07oRp5iBBBJwLEY19tHcNX3AQLhx+EyvQfCAMmKeKE
	OaitSy0w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41536)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r7X9c-0005Ur-1U;
	Mon, 27 Nov 2023 08:39:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r7X9b-0001le-53; Mon, 27 Nov 2023 08:39:43 +0000
Date: Mon, 27 Nov 2023 08:39:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH net] net: stmmac: update Rx clk divider for 10M SGMII
Message-ID: <ZWRVz05Gb4oALDnf@shell.armlinux.org.uk>
References: <20231124050818.1221-1-quic_snehshah@quicinc.com>
 <ZWBo5EKjkffNOqkQ@shell.armlinux.org.uk>
 <47c9eb95-ff6a-4432-a7ef-1f3ebf6f593f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47c9eb95-ff6a-4432-a7ef-1f3ebf6f593f@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Please reply _inline_ rather than at the top of the message, just like
every other email that is sent in the Linux community. It is actually
the _Internet_ standard way of replying, before people like Microsoft
encouraged your broken style.

Also wrapping the text of your message makes it easier.

On Mon, Nov 27, 2023 at 11:25:34AM +0530, Sneh Shah wrote:
> On 11/24/2023 2:42 PM, Russell King (Oracle) wrote:
> > On Fri, Nov 24, 2023 at 10:38:18AM +0530, Sneh Shah wrote:
> >>  #define RGMII_CONFIG_LOOPBACK_EN		BIT(2)
> >>  #define RGMII_CONFIG_PROG_SWAP			BIT(1)
> >>  #define RGMII_CONFIG_DDR_MODE			BIT(0)
> >> +#define RGMII_CONFIG_SGMII_CLK_DVDR		GENMASK(18, 10)
> > 
> > So you're saying here that this is a 9 bit field...
> > 
> >> @@ -617,6 +618,8 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
> >>  	case SPEED_10:
> >>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
> >>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> >> +		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR, BIT(10) |
> >> +			      GENMASK(15, 14), RGMII_IO_MACRO_CONFIG);
> > 
> > ... and then you use GENMASK(15,14) | BIT(10) here to set bits in that
> > bitfield. If there are multiple bitfields, then these should be defined
> > separately and the mask built up.
> > 
> > I suspect that they aren't, and you're using this to generate a _value_
> > that has bits 5, 4, and 0 set for something that really takes a _value_.
> > So, FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31) or
> > FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 49) would be entirely correct
> > here.
> 
> You are right here for GENMASK(15,14) | BIT(10). I am using this to create a field value.I will switch to FIELD_PREP as that seems like a better way to do this.

So this is a "nice" example of taking the use of GENMASK() and BIT() to
an inappropriate case.

> > The next concern I have is that you're only doing this for SPEED_10.
> > If it needs to be programmed for SPEED_10 to work, and not any of the
> > other speeds, isn't this something that can be done at initialisation
> > time? If it has to be done depending on the speed, then don't you need
> > to do this for each speed with an appropriate value?
> 
> This field programming is required only for 10M speed in for SGMII mode. other speeds are agnostic to this field. Hence we are programming it always when SGMII link comes up in 10M mode. init driver data for ethqos is common for sgmii and rgmii. As this fix is specific to SGMII we can't add this to init driver data.

I wasn't referring to adding it to driver data. I was asking whether it
could be done in the initialisation path.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

