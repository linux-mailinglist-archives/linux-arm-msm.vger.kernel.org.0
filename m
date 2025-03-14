Return-Path: <linux-arm-msm+bounces-51441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16442A6169D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2928719C5A7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F182036FF;
	Fri, 14 Mar 2025 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fw4GoLgt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A402036F3;
	Fri, 14 Mar 2025 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970623; cv=none; b=OQ92UqHY0jy8vQO/Jo8CffP554Ti+DvDvZhThYtaTGPTohWRFD4BVIAft3rw7JqjoJRS9J60sLxG2l18S2A4lJBndOS3N/sByGlACMChqB3p2PmVbc7PKNhkhfEu1yqrG0IoLoRD6vEI/i/oPKqH2ffvTAcsTh/7n9TL9cjAv5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970623; c=relaxed/simple;
	bh=g+pFKnCIFmlzrO15+eEkGyZ6oAi2qsmhKmTsgkZhi9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNgg/E2BLh71X8OARerdySPHCnQ2hDPFhhHrBnQ/u5O39FLHgj6AmxMPPT3zlnpdMsv+s31yOGXPEibJjNcD0OeT2ZBmLq2DeSmW518gN91CfdSaBjpbPRH/16dDQoo3gJjYCUsvNcTTF2r71qdMRminyVGCMTn8/o1t1XsGt1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fw4GoLgt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334C0C4CEE5;
	Fri, 14 Mar 2025 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741970623;
	bh=g+pFKnCIFmlzrO15+eEkGyZ6oAi2qsmhKmTsgkZhi9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fw4GoLgtnoyJdwmTxgyMWNMMiYzieByNZtVz6yDPAMNtqis6GKwICYPS++kil9H0t
	 zL9vGRN7kJAVBdDjkCocXexHfbMcMqrFdHKdC/sEDqs2EGCFkGU2Mk+q/RFgO6SUR2
	 +Yd/m5Bmi+ZyNl+0ZFjSmQHDRzKrBh+F1zHxB208CO5q0T8YHubu0SOJ8U/DVdPI8l
	 B8fK5uHobjhHS9rwc91wx72FrKje7DIKybn2z4gPDGxMg0zvnQHjRAxY/JFkPmIqwQ
	 Jd+OZkQCwQzvvYa7aAksIRty/volC241N1kSNy73fKatfnRAOHzozTlfg6AxNntgpX
	 QgtplaHDfLKBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tt88L-000000000Sx-3fRZ;
	Fri, 14 Mar 2025 17:43:42 +0100
Date: Fri, 14 Mar 2025 17:43:41 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v4 0/5] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <Z9RcvQBe523KITZW@hovoldconsulting.com>
References: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>

On Fri, Mar 14, 2025 at 02:32:15PM +0000, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> both recording and playback. These patches fix issues by
> 1. Adjusting the fragment size that dsp can service.
> 2. schedule available playback buffers in time for dsp to not hit under runs 
> 3. remove some of the manual calculations done to get hardware pointer.
> 
> With these patches, am able to see significant Audio quality improvements.
> I have few more patches to optimize the dsp drivers, but for now am
> keeping this series simple to address the underruns and overruns issues
> noticed in pipewire setup.
> 
> Any testing would be appreciated.
> 
> Please note that on pipewire min-latency has to be set to 512 which
> reflects the DSP latency requirements of 10ms. You might see audio
> artifacts like glitches if you try to play audio below 256 latency.

> Changes since v3:
> 	- updated period size aligment patch with 10ms period size
> 	  contstriants.
> 
> Changes since v2:
> 	- dropped patch which is causing regression with pluseaudio.
> 	- setup period sizes only for capture path
> 	- fix underruns/overruns in dsp pipelines.
> 	- add fixes tag
> 	- add patch to fix buffer alignment
> 
> Changes since v1:
> 	- added new patches to fix the fragment size, pointer
> 	  calculations
> 	- updated to schedule only available buffers.
> 

I tested v4 on the X13s with PulseAudio and T14s with PipeWire.

I'm no longer noticing any regressions with PulseAudio, while this
series makes PipeWire actually usable.

I may be hearing some crackling with PipeWire when recording with the 
pavucontrol volume meters enabled which results in a quantum size of
256. But I guess that's to be expected. Playback seems to work also at
256 with v4.

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

