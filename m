Return-Path: <linux-arm-msm+bounces-62880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24EAAEC0CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 22:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0D164634A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 20:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D2B21A44C;
	Fri, 27 Jun 2025 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuiTKiZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20874502A;
	Fri, 27 Jun 2025 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055795; cv=none; b=KSOfTCPUeRUUJFRgiVYf6rsavLXcdR2p3QRjZPShtudaN5NG+Qkv7mFvl3d+GibmbwlADmYZKKXOL389xYsuB1jXoAtRwSOs9bAHJgLnf7KftXP8HT0s9vq/3aa2BP1GBZ2QLG3NZM7LKK2srZLQMeei+bW6qvSDNIzEGVW1MI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055795; c=relaxed/simple;
	bh=h4QlW7GZNwkMaT48nW8b+HM7x20vb+bnxT8cmkT0MvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1N9G2EHfMDLF+A1Eh2mNXXwUFT1kESz/JqblkCOUVq6cQulhXMpn+sM/bkWHvOx0iWb6sden0Z8yGsHuGdIWxU+XMcbJFdxBDwNIUXyILMHWmFnFsvSHKP/ksWlERs1t+z6LshDNzvSj6mlR6xD8XU2sYyOaWAJPfmYfmKPcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuiTKiZR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D212C4CEED;
	Fri, 27 Jun 2025 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055794;
	bh=h4QlW7GZNwkMaT48nW8b+HM7x20vb+bnxT8cmkT0MvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LuiTKiZRQo9wmdm3gQj5kbd/ugDzxx7piAfqCB9uvE6P8UkFE0xKUotZyNCmkoqd/
	 CnLMCaFEauE2ntc91/7YFz8YSnlmOv0ZglC2lrI69xbXowFhFTyFWFI4fQukEQ5vi7
	 kVrmZ327fK/D78jZ+uQEbNIKLbP7gvQrHvR6BBQwnj7el01zXZZauC0yK2a9hSPhsE
	 LQRtcgQ2EeCdvFzPVzMUkzJUhNKTyV1ukPSHiGulUos6JxiPynqhwHnUhcX7fOoAKz
	 ba1g1XZMtMIEm4awk0Qw3tokkfBpzs/88eURm2yXSsu4XNbJeLV6GNhlzSWwF/BTFp
	 gh1xGrI3oqS0w==
Date: Fri, 27 Jun 2025 15:23:13 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 0/2] Add support for IQ-8275-evk board
Message-ID: <20250627202313.GA4189710-robh@kernel.org>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <175069348269.3797007.5540625905808833666.robh@kernel.org>
 <bcfbfaed-e857-44be-86bd-d4e977fd4d27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcfbfaed-e857-44be-86bd-d4e977fd4d27@oss.qualcomm.com>

On Mon, Jun 23, 2025 at 05:50:11PM +0200, Konrad Dybcio wrote:
> On 6/23/25 5:46 PM, 'Rob Herring (Arm)' via kernel wrote:
> > 
> > On Mon, 23 Jun 2025 18:34:18 +0530, Umang Chheda wrote:
> >> This series:
> >>
> >> Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.
> 
> [...]
> 
> >>
> >>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
> >>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >>  .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
> >>  3 files changed, 249 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
> >>
> 
> [...]
> 
> > 
> > New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250623130420.3981916-1-umang.chheda@oss.qualcomm.com:
> > 
> > arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
> > 	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
> 
> Seems like a fluke..

Yes, I failed to filter that out.

This is just a before and after run with filtering out everything in 
before. I suspect that sometimes warning lines get interleaved and these 
show up as new.

If QCom was warning free, then this would be less of an issue. :(

Rob

