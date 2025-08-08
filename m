Return-Path: <linux-arm-msm+bounces-68134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B760DB1EE30
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 20:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC31F5673AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 18:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDBE1F63CD;
	Fri,  8 Aug 2025 18:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxwLTw4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170311E5B91;
	Fri,  8 Aug 2025 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754676412; cv=none; b=eS+KXCzq7eFJqPO3y4k26pd/D/dN2sluJpnNgz5yCgfm35vVgT9mGy94qfEkcbcZEa+aXxEXqHwHA+J429SGCZSTP9T1y0Vwh6A5FJ24BoLXy82Hh+MiCR2+mcUHJKoAV6StAQGd0FnRR4mNI3cOk8kkAE7uBT3WSw/ZorsrLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754676412; c=relaxed/simple;
	bh=Xlb6GlM1jikm1KAnIiq6BWNyPUh3O/ufUGpGhV+m/jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqZc2ZXxNbqpQqgBr3PO3l7M+vOtji0/Mv39mX3SmPqQEDfHqvw9/GssfStwuD1ZQHrkS9+5Z0u7DSj2PL4gogecyo2hhYcCS0zzjiN28peIyIeamQy0S9HfQFV0UtncjK+xWt6SPG+GeIiYMnzJLF1dwd9eUUI3pTdcZzpKwQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxwLTw4/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C1EC4CEED;
	Fri,  8 Aug 2025 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754676411;
	bh=Xlb6GlM1jikm1KAnIiq6BWNyPUh3O/ufUGpGhV+m/jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxwLTw4/P9blEJzA0NeI3VVQbvvogs/jKUkp1iwYTHHSGUM804PVH79cOqYwy09iE
	 awuPFvEMVSoXT+AjyvUQ3qcGwltUw/yP/7k+aryoRr0vcLhPx2gFO8dWGfnnrkqZQD
	 f0ZSizK/wCc7vY7mJ/LHyWNTjZmICn6D5KAH5Y2sWYxuSi8nBIX1ENZG6vkytJXRyP
	 BTph3EjXTdPYlc/Vpy5gp4mkQPsQvP1LMBIpCeVUIuu4DrZlO3YKzQoJ2XDVp+QPB2
	 KHxY5krriR4lcHJsErKEieb1GVPd9uNR5XzbsmSyQA+ZV4SrdsTn4m0GyoIT91slwV
	 HciWeQ0kFikgw==
Date: Fri, 8 Aug 2025 23:36:40 +0530
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
Message-ID: <xqynlabahvaw4cznbofkkqjr4oh7tf6crlnxoivhpadlymxg5v@a4b5fgf55nqw>
References: <061d01dc0631$c1766c00$44634400$@samsung.com>
 <3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>
 <06d201dc0689$9f438200$ddca8600$@samsung.com>
 <wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
 <06f301dc0695$6bf25690$43d703b0$@samsung.com>
 <CGME20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60@epcas5p1.samsung.com>
 <nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
 <0d6801dc07b9$b869adf0$293d09d0$@samsung.com>
 <fh7y7stt5jm65zlpyhssc7dfmmejh3jzmt75smkz5uirbv6ktf@zyd2qmm2spjs>
 <0f8c01dc0876$427cf1c0$c776d540$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f8c01dc0876$427cf1c0$c776d540$@samsung.com>

