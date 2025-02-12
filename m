Return-Path: <linux-arm-msm+bounces-47681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A533A31C48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 03:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE7E4160FDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 02:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE971D515A;
	Wed, 12 Feb 2025 02:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kINN0SIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39941154426;
	Wed, 12 Feb 2025 02:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739328520; cv=none; b=F1VJKJ5tJ4oMPMuPbP866hraPc1IOcofI/ah0Ay7M+smScl0KyGrUvn+1wXO19+H7RT1FmunkyiVA7qcRDdEAZBG7h57oGZ+w1yGEJL+t5sAAIdweuyzkgLXOYXhhe00Y97HESuc8eqVjleLe5XY1WDLFLR+6wW+Tmuw/OBkrns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739328520; c=relaxed/simple;
	bh=MwIJ3eAApG+WHh+g1wyxEE8URUYD5dy6Yk36b8GcpJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRNx9AIh+LmP24JtCXF6MDU6MxKmLrWDBt+zyRylG2dEMKvoOlo5O4pJwoGMp1CS1SgixhLaY7dpJJOwObUIZdct+bQBhfHVIQuixtAoyddOiVxPYvbpTEKDFJ/33iWZNwyn03rqrkLtcKqzbB5enaT3/tFdMjbO4l3/2s4qo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kINN0SIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A5EC4CEDD;
	Wed, 12 Feb 2025 02:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739328519;
	bh=MwIJ3eAApG+WHh+g1wyxEE8URUYD5dy6Yk36b8GcpJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kINN0SIzclAG9Cp+wgItLCJJBlraij9BmeA3eMePnZx2D3eyKG4rYWlA4fNzbbhhI
	 ERFt7r+ASBSOA2k+EnSYioc7ujlMh5ZaJbTtC3R1o73L7445gD0X/F149kre/+N7bR
	 pS+/kXSje1nmQqOrhFZyIfW1rcJqTqkw8yaTD3Tw4GlPZ2dhLACsQrS7h3GSaXmu6t
	 w8I5bRpZQF9HaBcKvweD0sleAOsg4lR+qUJS3oCfhBiYWjG9ELPm15CfqgQFMSUW8S
	 KHNi1XIudi9B2fHojgqOLEDqEdGJlrIdQBOFq3hyU/sDvpHznK/6FNvB2SHkYlAoaL
	 TdgU8SkCGjEEg==
Date: Tue, 11 Feb 2025 20:48:36 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Chris Lew <quic_clew@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Joel Selvaraj <joelselvaraj.oss@gmail.com>, Alexey Minnekhanov <alexeymin@postmarketos.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
Message-ID: <aujp6tbyug66jamddd5mlpdnobiazapyzwtkkwo23uckd6x7yx@b73cwtszcjlr>
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
 <2vfwtuiorefq64ood4k7y7ukt34ubdomyezfebkeu2wu5omvkb@c5h2sbqs47ya>
 <87y0yj1up1.fsf@oltmanns.dev>
 <87msez1sim.fsf@oltmanns.dev>
 <87seon9vq6.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87seon9vq6.fsf@oltmanns.dev>

