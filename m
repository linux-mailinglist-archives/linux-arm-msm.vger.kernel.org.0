Return-Path: <linux-arm-msm+bounces-69778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AEB2C991
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43B40680642
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 16:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BAF248F42;
	Tue, 19 Aug 2025 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dX2G6QfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D4122FDEC;
	Tue, 19 Aug 2025 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620650; cv=none; b=Utn9MaVCUJPbTx8yiMk5bUU2T5L8yvZo+BLNi5ZwcOqAG9RH6zGOg9WmeyLCpqr99jnBk1OyeeU3q+RQGXza20rpX+BlcvxFLdjWbADabHIJVsvKaaIKZFoHkxxETyK2se9JEDWHBCeeF1CYqZDLXJgFWk+rbM594OyzwVJBnA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620650; c=relaxed/simple;
	bh=wHMkbTaYDfpZ2wDKdFwvxSdhvsteIPTLnERjgc/YEDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbLm3RSFZqcSBZY8fbaUNpqSbQdKpm8zm3FY25Ar+TBTvgDHvHcM21kNAf+F8SSQjcGzWdnsO+0tJa3lrKO0nh8HSG1ruGuAMCoDIQGihUGxvzAGhVwZK6mrhxT0v4EUwevlX9+xTQBDErXY+mHBMQm15qX1cmwJ79EYVmnsflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dX2G6QfF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Vd1fVjfecrNzv67FjQmaF3qTs66SkKr00KIyJJ5OAnY=; b=dX2G6QfFWoyouzS9hpaNTYhXe7
	fMvuvgVpl32Z6z2GGcajeKuyu2uwqMX8YFi3nXNAtIF/APmT/AuOTeC1SiolObvTzZdNNom2HaQZC
	qs2Can+jaTis9L6ghjqDlg8GQgXX7CCgXaEHKoEb30L/4lwy96kOspwgVa6Y7ZH+FVzU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uoP7w-005DFz-Gs; Tue, 19 Aug 2025 18:24:00 +0200
Date: Tue, 19 Aug 2025 18:24:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: YijieYang <yijie.yang@oss.qualcomm.com>
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
	devicetree@vger.kernel.org, stable+noautosel@kernel.org,
	Yijie Yang <quic_yijiyang@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
Message-ID: <813548c2-02be-40fa-bb6b-00c4e713d17c@lunn.ch>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>

> +	mdio: mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		rgmii_phy: phy@7 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x7>;
> +
> +			interrupts-extended = <&tlmm 121 IRQ_TYPE_EDGE_FALLING>;

PHY interrupt are always level, never edge.

    Andrew

---
pw-bot: cr


