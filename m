Return-Path: <linux-arm-msm+bounces-48825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27CA3EF4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 586FB7ABE95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8E5201270;
	Fri, 21 Feb 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jj++nu2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DB33EA;
	Fri, 21 Feb 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740128370; cv=none; b=NuHZw3g+EaMflxLMYL7ZK9aEKaIs5KtWRbaWkxvScBrv+cGmkS4PZU3B/A0GZgw49vrqNuHaLrNI8xwUSn3ZQQYhU8qWod0PXssfp3etHqGjOipDffpIBYulqZm17nIqMKrqZpUSG2A/Qq2lBAKhRBc3MGoxhIidsI2avdvj5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740128370; c=relaxed/simple;
	bh=vF9wawzvcizoo6jSYAx1QotnSijKYox7CG3RzFsjghM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sncplpdWTgtCwT4IPorUcbbkTU5Hwf6+EK0T0S9OogF5lJltRLi5EU5G0Pa4Xml9Ac2nf3R84nRErakXMMsHcG3Weji6KtC5dfp3TjeeOdclc43RIMGC/Y/iC6n0MBPN6zqNpdfLAHTEm4WoNgVnPvaTEib23Z5z5wQ1IHqScik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jj++nu2J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FE4C4CED6;
	Fri, 21 Feb 2025 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740128369;
	bh=vF9wawzvcizoo6jSYAx1QotnSijKYox7CG3RzFsjghM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jj++nu2JRWU+mpnJyThMIp/baCyMMBclJ1fPSRowj67WpZUeNQRSiapJWFtZoOz9M
	 8YR5NBqebC9xd466eZM3YDbRP+vnz4BKVsnSJfT49Q2sbvajTxnnBRzygp9X0otzn3
	 vAep/+DdRRg9456PdROhN7mbYERQujC1WvU2iZzKsLwZ0Rj1RZARSynFGjJ+A5cYRN
	 RLPYlY+ZV6M8YVwwZqtDHrGMH9BodqS/Y8wtaQ5DhMhg6nCCA+foJhrgKZw5XrFqqI
	 RX2OyI4TDMv54itd51l4NHN45Yb8NxgkGaaE738o3/ErMfad3+vqe6oX3923VXhqMF
	 +19pQ8cTCAJkQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tlOsm-000000002td-26Nv;
	Fri, 21 Feb 2025 09:59:40 +0100
Date: Fri, 21 Feb 2025 09:59:40 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 0/5] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <Z7hAfGHvdeWpZ4Y3@hovoldconsulting.com>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
 <Z7dog3cWe4BroZdT@hovoldconsulting.com>
 <Z7g5c0_vJNpN9fI4@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7g5c0_vJNpN9fI4@hovoldconsulting.com>

On Fri, Feb 21, 2025 at 09:29:39AM +0100, Johan Hovold wrote:
> On Thu, Feb 20, 2025 at 06:38:11PM +0100, Johan Hovold wrote:
> > On Thu, Feb 20, 2025 at 04:28:42PM +0000, Srinivas Kandagatla wrote:
> 
> > > On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> > > both recording and playback. These patches fix issues by
> > > 1. Adjusting the fragment size that dsp can service.
> > > 2. schedule available playback buffers in time for dsp to not hit under runs 
> > > 3. remove some of the manual calculations done to get hardware pointer.
> > > 
> > > With these patches, am able to see Audio quality improvements.
> > > 
> > > Any testing would be appreciated.
> > 
> > With this series, the choppy (robotic) capture when using pipewire
> > appears to be fixed (pulseaudio worked before).
> > 
> > Playback is still choppy (heavily distorted), though, and now it also
> > appears to be too slow.
> > 
> > I tested using pw-record and pw-play (and mpv) on the T14s (6.14-rc3).
> 
> Retested this morning and realised that playback is only choppy (and too
> slow) while I have pavucontrol open. That would be nice to fix if
> possible, but this is still a great improvement since pipewire was not
> usable at all before these changes.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Hmm... Scratch that.

This series apparently breaks pulseaudio instead.

Too fast playback on the T14s with mpv, and after I stopped it I wasn't
able too play any audio anymore. And systemd complains about a stop job
running for long when rebooting. Similar issues on the X13s.

Johan

