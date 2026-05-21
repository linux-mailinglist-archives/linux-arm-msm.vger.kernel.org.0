Return-Path: <linux-arm-msm+bounces-109134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCNyG6Q8D2rQIAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:11:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53F5A9EEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41E8830F64EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 16:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD9C379996;
	Thu, 21 May 2026 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuOoRKBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B72436A036;
	Thu, 21 May 2026 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380835; cv=none; b=VpAIgQQIpIiKy3nd27gC4C5ZNe1spiLvoLtT5cgjWdNUxyBRDvG6aVrIKRbZ2dR57Of9HN6rSHMHXghcroMZTFi1+yIzAgGdk5dVoq1fR4yhuKxMJ7BVF+mwV38EYEyCeSXFjz7nFqSMpJwQkrAxNBk4yDzCLdHDkHC9eKbnlEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380835; c=relaxed/simple;
	bh=C8Y+Ik99+HGvqZnOH/2fxPU97x5XHCh7WTq1PSR2UWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGr8TfoV2W+ZcvbxvPgkPTd6JDzhQiOANJUR/QauEzDnWRUQhuNk4amxLEYQSmNnL7aBvyJn4ybtwMUSDX8N4em6wOMUXYKGc5Hrt61uAU84KPFoRyfhbJq1lPQn/6dZhXTa3Qt/4sFBvNzOVCvsB+rsNzJYh5DHyLcdK1kYrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuOoRKBO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F61F1F000E9;
	Thu, 21 May 2026 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380834;
	bh=en35R6sc2ImIXJjSfKNTDeODIfFRRIXQVjpIv7bHdmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DuOoRKBO6Y1Oqrq2sJVjpuELojujcFM80db44IMaa6rdCsVyxoL2s+9M7w0kvfCxY
	 WCW3FPjEQbdO3j0DQ1pU/39D2T4/mSgwGY/XxIKOZ99G52iza5+52jIdv/FZfUwWIi
	 TKQELjriOStYA3QCfXpiFucHhhGpZQeGtMu3ZBtbfP5D+Mh8Zt2LZ1PGhN+qPrI0aw
	 6xkmpJjoMLOWpnx9ml1tKtw54ghGgcDQUD309KlAWUMHkk31otLpmnySG1nt0I98cR
	 ccI4arI3xtm1COLpzPFvlggMBVkYkf2XDAzZguFVzH0ETgrlum/YGVLx6H8Y1F9dOB
	 BCKRbLLME2zqQ==
Date: Thu, 21 May 2026 17:27:05 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
Message-ID: <20260521162705.GH3591266@google.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109134-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com,vger.kernel.org,lists.infradead.org,broadcom.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BF53F5A9EEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026, Bartosz Golaszewski wrote:

> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
> >
> > >
> > > I suggested it because of its flexibility. The alternative I had in
> > > mind is something like a new field in mfd_cell:
> > >
> > >     const char *cell_node_name;
> > >
> > > Which - if set - would tell MFD to look up an fwnode that's a child of
> > > the parent device's node by name - as it may not have a compatible.
> >
> > Remind me why the chlid device can't look-up its own fwnode?
> >
> 
> Oh sure it can, but should it? I'm not sure it's logically sound to
> have the child device reach into the parent, look up the fwnode and
> then assign it to itself after it's already attached to the driver.
> This should be done at the subsystem level before the device is
> registered.

Leaf drivers reach back into the parent all the time.

-- 
Lee Jones

