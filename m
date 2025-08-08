Return-Path: <linux-arm-msm+bounces-68124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF7B1E894
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 14:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1261C23401
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 12:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0170327A124;
	Fri,  8 Aug 2025 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGNavPnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976A42798E5;
	Fri,  8 Aug 2025 12:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754657036; cv=none; b=iu05ZC1DYJPBSVWnLSF8akikSSdfTsnm9eiuuoxXzJrqKn+qnSrKdeNYkLhCdumAH6IPLr95xdZXsUcTvG6loOSajo2ywYNlM+foEb1ZOh3BbUOCIKSv4WgjvS/lKvb+pShUrs7MMYUuUqUnfo+wcTr6aukanc9K/NLFBts4Veg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754657036; c=relaxed/simple;
	bh=tsejBiC+/oFFTRAIabIuUh+wHi8GC0uRJVghpAoYPiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANEBpvl/D1YCszpRIFNdavoHJFaMJK6hAtYaVpa7soRdGQIyo7M5qvdutdph77vxjHvqZp301HkczEaIoTbCwpnKm14zXn60EuYtLesO5cleHUHA+89hUQ9k3LySNz/je/+hByMeQHKDEFI6txGAOvwWPKF19RCC2LDza0Tr2qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGNavPnY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2853BC4CEED;
	Fri,  8 Aug 2025 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754657036;
	bh=tsejBiC+/oFFTRAIabIuUh+wHi8GC0uRJVghpAoYPiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGNavPnYc0BaIr4fEo7cDVyDXtlCaQML0x1+CLofQxH/7GBarUOAKyv10skBzgOgK
	 oBVGlbo+qxNsKBCaltiF/bCMzTBM+JS4FArltyTTfnjQ0UZzWwTvC5Z4fjVOozD7ZS
	 JQBbJfCugPeUJjdCovt0G2nAeOFRkzF2ecSo7UyiTk/Pksf1f3eKrhbfIpBuFzLAEx
	 QclWPJs8EPUYzB93ylVucyqZE1nMpRAMkuM74f/8W99rRj70YM8rC+0ZgZSbBEtuVJ
	 FPeW/jISkY1HYxlyyC8Mh2JyQuSegx01BsKlsUUy1Qsn0Gqy4ocgYNHR4fBT6G/d6D
	 g+NePeMF1zeZA==
Date: Fri, 8 Aug 2025 18:13:41 +0530
From: 'Manivannan Sadhasivam' <mani@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: 'Konrad Dybcio' <konrad.dybcio@oss.qualcomm.com>, 
	'Krzysztof Kozlowski' <krzk@kernel.org>, 'Ram Kumar Dwivedi' <quic_rdwivedi@quicinc.com>, 
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Message-ID: <fh7y7stt5jm65zlpyhssc7dfmmejh3jzmt75smkz5uirbv6ktf@zyd2qmm2spjs>
References: <061c01dc062f$70ec34b0$52c49e10$@samsung.com>
 <87c37d65-5ab1-4443-a428-dc3592062cdc@oss.qualcomm.com>
 <061d01dc0631$c1766c00$44634400$@samsung.com>
 <3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>
 <06d201dc0689$9f438200$ddca8600$@samsung.com>
 <wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
 <06f301dc0695$6bf25690$43d703b0$@samsung.com>
 <CGME20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60@epcas5p1.samsung.com>
 <nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
 <0d6801dc07b9$b869adf0$293d09d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d6801dc07b9$b869adf0$293d09d0$@samsung.com>

On Thu, Aug 07, 2025 at 10:08:32PM GMT, Alim Akhtar wrote:
> 
> 
> > -----Original Message-----
> > From: 'Manivannan Sadhasivam' <mani@kernel.org>
> > Sent: Wednesday, August 6, 2025 4:56 PM
> > To: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: 'Konrad Dybcio' <konrad.dybcio@oss.qualcomm.com>; 'Krzysztof
> [...]
> 
> > > >
> > > > On Wed, Aug 06, 2025 at 09:51:43AM GMT, Alim Akhtar wrote:
> > > >
> > > > [...]
> > > >
> > > > > > >> Introducing generic solutions preemptively for problems that
> > > > > > >> are simple in concept and can occur widely is good practice
> > > > > > >> (although it's sometimes hard to gauge whether this is a
> > > > > > >> one-off), as if the issue spreads a generic solution will
> > > > > > >> appear at some point, but we'll have to keep supporting the
> > > > > > >> odd ones as well
> > > > > > >>
> > > > > > > Ok,
> > > > > > > I would prefer if we add a property which sounds like "poor
> > > > > > > thermal dissipation" or "routing channel loss" rather than
> > > > > > > adding limiting UFS gear
> > > > > > properties.
> > > > > > > Poor thermal design or channel losses are generic enough and
> > > > > > > can happen
> > > > > > on any board.
> > > > > >
> > > > > > This is exactly what I'm trying to avoid through my suggestion -
> > > > > > one board may have poor thermal dissipation, another may have
> > > > > > channel losses, yet another one may feature a special batch of
> > > > > > UFS chips that will set the world on fire if instructed to
> > > > > > attempt link training at gear 7 - they all are causes, as
> > > > > > opposed to describing what needs to happen (i.e. what the
> > > > > > hardware must be treated as - gear N incapable despite what can
> > > > > > be discovered at runtime), with perhaps a comment on the side
> > > > > >
> > > > > But the solution for all possible board problems can't be by
> > > > > limiting Gear
> > > > speed.
> > > >
> > > > Devicetree properties should precisely reflect how they are relevant
> > > > to the hardware. 'limiting-gear-speed' is self-explanatory that the
> > > > gear speed is getting limited (for a reason), but the devicetree
> > > > doesn't need to describe the
> > > > *reason* itself.
> > > >
> > > > > So it should be known why one particular board need to limit the gear.
> > > >
> > > > That goes into the description, not in the property name.
> > > >
> > > > > I understand that this is a static configuration, where it is
> > > > > already known
> > > > that board is broken for higher Gear.
> > > > > Can this be achieved by limiting the clock? If not, can we add a
> > > > > board
> > > > specific _quirk_ and let the _quirk_ to be enabled from vendor
> > > > specific hooks?
> > > > >
> > > >
> > > > How can we limit the clock without limiting the gears? When we limit
> > > > the gear/mode, both clock and power are implicitly limited.
> > > >
> > > Possibly someone need to check with designer of the SoC if that is possible
> > or not.
> > 
> > It's not just clock. We need to consider reducing regulator, interconnect
> > votes also. But as I said above, limiting the gear/mode will take care of all
> > these parameters.
> > 
> > > Did we already tried _quirk_? If not, why not?
> > > If the board is so poorly designed and can't take care of the channel
> > > loses or heat dissipation etc, Then I assumed the gear negotiation
> > > between host and device should fail for the higher gear and driver can have
> > a re-try logic to re-init / re-try "power mode change" at the lower gear. Is
> > that not possible / feasible?
> > >
> > 
> > I don't see why we need to add extra logic in the UFS driver if we can extract
> > that information from DT.
> > 
> You didn’t answer my question entirely, I am still not able to visualised how come Linkup is happening in higher gear and then 
> Suddenly it is failing and we need to reduce the gear to solve that?

Oh well, this is the source of confusion here. I didn't (also the patch) claim
that the link up will happen with higher speed. It will most likely fail if it
couldn't operate at the higher speed and that's why we need to limit it to lower
gear/mode *before* bringing the link up.

As you can see, the driver patch is parsing the limits in its
ufs_hba_variant_ops::init() callback, which gets called during
ufshcd_hba_init().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

