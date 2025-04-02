Return-Path: <linux-arm-msm+bounces-52995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7AAA788BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 09:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFE7B1885B4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 07:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED194233D85;
	Wed,  2 Apr 2025 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSzWrfpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9FC233158;
	Wed,  2 Apr 2025 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577976; cv=none; b=YXElkD50hHDLnaTFlULkD3JDxaEL8JisWczOIxkPXpRGer4KPkFw3QXn4zTTRp66GiA9cywKKiSq3tL9rO5i0qd56rx+l6e2l7TQLFTY6QBtThrxarzc5Z91GV/GkLMUe94K7AM43+/fby9pTV0uzKMAv9bw4wEZCstDM9nHEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577976; c=relaxed/simple;
	bh=lAG+bncEH0vbkZKk8N7eZX+5HWev1dEYKoZ509gNiwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxkVbJiKnM/Z9/UDWMWxQtliFhArHLVx+wwoGjDbvOk/P2aHdwUjPhjiXMa7y3y9ReibWtTOgYwy4NGMotnl+KfGL8AC4AbC0r+cXyI3YRJ9PyzSTirSquj7K/p4lof6OG5kT/eF5dEvsmn4Rb+Q9xlWUwwGhmRazVbzDW5yqbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSzWrfpE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC0FC4CEDD;
	Wed,  2 Apr 2025 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577976;
	bh=lAG+bncEH0vbkZKk8N7eZX+5HWev1dEYKoZ509gNiwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSzWrfpEIuzeUZx64IXnJ+BXFlpcGzGYkxkuGmaoSa+89NIgenFh/nzkLVyZIXuy5
	 9JnJ/7uShO+7f8Q/AEK00r14flarGeHwYkBaJujX4Ys6KA74n5TkOtg73kAZ5bR6Us
	 7k1+v2yVE11j4UIODkPLA7xGmUAuU5kR6eebGkVJLgxc5Xb3Y9k1+n3hRYSWXc2lQs
	 CXHLBgyGdwXifAThwrZdyBBlsc/KUnGZkAwXI3ZNdFP5cO0mfP34UxW7E45/r5U1al
	 nW6kAnoOgVYixwuw3aFRHwj0/sBGd6Aij/m4mOX+acY5ekheJ4KQIeJtAahDQHw90C
	 LVbzI7TgLxinQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzsHU-000000006ut-084m;
	Wed, 02 Apr 2025 09:13:00 +0200
Date: Wed, 2 Apr 2025 09:13:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Clayton Craft <clayton@craftyguy.net>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug
 events
Message-ID: <Z-zjfLyRjPplXLHV@hovoldconsulting.com>
References: <20250324132448.6134-1-johan+linaro@kernel.org>
 <dd1bc01c-75f4-4071-a2ac-534a12dd3029@craftyguy.net>
 <Z-JqCUu13US1E5wY@hovoldconsulting.com>
 <Z-QSg7LH8u7uAfLg@hovoldconsulting.com>
 <7e287401-98c4-413f-8108-134d5e43d279@craftyguy.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e287401-98c4-413f-8108-134d5e43d279@craftyguy.net>

On Tue, Apr 01, 2025 at 11:18:49AM -0700, Clayton Craft wrote:
> On 3/26/25 07:43, Johan Hovold wrote:
> > On Tue, Mar 25, 2025 at 09:32:10AM +0100, Johan Hovold wrote:

> >> I didn't realise you were also using a display/dock. Bjorn mentioned
> >> that he has noticed issues with one of his monitors (e.g. built-in hub
> >> reenumerating repeatedly iirc) which may be related.
> 
> Sorry for the confusion, let me clarify:
> 
> The original issue I reported to you on IRC was *without* a 
> dock/external display attached, only a PD adapter was attached. With 
> your patch, I no longer see these drm hotplug events in this scenario.
> 
> After confirming that your patch resolved the spurious hotplug events 
> when using a PD charger, I connected a dock+external display to see if 
> the patch caused any regressions there for me. It was here that I 
> noticed a periodic hotplug event firing 2 times every 30 seconds was 
> still showing up. I don't know if this is expected or not, I've never 
> noticed it before because I wasn't monitoring udev events.

Got it, thanks for clarifying.

Did you get a chance to try the patch enabling UCSI and USB-PD? That one
may possibly help with the dock issue:

	https://lore.kernel.org/lkml/20250326124944.6338-1-johan+linaro@kernel.org/

> >> Did it help with the display flickering too? Was that only on the
> >> external display?
> 
> The flickering was only on the internal display, and your patch here 
> seems to have resolved that.

Good. Is there any flickering on either screen when you see the spurious
HP events with the dock?

Johan

