Return-Path: <linux-arm-msm+bounces-66763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 286AAB12BCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 20:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F263AFA22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 18:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A94288C89;
	Sat, 26 Jul 2025 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mk60yALw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F7D1DE2D8;
	Sat, 26 Jul 2025 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753553097; cv=none; b=J6+y9NP5wymz3Zbgpb+UtVA82W09ByvwaUJnVCKHdfud2cg+zuTXrvrXfRujvEv15m7FYbQM/+HCoukmReUZKmS5jceO4qA5VD1vb+eC5BANRNTJDO7jNV3AoMuE48zPb3S7p8pJIUOYl4qbQw++PyMCwcHDwz1RlmDdm3n6+bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753553097; c=relaxed/simple;
	bh=dA3RQXEC+Ya4PmUpYs4RFw4idADWpDG4vWeL2fSZ6M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBKkF79+irqk9ufR7oerDhbbqJSux8US7y9p9aTdFHiEV63gbw7KTVCW14yA1oWVifzf3I31B4RJeZCosi3hVaMGET9DVQLRj3GTlcQwy0ohupWi6zKtQyF9OOCpA33zdFB1raU9f59Ulq4fjKLE6aK4Se7VkCbRvoCYO5vINws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mk60yALw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92186C4CEED;
	Sat, 26 Jul 2025 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753553096;
	bh=dA3RQXEC+Ya4PmUpYs4RFw4idADWpDG4vWeL2fSZ6M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mk60yALwghPokJKFHR7S9PFM88kTEYZYtfojXaZI+uiimFAPD9KIEv+wteV4f6jMs
	 yd/HoAXf4N318Zl0XUPbbgv+DC5DmO+5aMbqR3rOykGrbHcx6W7Wv0hj3+KUVPaaHW
	 VIcSuKVEuy3n7mDDX6SzQZM46jrOBu+JWpBlHPSRrPx3ksFMg5NnrtHCjLbLDEF27P
	 pzbHJL5eWw952Uhpz3awLM5TmaJvuaanqxZ6wR89SG5si+cVb6cx61/k2znh4io9qP
	 kzilZTDlNe2yAYnESP2zFJS4wi91yhuKrESL+HZYgt3Wucq8GxTs/hkpghqAADxiYs
	 nRLgxFtzaraAA==
Date: Sat, 26 Jul 2025 19:04:51 +0100
From: Simon Horman <horms@kernel.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Message-ID: <20250726180451.GM1367887@horms.kernel.org>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
 <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
 <159eb27b-fca8-4f7e-b604-ba19d6f9ada7@oss.qualcomm.com>
 <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>
 <CACSVV00jef8so-jqjCaqJehj-XN2OZ562_R+Dod64+C4-dmDhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00jef8so-jqjCaqJehj-XN2OZ562_R+Dod64+C4-dmDhQ@mail.gmail.com>

On Thu, Jul 24, 2025 at 08:59:38AM -0700, Rob Clark wrote:
> On Thu, Jul 24, 2025 at 5:52 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 24/07/2025 14:47, Konrad Dybcio wrote:
> > > On 7/23/25 10:29 AM, 'Krzysztof Kozlowski' via kernel wrote:
> > >> On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
> > >>> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
> > >>> collectively referred to as lemans. Most notably, the last of them
> > >>> has the SAIL (Safety Island) fused off, but remains identical
> > >>> otherwise.
> > >>>
> > >>> In an effort to streamline the codebase, rename the SoC DTSI, moving
> > >>> away from less meaningful numerical model identifiers.
> > >>>
> > >>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > >>> ---
> > >>>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
> > >>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
> > >>
> > >> No, stop with this rename.
> > >>
> > >> There is no policy of renaming existing files.
> > >
> > > There's no policy against renaming existing files either.
> >
> > There is, because you break all the users. All the distros, bootloaders
> > using this DTS, people's scripts.
> 
> I think that is a valid argument against renaming the toplevel .dts
> (and therefore .dtb), but renaming .dtsi should be a harmless internal
> detail to the kernel.  And less confusing, IMHO, than
> qsc9100-myboard.dts #including sa8775p.dtsi.
> 
> So wouldn't the sensible way forward be to rename .dtsi but not .dts?

FWIIW, and with the dual caveats that: I do not have the full context of
this series; and SoCs are not somewhere where I am active these days:

I am also under the impression that, in general, renames to
match product or other organisational changes are a non-starter.

But reading over this patchset, I also felt that renaming the .dsti files
would improve things. And seems to have little scope to break things for
users.

</2c>

