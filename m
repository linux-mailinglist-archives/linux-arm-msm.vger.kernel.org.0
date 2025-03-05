Return-Path: <linux-arm-msm+bounces-50316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C767A4F7EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 08:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BFA916E72D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 07:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6201EA7E6;
	Wed,  5 Mar 2025 07:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzXE2Tck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF619D06A;
	Wed,  5 Mar 2025 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741159931; cv=none; b=aI6iLPdBBgvrQgo+cOtLIrYoeSkXdSHbyh3qtQDDwiged+vwdK92erw/gtEubqWhdLIWqeLLY/aSCeOUIheS6JN/P5PUu0J+m4/uet45vq3HJfIlretLnGS+TiUIsh9Ssaw+mdifhfv2sXHKGfdzwuLfjJrjzRdQYymksctvYHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741159931; c=relaxed/simple;
	bh=m62ntYl+OHjI4BbSj3eSfbV1M2IVOsVTJYXyzyiQ8cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wnvru/COUnND6K9yFMrDi5Ussqift8ihSKWwt+Ul/j2PpxB44fAFDaznBTN5gkG1FOagQAmsZZPa8C0aLIXbL+x1gJhL1fZCn7QbOOEKFP0Ds7TZm+L2TKMFHS4+w66fkQStbFmv0NjZYzF1tJyWAS+oX3uv0n5fZoA7+JoLAVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzXE2Tck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83236C4CEE2;
	Wed,  5 Mar 2025 07:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741159930;
	bh=m62ntYl+OHjI4BbSj3eSfbV1M2IVOsVTJYXyzyiQ8cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzXE2Tck/lDhxGd7+olXHUH9tYc7zFNpzzbFM4ShYSxjDqPsUD1z4Vjq5v/0+/Xe9
	 VHbU8E5BDJ2sqSrjARXmS6zWQdCRz1gE8SfwD/dbNDC5V+ks6RXYI7RYn905tGiwb7
	 wWBA4+wkkYTW8Y3dxJAagG9DGnY/QQvFVhVbHeOMVsTPBIqn4v4aUZW7mBv8pkfn6F
	 dx7qGEByHTDHznB/rhUumWoB4hDNWNK8ayR/5TwRNLxjF7uMAu3fE5NTeIn2M+TVGl
	 jzTzpoMEA8pLjq3wQF493TFciUCEpc3Mq5VJoDNedxso9It7grlylT4n8jxN8i5G2L
	 LNJ3/7YiXXepg==
Date: Wed, 5 Mar 2025 08:32:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/9] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Message-ID: <20250305-furry-finch-of-camouflage-e7ee5e@krzk-bin>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-2-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-2-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:35PM -0800, Melody Olvera wrote:
> +  vdd-supply:
> +    description:
> +      Phandle to 0.88V regulator supply to PHY digital circuit.
> +
> +  vdda12-supply:
> +    description:
> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdd-supply
> +  - vdda12-supply
> +  - resets

Keep the same order as in "properties" list.

> +
> +additionalProperties: false

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


