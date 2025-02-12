Return-Path: <linux-arm-msm+bounces-47729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EABA3228C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ADA1188A265
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 09:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD022080EB;
	Wed, 12 Feb 2025 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQQpFous"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0C12046BF;
	Wed, 12 Feb 2025 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739353048; cv=none; b=J2SJ+f3DpP/tR1D3s1bSo/8jfhb/jzKcXISFTqeqnm1KisEZq8GJDZiRP1o0cl+bVUgDd7ml9rnHg5KhgxOkoQJjBhmq83MYsueYEIlmGz73yf7qvVybGbkotfYOghQGB903pMtPOd7UNdpWSvh0sYUcpXFzkuAVtpSgCFYeNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739353048; c=relaxed/simple;
	bh=Sf9TKmSkzVueM1GHBhBchFQOzKBW36BR9sNxJqN89VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv2iBaF1XvpU/f41blimhilUWXFC4XPunpkMh4rIGMzA6hd3ejvjJ/q1G1hGJlhlIdXQWQ7HI1+sqhDZiyBFcFZfxcFiFos7imgp5aN6nUUortn3jlx4oUxX3TtgyIWwoX+Rso7lX05nWA9R5t6wFskuHdIQE3VCckPF0Zp5zvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQQpFous; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBA1C4CEDF;
	Wed, 12 Feb 2025 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739353048;
	bh=Sf9TKmSkzVueM1GHBhBchFQOzKBW36BR9sNxJqN89VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQQpFousasWfqZDY4+6b2djjxTKiIwrHPS+SSGh1gn4skoX77dASovqUU3Q23JmjR
	 UqH0fPhy0fA/dVP9wGCvcbGWp3dnP03pHup/wZXMsbT9G+sPVaQ6CMgLrUjDR/Mdpb
	 YMEDMh/Vvs5j+Ig+tsZ6aYQFL5joW4DwUoB6vsM2ugzfu4pXNT3gEGTL0KotJqccRT
	 Iyo9ZYrsUZ+giqMbM3h4zY0U1qywr+kyEc3vBVVJJAETCUdi2hzdbr9H6erqm/kE+D
	 ZKjgH/L5S2PGAdqnMSSHGf0BgbR2ApBFGEW97KjVashyG+gwnuyiuYAq5dQuNW8gzp
	 i+REHQZXqMvpQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1ti9BX-000000003Nw-2Eii;
	Wed, 12 Feb 2025 10:37:35 +0100
Date: Wed, 12 Feb 2025 10:37:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Saranya R <quic_sarar@quicinc.com>,
	Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <Z6xr3ylNSC6iYf-C@hovoldconsulting.com>
References: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>
 <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
 <Z6nE0kxF2ipItB2r@hu-mojha-hyd.qualcomm.com>
 <Z6nKOz97Neb1zZOa@hovoldconsulting.com>
 <Z6uDv3c3DkmgumnM@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6uDv3c3DkmgumnM@hu-mojha-hyd.qualcomm.com>

On Tue, Feb 11, 2025 at 10:37:11PM +0530, Mukesh Ojha wrote:
> On Mon, Feb 10, 2025 at 10:43:23AM +0100, Johan Hovold wrote:
> > On Mon, Feb 10, 2025 at 02:50:18PM +0530, Mukesh Ojha wrote:
> > > On Thu, Feb 06, 2025 at 04:13:25PM -0600, Bjorn Andersson wrote:

> > > > I came to the same patch while looking into the issue related to
> > > > in-kernel pd-mapper reported here:
> > > > https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> > > > 
> > > > So:
> > > > Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > Tested-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> Should i add this in next version ?

Yes, if there is another revision.

> > I was gonna ask if you have confirmed that this indeed fixes the audio
> > regression with the in-kernel pd-mapper?
> > 
> > Is this how you discovered the issue as well, Mukesh and Saranya?
> 
> No, we are not using in kernel pd-mapper yet in downstream..

Ok, thanks for confirming.

> > If so, please mention that in the commit message, but in any case also
> > include the corresponding error messages directly so that people running
> > into this can find the fix more easily. (I see the pr_err now, but it's
> > not as greppable).
> 
> Below is the sample log which got in downstream when we hit this issue
> 
> 13.799119:   PDR: tms/servreg get domain list txn wait failed: -110
> 13.799146:   PDR: service lookup for msm/adsp/sensor_pd:tms/servreg failed: -110

I think it would be good to include this (without the time stamp) as an
example as it would make it easier to find this fix even if the failure
happens for another service.

> > A Link tag to my report would be good to have as well if this fixes the
> > audio regression.
> 
> I see this is somehow matching the logs you have reported, but this deadlock
> is there from the very first day of pdr_interface driver.
> 
> [   14.565059] PDR: avs/audio get domain list txn wait failed: -110
> [   14.571943] PDR: service lookup for avs/audio failed: -110

Yes, but using the in-kernel pd-mapper has exposed a number of existing
bugs since it changes the timing of events enough to make it easier to
hit them.

The audio regression is a very real regression for users of Snapdragon
based laptops like, for example, the Lenovo Yoga Slim 7x.

If Bjorn has confirmed that this is the same issue (I can try to
instrument the code based on your analysis to confirm this too), then I
think it would be good to mention this in the commit message and link to
the report, for example:

	This specifically also fixes an audio regression when using the
	in-kernel pd-mapper as that makes it easier to hit this race. [1]

	Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/ # [1]

or similar.

Johan

