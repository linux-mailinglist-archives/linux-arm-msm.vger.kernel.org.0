Return-Path: <linux-arm-msm+bounces-31135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A296F79B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 17:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34C06B2179E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955781CE6F8;
	Fri,  6 Sep 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKd4XzP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692791C8FBC;
	Fri,  6 Sep 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634816; cv=none; b=YtwHTW+OSIufnsPqydk4Uqd6/EbB+ev+BakDlhkplKMJq4s3c7Ifzapi/5yqLWgQi/FwmYQWSQYnv0z02n1ndyLSxY/woBDNX7rsahAcjkWUzTQCxeMRlLwU0h1K3EPOXRSa+H/akJ8pWzE4QTtnk81fg/59ZVIWkFQZC/EXv+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634816; c=relaxed/simple;
	bh=p7yIq8PH1I2bwijZSVcZji0ntexjWrnsPzKDcLBZnP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBfvjJRwmWJ9cg6YAQsu95OMXBqOBDV8iZe+xY+vCH4nfDtb+7NfQrGfk7TdUTPgVrpW9lId5rCKzw001SSzaqehgdVSa4aNB2ijpAKLRhptHt+Arn3XrEQmwGHJSKmZNXVrvWKQ9oQNGBIIE6ALbNPJJ7AhsIGG2NaQajoQwFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKd4XzP2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AD5C4CEC7;
	Fri,  6 Sep 2024 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725634816;
	bh=p7yIq8PH1I2bwijZSVcZji0ntexjWrnsPzKDcLBZnP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKd4XzP23CGtaHOa12wc0BIwvz3XjJBGpEOHqCvAj1bnyaDUZRBTLTETK5L4FM//y
	 quLufcrgQuJWc5CRjHR0Os28CbbUbzciRTV6UR6cPLUmX/d/Dyk5wDxCQNYul4V1Kt
	 AMAMTqidJvxT+CNify+iaAL0fGA/a+RlFQCZUEBqpeSTb3FwaaByNrF31C0Wm3jPlY
	 DUn+A3JTy7l78PEx/D2hLOpmslbAVpws3rCHPFf7m1wLvwF+NWm6YyUFgK+IsbZl1J
	 HS/D4sp1hs5FmwldgiRs5Of/wxJ4Z4M+WceKJU5D8AlLgTDwUhzMQNOGAttNy5dRIX
	 Poaz1kq0/y1pg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1smaRw-000000005OM-3LOU;
	Fri, 06 Sep 2024 17:00:36 +0200
Date: Fri, 6 Sep 2024 17:00:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc8280xp-crd: enable wifi
Message-ID: <ZtsZFKJgSaghf9HH@hovoldconsulting.com>
References: <20240813190639.154983-1-brgl@bgdev.pl>
 <20240813190639.154983-2-brgl@bgdev.pl>
 <ZsdRrHK7kCYs7MJF@hovoldconsulting.com>
 <62ac051e-f462-4a98-9c80-2229d1bf16be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62ac051e-f462-4a98-9c80-2229d1bf16be@kernel.org>

On Tue, Aug 27, 2024 at 01:26:40PM +0200, Konrad Dybcio wrote:
> On 22.08.2024 4:56 PM, Johan Hovold wrote:
> > On Tue, Aug 13, 2024 at 09:06:36PM +0200, Bartosz Golaszewski wrote:
> >> From: Konrad Dybcio <konradybcio@kernel.org>

> >> +	vreg_s10b: regulator-s10b {
> >> +		compatible = "regulator-fixed";
> > 
> > I don't think this is a fixed regulator.
> 
> It effectively is

If it's an output of one of the pmic as the name suggests and as it is
on the X13s, I think it should be described as such.
 
> >> +
> >> +		regulator-name = "VREG_S10B";
> >> +		regulator-min-microvolt = <1800000>;
> >> +		regulator-max-microvolt = <1800000>;
> >> +
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +	};
 
> >> +	wlan_en: wlan-en-state {
> >> +		pins = "gpio134";
> >> +		function = "gpio";
> >> +		drive-strength = <8>;
> > 
> > Why increase the drive strength?
> 
> This is what's used on Windows, for lack of a better idea, not sure
> if this is actually necessary

If this indeed is what the fw configures it as then I guess it's fine to
keep as-is for now.

Johan

