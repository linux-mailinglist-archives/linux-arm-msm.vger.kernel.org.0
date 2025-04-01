Return-Path: <linux-arm-msm+bounces-52963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184FA779EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 13:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 593333A3A9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B773020103A;
	Tue,  1 Apr 2025 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhE0JL2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2D200BB2;
	Tue,  1 Apr 2025 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508007; cv=none; b=gFyv4U0mMLYrHsbiY8FiUABYXerOalJnRclUOft4KkTcCRNbvxeUfw/haHENnVugO1BFzzOv+A9/lHCUE19prsz7bZewoylWYQPQuTlfQdO4dLT9SFBnAkfJxxngCdMNdJrWNKy9iOB30MyNmJVK/VqCGzDjEcKJ8inw09twZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508007; c=relaxed/simple;
	bh=XqdnbW6pAeCpwOdRwLilImT/OKAIai64/QacKoT+his=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/vgTDgHNefuqiyh0m3qTpoVP+6SoTARXUTlm9IXYozIefgQP0vxmgEV1MAmlZOZaU5u2g+T7KDQjc9/2AFFHhexOIV/eO0NZ8Lou6x3+2yDaAF5eCFtXxnnPAzPpELL30GIV0TtmA/p6wQT3PQ0j9bnG1hytaBEpnKn+7Zp6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhE0JL2z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3E3C4CEEE;
	Tue,  1 Apr 2025 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743508006;
	bh=XqdnbW6pAeCpwOdRwLilImT/OKAIai64/QacKoT+his=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhE0JL2zRfEGDWmOoV5UfVpPRtv7w90asCz4oq8Ou2jJddm1jKMgkNMSwHl0AbDww
	 5mlEq62AAHifxna0K901IybOxpxnyaZ4cgKWVHKOZOvqmBQyOXohBRrxTXCoSnmdwv
	 v2M/L7jGDv7DteWTAAy4gZ8i8E6HvlVhkzG98k3gL2MbTk4iHZyvsKxHhxdBuqddl+
	 JVGsDZDaMWgq1qhcWizdM/FItdIeN5RXiO3jW/25jZb6TIUS9h+hVU78QgkqtNxfZY
	 Q61PsHEYt3LxNfFrbCBl9spaiT8U6QZFyPGFqnavX96jrEF0/2G74KzhJkrBLFbcE5
	 b2lnmuYr+iWBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tza4w-000000001Qx-137t;
	Tue, 01 Apr 2025 13:46:50 +0200
Date: Tue, 1 Apr 2025 13:46:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer
Message-ID: <Z-vSKlA8MjNFk3Xh@hovoldconsulting.com>
References: <20250328084154.16759-1-johan+linaro@kernel.org>
 <707db3e3-b380-4db4-96e9-50e66b0be595@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <707db3e3-b380-4db4-96e9-50e66b0be595@oss.qualcomm.com>

On Tue, Apr 01, 2025 at 12:27:55PM +0200, Konrad Dybcio wrote:
> On 3/28/25 9:41 AM, Johan Hovold wrote:
> > Jens reported that the sanity checks added to the new ps883x USB retimer
> > driver breaks USB and display on the HP X14. Turns out the X14 only has
> > a retimer on one of the ports, but this initially went unnoticed due to
> > the missing sanity check (and error handling) in the retimer driver.
> > 
> > Drop the non-existing retimer from the devicetree to enable the second
> > USB port and the display subsystem.
> > 
> > Note that this also matches the ACPI tables.
> > 
> > Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
> > Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> > 
> > The devicetree went upstream before the retimer driver so the display
> > would already be broken in 6.14 and there's no need to backport this
> > one (but it should go into 6.15).
> > 
> > Note that the SBU mux can be added later when/if someone figures out how
> > it is connected.
> 
> I am shocked, but this product photo [1] (is this the right laptop? there's a
> bunch with similar naming) on the HP website suggests that indeed only one port
> has a USB-40Gbps marking on it, with the other type-C only being supposed to do
> 10Gbps

Yeah, I found a photo like that on their web page too, and the specs
also mention it:

	1 USB Type-C® 10Gbps signaling rate (USB Power Delivery,
	DisplayPort™ 1.4a, HP Sleep and Charge); 1 USB Type-C® 40Gbps
	signaling rate (USB Power Delivery, DisplayPort™ 1.4a, HP Sleep
	and Charge)

	https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-ai-pc-14-fe000-14-9j1h6av-1#techSpecs

> [1] https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c08993265.png

Johan

