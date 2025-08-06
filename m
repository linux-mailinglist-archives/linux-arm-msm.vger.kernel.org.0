Return-Path: <linux-arm-msm+bounces-67845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D56CB1BFC4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 07:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC64623A89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4248E1E98E3;
	Wed,  6 Aug 2025 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4GuCbmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2D91E51F1;
	Wed,  6 Aug 2025 05:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754456738; cv=none; b=tqz0+QrkrPY2Utd9j/65cr7MBIU/gn6wymb5gN8p46f3ESeobI/9zx6zLutb9D/99/wJEMVBd1NPrPYfPjQVrSJKlEXnea+FF7KsZ+4AaAkkBh5qVcZF0w6CQ2ywzZBfsgarCubetiEQAMKYwiM3BRi2A0zUWU5lwgAJyV01Md8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754456738; c=relaxed/simple;
	bh=DRR2UArJnu21pmMOS9d7ToVe7QDjYULvuvBfAI6brgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihxqWGHl29RXU8NFA+6J2z7qNMBTTU1HYOLyWYohxz/jd9SLFs/6QpNqRg9chZN7ThIZsUtbBK1pztWuyKa0O/NTRM7EynedgjJZBZ0jj64VNf8H9OK1+613kEqIcUIYdkSlI0jSrAjlFInZr0GeBeVXWHig8OYDRgjGzavzvQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4GuCbmU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8EEC4CEE7;
	Wed,  6 Aug 2025 05:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754456737;
	bh=DRR2UArJnu21pmMOS9d7ToVe7QDjYULvuvBfAI6brgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4GuCbmUgnd95SpiAhdfi0P6dPFrdJEyMPx5E/8eLnDWAJusxlqpyKL3rQZszV2IK
	 FDL7r+aZUYi+Gwe/N487QKHONxdTVpqR/Hsw7jkgzDtq2DFAOVhgAwMU5bRKEqS944
	 OR/G27fzwtMUIgUhn3GSAGzRtbGyJgRXsZJ97/YhfygkTNm6u92pvXZcbSTs3eBbKj
	 5gKF9kfZPCrzeY30yQUIgxiZyKLyPZX2P9Ela7P3i0lHFbNbwQ+Xxyv2jD24CARNu9
	 ygt0j2/hNG8+cR+E6JpSw2ZU7JX9jhiLiFlT5z12t5HhdIO9c9dnIsMJXwxPV8FdIh
	 H49BnQQKibUAA==
Date: Wed, 6 Aug 2025 10:35:27 +0530
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
Message-ID: <wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
References: <jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
 <CGME20250805170638epcas5p4cb0cc78c5b5d77072cec547380b9f03d@epcas5p4.samsung.com>
 <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
 <061b01dc062d$25c47800$714d6800$@samsung.com>
 <i6eyiscdf2554znc4aaglhi22opfgyicif3y7kzjafwsrtdrtm@jjpzak64gdft>
 <061c01dc062f$70ec34b0$52c49e10$@samsung.com>
 <87c37d65-5ab1-4443-a428-dc3592062cdc@oss.qualcomm.com>
 <061d01dc0631$c1766c00$44634400$@samsung.com>
 <3cd33dce-f6b9-4f60-8cb2-a3bf2942a1e5@oss.qualcomm.com>
 <06d201dc0689$9f438200$ddca8600$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06d201dc0689$9f438200$ddca8600$@samsung.com>

On Wed, Aug 06, 2025 at 09:51:43AM GMT, Alim Akhtar wrote:

[...]

> > >> Introducing generic solutions preemptively for problems that are
> > >> simple in concept and can occur widely is good practice (although
> > >> it's sometimes hard to gauge whether this is a one-off), as if the
> > >> issue spreads a generic solution will appear at some point, but we'll
> > >> have to keep supporting the odd ones as well
> > >>
> > > Ok,
> > > I would prefer if we add a property which sounds like "poor thermal
> > > dissipation" or "routing channel loss" rather than adding limiting UFS gear
> > properties.
> > > Poor thermal design or channel losses are generic enough and can happen
> > on any board.
> > 
> > This is exactly what I'm trying to avoid through my suggestion - one board
> > may have poor thermal dissipation, another may have channel losses, yet
> > another one may feature a special batch of UFS chips that will set the world
> > on fire if instructed to attempt link training at gear 7 - they all are causes, as
> > opposed to describing what needs to happen (i.e. what the hardware must
> > be treated as - gear N incapable despite what can be discovered at runtime),
> > with perhaps a comment on the side
> > 
> But the solution for all possible board problems can't be by limiting Gear speed.

Devicetree properties should precisely reflect how they are relevant to the
hardware. 'limiting-gear-speed' is self-explanatory that the gear speed is
getting limited (for a reason), but the devicetree doesn't need to describe the
*reason* itself.

> So it should be known why one particular board need to limit the gear.

That goes into the description, not in the property name.

> I understand that this is a static configuration, where it is already known that board is broken for higher Gear.
> Can this be achieved by limiting the clock? If not, can we add a board specific _quirk_ and let the _quirk_ to be enabled from vendor specific hooks? 
> 

How can we limit the clock without limiting the gears? When we limit the
gear/mode, both clock and power are implicitly limited.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

