Return-Path: <linux-arm-msm+bounces-64567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B7B01C30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9593C5806BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AAE2BE7A1;
	Fri, 11 Jul 2025 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mvvfA2Gj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OyyJRv9S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i+T+nIxW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ijim6fxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F23C26
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752237671; cv=none; b=QSgXv08DDaivHjRWXXElzAImf58mTCdz1jNlWm+P3iffLBwONY1+WUkMy6g42f6sONFKB07D2gQ52fu6Ca+wWo2Orl4Eyix3U6C+7Tl+a4ysHTQXmgj15+CmPnWeRTubRhi3t8L38hbUQGDwnHs64ma4cOOOrk42GEIbi2y/6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752237671; c=relaxed/simple;
	bh=DXWkRDZnfNAPWBTgta9/chuCA5DEdyqeL7jssvuQzIU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uETWYWcVDIjQUPm4tfaZF40qR1hBBJl/EfcQ/ttMtrboBOk/wAkt9twSvsu1wsi5Yt3x4EL/wdRVeu1hYWMZXQLkABk3mlTRJ6ZsARxkm42pUn5YbPyOIwubf3MgsGRrAk/yy20U3kuEuXBDhoLuOkuEABg/ai1FBuhrhEqRpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mvvfA2Gj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OyyJRv9S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i+T+nIxW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ijim6fxu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 12995211D0;
	Fri, 11 Jul 2025 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752237668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=;
	b=mvvfA2GjUK9B5BoVIq0LkOjcQ66Q8ndM3eE5q9FhZERXsNh+uBeAR3egTRXJaLCCrYgZud
	CDQ+iW59hpZD4yk6rJILnbPxXbK6Y/ZmQTCFqmlcxTxvKPvB4MJGNMqQzJmCvjy567vYZw
	AKx+hcJ+PqZu4YlDCrTuGRY+qiqBG8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752237668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=;
	b=OyyJRv9SNDM3TMyOwzYIV9u5M66jR7evWwzoL7zLsOSFsdxPeJFP9yoGRE/R8iPVmYSp7y
	uH/z6Zmq2vlxDHBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752237667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=;
	b=i+T+nIxWWlwfEqZ1zj/27kzojyXmRkFkc5UzKFURsZf3ZfV2jaHfoSw2n8SLTAAkmWB9yj
	YuKAoXj9d4jy3O+A3kJ6ELVOMBBUuKHvav5GFfVvMJR1hwBU/IJxEQgPbrVMZ91ywhi9QV
	5kNcq3gRNH/PlqRfA+fEHMQsEzSK7nI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752237667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm+1q6uhZZEdjKVMT8Uenl84wjsiNI8TM2FeGexcvg=;
	b=ijim6fxusABPnaEAUSVIPHXj/xFyeRSa0F5mqZStfhhSLPFzektelsyjUANZkrAvu6xgiw
	5haTlLR5mfeImrCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ADB9138A5;
	Fri, 11 Jul 2025 12:41:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ku3rEGIGcWh4MAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Jul 2025 12:41:06 +0000
Date: Fri, 11 Jul 2025 14:41:05 +0200
Message-ID: <8734b2hpcu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Joris Verhaegen <verhaegen@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	kernel-team@android.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
In-Reply-To: <aHD7/9MZbcOmn+08@opensource.cirrus.com>
References: <20250711093636.28204-1-verhaegen@google.com>
	<aHD7/9MZbcOmn+08@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,perex.cz,suse.com,gmail.com,opensource.cirrus.com,cirrus.com,intel.com,linux.intel.com,linux.dev,nxp.com,linux.alibaba.com,socionext.com,android.com,vger.kernel.org,alsa-project.org,lists.infradead.org];
	R_RATELIMIT(0.00)[to_ip_from(RLtwg9tyn6faipwn1aqsxq4m86)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Fri, 11 Jul 2025 13:56:47 +0200,
Charles Keepax wrote:
> 
> On Fri, Jul 11, 2025 at 10:36:26AM +0100, Joris Verhaegen wrote:
> > The current compress offload timestamping API relies on
> > struct snd_compr_tstamp, whose cumulative counters like
> > copied_total are defined as __u32. On long-running high-resolution
> > audio streams, these 32-bit counters can overflow,
> > causing incorrect availability calculations.
> > 
> > This patch series introduces a parallel, 64-bit safe API to solve
> > this problem while maintaining perfect backward compatibility with the
> > existing UAPI. A new pointer64 operation and corresponding ioctls
> > are added to allow the kernel to track counters using u64 and expose
> > these full-width values to user-space.
> > 
> > The series is structured as follows:
> > 
> > Patch 1: Introduces the new internal pointer64 op, refactors the
> > core logic to use it, and defines the new UAPI structs.
> > 
> > Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> > 
> > Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> > 
> > Patch 4: Implements the new .pointer64 operation in various ASoC
> > drivers that support compress offload.
> > 
> > This series has been tested on a Pixel 9 device. All compress offload
> > use cases, including long-running playback, were verified to work
> > correctly with the new 64-bit API, and no regressions were observed
> > when using the legacy API.
> > 
> > Thanks,
> > Joris (George) Verhaegen
> > 
> > Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> > 
> > ---
> 
> Would it not be slightly simpler to just update all the in kernel
> bits to use 64-bit and then only convert to 32-bit for the
> existing 32-bit IOCTLs? Why do we need 32-bit callbacks into the
> drivers for example?

Right, it's a usual pattern to have only the 64bit ops in the kernel
driver side while providing the 32bit stuff converted in the core
layer.  Having two different ops are rather confusing and
superfluous after conversions.

If there are tons of users for this API, it'd be needed to convert
gradually, and eventually drop the 32bit ops at the end.  But in this
case, there doesn't seem so many relevant drivers, hence the
conversion can be done in a shot as done in your patch 4.


thanks,

Takashi

