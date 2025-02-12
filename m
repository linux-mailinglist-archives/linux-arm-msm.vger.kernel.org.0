Return-Path: <linux-arm-msm+bounces-47741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C089A3241D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C60A43A60B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DE0209F3C;
	Wed, 12 Feb 2025 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMLmFD/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD06209F35;
	Wed, 12 Feb 2025 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739357969; cv=none; b=ZzCrdtl+uYShwu9z0TVPuwQAKWCCsgeSUeglVBHDqnhbwQ8CNXnER4v0lh0i7DhYCsgeYqoS3bu5VTe89TMdgGuOKckGvBhG3lMrpYvICUP2tv35U6PuG3se0Gr4vFF5jVvDRDzs3aKwZu5Kj5m2r9pXPE7LA6f+5j46YE4RhTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739357969; c=relaxed/simple;
	bh=SWfK5E+asiqNvK5yZlVvwPZxamhKEoIr2RspAVaSiYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHIVf9L5LBHQ4gPCCTIEeggGUeC+5mZf1q37iX6nFlyT7PMiQ1IgnFJsNmw6QPt3HNrJkCuIUXmsBOwrDoA7mt3nMfO/FA04/otuos2mW0N6CT96vNwmh2JDCGrAZOV9VCthvTbB28wxJ/lBYTrhnnZ2M2sH5WYzGUA2qhRGo9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMLmFD/O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03CEC4CEDF;
	Wed, 12 Feb 2025 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739357968;
	bh=SWfK5E+asiqNvK5yZlVvwPZxamhKEoIr2RspAVaSiYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMLmFD/OmNgxxb45yMeX28QBLtpg/DOvT+SjeE+Uyd+Yp9CTpS5fuVbZEludZP2ga
	 rpLj5CYe4nBU0aCo5nI+g1JzfU7MrgC+vVXh0wOvUvL5KYUekmR/MzHeakrFX7wqgZ
	 GTa6N7eMr/0opIkPgDCFwrB2iC+6pd61wKpfbMjbWeVnpjaiwqO4wZAZG70v0C+EQF
	 ohI094oTMCz7nEWhWaMepScQy4Sq+CwvTAMj9PEHXUZbz+1YYAb0cSiAUrNgnDft6a
	 QH9Mo2AifpiuGfl2mT0CxEhTwoi7Oktz4uYOJmWNlypp8b7Iiv3lMzbQ3wFi6x+vY+
	 4O0wMJYDUN5Xw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tiASu-000000001ca-0GAw;
	Wed, 12 Feb 2025 11:59:36 +0100
Date: Wed, 12 Feb 2025 11:59:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Saranya R <quic_sarar@quicinc.com>,
	Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <Z6x_GJg92ddzoRwQ@hovoldconsulting.com>
References: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>
 <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
 <Z6nE0kxF2ipItB2r@hu-mojha-hyd.qualcomm.com>
 <Z6nKOz97Neb1zZOa@hovoldconsulting.com>
 <Z6uDv3c3DkmgumnM@hu-mojha-hyd.qualcomm.com>
 <Z6xr3ylNSC6iYf-C@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6xr3ylNSC6iYf-C@hovoldconsulting.com>

On Wed, Feb 12, 2025 at 10:37:35AM +0100, Johan Hovold wrote:
> On Tue, Feb 11, 2025 at 10:37:11PM +0530, Mukesh Ojha wrote:
> > On Mon, Feb 10, 2025 at 10:43:23AM +0100, Johan Hovold wrote:

> > > A Link tag to my report would be good to have as well if this fixes the
> > > audio regression.
> > 
> > I see this is somehow matching the logs you have reported, but this deadlock
> > is there from the very first day of pdr_interface driver.
> > 
> > [   14.565059] PDR: avs/audio get domain list txn wait failed: -110
> > [   14.571943] PDR: service lookup for avs/audio failed: -110
> 
> Yes, but using the in-kernel pd-mapper has exposed a number of existing
> bugs since it changes the timing of events enough to make it easier to
> hit them.
> 
> The audio regression is a very real regression for users of Snapdragon
> based laptops like, for example, the Lenovo Yoga Slim 7x.
> 
> If Bjorn has confirmed that this is the same issue (I can try to
> instrument the code based on your analysis to confirm this too), then I
> think it would be good to mention this in the commit message and link to
> the report, for example:
> 
> 	This specifically also fixes an audio regression when using the
> 	in-kernel pd-mapper as that makes it easier to hit this race. [1]
> 
> 	Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/ # [1]
> 
> or similar.

I can confirm that audio regression with the in-kernel pd-mapper appears
to be caused by the race that this patch fixes.

If I insert a short (100-200 ms) sleep before taking the list lock in
pdr_locator_new_server() to increase the race window, I see the audio
service failing to register on both the X1E CRD and Lenovo ThinkPad
X13s:

[   11.118557] pdr_add_lookup - tms/servreg / msm/adsp/charger_pd
[   11.443632] pdr_locator_new_server
[   11.558122] pdr_locator_new_server - taking list lock
[   11.563939] pdr_locator_new_server - releasing list lock
[   11.582178] pdr_locator_work - taking list lock
[   11.594468] pdr_locator_work - releasing list lock
[   11.992018] pdr_add_lookup - avs/audio / msm/adsp/audio_pd
[   11.992034] pdr_add_lookup - avs/audio / msm/adsp/audio_pd
[   11.992224] pdr_locator_new_server
    < 100 ms sleep inserted before taking lock in pdr_locator_new_server() >
[   11.997937] pdr_locator_work - taking list lock
[   12.093984] pdr_locator_new_server - taking list lock
[   17.120169] PDR: avs/audio get domain list txn wait failed: -110
[   17.127066] PDR: service lookup for avs/audio failed: -110
[   17.132893] pdr_locator_work - releasing list lock
[   17.139885] pdr_locator_new_server - releasing list lock

[ On the X13s, where I have not hit this issue with the in-kernel
  pd-mapper, I had to make sure to insert the sleep only on the second
  call, possibly because of interaction with the charger_pd registration
  which happened closer to the audio registration. ]

Please add a comment and link to the audio regression report as I
suggested above, and feel free to include my:

	Tested-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for fixing this!

Johan

