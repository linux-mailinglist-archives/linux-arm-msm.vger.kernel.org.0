Return-Path: <linux-arm-msm+bounces-87230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C58CEE7B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 13:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CE9E3008D5E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06C1221F0A;
	Fri,  2 Jan 2026 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpyDFbF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A4184;
	Fri,  2 Jan 2026 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356259; cv=none; b=X75Q14ux1LUaUKMg53QxP93kp/+5Cxe7eq/VeKb1HATXyA53ksYArCaZktjgbPKAYb8Xed7sYoz3I/HND+lkd4oKU40YGQo0IYJftL6NvbpibTq4R5NiHBUIApU1MA//BkImBIg1OYxR7NMRjDKHhZmI774QjD6MW9P+ZPqgW2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356259; c=relaxed/simple;
	bh=TSlD5GTOB3iJ+iDN2gxB4z6rcomIZnSlCO8Hm5Htk1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qF7BfB1WS8RKKcRKbkhEQXLRbWCZjIzwHMEwC36H+UmsWILT2en2NBLyAw3yeU8HSefzYl15LW40iPsePiMHr3L/dnghynSMjaTYQ3QwdBnboUBhKJvxN+7w0LLqrU3zrREcd7X1yAgsz+/FqD8pWKmrlXokS+yK5+O341kxWOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpyDFbF3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD89C116B1;
	Fri,  2 Jan 2026 12:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767356259;
	bh=TSlD5GTOB3iJ+iDN2gxB4z6rcomIZnSlCO8Hm5Htk1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpyDFbF3I1Km3wHCd6mnBWp6X1Hxob4N0UHlKYEf2clD/QD7OYcPOL3oCk7y01SCc
	 oaRe7W7P0lgxE6cPIXhKTx/hj0Fcn8tJbD00QBSUC7QxyPmJbZd4DjIA4MnVbtyiFg
	 KhQyjLm9HS9dUUeuFKkJHvf+RibtBv3sVXRoA+X4Jz3aKK2kk2VJ7Udl5Dh4SPtJeW
	 ax1nWAUKo7AMaP82QHTGN17l6uPj6Ln+wIyGUwMqpnEoEM7fby6qVjrfNL3hPdID4g
	 /ShPq1Qi4Om+qp3spHn1ah+fl4ljvqx/M4Gdw4DFt+uPyEHwDzRq2tIO7tMKqXhKVS
	 6Z8Zlt8Yh9wiA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vbe5u-000000004t4-0wM7;
	Fri, 02 Jan 2026 13:17:26 +0100
Date: Fri, 2 Jan 2026 13:17:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa884x: fix codec initialisation
Message-ID: <aVe3VgrKi7WsqrYA@hovoldconsulting.com>
References: <20260102111413.9605-1-johan@kernel.org>
 <20260102111413.9605-4-johan@kernel.org>
 <18f646c0-00f3-4460-842d-cf8811dddecf@kernel.org>
 <aVevbmfwoHCqrnQF@hovoldconsulting.com>
 <9c68b403-f11b-4395-a564-8172e7db5390@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c68b403-f11b-4395-a564-8172e7db5390@kernel.org>

On Fri, Jan 02, 2026 at 12:50:45PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2026 12:43, Johan Hovold wrote:
> > On Fri, Jan 02, 2026 at 12:31:21PM +0100, Krzysztof Kozlowski wrote:
> >> On 02/01/2026 12:14, Johan Hovold wrote:
> >>> The soundwire update_status() callback may be called multiple times with
> >>> the same ATTACHED status but initialisation should only be done when
> >>> transitioning from UNATTACHED to ATTACHED.
> >>>
> >>> Fix the inverted hw_init flag which was set to false instead of true
> >>> after initialisation which defeats its purpose and may result in
> >>> repeated unnecessary initialisation.

> > No, update_status() has:
> > 
> > 	if (wsa884x->hw_init || status != SDW_SLAVE_ATTACHED)
> > 		return 0;
> > 
> > 	...
> > 
> > 	wsa884x_init(wsa884x);
> > 
> > so if you set hw_init to true then init is never called when status is
> > changed to ATTACHED.
> 
> Uh, indeed, so this was supposed to be !wsa884x->hw_init... or indeed
> your meaning. This also means that this was never passing above if() and
> the init() was never called.
> 
> regcache was probably synced via runtime PM, so at least that part worked.
> 
> Did you test this driver on actual device how it affects the behavior?

No, I don't have a device that uses this codec anymore.

If you could give it a spin that would be great. It seems we have been
depending on reset values or an UNATTACHED => ATTACHED transition so
far.

Johan

