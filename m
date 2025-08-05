Return-Path: <linux-arm-msm+bounces-67806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4CCB1B944
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 19:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FDE13ADF5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 17:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D14D29A30A;
	Tue,  5 Aug 2025 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpzSUAFv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2865C299AAE;
	Tue,  5 Aug 2025 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414550; cv=none; b=coJPy7nABtGYEpN5KWgfMeul1w2Ii9EBYWZnZJlqCRFnqEJxN+s+Xh99G74IvEEaKX57eWmP2SCEla1wY24g7OG2lKOwMWH8lBD+ibV0lKAFi3K8k3ErztjaE99vbT+NaSOV+EtASwAH70ss/V9D8+x4IZs4n9bwtQPygGJ99Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414550; c=relaxed/simple;
	bh=55XFaa4E4iCjW6PTcfvq9/OUXR8GzIwb9H77ifiGf3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4CKE3XNWQchba+Pzc50l5g8oP2HyEqf/PTTsOyItCSWrBbH5qfORNFcJbso5e+55ZUHjQWQoM4lUODEYq9Orik62Hvmk6OkyZB9cJmFmFXpmLrw2zUvAjBWAZ4XDXZF6r/WlAwhsEIKQ1emCYeOBANOQ7Csnbm3gK5613fwxlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpzSUAFv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748B1C4CEF7;
	Tue,  5 Aug 2025 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414549;
	bh=55XFaa4E4iCjW6PTcfvq9/OUXR8GzIwb9H77ifiGf3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZpzSUAFvHEXPev9q4I8u9SmxBARPsXLt7PvXrtNhXmbViuSfR8s+wt11EP7fd0ATA
	 3KCY8XOtr/McXE3YKAWCaOj6Frg8dwwv3/yFqsEI97YrOfbDlgtAup8EgRLehDhDlH
	 SbFr6fXtv0ijmE3464otiRskF1blJwVMNkfurdC8WYJ/9L9/sl16VcQt2jXkIbgJmi
	 7EzuahYJGnrBtzce+QSKDuozsJpvf+G2TxKmphEMZrUvz1oT39L35pUmSy1EwAudky
	 nXOMuGAA4ypW98xeN2nH1u2B3v25B3b8AUUK8QEKTzAAcz3pLga5KreU9u3Ws66x0n
	 chL7hqvFWHNZg==
Date: Tue, 5 Aug 2025 22:52:20 +0530
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
Message-ID: <i6eyiscdf2554znc4aaglhi22opfgyicif3y7kzjafwsrtdrtm@jjpzak64gdft>
References: <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
 <fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
 <1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
 <2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
 <11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>
 <jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
 <CGME20250805170638epcas5p4cb0cc78c5b5d77072cec547380b9f03d@epcas5p4.samsung.com>
 <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
 <061b01dc062d$25c47800$714d6800$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <061b01dc062d$25c47800$714d6800$@samsung.com>

On Tue, Aug 05, 2025 at 10:49:45PM GMT, Alim Akhtar wrote:
> 
> 
> > -----Original Message-----
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Sent: Tuesday, August 5, 2025 10:36 PM
> > To: Manivannan Sadhasivam <mani@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>; Ram Kumar Dwivedi
> > <quic_rdwivedi@quicinc.com>; alim.akhtar@samsung.com;
> > avri.altman@wdc.com; bvanassche@acm.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; andersson@kernel.org;
> > konradybcio@kernel.org; James.Bottomley@hansenpartnership.com;
> > martin.petersen@oracle.com; agross@kernel.org; linux-arm-
> > msm@vger.kernel.org; linux-scsi@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
> > properties to UFS
> > 
> > On 8/5/25 6:55 PM, Manivannan Sadhasivam wrote:
> > > On Tue, Aug 05, 2025 at 03:16:33PM GMT, Konrad Dybcio wrote:
> > >> On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
> > >>> On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski wrote:
> > >>>> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
> > >>>>>
> > >>>>>
> > >>>>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
> > >>>>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
> > >>>>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
> > >>>>>>>> Add optional limit-hs-gear and limit-rate properties to the UFS
> > >>>>>>>> node to support automotive use cases that require limiting the
> > >>>>>>>> maximum Tx/Rx HS gear and rate due to hardware constraints.
> > >>>>>>>
> > >>>>>>> What hardware constraints? This needs to be clearly documented.
> > >>>>>>>
> > >>>>>>
> > >>>>>> Ram, both Krzysztof and I asked this question, but you never
> > >>>>>> bothered to reply, but keep on responding to other comments. This
> > >>>>>> won't help you to get this series merged in any form.
> > >>>>>>
> > >>>>>> Please address *all* review comments before posting next iteration.
> > >>>>>
> > >>>>> Hi Mani,
> > >>>>>
> > >>>>> Apologies for the delay in responding.
> > >>>>> I had planned to explain the hardware constraints in the next
> > patchset’s commit message, which is why I didn’t reply earlier.
> > >>>>>
> > >>>>> To clarify: the limitations are due to customer board designs, not our
> > SoC. Some boards can't support higher gear operation, hence the need for
> > optional limit-hs-gear and limit-rate properties.
> > >>>>>
> > >>>>
> > >>>> That's vague and does not justify the property. You need to
> > >>>> document instead hardware capabilities or characteristic. Or
> > >>>> explain why they cannot. With such form I will object to your next
> > patch.
> > >>>>
> > >>>
> > >>> I had an offline chat with Ram and got clarified on what these properties
> > are.
> > >>> The problem here is not with the SoC, but with the board design. On
> > >>> some Qcom customer designs, both the UFS controller in the SoC and
> > >>> the UFS device are capable of operating at higher gears (say G5).
> > >>> But due to board constraints like poor thermal dissipation, routing
> > >>> loss, the board cannot efficiently operate at the higher speeds.
> > >>>
> > >>> So the customers wanted a way to limit the gear speed (say G3) and
> > >>> rate (say Mode-A) on the specific board DTS.
> > >>
> > >> I'm not necessarily saying no, but have you explored sysfs for this?
> > >>
> > >> I suppose it may be too late (if the driver would e.g. init the UFS
> > >> at max gear/rate at probe time, it could cause havoc as it tries to
> > >> load the userland)..
> > >>
> > >
> > > If the driver tries to run with unsupported max gear speed/mode, it
> > > will just crash with the error spit.
> > 
> > OK
> > 
> > just a couple related nits that I won't bother splitting into separate emails
> > 
> > rate (mode? I'm seeing both names) should probably have dt-bindings
> > defines while gear doesn't have to since they're called G<number> anyway,
> > with the bindings description strongly discouraging use, unless absolutely
> > necessary (e.g. in the situation we have right there)
> > 
> > I'd also assume the code should be moved into the ufs-common code, rather
> > than making it ufs-qcom specific
> > 
> > Konrad
> Since this is a board specific constrains and not a SoC properties, have an option of handling this via bootloader is explored?

Both board and SoC specific properties *should* be described in devicetree if
they are purely describing the hardware.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