On Fri, Aug 08, 2025 at 08:38:09PM GMT, Alim Akhtar wrote:
> 
> 
> > -----Original Message-----
> > From: 'Manivannan Sadhasivam' <mani@kernel.org>
> > Sent: Friday, August 8, 2025 6:14 PM
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
> > On Thu, Aug 07, 2025 at 10:08:32PM GMT, Alim Akhtar wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: 'Manivannan Sadhasivam' <mani@kernel.org>
> > > > Sent: Wednesday, August 6, 2025 4:56 PM
> > > > To: Alim Akhtar <alim.akhtar@samsung.com>
> > > > Cc: 'Konrad Dybcio' <konrad.dybcio@oss.qualcomm.com>; 'Krzysztof
> > > [...]
> > >
> > > > > >
> > > > > > On Wed, Aug 06, 2025 at 09:51:43AM GMT, Alim Akhtar wrote:
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > > > > >> Introducing generic solutions preemptively for problems
> > > > > > > > >> that are simple in concept and can occur widely is good
> > > > > > > > >> practice (although it's sometimes hard to gauge whether
> > > > > > > > >> this is a one-off), as if the issue spreads a generic
> > > > > > > > >> solution will appear at some point, but we'll have to
> > > > > > > > >> keep supporting the odd ones as well
> > > > > > > > >>
> > > > > > > > > Ok,
> > > > > > > > > I would prefer if we add a property which sounds like
> > > > > > > > > "poor thermal dissipation" or "routing channel loss"
> > > > > > > > > rather than adding limiting UFS gear
> > > > > > > > properties.
> > > > > > > > > Poor thermal design or channel losses are generic enough
> > > > > > > > > and can happen
> > > > > > > > on any board.
> > > > > > > >
> > > > > > > > This is exactly what I'm trying to avoid through my
> > > > > > > > suggestion - one board may have poor thermal dissipation,
> > > > > > > > another may have channel losses, yet another one may feature
> > > > > > > > a special batch of UFS chips that will set the world on fire
> > > > > > > > if instructed to attempt link training at gear 7 - they all
> > > > > > > > are causes, as opposed to describing what needs to happen
> > > > > > > > (i.e. what the hardware must be treated as - gear N
> > > > > > > > incapable despite what can be discovered at runtime), with
> > > > > > > > perhaps a comment on the side
> > > > > > > >
> > > > > > > But the solution for all possible board problems can't be by
> > > > > > > limiting Gear
> > > > > > speed.
> > > > > >
> > > > > > Devicetree properties should precisely reflect how they are
> > > > > > relevant to the hardware. 'limiting-gear-speed' is
> > > > > > self-explanatory that the gear speed is getting limited (for a
> > > > > > reason), but the devicetree doesn't need to describe the
> > > > > > *reason* itself.
> > > > > >
> > > > > > > So it should be known why one particular board need to limit the
> > gear.
> > > > > >
> > > > > > That goes into the description, not in the property name.
> > > > > >
> > > > > > > I understand that this is a static configuration, where it is
> > > > > > > already known
> > > > > > that board is broken for higher Gear.
> > > > > > > Can this be achieved by limiting the clock? If not, can we add
> > > > > > > a board
> > > > > > specific _quirk_ and let the _quirk_ to be enabled from vendor
> > > > > > specific hooks?
> > > > > > >
> > > > > >
> > > > > > How can we limit the clock without limiting the gears? When we
> > > > > > limit the gear/mode, both clock and power are implicitly limited.
> > > > > >
> > > > > Possibly someone need to check with designer of the SoC if that is
> > > > > possible
> > > > or not.
> > > >
> > > > It's not just clock. We need to consider reducing regulator,
> > > > interconnect votes also. But as I said above, limiting the gear/mode
> > > > will take care of all these parameters.
> > > >
> > > > > Did we already tried _quirk_? If not, why not?
> > > > > If the board is so poorly designed and can't take care of the
> > > > > channel loses or heat dissipation etc, Then I assumed the gear
> > > > > negotiation between host and device should fail for the higher
> > > > > gear and driver can have
> > > > a re-try logic to re-init / re-try "power mode change" at the lower
> > > > gear. Is that not possible / feasible?
> > > > >
> > > >
> > > > I don't see why we need to add extra logic in the UFS driver if we
> > > > can extract that information from DT.
> > > >
> > > You didn’t answer my question entirely, I am still not able to
> > > visualised how come Linkup is happening in higher gear and then Suddenly
> > it is failing and we need to reduce the gear to solve that?
> > 
> > Oh well, this is the source of confusion here. I didn't (also the patch) claim
> > that the link up will happen with higher speed. It will most likely fail if it
> > couldn't operate at the higher speed and that's why we need to limit it to
> > lower gear/mode *before* bringing the link up.
> > 
> Right, that's why a re-try logic to negotiate a __working__ power mode change can help, instead of introducing new binding for this case.

Retry logic is already in place in the ufshcd core, but with this kind of signal
integrity issue, we cannot guarantee that it will gracefully fail and then we
could retry. The link up *may* succeed, then it could blow up later also (when
doing heavy I/O operations etc...). So with this non-deterministic behavior, we
cannot rely on this logic.

> And that approach can be useful for many platforms.

Other platforms could also reuse the same DT properties to workaround similar
issues.

> Anyway coming back with the same point again and again is not productive.
> I gave my opinion and suggestions. Rest is on the maintainers.

Suggestions are always welcomed. It is important to have comments to try out
different things instead of sticking to the proposed solution. But in my
opinion, the retry logic is not reliable in this case. Moreover, we do have
similar properties for other peripherals like PCIe, MMC, where the vendors would
use DT properties to limit the speed to workaround the board issues. So we are
not doing anything insane here.

If there are better solutions than what is proposed here, we would indeed like
to hear.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

