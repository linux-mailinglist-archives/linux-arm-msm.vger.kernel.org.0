Return-Path: <linux-arm-msm+bounces-67010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5731B14E94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BFC0189716D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A26199934;
	Tue, 29 Jul 2025 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvF8erXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2092200A3;
	Tue, 29 Jul 2025 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796588; cv=none; b=WSvb0HYutC8bg/8Ez6zpJuCfPkh47T4vAaTFTHH+qXovFG2y3Ouqkbeai0ekO/uf2F3z1GvkbvXSSmLpDfInK+VK1WOVnH/q9EosycYSJi9hZEUddaBYHqWc6KnFF16gjbx60qhDj1YrSbBT7xXYnro0oh63osK/PLddKYEoZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796588; c=relaxed/simple;
	bh=8J8WsDaAXuGhIRqih5/Dp7Ehpdk4JivDt91FfVoN60k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mcfd5VlU+f9LXQ4XWJfx096drDUNXE18VIqqf+/77pQrKoS+9bGkxA0WqUEEaMO4xucW7PewJ6TZxJ3rmfay8wnQUrUttm9ANFUKsVVlo7utVqtEw1fYBTj47TnYAdLoY2QFAbEMI7h9XxSzUFqp6oP5RzYsjneVmQen8AQipns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvF8erXJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB20C4CEEF;
	Tue, 29 Jul 2025 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753796587;
	bh=8J8WsDaAXuGhIRqih5/Dp7Ehpdk4JivDt91FfVoN60k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvF8erXJSXiyMsFzY2yB309WKNyJwtGoE8G+OZv/bP1xEY6CIkwLFx0XngSYK7bFI
	 tURf/eOoq+792Gul8eJokb9PUQIzpLvpEqjJNqsL3vqU4RgeEmKzCIt1jThoSWqymE
	 SSCVxpGEjHLE/MBaNWJD7faooOKQnLgVeBNDamaFwa5/Enk1eDe5nSJsHXrpmsp5i9
	 b3DSzdk8VLhEu/sMpOOtB90J3QOhllvPW4UfC0LDoLaP0ZDn8WM8tV3J0HQajeN527
	 nh4ywSYmUJGzhZQ4fABjD+Rpwt3A21MnRBXT5AqNs7HOgFp4mZxeUkS8Ls1ZRfQDgn
	 M3pY+VS2mDAYg==
Date: Tue, 29 Jul 2025 14:43:02 +0100
From: Simon Horman <horms@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <rob.clark@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Message-ID: <20250729134302.GF1877762@horms.kernel.org>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
 <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
 <159eb27b-fca8-4f7e-b604-ba19d6f9ada7@oss.qualcomm.com>
 <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>
 <CACSVV00jef8so-jqjCaqJehj-XN2OZ562_R+Dod64+C4-dmDhQ@mail.gmail.com>
 <20250726180451.GM1367887@horms.kernel.org>
 <keqfco2t254skl6zjxchfze65j5bc5yq4j4t3wzllca7djtybm@zb724ha6khyg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <keqfco2t254skl6zjxchfze65j5bc5yq4j4t3wzllca7djtybm@zb724ha6khyg>

On Mon, Jul 28, 2025 at 09:36:42PM -0500, Bjorn Andersson wrote:
> On Sat, Jul 26, 2025 at 07:04:51PM +0100, Simon Horman wrote:
> > On Thu, Jul 24, 2025 at 08:59:38AM -0700, Rob Clark wrote:
> > > On Thu, Jul 24, 2025 at 5:52 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > On 24/07/2025 14:47, Konrad Dybcio wrote:
> > > > > On 7/23/25 10:29 AM, 'Krzysztof Kozlowski' via kernel wrote:
> > > > >> On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
> > > > >>> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
> > > > >>> collectively referred to as lemans. Most notably, the last of them
> > > > >>> has the SAIL (Safety Island) fused off, but remains identical
> > > > >>> otherwise.
> > > > >>>
> > > > >>> In an effort to streamline the codebase, rename the SoC DTSI, moving
> > > > >>> away from less meaningful numerical model identifiers.
> > > > >>>
> > > > >>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > > >>> ---
> > > > >>>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
> > > > >>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
> > > > >>
> > > > >> No, stop with this rename.
> > > > >>
> > > > >> There is no policy of renaming existing files.
> > > > >
> > > > > There's no policy against renaming existing files either.
> > > >
> > > > There is, because you break all the users. All the distros, bootloaders
> > > > using this DTS, people's scripts.
> > > 
> > > I think that is a valid argument against renaming the toplevel .dts
> > > (and therefore .dtb), but renaming .dtsi should be a harmless internal
> > > detail to the kernel.  And less confusing, IMHO, than
> > > qsc9100-myboard.dts #including sa8775p.dtsi.
> > > 
> > > So wouldn't the sensible way forward be to rename .dtsi but not .dts?
> > 
> > FWIIW, and with the dual caveats that: I do not have the full context of
> > this series; and SoCs are not somewhere where I am active these days:
> > 
> > I am also under the impression that, in general, renames to
> > match product or other organisational changes are a non-starter.
> > 
> 
> This is indeed a key reason for the new naming scheme. Until now we've
> named things based on the "product number" and we're here facing the
> introduction of the 3rd product name for the same die.
> 
> The purpose of this series is to detach from the product naming (and
> introduce the EVK board).

In general, something detached from product naming, and the whims thereof,
does seem sensible to me.

> > But reading over this patchset, I also felt that renaming the .dsti files
> > would improve things. And seems to have little scope to break things for
> > users.
> > 
> > </2c>
> 

