Return-Path: <linux-arm-msm+bounces-35905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918139B07F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49637B29799
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFFF1D3596;
	Fri, 25 Oct 2024 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2rqJPxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE2187FE2;
	Fri, 25 Oct 2024 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869480; cv=none; b=oyawRIzQbHN6mzUFjpFbigsKz5K81/6IBnz+uPiyuxCvxhIrDScBWzTKuSaifm8An0qS4DOLBu+ZcgQtg9L7oE6ZK6IQlgD7+AZSsIdfMv2hG0JarFgri5LXVkkZtt3UzuqV6d8JSZvyBJn/mPe71XcCxpBK0TYuiGRaNsa7vRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869480; c=relaxed/simple;
	bh=AFB5dBlvHcC/6M5uimJnSPRLELNuhWnZtKgP9ksYlcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgVT0oyJuBnx8oTzgDeg367spjNhtHr+9HkWA6jr7GvpZqySaB5Nz7upp1xt3VarjRKHjfpiS2pgpHz1ZdBV878dO32k96Tai/i/ftHvF3pXTC5m6Ubw5xyRILKHopavSRvhbooShxQ1Mt2eamuLIcf6mR1qcAgByyWJAHtvbtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2rqJPxA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A836C4CEC3;
	Fri, 25 Oct 2024 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729869479;
	bh=AFB5dBlvHcC/6M5uimJnSPRLELNuhWnZtKgP9ksYlcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2rqJPxA6j+KyKCKn9OVcq+jQB/rblSmR0AHXaguoSDFk83tFOAjdNO0VznGw6Qxt
	 Qr+x46+MDX2D8JQHsJtvwU1U/eiJcRAURc6+cT7cfEQqh+uB2IofWoMNgRnrc9V4nL
	 r5h/PWy9LElGBB/7KjCXOcv9FrW8oSTV1IjVbmttjziTHgIM13hdP9tCjAbLoFIBgs
	 BkV+iaW6t2ixo89zscM8UFIbGtr2+SN8zloMqPV8m+ajcboZnzXjJFdDNjzMGDcs1O
	 rvU6mblSuQrtkEUzkAcZCbkCzWrtJrbEBUJVR9YJiVnZLoL8Fx7tz5ahzbe+tK2p36
	 qi3mQsUUqTJ0w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t4M4v-000000002Vj-1zWB;
	Fri, 25 Oct 2024 17:18:18 +0200
Date: Fri, 25 Oct 2024 17:18:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: x1e80100-crd: describe HID supplies
Message-ID: <Zxu2uedfWhAYSCrE@hovoldconsulting.com>
References: <20241015122427.15995-1-johan+linaro@kernel.org>
 <Zw5w+eCBMQu3CSuz@linaro.org>
 <Zw_tLjudvbTKGAMM@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw_tLjudvbTKGAMM@linaro.org>

On Wed, Oct 16, 2024 at 06:43:26PM +0200, Stephan Gerhold wrote:
> On Tue, Oct 15, 2024 at 04:41:13PM +0300, Abel Vesa wrote:
> > On 24-10-15 14:24:27, Johan Hovold wrote:
 
> > > +&pm8550ve_8_gpios {
> > > +	misc_3p3_reg_en: misc-3p3-reg-en-state {
> > > +		pins = "gpio6";
> > > +		function = "normal";
> > > +		bias-disable;
> > 
> > Maybe output-enable and input-disable are needed. Can you please check?
> 
> FWIW, there is a reason behind explicitly describing the intended
> direction of the pin for PMIC GPIOs with properties like "output-enable"
> or "input-disable": On QC platforms, PMIC GPIOs can be either in "input"
> mode, "output" mode, or "input+output" mode. If you don't specify
> exactly what you want, then the pinctrl-spmi-gpio driver will only add
> to the existing configuration.
> 
> For the configuration above this means:
> 
>  1. If GPIO6 is disabled or in "output" mode during boot, the resulting
>     mode will be "output".
> 
>  2. If GPIO6 is in "input" mode during boot, the resulting mode will be
>     "input+output".
> 
> I don't know if "input+output" mode has any negative impact compared to
> pure "output" mode. We usually want to have the pins in a consistent
> state though (i.e. independent of the boot up state).

Fair enough. I was worried that configuring the pin as an output without
setting the output value could cause trouble (e.g. always default to
low), but it seems at least the Linux driver handles that.

Johan

