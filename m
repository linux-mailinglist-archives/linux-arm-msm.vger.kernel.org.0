Return-Path: <linux-arm-msm+bounces-52541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39DA71950
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 15:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31C63A7999
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 14:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC261F63C1;
	Wed, 26 Mar 2025 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lM0R5Wl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2C41F3BA5;
	Wed, 26 Mar 2025 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000194; cv=none; b=sOIta1l/o5vSARWWeGQWe6GsamI1Eitry4g5xKRhxljnCgGt8jek0FAW+TnliFyIbiX2tqUrYNWrHJKJTZTla2Oy4zKHsz7oltgGh7jECPPOYYe4ULwvwDoM99Qj9jhaDJN2rYseeTpMbiWRLPIfNZ1gxcOqr74AELVsFQF9wUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000194; c=relaxed/simple;
	bh=f0gPCfiuw07TFCMPMlro6o7dIC6mTUxDA2RqL0P51j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQTgHx7uyg+MUFvjAfqmMB0ROspZV4f6wcumQizniSi2n+3LRy0P79G2+UjT28GYLj2xsGoC8XuaGn1k54jOOZAgckC5gKafA0ZlNqQrMOQteobRkI8o7xPjhl4/FeSSSwyMCApNC88Wa/ws551DxCkFR1kRpPDK7+ktYARZuFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lM0R5Wl5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0545C4CEE2;
	Wed, 26 Mar 2025 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743000193;
	bh=f0gPCfiuw07TFCMPMlro6o7dIC6mTUxDA2RqL0P51j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lM0R5Wl5kHgDO47mQ1sq1a3xtustJMG8Dw5JG81R6ZGZY7q48v3caNqkS55mrN3XN
	 4A6FwBPYC+WqXxsmf1aTS2N9/KFUqNwIBBVCX1VUi2kscdXLzWD/jF9v+V0KlT4NKf
	 SadjqxWSZFP6b6P+mTp5PpeXIpijdQrDU+sAk4Ltj3HmKkmMsoo1ozLjZsi82W7HCb
	 crbn7k4wgmWSurHz6ElIZd8TlVPOr0fLIy9tk7rKHxLkGeNGUKH98Tch5XWaCQsGT/
	 pmtJuIgHO8AZo7V+XvoH+IOT10DGtTXjcCJ9dmcS4B5zpbctLl2k/xx20LReo0Bq3W
	 wCfofCt29Uwnw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1txRyN-000000006s6-1tuL;
	Wed, 26 Mar 2025 15:43:16 +0100
Date: Wed, 26 Mar 2025 15:43:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Clayton Craft <clayton@craftyguy.net>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug
 events
Message-ID: <Z-QSg7LH8u7uAfLg@hovoldconsulting.com>
References: <20250324132448.6134-1-johan+linaro@kernel.org>
 <dd1bc01c-75f4-4071-a2ac-534a12dd3029@craftyguy.net>
 <Z-JqCUu13US1E5wY@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-JqCUu13US1E5wY@hovoldconsulting.com>

On Tue, Mar 25, 2025 at 09:32:10AM +0100, Johan Hovold wrote:
> On Mon, Mar 24, 2025 at 10:05:44AM -0700, Clayton Craft wrote:
> > On 3/24/25 06:24, Johan Hovold wrote:
> > > The PMIC GLINK driver is currently generating DisplayPort hotplug
> > > notifications whenever something is connected to (or disconnected from)
> > > a port regardless of the type of notification sent by the firmware.
> > > 
> > > These notifications are forwarded to user space by the DRM subsystem as
> > > connector "change" uevents:
> 
> > > ---
> > > 
> > > Clayton reported seeing display flickering with recent RC kernels, which
> > > may possibly be related to these spurious events being generated with
> > > even greater frequency.
> > > 
> > > That still remains to be fully understood, but the spurious events, that
> > > on the X13s are generated every 90 seconds, should be fixed either way.
> > 
> > When a display/dock (which has ethernet) is connected, I see this 
> > hotplug change event 2 times (every 30 seconds) which I think you said 
> > this is expected now?
> 
> I didn't realise you were also using a display/dock. Bjorn mentioned
> that he has noticed issues with one of his monitors (e.g. built-in hub
> reenumerating repeatedly iirc) which may be related.
> 
> I see these pairs of identical notification when connecting the stock
> charger to one of the ports directly, and I noticed that they repeat
> every 90 seconds here. After plugging and unplugging a bunch of devices
> I think they stopped at one point, but they were there again after a
> reboot.
> 
> So there's something going on with the PMIC GLINK firmware or driver on
> the X13s. I did not see these repeated messages on the T14s with just a
> charger (and I don't have a dock to test with).

With this patch enabling UCSI on sc8280xp:

	https://lore.kernel.org/lkml/20250326124944.6338-1-johan+linaro@kernel.org/

most of the periodic orientation notifications for the port with the
charger connected appears to be gone on the X13s (note that the T14s
already has UCSI enabled).

I get one to three notification 90 seconds after boot with the charger
connected (and two notifications when reconnecting it) but that appears
to be it.

Perhaps you can give that one a try with your docks and monitors as
well, Clayton and Bjorn.
 
> > Not sure about you seeing it every 90s vs my 30s... anyways, I no longer 
> > see these events when a PD charger is connected though, so this patch 
> > seems to help with that!
> 
> Just so I understand you correctly here, you're no longer seeing the
> repeated uevents with this patch? Both when using a dock and when using
> a charger directly?
> 
> Did it help with the display flickering too? Was that only on the
> external display?

Johan

