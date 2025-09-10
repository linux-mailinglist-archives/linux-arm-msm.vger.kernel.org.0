Return-Path: <linux-arm-msm+bounces-73004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 011FEB51CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 18:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E348567272
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 16:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A93327A07;
	Wed, 10 Sep 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="La6wrW4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9913A263C8C;
	Wed, 10 Sep 2025 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757520285; cv=none; b=b9htC0qDt4HuQ87T+XgDjj8utSjUczgjpVnO89h6GD8AxwUW/0k3Ap50F1CNgBXQnGdhBLNXlc6wVN/DYVOC9EgDYNW/hqRWE134peoixeBTJs7kqetqm7Ev8eIyUhMOBbSmywy72aajsFJe8PX98SjJBQDNP8CXzxnJ5lZ6CEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757520285; c=relaxed/simple;
	bh=ARBFhfPQE1yTd6Bep5x+KYhOhNUB93VDBinqM4X+PBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUkD2rfJDvx2OuEM0o9IXlH9D8sYXSkeGfhCBXMv1Wldj+/dLy2Ef7s+nePRJ8a45wXeVfffqHV34RmiTeWr3FzYFN7W9C0c3h35/8vJEnS+t1gql7TKpFSvEGAHh9ySAO1RtikMYYbeZztc5f2+L7qU8HXE7W+z/g+qUJdxHy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=La6wrW4K; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KlHv0+GrHV1hBNSj6BJKLSwams6/gKxyprG2p5gwuN8=; b=La6wrW4KHul4jfO4rtbU8hD01X
	FcZppvUr5TlhkRKeJber2yMH0LVsSwhRAKwz+bhLWoEMEg0OIAjMwJ7FC5Ow/BYVscoA22vdPHydt
	Jot1v/kCWKxpJ0qC5GzmEy1GXrSPjmz8c8Sh1AOlk431WwjvNSYPJU6caRZ7GOnck1Eo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwNJ6-007y3p-Ip; Wed, 10 Sep 2025 18:04:28 +0200
Date: Wed, 10 Sep 2025 18:04:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
Message-ID: <24cd127d-1be7-42f4-a2ec-697c5e7554db@lunn.ch>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>

> +    ethernet: ethernet@7a80000 {
> +        compatible = "qcom,sa8255p-ethqos";
> +        reg = <0x23040000 0x10000>,
> +              <0x23056000 0x100>;
> +        reg-names = "stmmaceth", "rgmii";
> +
> +        iommus = <&apps_smmu 0x120 0x7>;
> +
> +        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq", "sfty";
> +
> +        dma-coherent;
> +
> +        snps,tso;
> +        snps,pbl = <32>;
> +        rx-fifo-depth = <16384>;
> +        tx-fifo-depth = <16384>;
> +
> +        phy-handle = <&sgmii_phy1>;
> +        phy-mode = "2500base-x";

Nitpicking: It is clearly not an SGMII PHY if it support
2500BaseX. You might want to give the node a better name.

> +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> +        snps,ps-speed = <1000>;

Since this MAC can do 2.5G, is 1000 correct here?

      Andrew

