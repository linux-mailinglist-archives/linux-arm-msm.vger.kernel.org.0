Return-Path: <linux-arm-msm+bounces-87223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1D1CEE694
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1525830389BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DFD30DEA6;
	Fri,  2 Jan 2026 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oONmfzGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B099304BCB;
	Fri,  2 Jan 2026 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354235; cv=none; b=boVt75Vv1NjLwtLQn5A/tR1pkZCTkpA/Qd95po4tMFBxgdRhMIhRyJPrbVrgfFL2H5BfowK2j6aHJiWY/KVUAfFmkFW1vNS3ReipcO8uzHpdXZSFo8cQFTH2KKeY/aVFxt1USWsFNZ/WzZ2xmPoGrYCdCuGeA4lHzhemW69Z/i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354235; c=relaxed/simple;
	bh=GCqrUBCt1ofwWO3h0OLKjCe+CBQA5TAjbQhe6NWH26I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TS/49kli5EpDTnawvorKK80p92637mk49KbVd7NoEyrkvjjEFcxWtTi2YyxrwvYZd4XYQBrFRVEWdDwRxNyp7udjvbwul20ZAJ+pe0MUnq+7IcUuffJ3RJj92HkB8YHKtSjXNuqsFWQj5zDyZgBX/ZCcE3i/YsVo7hBAOndeQ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oONmfzGt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58B7C116B1;
	Fri,  2 Jan 2026 11:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767354234;
	bh=GCqrUBCt1ofwWO3h0OLKjCe+CBQA5TAjbQhe6NWH26I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oONmfzGtpeHuISRcPbpazLED74MCMKhTcHswedY6ZNJGZMtBqfoTePO8/GQEbLyVj
	 0hOzkssYRrNk2MlK66G5bPJvx0p/K1SCT3gbTKw2P2+Zvd5vqcJR3PPrrrqn4NNQYt
	 JSFRtpDyY2TI7AbBSMSwLSKyeRmlxZwdxnpAZfccRDDqq0h5DitClLjlolSf3IUYD7
	 QHRGB0yNS9JIdH7yM0js76UiZ28hqERa0lIXqyovWRdOyCMa/7cWivwITGP/Lj2DTw
	 cF6Uw14HDI7Rv8UT/2udNRPL3tzTJilh+E+FiAF44EiXkqHbyxnsAYQoUKN8z8nE1x
	 JxdPIeJZS5O7w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vbdZG-000000004Sw-2P9Y;
	Fri, 02 Jan 2026 12:43:42 +0100
Date: Fri, 2 Jan 2026 12:43:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa884x: fix codec initialisation
Message-ID: <aVevbmfwoHCqrnQF@hovoldconsulting.com>
References: <20260102111413.9605-1-johan@kernel.org>
 <20260102111413.9605-4-johan@kernel.org>
 <18f646c0-00f3-4460-842d-cf8811dddecf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18f646c0-00f3-4460-842d-cf8811dddecf@kernel.org>

On Fri, Jan 02, 2026 at 12:31:21PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2026 12:14, Johan Hovold wrote:
> > The soundwire update_status() callback may be called multiple times with
> > the same ATTACHED status but initialisation should only be done when
> > transitioning from UNATTACHED to ATTACHED.
> > 
> > Fix the inverted hw_init flag which was set to false instead of true
> > after initialisation which defeats its purpose and may result in
> > repeated unnecessary initialisation.
> 
> Either it results or it does not, not "may". 

No, it depends on whether update_status() is called with the same status
more than once. So "may" is correct here.

> If the device moves to
> UNATTACHED state flag should be probably set to "true". This is the bug.

No, update_status() has:

	if (wsa884x->hw_init || status != SDW_SLAVE_ATTACHED)
		return 0;

	...

	wsa884x_init(wsa884x);

so if you set hw_init to true then init is never called when status is
changed to ATTACHED.

> > 
> > Similarly, the initial state of the flag was also inverted so that the
> > codec would only be initialised and brought out of regmap cache only
> > mode if its status first transitions to UNATTACHED.
> 
> Maybe that's confusing wording but existing code was intentional and IMO
> almost correct. The flag is saying - we need hw init - that's why it is
> set to true in the probe and to false AFTER the proper hw initialization
> which is done after ATTACHED state.

All other codec drivers have hw_init mean that init has been done and
the check in update_status() reflects that too so this driver is still
broken.

Johan