On Sun, Feb 09, 2025 at 12:57:21PM +0100, Frank Oltmanns wrote:
> On 2025-02-06 at 07:44:49 +0100, Frank Oltmanns <frank@oltmanns.dev> wrote:
> Hi Bjorn,
> 
> > Hi again,
> >
> > On 2025-02-06 at 06:57:46 +0100, Frank Oltmanns <frank@oltmanns.dev> wrote:
> >> On 2025-02-05 at 20:54:53 -0600, Bjorn Andersson <andersson@kernel.org> wrote:
> >>> On Wed, Feb 05, 2025 at 10:57:11PM +0100, Frank Oltmanns wrote:
> >>>> On xiaomi-beryllium and oneplus-enchilada audio does not work reliably
> >>>> with the in-kernel pd-mapper. Deferring the probe solves these issues.
> >>>> Specifically, audio only works reliably with the in-kernel pd-mapper, if
> >>>> the probe succeeds when remoteproc3 triggers the first successful probe.
> >>>> I.e., probes from remoteproc0, 1, and 2 need to be deferred until
> >>>> remoteproc3 has been probed.
> >>>>
> >>>> Introduce a device specific quirk that lists the first auxdev for which
> >>>> the probe must be executed. Until then, defer probes from other auxdevs.
> >>>>
> >>>> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >>>> ---
> >>>> The in-kernel pd-mapper has been causing audio issues on sdm845
> >>>> devices (specifically, xiaomi-beryllium and oneplus-enchilada). I
> >>>> observed that Stephan’s approach [1] - which defers module probing by
> >>>> blocklisting the module and triggering a later probe - works reliably.
> >>>>
> >>>> Inspired by this, I experimented with delaying the probe within the
> >>>> module itself by returning -EPROBE_DEFER in qcom_pdm_probe() until a
> >>>> certain time (13.9 seconds after boot, based on ktime_get()) had
> >>>> elapsed. This method also restored audio functionality.
> >>>>
> >>>> Further logging of auxdev->id in qcom_pdm_probe() led to an interesting
> >>>> discovery: audio only works reliably with the in-kernel pd-mapper when
> >>>> the first successful probe is triggered by remoteproc3. In other words,
> >>>> probes from remoteproc0, 1, and 2 must be deferred until remoteproc3 has
> >>>> been probed.
> >>>>
> >>>
> >>> The remoteproc numbering is assigned at the time of registering each
> >>> remoteproc driver, and does not necessarily relate to the order in which
> >>> they are launched. That said, it sounds like what you're saying is that
> >>> is that audio only works if we launch the pd-mapper after the
> >>> remoteprocs has started?
> >>
> >> Almost, but not quite. You are right, that remoteproc3 in my setup is
> >> always the last one that probes the pd-mapper.
> >>
> >> However, when experimenting with different timings I saw that the
> >> pd-mapper really do has to respond to the probe from remoteproc3 (I'm
> >> not sure I'm using the right terminology here, but I hope my intent
> >> comes across). If the pd-mapper responds to remoteproc3's probe with
> >> -EPROBE_DEFER there will again be subsequent probes from the other
> >> remoteprocs. If we act on those probes, there is a chance that audio
> >> (mic in my case) does not work. So, my conclusion was that remoteproc3's
> >> probe has to be answered first before responding to the other probes.
> >>
> >> Further note that in my experiments remoteproc1 was always the first to
> >> do the probing, followed by either remoteproc0 or remoteproc2.
> >> remoteproc3 was always the last.
> >>
> >>> Can you please confirm which remoteproc is which in your numbering? (In
> >>> particular, which remoteproc instance is the audio DSP?)
> >>
> >> remoteproc0: adsp
> >> remoteproc1: cdsp
> >> remoteproc2: slpi
> >> remoteproc3: 4080000.remoteproc
> >
> > I'm sorry but there's one additional thing that I really should have
> > mentioned earlier: My issue is specifically with *call* audio.
> >
> > Call audio is only available using out-of-tree patches. The ones I'm
> > currently using are here:
> > https://gitlab.com/sdm845-mainline/linux/-/commits/sdm845-6.13-rc2-r2?ref_type=tags
> 
> Just wanted to let you know that I've tested Mukesh Ojha's and Saranya
> R's patch [1]. Thanks, Bjorn for cc'ing me in your response.
> 
> Unfortunately, it seems to fix a different issue than the one I'm
> experiencing. The phone's mic still doesn't work. As I wrote elsewhere
> [2], I don't see the PDR error messages on xiaomi-beryllium, so, as
> Johan expected, the issue I'm experiencing is indeed a different one.
> 

Yes, it sounds like you have another race following this. [1] resolves
an issue where we get a timeout as we're trying to learn about which PDs
exist - which results in no notification about the adsp coming up, which
in turn means no audio services.

Do you have the userspace pd-mapper still running btw?

Regards,
Bjorn

