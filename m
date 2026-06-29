Return-Path: <linux-arm-msm+bounces-114811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Js2WFsTLQWoougkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 03:35:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A46D56A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 03:34:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O71nDWX1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114811-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114811-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42215300D336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 01:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD72379971;
	Mon, 29 Jun 2026 01:34:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB691A683D;
	Mon, 29 Jun 2026 01:34:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782696895; cv=none; b=mJYfTKYpmypYuOi3G/yTEZjbu3aZWz66ATM1M+rA+esyuz0pAHLqJvIhxjg0gk9qBXuyyFroONbmh2wf7zrJy0FzbxFTnCDiJFKbxWLXr7H6TjuhaAuXR0ONw9ZkDLIUZB4bUoVm18hyQOznnXlvQrF+Q4IOKe1P0J0aXZEiLLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782696895; c=relaxed/simple;
	bh=it4WTs50OHWh3oRcFIMVblsQhkVAmd8+K1FhC4skm+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYA+x6KHbSf+zR8Q9XB+h4CfN46Ypst3ezZSuKgiui0t0+MjCpq+ADpjDqb/4UfUBdWkKDZLI5XFWHchmJTwikM1aPyq63vFn8hK7/f/80AOY9a2ZVqfO+MAI6yFMt2Ei3GniGR7ZzrqgsQVYoC+O3bmmwNXLyE99cWFNA0syoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O71nDWX1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC951F000E9;
	Mon, 29 Jun 2026 01:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782696894;
	bh=5o9vzQ5awf5chQlqEeray9rTDpmHaB2X2kxgT1murzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O71nDWX1ZkYb2WN0n9CBMnWIz1/OD4O0CquIbW2H7xVvy9TWeitAG0DQdTL8+YRV9
	 gPXsLMkZ1CLXUNrmjgTxLHwpPtrdTllEu4kFv0qaG3JzeZ0tYnYsECcebJJ9eqYbn2
	 bZsp66UVr7uBpEs0fliuveSdvJ6DPU/Ryaqxuuf186YRF0qBFbxsswlF6A+XKOWJxC
	 6TeiylPszTA9EjpX1UKz2BTIQw1qIlQBNabohw7Safzg72ZGpGnXJyaFEpcpk9zaPp
	 b0AixmzcSe2cs3Y1s9kwGI8UvAB3vrOlZ4uVM6Sn2or7wg7YegG4XnWo18ve+BHHL5
	 rslJ9od4uj6nA==
Date: Sun, 28 Jun 2026 20:34:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
Message-ID: <akHHCx0MLYu3vfbq@baldur>
References: <pskkNka1-QtLVb1tcyyUSjNNeMAWUUOLyvn0XSpq55AyeqXnEjOWDCXF1pWVAufJEya52NTx6ZCXz5dMHcMlyQ==@protonmail.internalid>
 <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <asD5eIxx2ppKOwrwsxHV3d3olpLk5MF9C3Upf_lVo_MWzsiSilQZ2obgX-IAL0Zmv_Pxd3d1zyBV2tSH4ramsw==@protonmail.internalid>
 <04b4f1b0-4d8f-41eb-9b6f-d90b88aec2ff@kernel.org>
 <b5283758-bf75-4906-b821-d6bd7a81e3cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5283758-bf75-4906-b821-d6bd7a81e3cd@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114811-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A93A46D56A4

On Fri, Jun 26, 2026 at 03:43:59PM +0100, Bryan O'Donoghue wrote:
> On 26/06/2026 15:33, Bryan O'Donoghue wrote:
> > On 23/06/2026 15:52, Hans de Goede wrote:
> > > Comments, thoughts ?
> > 
> > Throw out DT and just do this...
> > 
> > One thing I like about this approach TBH is that you don't do the easy
> > thing of presuming to push the hard work into the bootloader - thus
> > creating a dependency on bootloader.
> > 
> > We've had _alot_ of problems doing DT selectivity to get OSes installed
> > on arm64 laptops. You mentioned I2C-HID devices and EC controllers which
> > I agree are a good and obvious targets.
> > 
> > I don't think this can replace a full and complete DT but, then I don't
> > think that should be the objective.
> > 
> > Much like installing cursed OSes like Windows on "normal" laptops or x86
> > machines, you'd expect to boot in ACPI mode have enough of the OS
> > running to install more of the OS - which I think _can_ be a viable
> > objective with an ACPI-DT translator.
> > 
> > Sadly OpenBSD could boot all the way to console on the Qcom laptops
> > where Linux could not - because ACPI support was better there.
> > 
> > And, we have Nvidia laptops coming too, Windows laptops which will parse
> > ACPI tables to boot.
> > 
> > There's almost no upside in having ACPI data and not trying to make
> > maximal use of it, especially if you don't have a DT supplied by
> > antecedent boot stages.
> > 
> > ---
> > bod
> > 
> 
> I'm going to agree with myself some more on the boot story.
> 

Good for you.

> If you can boot Linux _at_all_ and dump out ACPI tables from the booted
> system you are way further along than not being able to boot without a
> "real" DT.
> 
> Again, bootloaders have had to be educated on how to make that DT selection
> - a problem that isn't well solved or converged on - and even if such an
> agreed method were present, exactly 100% useless to you without the DT to go
> with it.
> 

The problem of selecting "after-market hardware description" will remain
as long as "BIOS" ships without upstream-compliant descriptions. I'm not
sure I understand in what way your comment relate to the patchset at
hand though.

> As a Linux user I don't expect everything to work, especially so on aarch64
> but, if I can get to a boot console with a screen and keyboard - I have
> scope to play in a way I otherwise don't - parsing DSDT from Windows and
> walking backwards to DT.
> 

We supported this on SDM850 and 8cx, we had sufficient amount of
support/quirks in Linux to allow you to boot and run the Debian
installer - but that's how far it was possible to push things without
improving ACPI specification and tables.

Given that you couldn't run any real use cases, this was not adequately
maintained and as we moved on to 8cx Gen3 I argued that we should
prioritize the DT-effort.

> DT _should_ be the landing zone of course but, ACPI-DT hybrid to "just boot"
> seems like an obvious yes to me.
> 

But this proposal doesn't give you ACPI+DT, it gives you DT+ACPI, you
still need a base DT that is somewhat functional - and then you
explicitly need to make references to the external ACPI representation.

Quite nice for experimentation, but I don't think it will solve either
of your problems.

Regards,
Bjorn

> ---
> bod

