Return-Path: <linux-arm-msm+bounces-62644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8EFAE9E5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 15:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34ACF1C42A67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C9E2E540F;
	Thu, 26 Jun 2025 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT7kcXIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1262E540B;
	Thu, 26 Jun 2025 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943623; cv=none; b=p5fa11bDopLlOh4W6VVJ0MU5j6YfJDpIuhPvOeBkM3OFC94++E0i5OwDuc8Y0xo0AjcIAqBCcSkwKWSuln3zTTj/28h1oasZVeQ/2uDoe31j511fj8TpZE1SJS14i9SWIOZyt7lmlrnYdGmmjJXBYtQrk3oggZmK0HpKFtoJEQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943623; c=relaxed/simple;
	bh=eGe6DgFdnWVzmqfcizRNhuUwNbmovbKrb7hpTd0/7pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NooJXOEyOZaC4yAkpJ4dnZHgLh28YeBUsobZ6aZX+GIPvVGKOr2XkdXk8c6L9kAfsK3TPGOsYrwzV2Oqg6nvv9PM5YbOkDeZ5b0lktJS6rSkg7wbje2e182UwOBTLO/zgm7gl3a89aJdvMMJymx7NUE+O9x/SXE+VXHOk3nyMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT7kcXIG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4043C4CEEB;
	Thu, 26 Jun 2025 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750943622;
	bh=eGe6DgFdnWVzmqfcizRNhuUwNbmovbKrb7hpTd0/7pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iT7kcXIGtuQWv0kv2WBwECq7p9++xG2lC/+zPx0xDYojnP5/mcnnL2YgLwgX8Xu6s
	 Q/QqOMG4RwtCIjds4OZSE+RXrZZhwb/YseG7tX3xg1kPetIxYHZGijm2OAXbZdhLNK
	 gezvMhIMNG41cqWGC+NrBkIA0CddoOI/gdEAiINzP5+r0TWJNnrp8xQid49aqwTdBZ
	 LzrjgfqKOR/97p8dIbdvfv/rgPJPHTvR1pcKi/vuoNAxvwv4fhN3DDf9zVO47xdL00
	 GSpZeUk8UZ7TCtBb86MmN27IYQJegrl0LJ1GucTzTpb1s4j67VjPhWMzQZdRCPS8LH
	 2qUf8uicTelRQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUmQA-000000002fg-2GtK;
	Thu, 26 Jun 2025 15:13:43 +0200
Date: Thu, 26 Jun 2025 15:13:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <aF1Hhs0JAS747SVi@hovoldconsulting.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <aFlps9iUcD42vN4w@hovoldconsulting.com>
 <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>
 <aF0WGmnN_8rvI9n1@hovoldconsulting.com>
 <zufyvg4hoxxz4i45pynzta3gyglqvecrmeslnpphsgwmtujivl@t2zbdtejt3x4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zufyvg4hoxxz4i45pynzta3gyglqvecrmeslnpphsgwmtujivl@t2zbdtejt3x4>

On Thu, Jun 26, 2025 at 02:15:26PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 26, 2025 at 11:42:50AM +0200, Johan Hovold wrote:
> > On Tue, Jun 24, 2025 at 04:13:34AM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Jun 23, 2025 at 04:50:27PM +0200, Johan Hovold wrote:
> > > > On Mon, Jun 23, 2025 at 04:45:30PM +0200, Johan Hovold wrote:
> > 
> > > > > Also not sure how useful it is to only be able to read variables,
> > > > > including for the RTC where you'll end up with an RTC that's always
> > > > > slightly off due to drift (even if you can set it when booting into
> > > > > Windows or possibly from the UEFI setup).
> > > > > 
> > > > > Don't you have any SDAM blocks in the PMICs that you can use instead for
> > > > > a proper functioning RTC on these machines?
> > > 
> > > I'd rather not poke into an SDAM, especially since we don't have docs
> > > which SDAM blocks are used and which are not.
> > 
> > You're with Qualcomm now so you should be able to dig up this
> > information like we did for the X13s (even if I'm quite aware that it
> > may still be easier said than done).
> 
> I'd rather try to find information on how to update UEFI vars on the
> storage.

You can do both, especially if it turns out you won't be able to have
persistent variables on these machines.

> Moreover, using the UEFI variable doesn't send the wrong
> message to other developers (if I remember correctly, I've seen patches
> poking to semi-random SDAM just because it seemed to be unused).

That's for the Qualcomm maintainers, and the rest of us, to catch during
review. And people putting random values into devicetrees is
unfortunately not limited to SDAM addresses.

Furthermore, getting an allocated block of addresses in SDAM for Linux
could be useful for other things too.
 
> > > I think the slightly drifted RTC is still much better than ending up
> > > with an RTC value which is significantly off, because it was set via the
> > > file modification time.
> > 
> > I measured drift of 1 second every 3.5 h on the X13s, so having an
> > almost correct time with massive drift that cannot be corrected for may
> > not necessarily be better.
> 
> For me it provided a better user experience. Yes, I'm using C630 from
> time to time, including the kernel development. A drifted but ticking
> RTC is better than the RTC that rolls backs by several months at a
> reboot, because of the missing RTC offset info.

Does it have to roll back? Can't you just keep it running after whatever
semi-random date it started at? And there is ntp and services like
fake-hwclock which saves the time on shutdown too.

Anyway, I still do no understand why you seem so reluctant to having a
proper functioning RTC using an SDAM offset.

Johan

