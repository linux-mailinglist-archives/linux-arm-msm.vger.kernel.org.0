Return-Path: <linux-arm-msm+bounces-64588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D374EB01CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E25A25C16A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A648F2D321A;
	Fri, 11 Jul 2025 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIabZncs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UfGei8LT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIabZncs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UfGei8LT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A52D3202
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238863; cv=none; b=gkhJgAYKlLaJIJeLn7WI+p4R3F6fISr1L0czGrpls1mG0W69OJG8TApGFJe6yCM+lLr+gbShJIZEhk9zwSiPzPwBIt/KAn/qlA4Nvr8q9vOrNIx6+hswSgMI9myUHWJebXS62qwd5uAjNiMzcISk0JOaLu++4YByulkrkLOKGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238863; c=relaxed/simple;
	bh=iBer7s0qVLn8GqkLLJOd0rCYF9C7SMkm/SF3DGMKN7Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BBnLRwe+d9WEGgkNV/mUZLe6Cz8z3OdiIxxrEygjoxjwPb6py8uUL1G2gRzDWD0DKUs61rHobpdP3gAT5SMUlG1mzj71g4vKLHnaMd2SdceeXMrn/dA36FOWhhKqCLXBC9xu2H3QqXPXHlzvMF3PFo0wCrtEINoDvj8WywlwJDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EIabZncs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UfGei8LT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EIabZncs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UfGei8LT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8E277211A1;
	Fri, 11 Jul 2025 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752238858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99/nrZ3jMvnnDXT1EtGRSVK6t1HpEMJ2yRrbZ2a36ss=;
	b=EIabZncsmdgObTpqbVT7iazVG+CJVs8CfHJkhkXVBdUNKSNxb2qpFnFsxczCd6mJHRJipR
	K5ZWX0c1IV83fRF5+ACDnDYOPwQJLLKYktLx9PIZW2/B4cGFPW29JD0vZSTCR8ofzNgvXp
	dztMQ2eWHdEW8GHQqwo2xDxePWV9Ed8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752238858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99/nrZ3jMvnnDXT1EtGRSVK6t1HpEMJ2yRrbZ2a36ss=;
	b=UfGei8LTKPLOBPN2mXLGtctqnYSsqbb/d3+1+IFV5osq3wVnWWCXEf7ARCmOywavObR0cP
	4axW4ATOf+VF0EBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EIabZncs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UfGei8LT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752238858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99/nrZ3jMvnnDXT1EtGRSVK6t1HpEMJ2yRrbZ2a36ss=;
	b=EIabZncsmdgObTpqbVT7iazVG+CJVs8CfHJkhkXVBdUNKSNxb2qpFnFsxczCd6mJHRJipR
	K5ZWX0c1IV83fRF5+ACDnDYOPwQJLLKYktLx9PIZW2/B4cGFPW29JD0vZSTCR8ofzNgvXp
	dztMQ2eWHdEW8GHQqwo2xDxePWV9Ed8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752238858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99/nrZ3jMvnnDXT1EtGRSVK6t1HpEMJ2yRrbZ2a36ss=;
	b=UfGei8LTKPLOBPN2mXLGtctqnYSsqbb/d3+1+IFV5osq3wVnWWCXEf7ARCmOywavObR0cP
	4axW4ATOf+VF0EBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2EC413918;
	Fri, 11 Jul 2025 13:00:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i29HNgkLcWj7NgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Jul 2025 13:00:57 +0000
Date: Fri, 11 Jul 2025 15:00:53 +0200
Message-ID: <87wm8eg9ve.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
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
In-Reply-To: <8734b2hpcu.wl-tiwai@suse.de>
References: <20250711093636.28204-1-verhaegen@google.com>
	<aHD7/9MZbcOmn+08@opensource.cirrus.com>
	<8734b2hpcu.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,kernel.org,perex.cz,suse.com,gmail.com,cirrus.com,intel.com,linux.intel.com,linux.dev,nxp.com,linux.alibaba.com,socionext.com,android.com,vger.kernel.org,alsa-project.org,lists.infradead.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLzj6aswpe58r68z1acwzd13oz)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8E277211A1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01

On Fri, 11 Jul 2025 14:41:05 +0200,
Takashi Iwai wrote:
> 
> On Fri, 11 Jul 2025 13:56:47 +0200,
> Charles Keepax wrote:
> > 
> > On Fri, Jul 11, 2025 at 10:36:26AM +0100, Joris Verhaegen wrote:
> > > The current compress offload timestamping API relies on
> > > struct snd_compr_tstamp, whose cumulative counters like
> > > copied_total are defined as __u32. On long-running high-resolution
> > > audio streams, these 32-bit counters can overflow,
> > > causing incorrect availability calculations.
> > > 
> > > This patch series introduces a parallel, 64-bit safe API to solve
> > > this problem while maintaining perfect backward compatibility with the
> > > existing UAPI. A new pointer64 operation and corresponding ioctls
> > > are added to allow the kernel to track counters using u64 and expose
> > > these full-width values to user-space.
> > > 
> > > The series is structured as follows:
> > > 
> > > Patch 1: Introduces the new internal pointer64 op, refactors the
> > > core logic to use it, and defines the new UAPI structs.
> > > 
> > > Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> > > 
> > > Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> > > 
> > > Patch 4: Implements the new .pointer64 operation in various ASoC
> > > drivers that support compress offload.
> > > 
> > > This series has been tested on a Pixel 9 device. All compress offload
> > > use cases, including long-running playback, were verified to work
> > > correctly with the new 64-bit API, and no regressions were observed
> > > when using the legacy API.
> > > 
> > > Thanks,
> > > Joris (George) Verhaegen
> > > 
> > > Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> > > 
> > > ---
> > 
> > Would it not be slightly simpler to just update all the in kernel
> > bits to use 64-bit and then only convert to 32-bit for the
> > existing 32-bit IOCTLs? Why do we need 32-bit callbacks into the
> > drivers for example?
> 
> Right, it's a usual pattern to have only the 64bit ops in the kernel
> driver side while providing the 32bit stuff converted in the core
> layer.  Having two different ops are rather confusing and
> superfluous after conversions.
> 
> If there are tons of users for this API, it'd be needed to convert
> gradually, and eventually drop the 32bit ops at the end.  But in this
> case, there doesn't seem so many relevant drivers, hence the
> conversion can be done in a shot as done in your patch 4.

Also, don't forget to increase the protocol version if you change the
ABI.


thanks,

Takashi

