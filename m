Return-Path: <linux-arm-msm+bounces-8934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D5A8417E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 01:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2054F1C22561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 00:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F210A22075;
	Tue, 30 Jan 2024 00:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="tJ/VPdbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64379208AF;
	Tue, 30 Jan 2024 00:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706576138; cv=none; b=c9Ooap06mn0Ibw64GIrGlA/GET23OORKGnSUVJ2n1ub1gLQf+sGs7AC7nJ7AVb+vH8k3ErlejqjTgNjw1KYnkzmiksDvh1YIKWNMxt8yblo0F9N42p3EMuo82TqtESO6VlJSlciLLcQBlRLOJPLTEB73SqnT93zW/GqfMJX8fFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706576138; c=relaxed/simple;
	bh=i5g1+WH0wisIddYfUi9lGEjiAebUrGuPL0D6UbtJNX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPMCRsV9DxwVKYLtIOs8uwzV30C/hErgLjxyTDKfdq7sy3Wj/6qV37rIpco0miFpBQ3/QdbuSN/ZKnSByKUHOBBQoiwXnwkMNawxx7wzxn4FtG1Bxv/AFzHKbcdshxiYKeS1DV0NUkz71wmTs7xJLHmUEfjlntIiZYO3U2N80V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=tJ/VPdbV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=i/hs1EC/s/kyhNEPpP84UmOb359RhN5xxFmPOlKDVPA=; b=tJ/VPdbVRJprPLWD90bBah/V9y
	k12nYqPOkhThK+ApIm648DF++KRxbnLo6gr105h2gYmwLyi3l5c7l7NrDGoCEcAf9cZjjHePyFKIP
	Rf7FsA2jPrsodm9sXRFXef8H05n9cKCeIe19+aXIMdZOqENXl6+oGHwWehEqsftz5ldI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rUcPQ-006Qpc-Ea; Tue, 30 Jan 2024 01:55:28 +0100
Date: Tue, 30 Jan 2024 01:55:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jie Luo <quic_luoj@quicinc.com>
Subject: Re: [net-next PATCH v2 3/3] arm64: dts: qcom: ipq8074: add
 clock-frequency to MDIO node
Message-ID: <b1ff77bc-0833-493a-b099-884c727f0341@lunn.ch>
References: <20240130003546.1546-1-ansuelsmth@gmail.com>
 <20240130003546.1546-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130003546.1546-4-ansuelsmth@gmail.com>

On Tue, Jan 30, 2024 at 01:35:22AM +0100, Christian Marangi wrote:
> Add clock-frequency to MDIO node to set the MDC rate to 6.25Mhz instead
> of using the default value of 390KHz from MDIO default divider.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 2f275c84e566..08ddfeece043 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -264,6 +264,8 @@ mdio: mdio@90000 {
>  			clocks = <&gcc GCC_MDIO_AHB_CLK>;
>  			clock-names = "gcc_mdio_ahb_clk";
>  
> +			clock-frequency = <6250000>;
> +
>  			status = "disabled";

If we merge this via netdev, is a merge conflict likely? Any other
changes expected in this area, given the changes which might happen to
GCC soon, etc?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

