Return-Path: <linux-arm-msm+bounces-1799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE837F6F35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 10:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CE551C20DCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 09:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA5A4C6E;
	Fri, 24 Nov 2023 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WtJQb6aL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DD812B;
	Fri, 24 Nov 2023 01:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r1rAm5jR/6md8ILmUhugQ8toaM7ECJmSBokwUzobLWo=; b=WtJQb6aLCdUyJqLHSxN1r6+Iet
	CEpijUCrf7cgv+SKytQHd+Pav+6+9T+RFLivuotQVIlzRWdscxVDY82MoPcwOAWcpvCU6xjg1f4W0
	oP6MS7sx0BxVnnThYqLfZWUJkgjhvvz8J1BLL1Lm7pseksb4+aVQG1hZeLfXjXWB8FrCZfGP/AqD0
	OBOjkGDIhegny3DqPVI5nibJ7DSBZSWpUqmSwkQIUr5f+p3zq8/1lM+UjHrZWR3qmLavF3AvdMRe0
	HAyXK3Nv5ynOyWvlHM/ckMFE9t6cbrOp4L9VnE0lB9kPH4aJasWh9kxyj/1cLbR4C81fiPgEp+/HG
	3ePZO9BQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57684)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r6SEJ-0002Zh-2T;
	Fri, 24 Nov 2023 09:12:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r6SEG-00077c-Qm; Fri, 24 Nov 2023 09:12:04 +0000
Date: Fri, 24 Nov 2023 09:12:04 +0000
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
Message-ID: <ZWBo5EKjkffNOqkQ@shell.armlinux.org.uk>
References: <20231124050818.1221-1-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124050818.1221-1-quic_snehshah@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Nov 24, 2023 at 10:38:18AM +0530, Sneh Shah wrote:
>  #define RGMII_CONFIG_LOOPBACK_EN		BIT(2)
>  #define RGMII_CONFIG_PROG_SWAP			BIT(1)
>  #define RGMII_CONFIG_DDR_MODE			BIT(0)
> +#define RGMII_CONFIG_SGMII_CLK_DVDR		GENMASK(18, 10)

So you're saying here that this is a 9 bit field...

> @@ -617,6 +618,8 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> +		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR, BIT(10) |
> +			      GENMASK(15, 14), RGMII_IO_MACRO_CONFIG);

... and then you use GENMASK(15,14) | BIT(10) here to set bits in that
bitfield. If there are multiple bitfields, then these should be defined
separately and the mask built up.

I suspect that they aren't, and you're using this to generate a _value_
that has bits 5, 4, and 0 set for something that really takes a _value_.
So, FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31) or
FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 49) would be entirely correct
here.

The next concern I have is that you're only doing this for SPEED_10.
If it needs to be programmed for SPEED_10 to work, and not any of the
other speeds, isn't this something that can be done at initialisation
time? If it has to be done depending on the speed, then don't you need
to do this for each speed with an appropriate value?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

