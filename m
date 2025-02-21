Return-Path: <linux-arm-msm+bounces-48821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A4A3EEB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C81370260C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C05E201012;
	Fri, 21 Feb 2025 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNQxhl27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3B7200BAA;
	Fri, 21 Feb 2025 08:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740126569; cv=none; b=sAlyPAgA442XoU+iGMyTRmti7W1JeO8ezD4gqysBIz57YufpgTgzYXoghkpqSKAj4R0LrHcFF/uFEEWL7dMie3fWbXcqs0hq9yPmqyrVW6BlL+fQRMCyWe9/zwXp5ONI/zvmb4Nw9JUJEmHy5dTA3kwj9xZl5TcE8Qap+gXFJnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740126569; c=relaxed/simple;
	bh=mOw3fLi7y14ixK4M6buUbXvYjK33rdnARXUAfg8bOfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbOBUxi+kT/Q+/Jd6SazLy7hbUEW3tF5bXAJ1M2Bvvv8GTzjzIC3k3fgQRsIzHxgCubrFhmwWoG9IikzAuJIsJCg5I/wFzTr1Y5BOLIh0vkLFNzIM6VtqstJVnidQcRGz8h7Ggeb5ppE0tEuEmGPaShXRCM2yv+HvRQIlZBfMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNQxhl27; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902EEC4CED6;
	Fri, 21 Feb 2025 08:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740126568;
	bh=mOw3fLi7y14ixK4M6buUbXvYjK33rdnARXUAfg8bOfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNQxhl27aoZwze66Rg7H7PTpDbG+3zeCZmYgQw0MXPiG8shdpaDAxayeGRIOqylvu
	 pydJBZ6+VoAl9qs8xi7RVVVju1wiqER618kugwWjMmsrxt/PlxTOhYF5szMoZ9J/oa
	 C+3JCJwqMBx70HZ76keZX+fT9KLI5/j2hu3jQ6Yqk5UPI5bkA825G/T4fhPRqK73TJ
	 64qvX7V9SwCqslMJdRZJnJdZdDxgXnPLU+y46Yl1e+GsNVA5dI4boI9tDc7GzffnJX
	 73VOuTQKDcwOU6Uh5tJmD/ba/In+FXxc+puG5uAXtkUhIkAGt4IJFN6XNDTuvyP2I+
	 fczKdMejvFJIQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tlOPj-000000007He-0gXd;
	Fri, 21 Feb 2025 09:29:39 +0100
Date: Fri, 21 Feb 2025 09:29:39 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 0/5] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <Z7g5c0_vJNpN9fI4@hovoldconsulting.com>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
 <Z7dog3cWe4BroZdT@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7dog3cWe4BroZdT@hovoldconsulting.com>

On Thu, Feb 20, 2025 at 06:38:11PM +0100, Johan Hovold wrote:
> On Thu, Feb 20, 2025 at 04:28:42PM +0000, Srinivas Kandagatla wrote:

> > On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> > both recording and playback. These patches fix issues by
> > 1. Adjusting the fragment size that dsp can service.
> > 2. schedule available playback buffers in time for dsp to not hit under runs 
> > 3. remove some of the manual calculations done to get hardware pointer.
> > 
> > With these patches, am able to see Audio quality improvements.
> > 
> > Any testing would be appreciated.
> 
> With this series, the choppy (robotic) capture when using pipewire
> appears to be fixed (pulseaudio worked before).
> 
> Playback is still choppy (heavily distorted), though, and now it also
> appears to be too slow.
> 
> I tested using pw-record and pw-play (and mpv) on the T14s (6.14-rc3).

Retested this morning and realised that playback is only choppy (and too
slow) while I have pavucontrol open. That would be nice to fix if
possible, but this is still a great improvement since pipewire was not
usable at all before these changes.

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

