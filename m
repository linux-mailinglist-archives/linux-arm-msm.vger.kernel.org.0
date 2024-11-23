Return-Path: <linux-arm-msm+bounces-38937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75E9D6B2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 20:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2918161BDC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 19:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1625017BB16;
	Sat, 23 Nov 2024 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="z+3Exu21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD3F158DB1;
	Sat, 23 Nov 2024 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390913; cv=none; b=iqW7Q8JrYDV7ZKa8fVsMbgnzvoCzZBTysH7JiC5XGbvLte2I9u6I1iDbs5N/ew8ZqODRyjjRTW8/LG3I8bLYXPc1Lq12u0fBTc+oYck16XdzoHweclVcnUtihl2D9gFJD620rrp2+bQjP/w+jzq0Y8x8Al/vxSL8h0N3bd11muI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390913; c=relaxed/simple;
	bh=Vb5QHAayI057QZIb4ZxIjRg4f0RYlXzQxPSvBg/yZrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpJfgQbV3KXUE2lMacddDy4JXiEBVIbTdUaKOlE8lbZxabqTjF9odfpyQ1MWL7OBZlho5im042MkyfrxHQnVWrdMb/4hulBi6QGGIcVrgRBBKMPqlKMGs6G64MNN3Aay4dfFyRFnKLyF/ctAHCQ+bcD3SWy4LP9ypOQUEe79kIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=z+3Exu21; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bXSGeVcp+cWnCmHmUCmJMk2BmeyVeWCVr/9EKOca6eM=; b=z+3Exu21gVLNau8G2CdKo5qliZ
	/s2vHZgv8mJNtWwnXpTu86AGHEXb9ubyFgGpdnmKvHgHR4FD3sgXqi/0XaQupZ+SwKBq3o+wQQ/WU
	tJv7hRT9AACJR4ofXGutRL/j3bwd0XEd4V+WIvhP6zgNuvn7PNVRuCc6dCBNA8aKYcIA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tEw0m-00EEC4-Os; Sat, 23 Nov 2024 20:41:44 +0100
Date: Sat, 23 Nov 2024 20:41:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: enable ethernet0
Message-ID: <cbd696c0-3b25-438b-a279-a4263308323a@lunn.ch>
References: <20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com>
 <20241123-dts_qcs8300-v4-2-b10b8ac634a9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123-dts_qcs8300-v4-2-b10b8ac634a9@quicinc.com>

On Sat, Nov 23, 2024 at 04:51:54PM +0800, Yijie Yang wrote:
> Enable the SerDes PHY on qcs8300-ride. Add the MDC and MDIO pin functions
> for ethernet0 on qcs8300-ride. Enable the ethernet port on qcs8300-ride.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 7eed19a694c39dbe791afb6a991db65acb37e597..af7be26828524cc28299e219c1f0ad459e1c543d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -210,6 +210,95 @@ vreg_l9c: ldo9 {
>  	};
>  };
>  
> +&ethernet0 {
> +	phy-mode = "2500base-x";
> +	phy-handle = <&sgmii_phy0>;

Nit picking, but your PHY clearly is not an SGMII PHY if it is using
2500base-x. I would call it just phy0, so avoiding using SGMII
wrongly, which most vendors do use the name SGMII wrongly.

	Andrew

