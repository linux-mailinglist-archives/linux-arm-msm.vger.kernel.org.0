Return-Path: <linux-arm-msm+bounces-68198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E616AB1F456
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 13:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7EA518C7D77
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDA9272E7F;
	Sat,  9 Aug 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4EeApLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18213D539;
	Sat,  9 Aug 2025 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754738025; cv=none; b=iF0JUgWIojfw7JggJP18ZlJEljFzDWuQumuMJB6Owo8v+El0fZZkAJZeXOdm7rr5ou8xFV/vrfSb1aLYht9HEMrFiXAJgsguHP2mX8XJaxxU+nx73FMt7TMw3xajWA9nG+PvUmoUqqy3VWAsVmp9vHT9J7xrVjR5akvo9peUCy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754738025; c=relaxed/simple;
	bh=mwTGoJ1vJekZDumrlzePyF4v7ik+2mC6/XKusF2wlkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CS2HKIEFeTZFSWjYZSmxFkTsF7gvfSLGnRZNsimQ+cAbZYiesPEJJeHbZE44mp6kDCGHyvJEVhZFDRB4mMgukxqjaAbcCdwATEZlb77hcQnxzE6qXFDqmlXigS71qRNQRQQ2kztY52dHFVq1h8K80gOEyXrffyOkfFUqKmYwH9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4EeApLm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A04EC4CEE7;
	Sat,  9 Aug 2025 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754738024;
	bh=mwTGoJ1vJekZDumrlzePyF4v7ik+2mC6/XKusF2wlkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4EeApLm9HV60hGRx8yNmXdQOcs5p382vugfMwd6b2ZU6+xsLGEbyx5Kc15wmYbDB
	 RtIytPwLJP8l9xJVe1ezILZ92YOnx7haquRmPFlQJxjlNbz9pKulfLjqJLbejF7YXE
	 ifIM5iCqZmQx8fV0AsF1TRje4XcmHTkHEMBHDVcygxHW8ee/S3l/gc21JjFfJZxa79
	 Y+VihLkJIHb4MAt+CRTeJC304AWoio8ZDQVqIPl3BrlBEGBEhAuQJhTqgTMCD7lUmy
	 m15DrniUUrzi7u/mLuTzYrpwJZaXfkN54r2MunZAHCsnW7LLkUjPxuLH28vgU1sYBV
	 Rz24cYj2bqa6A==
Date: Sat, 9 Aug 2025 16:43:35 +0530
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
Message-ID: <o2lnzaxurshoyyxtdcyiyphprumisggd6m2qvcoeptvnkvh4ap@dm2nc4krinja>
References: <06d201dc0689$9f438200$ddca8600$@samsung.com>
 <wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
 <06f301dc0695$6bf25690$43d703b0$@samsung.com>
 <CGME20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60@epcas5p1.samsung.com>
 <nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
 <0d6801dc07b9$b869adf0$293d09d0$@samsung.com>
 <fh7y7stt5jm65zlpyhssc7dfmmejh3jzmt75smkz5uirbv6ktf@zyd2qmm2spjs>
 <0f8c01dc0876$427cf1c0$c776d540$@samsung.com>
 <xqynlabahvaw4cznbofkkqjr4oh7tf6crlnxoivhpadlymxg5v@a4b5fgf55nqw>
 <10ae01dc08c9$022d8aa0$06889fe0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10ae01dc08c9$022d8aa0$06889fe0$@samsung.com>

On Sat, Aug 09, 2025 at 06:30:29AM GMT, Alim Akhtar wrote:

[...]

> > > > > > > > > I understand that this is a static configuration, where it
> > > > > > > > > is already known
> > > > > > > > that board is broken for higher Gear.
> > > > > > > > > Can this be achieved by limiting the clock? If not, can we
> > > > > > > > > add a board
> > > > > > > > specific _quirk_ and let the _quirk_ to be enabled from
> > > > > > > > vendor specific hooks?
> > > > > > > > >
> > > > > > > >
> > > > > > > > How can we limit the clock without limiting the gears? When
> > > > > > > > we limit the gear/mode, both clock and power are implicitly
> > limited.
> > > > > > > >
> > > > > > > Possibly someone need to check with designer of the SoC if
> > > > > > > that is possible
> > > > > > or not.
> > > > > >
> > > > > > It's not just clock. We need to consider reducing regulator,
> > > > > > interconnect votes also. But as I said above, limiting the
> > > > > > gear/mode will take care of all these parameters.
> > > > > >
> > > > > > > Did we already tried _quirk_? If not, why not?
> > > > > > > If the board is so poorly designed and can't take care of the
> > > > > > > channel loses or heat dissipation etc, Then I assumed the gear
> > > > > > > negotiation between host and device should fail for the higher
> > > > > > > gear and driver can have
> > > > > > a re-try logic to re-init / re-try "power mode change" at the
> > > > > > lower gear. Is that not possible / feasible?
> > > > > > >
> > > > > >
> > > > > > I don't see why we need to add extra logic in the UFS driver if
> > > > > > we can extract that information from DT.
> > > > > >
> > > > > You didn’t answer my question entirely, I am still not able to
> > > > > visualised how come Linkup is happening in higher gear and then
> > > > > Suddenly
> > > > it is failing and we need to reduce the gear to solve that?
> > > >
> > > > Oh well, this is the source of confusion here. I didn't (also the
> > > > patch) claim that the link up will happen with higher speed. It will
> > > > most likely fail if it couldn't operate at the higher speed and
> > > > that's why we need to limit it to lower gear/mode *before* bringing the
> > link up.
> > > >
> > > Right, that's why a re-try logic to negotiate a __working__ power mode
> > change can help, instead of introducing new binding for this case.
> > 
> > Retry logic is already in place in the ufshcd core, but with this kind of signal
> > integrity issue, we cannot guarantee that it will gracefully fail and then we
> > could retry. The link up *may* succeed, then it could blow up later also
> > (when doing heavy I/O operations etc...). So with this non-deterministic
> > behavior, we cannot rely on this logic.
> > 
> I would image in that case , PHY tuning / programming is not proper.

I don't have the insight into the PHY tuning to avoid this issue. Maybe Nitin or
Ram can comment here. But PHY tuning is mostly SoC specific in the PHY driver.
We don't have board level tuning sequence AFIAK.

> 
> > > And that approach can be useful for many platforms.
> > 
> > Other platforms could also reuse the same DT properties to workaround
> > similar issues.
> > 
> > > Anyway coming back with the same point again and again is not productive.
> > > I gave my opinion and suggestions. Rest is on the maintainers.
> > 
> > Suggestions are always welcomed. It is important to have comments to try
> > out different things instead of sticking to the proposed solution. But in my
> > opinion, the retry logic is not reliable in this case. Moreover, we do have
> > similar properties for other peripherals like PCIe, MMC, where the vendors
> > would use DT properties to limit the speed to workaround the board issues.
> > So we are not doing anything insane here.
> > 
> > If there are better solutions than what is proposed here, we would indeed
> > like to hear.
> > 
> For that, more _technical_ things need to be discussed (e.g. Is it the PHY which has problem, or problem is happening at unipro level or somewhere else), 
> I didn't saw any technical backing from the patch Author/Submitter
> (I assume Author should be knowing a bit more in-depth then what we are assuming and discussing here). 
> 

Nitin/Ram, please share more details on what level the customer is facing the
issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

