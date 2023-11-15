Return-Path: <linux-arm-msm+bounces-698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1E7EC3F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A061C20912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 13:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0D21DDD7;
	Wed, 15 Nov 2023 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="UREF5loC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C01A261;
	Wed, 15 Nov 2023 13:44:45 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC499B;
	Wed, 15 Nov 2023 05:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gtHdcKH61L06S8styF2hP6URbouJS+Q9N5ufE6csYpc=; b=UREF5loC4B3svBkFjSgazmXSJT
	/F42CuDfxkaZK/c992Gr/Bba/NDRaILkogzJ/ZMDChRgKXPorQAa/cPg3+hYc4t05PwXF5B8P/jwJ
	OLEP0zmjF+jSQ6qtmnNFmmijON2TdoUKqR0AUZ7sCFQ3rPFTWwu+YXWtyNOlkagSbX+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r3GBy-000F9b-1Y; Wed, 15 Nov 2023 14:44:30 +0100
Date: Wed, 15 Nov 2023 14:44:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 1/9] net: mdio: ipq4019: increase eth_ldo_rdy for ipq5332
 platform
Message-ID: <c7ae6561-fbcc-40d9-a02c-61fc76e089d0@lunn.ch>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-2-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115032515.4249-2-quic_luoj@quicinc.com>

> +	for (ret = 0; ret < ETH_LDO_RDY_CNT; ret++) {
> +		if (priv->eth_ldo_rdy[ret]) {
> +			val = readl(priv->eth_ldo_rdy[ret]);
> +			val |= BIT(0);
> +			writel(val, priv->eth_ldo_rdy[ret]);
> +			fsleep(IPQ_PHY_SET_DELAY_US);
> +		}

Please add a new variable, rather than use ret this way.

> +	for (ret = 0; ret < ETH_LDO_RDY_CNT; ret++) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, ret + 1);
> +		if (res)
> +			priv->eth_ldo_rdy[ret] = devm_ioremap(&pdev->dev,

same here.

    Andrew

---
pw-bot: cr

