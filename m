Return-Path: <linux-arm-msm+bounces-69777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE0B2C961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05F743AE7C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 16:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7B5253B71;
	Tue, 19 Aug 2025 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="MYnjcJRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D501B22D4C3;
	Tue, 19 Aug 2025 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620444; cv=none; b=FlNYYBF0cvCquz7Vgt8QqeF3e/7ot5AWTFVN81h0rNcP32lJju4Zt87/Q8xxJcP2JVGOxnllPh0K9Ibq+YcUekd9KZp4c9tkKZafun+GAIleFpqT2wT1WsEamtnvtXvYPRRMScuf7H9vklgnWHX6vLa28W8Q55prxALokqsMAGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620444; c=relaxed/simple;
	bh=XPfOm7nEgRY7hdOmem221KkJIe2yW4S93V2YVQOa6oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il/keIbcn65Agy2+N68s8MeY34O9tEH8eKtcW6yfhFvymawKXhyreDFybCigo9an071jqCzRA1JoT2anW+YDy1pi4n1BRDUZi9yt+W25GkLLUgb8dLY23ZSjAOO5dCCpd96CWMphQ314P81wSrSqkNud6kVL/m0kLAjQRPi5CzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=MYnjcJRg; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XrqByDDD1Ij8KuEP6AwMvl51hQMZ1NfZoFOmBPz4nWc=; b=MYnjcJRgkpt2w7ModbMj2O7a97
	9fqNpd+gL4/JtJqA96022PcTRJZVLwYoeldu0jwQe5NNZTDoguEv47Tdv4Y/HLb76GkwyiBMvdRiN
	uTMyJGlOSHnDsRSgkgzC1kxTccdSvlL1Gu8fZO+fINYXXWBUpbww/KviHcShY1hhSLiA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uoP4V-005DEc-NO; Tue, 19 Aug 2025 18:20:27 +0200
Date: Tue, 19 Aug 2025 18:20:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH v4 2/6] net: stmmac: Inverse the phy-mode definition
Message-ID: <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>

>  static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
>  {
>  	struct device *dev = &ethqos->pdev->dev;
> -	int phase_shift;
> +	int phase_shift = 0;
>  	int loopback;
>  
>  	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> -		phase_shift = 0;
> -	else
> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>  		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;

Does this one setting control both RX and TX delays? The hardware
cannot support 2ns delay on TX, but 0ns on RX? Or 2ns on RX but 0ns on
TX?

	Andrew

