Return-Path: <linux-arm-msm+bounces-67893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE12B1C4CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 13:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB97C3A4FB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C197A25EFB6;
	Wed,  6 Aug 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ju8QlN4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0219AD70;
	Wed,  6 Aug 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754479539; cv=none; b=phrB7N5V5I0jozf7j3NypGrH8J6m14dSq1WXPvF0lCIPH1Iv9gXPGOi5odyl/ECBXcKl6VefUQwOX68HHKs+1u97NP2jIkn+PP2TcWjiuCjlqjWVJtTAt760rlNdnsbgiwn8Pd/imG0DpVercVaz57T1zk1l1wdJzyZC3g0YDe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754479539; c=relaxed/simple;
	bh=62qvASXmUB4wVqE8rGuI4cmZ6A66fVDJY5o++OQtx1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKGGF4a/T1lm1iSTJzy2BUepE9aAcT9g3+BJ/xkE42I+Z23Rk6VSLuKIattDrmiY7dhXsMuJLaJDucXviCK3f1EXFvI2T8jAVU6xHnT7rUh3YobYLkZfO+H3ih3aDQnPQpF+V9BquEnjQi9Vl1bd7EjaMFVYAogdHTcaCBiB2ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ju8QlN4M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E163FC4CEE7;
	Wed,  6 Aug 2025 11:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754479539;
	bh=62qvASXmUB4wVqE8rGuI4cmZ6A66fVDJY5o++OQtx1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ju8QlN4MKcK+y6xrlf6+3pMN1tpsFTYLt/TGb/6oPC+92B2NCLqBdSKyZd9YK0Z/9
	 yE+ZvzuZORAJ8MvEekSepaatb1PDeCb7xWwWTJAMbflkB8rQqm+vLx7X/RvWUkO6wK
	 f6oqA1iPbeTSayYShG0gGhpD+QJMCXZt0iybS67oy0eF5h3LSqnBDpi0YFUiJiQrPm
	 dOAVGn4I1wnKqQV9mohur45DL2X1ctGSzyLhy49HPi/U4YapMi+58MJhig9kGlni+m
	 j9v3FBiD1+SBHm+EQldKTLE6D6aak3UPMXftSpMPvVYCfKDmG9sAr/T1q2bXN8gop4
	 ZbQt3wnkB1FtA==
Date: Wed, 6 Aug 2025 16:55:30 +0530
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
Message-ID: <nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
References: <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
 <061b01dc062d$25c47800$714d6800$@samsung.com>
 <i6eyiscdf2554znc4aaglhi22opfgyicif3y7kzjafwsrtdrtm@jjpzak64gdft>
 <061c01dc062f$70ec34b0$52c49e10$@samsung.com>
 <87c37d65-5ab1-4443-a428-dc3592062cdc@oss.qualcomm.com>
 <061d01dc0631$c1766c00$44634400$@samsung.com>
 <3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>
 <06d201dc0689$9f438200$ddca8600$@samsung.com>
 <wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
 <06f301dc0695$6bf25690$43d703b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06f301dc0695$6bf25690$43d703b0$@samsung.com>

On Wed, Aug 06, 2025 at 11:16:11AM GMT, Alim Akhtar wrote:
> 
> 
> > -----Original Message-----
> > From: 'Manivannan Sadhasivam' <mani@kernel.org>
> > Sent: Wednesday, August 6, 2025 10:35 AM
> > To: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: 'Konrad Dybcio' <konrad.dybcio@oss.qualcomm.com>; 'Krzysztof
> > Kozlowski' <krzk@kernel.org>; 'Ram Kumar Dwivedi'
> > <quic_rdwivedi@quicinc.com>; avri.altman@wdc.com;
> > bvanassche@acm.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; andersson@kernel.org; konradybcio@kernel.org;
> > James.Bottomley@hansenpartnership.com; martin.petersen@oracle.com;
> > agross@kernel.org; linux-arm-msm@vger.kernel.org; linux-
> > scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
> > properties to UFS
> > 
> > On Wed, Aug 06, 2025 at 09:51:43AM GMT, Alim Akhtar wrote:
> > 
> > [...]
> > 
> > > > >> Introducing generic solutions preemptively for problems that are
> > > > >> simple in concept and can occur widely is good practice (although
> > > > >> it's sometimes hard to gauge whether this is a one-off), as if
> > > > >> the issue spreads a generic solution will appear at some point,
> > > > >> but we'll have to keep supporting the odd ones as well
> > > > >>
> > > > > Ok,
> > > > > I would prefer if we add a property which sounds like "poor
> > > > > thermal dissipation" or "routing channel loss" rather than adding
> > > > > limiting UFS gear
> > > > properties.
> > > > > Poor thermal design or channel losses are generic enough and can
> > > > > happen
> > > > on any board.
> > > >
> > > > This is exactly what I'm trying to avoid through my suggestion - one
> > > > board may have poor thermal dissipation, another may have channel
> > > > losses, yet another one may feature a special batch of UFS chips
> > > > that will set the world on fire if instructed to attempt link
> > > > training at gear 7 - they all are causes, as opposed to describing
> > > > what needs to happen (i.e. what the hardware must be treated as -
> > > > gear N incapable despite what can be discovered at runtime), with
> > > > perhaps a comment on the side
> > > >
> > > But the solution for all possible board problems can't be by limiting Gear
> > speed.
> > 
> > Devicetree properties should precisely reflect how they are relevant to the
> > hardware. 'limiting-gear-speed' is self-explanatory that the gear speed is
> > getting limited (for a reason), but the devicetree doesn't need to describe
> > the
> > *reason* itself.
> > 
> > > So it should be known why one particular board need to limit the gear.
> > 
> > That goes into the description, not in the property name.
> > 
> > > I understand that this is a static configuration, where it is already known
> > that board is broken for higher Gear.
> > > Can this be achieved by limiting the clock? If not, can we add a board
> > specific _quirk_ and let the _quirk_ to be enabled from vendor specific
> > hooks?
> > >
> > 
> > How can we limit the clock without limiting the gears? When we limit the
> > gear/mode, both clock and power are implicitly limited.
> > 
> Possibly someone need to check with designer of the SoC if that is possible or not.

It's not just clock. We need to consider reducing regulator, interconnect votes
also. But as I said above, limiting the gear/mode will take care of all these
parameters.

> Did we already tried _quirk_? If not, why not? 
> If the board is so poorly designed and can't take care of the channel loses or heat dissipation etc,
> Then I assumed the gear negotiation between host and device should fail for the higher gear 
> and driver can have a re-try logic to re-init / re-try "power mode change" at the lower gear. Is that not possible / feasible?
> 

I don't see why we need to add extra logic in the UFS driver if we can extract
that information from DT.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

