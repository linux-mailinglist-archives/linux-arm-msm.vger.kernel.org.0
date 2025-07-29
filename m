Return-Path: <linux-arm-msm+bounces-66951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DA3B1464F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 04:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AB08542478
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 02:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A3F20E6F3;
	Tue, 29 Jul 2025 02:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+plK5zr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AEA79EA;
	Tue, 29 Jul 2025 02:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753756606; cv=none; b=l1pWciEPYEkvHUVNtFCdIW0U3zqNB1rjYfpbzeoBcMEjXo9dIDW2gBGNYofhJkrgIxITSquLdUss0oREjMzm9thT3iwoOIqnoJRJ2DcFuVOz2OAiTpy4JZ1lIdduBaAA0++LbXQjin/gNzSsqvizYUQHoY6ztTMiEtEWSPcdqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753756606; c=relaxed/simple;
	bh=tTjmBX1hi7lfBohsP08/xasKO5OLc1R0iOYa9lFW2ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeMsYPUQgzHoHdJnGrPc5wTQNLd2McLHOFRblw4tbnpqg/Og7cb5M/Dn+IAonQYqPFvrhdhN3ufgEah4zfjCyJAIsxnSE8TzI+65+YRYiETIfRrLUutOkQJ2jNNEO6CLN/yVrxnB9n2ca+Fl6rwIqGRkEN+HJuWu7NiStznG8Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+plK5zr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE7CC4CEE7;
	Tue, 29 Jul 2025 02:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753756605;
	bh=tTjmBX1hi7lfBohsP08/xasKO5OLc1R0iOYa9lFW2ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+plK5zrMIYqi1uBK/nnwUx3VmtKW8rXOFbI3EkuMbsqHdFssmCqkAiOD1n4yycYR
	 ZTg8w0SzHoPTtmGTpW9ohuwr3EsfoPKoQHiwq6piiJTbd5KKN/arngQwIYBL0bb2M8
	 IbB1r+m0xdAwJbmdO4C9u6WJo34eTpVgYWKYTg2k1S1nqNVY47yGJS4VvzvIF/8go2
	 J3qhS97trGZzD8gYfT2DLXBOF5eDLpOLX3gDevA8KUZuvl2AlWiharjHbSEMvsRLRN
	 kqS4boV8cjsHZXNHIwzk8K0Le+r5UHlrYb7KcWFGwi8I1QbwbQzrSqorGYZoIcuuwg
	 lFHM58SAGqI0A==
Date: Mon, 28 Jul 2025 21:36:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Rob Clark <rob.clark@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Message-ID: <keqfco2t254skl6zjxchfze65j5bc5yq4j4t3wzllca7djtybm@zb724ha6khyg>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
 <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
 <159eb27b-fca8-4f7e-b604-ba19d6f9ada7@oss.qualcomm.com>
 <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>
 <CACSVV00jef8so-jqjCaqJehj-XN2OZ562_R+Dod64+C4-dmDhQ@mail.gmail.com>
 <20250726180451.GM1367887@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250726180451.GM1367887@horms.kernel.org>

On Sat, Jul 26, 2025 at 07:04:51PM +0100, Simon Horman wrote:
> On Thu, Jul 24, 2025 at 08:59:38AM -0700, Rob Clark wrote:
> > On Thu, Jul 24, 2025 at 5:52 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On 24/07/2025 14:47, Konrad Dybcio wrote:
> > > > On 7/23/25 10:29 AM, 'Krzysztof Kozlowski' via kernel wrote:
> > > >> On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
> > > >>> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
> > > >>> collectively referred to as lemans. Most notably, the last of them
> > > >>> has the SAIL (Safety Island) fused off, but remains identical
> > > >>> otherwise.
> > > >>>
> > > >>> In an effort to streamline the codebase, rename the SoC DTSI, moving
> > > >>> away from less meaningful numerical model identifiers.
> > > >>>
> > > >>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > >>> ---
> > > >>>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
> > > >>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
> > > >>
> > > >> No, stop with this rename.
> > > >>
> > > >> There is no policy of renaming existing files.
> > > >
> > > > There's no policy against renaming existing files either.
> > >
> > > There is, because you break all the users. All the distros, bootloaders
> > > using this DTS, people's scripts.
> > 
> > I think that is a valid argument against renaming the toplevel .dts
> > (and therefore .dtb), but renaming .dtsi should be a harmless internal
> > detail to the kernel.  And less confusing, IMHO, than
> > qsc9100-myboard.dts #including sa8775p.dtsi.
> > 
> > So wouldn't the sensible way forward be to rename .dtsi but not .dts?
> 
> FWIIW, and with the dual caveats that: I do not have the full context of
> this series; and SoCs are not somewhere where I am active these days:
> 
> I am also under the impression that, in general, renames to
> match product or other organisational changes are a non-starter.
> 

This is indeed a key reason for the new naming scheme. Until now we've
named things based on the "product number" and we're here facing the
introduction of the 3rd product name for the same die.

The purpose of this series is to detach from the product naming (and
introduce the EVK board).

Regards,
Bjorn

> But reading over this patchset, I also felt that renaming the .dsti files
> would improve things. And seems to have little scope to break things for
> users.
> 
> </2c>

