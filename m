Return-Path: <linux-arm-msm+bounces-66715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9DB11FA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 15:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8823317FF57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 13:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FAA1A2545;
	Fri, 25 Jul 2025 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qkyxUIg/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mylSVgUc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qkyxUIg/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mylSVgUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E20D1ADC97
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753451628; cv=none; b=YSnk4rN98icQzmXkA7w82uUZiENgblELiwY9Of0+cEU3wsOjTbIlWvUSzDpoxCbv/ipnM9VldpL6wqn+Y548B1Wqu8wsJo5Bllv0AhDxkimBkJgqHfwUuK2qg9QeMBxWm6rWRu5s5tHGS4BzvDyby6K1H+N7An08R0iK5Ivq6eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753451628; c=relaxed/simple;
	bh=IR/Vi22XVrrga8blVhc5NOXTYz8qtv3NSPAWFSX1P5k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QmAP8wwoYV6GLC5yt2RJd8Rjj+/t226oYmw0CDLPcCHy7hJPcGMd9vJIkm5pPmjm+ba0FRK3kz48QncTja9syHb+aTRnrXutkk6wMI2+KLSLWUU1pGE2B8O5q6+ZtJtBOUgudshWaOOdUghY6sFBtS/WxR9sRtFcKuVMcUZm96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qkyxUIg/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mylSVgUc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qkyxUIg/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mylSVgUc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B36081F76C;
	Fri, 25 Jul 2025 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753451624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cLK0Ic1lz58928Iz6K8Vh5T63JlZ6JcRUL5uTD0Itw=;
	b=qkyxUIg/j6I2c6xZhFuAxziL5yLCr3g50BeV6GoGssj/qsdFAmnIUXHW7OPe/tbdDt2RsN
	S4ttrCCXwQWLPoga/dRUVJ0uggiE7RSIZRs+frRE2uhRkuKw5xjPBvsGH52be/79yK6Cjg
	rTEQjZvcULAQuNn9/bofiZK6UoFZBkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753451624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cLK0Ic1lz58928Iz6K8Vh5T63JlZ6JcRUL5uTD0Itw=;
	b=mylSVgUcVKuEv9k7BkSdSINn67s4iOAFvfHbTAHh8KkZET+ZjUZdazgN/4GOtwNLO6kjme
	3bU10snn4yapTXCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753451624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cLK0Ic1lz58928Iz6K8Vh5T63JlZ6JcRUL5uTD0Itw=;
	b=qkyxUIg/j6I2c6xZhFuAxziL5yLCr3g50BeV6GoGssj/qsdFAmnIUXHW7OPe/tbdDt2RsN
	S4ttrCCXwQWLPoga/dRUVJ0uggiE7RSIZRs+frRE2uhRkuKw5xjPBvsGH52be/79yK6Cjg
	rTEQjZvcULAQuNn9/bofiZK6UoFZBkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753451624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cLK0Ic1lz58928Iz6K8Vh5T63JlZ6JcRUL5uTD0Itw=;
	b=mylSVgUcVKuEv9k7BkSdSINn67s4iOAFvfHbTAHh8KkZET+ZjUZdazgN/4GOtwNLO6kjme
	3bU10snn4yapTXCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16F511373A;
	Fri, 25 Jul 2025 13:53:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zCFeBGiMg2iXRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 25 Jul 2025 13:53:44 +0000
Date: Fri, 25 Jul 2025 15:53:43 +0200
Message-ID: <87cy9oidg8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
Subject: Re: [PATCH v3 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
In-Reply-To: <20250725114249.2086974-1-verhaegen@google.com>
References: <20250725114249.2086974-1-verhaegen@google.com>
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
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,intel.com,linux.intel.com,linux.dev,nxp.com,linux.alibaba.com,socionext.com,android.com,vger.kernel.org,opensource.cirrus.com,alsa-project.org,lists.infradead.org];
	R_RATELIMIT(0.00)[to_ip_from(RLtwg9tyn6faipwn1aqsxq4m86)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Fri, 25 Jul 2025 13:42:42 +0200,
Joris Verhaegen wrote:
> 
> The current compress offload timestamping API relies on struct
> snd_compr_tstamp, whose cumulative counters like copied_total are
> defined as __u32. On long-running high-resolution audio streams, these
> 32-bit counters can overflow, causing incorrect availability
> calculations.
> 
> This patch series transitions to a 64-bit safe API to solve the problem
> while maintaining perfect backward compatibility with the existing UAPI.
> The pointer operation is reworked to use a new timestamp struct with
> 64-bit fields for the cumulative counters, named snd_compr_tstamp64.
> ASoC drivers are updated to use the 64-bit structures. Corresponding
> ioctls are added to expose them to user-space.
> 
> The series is structured as follows:
> 
> Patch 1: Updates the pointer op, refactors the core logic and ASoC
> drivers to use it, and defines the new UAPI structs.
> 
> Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> 
> Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> 
> This series has been tested on a Pixel 9 device. All compress offload
> use cases, including long-running playback, were verified to work
> correctly with the new 64-bit API.
> 
> Thanks,
> Joris (George) Verhaegen
> 
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>

Through a quick glance, the patches look OK, but since it's too late
for 6.17 merge window for such a non-trivial core API change, so I'll
postpone the merge for 6.18.


thanks,

Takashi

