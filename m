Return-Path: <linux-arm-msm+bounces-31066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6AF96EBEE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 09:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8A5A1C21761
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 07:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881D814BF8D;
	Fri,  6 Sep 2024 07:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0bdCY3yK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Eyqhmktm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0bdCY3yK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Eyqhmktm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC0149C4B;
	Fri,  6 Sep 2024 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725607581; cv=none; b=uk1qdykj+OkVGKzhfQCGC8g+cD5eM2GV2ekVYZQAgJzJLrsC6dnMhUsS6YHyxWzn2UKsCQ+Mfp4OPV4jT2XcYq6xPR/dpqaCVQzkXSasXY7DNj+Eg9t5Rmj+lQkKK8kK1hl0eFodBOJ5X2B6MEjUF4aEStdbBeUs92NmlM/xKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725607581; c=relaxed/simple;
	bh=w24ClMpk/3FWOO/uXiViU0olb2BuJQQrGQS/6CnBfuE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbB1svccCTYW7hEm4A7L3Rw8bKVpRyPzxWjpbSMKoQVJLpXlkuKmv4aVMOSCwRliqQVaNG+f4AM4qjQC0OiBUTsmwIgSYDmeo4DSbaASaQLThmECOineeO7dqS9jh3Q0vsTMxpvg7PuRUJY6rwVSkV+yZ3fkct4k05uXzCu8Slc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0bdCY3yK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Eyqhmktm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0bdCY3yK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Eyqhmktm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0786C1F896;
	Fri,  6 Sep 2024 07:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725607578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqoweOcBDbSA+7HZiUYq5Pgtsyq80P3DQd88C5/WAT4=;
	b=0bdCY3yKGm8H/78zikBOmnv7J25+SU5hegtuofsLGKVl7Kmn32ajD46MIeamJytzFXGFLy
	hFsTIqfcv8HhbeeTJpiPSwzFKSt9W5DW8LwKnH6vP3K+8h/LRTusEHbnph/otzjRy8OZVq
	V8YVw8wobPDbmOYC+EeWEDUojry7QLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725607578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqoweOcBDbSA+7HZiUYq5Pgtsyq80P3DQd88C5/WAT4=;
	b=EyqhmktmWFiZJmZW8M/wUVN8guG1vJe0G6sWL8OW3r9Rxm1DVjHnSTVToLVfVZbdSRUEOq
	UI+ULZ/FmGxqD7BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725607578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqoweOcBDbSA+7HZiUYq5Pgtsyq80P3DQd88C5/WAT4=;
	b=0bdCY3yKGm8H/78zikBOmnv7J25+SU5hegtuofsLGKVl7Kmn32ajD46MIeamJytzFXGFLy
	hFsTIqfcv8HhbeeTJpiPSwzFKSt9W5DW8LwKnH6vP3K+8h/LRTusEHbnph/otzjRy8OZVq
	V8YVw8wobPDbmOYC+EeWEDUojry7QLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725607578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqoweOcBDbSA+7HZiUYq5Pgtsyq80P3DQd88C5/WAT4=;
	b=EyqhmktmWFiZJmZW8M/wUVN8guG1vJe0G6sWL8OW3r9Rxm1DVjHnSTVToLVfVZbdSRUEOq
	UI+ULZ/FmGxqD7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E2B61395F;
	Fri,  6 Sep 2024 07:26:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CgfEFZmu2mYgNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Sep 2024 07:26:17 +0000
Date: Fri, 06 Sep 2024 09:27:03 +0200
Message-ID: <87h6atfdiw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/13] ALSA: update sample rate definitions
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,cirrus.com,opensource.cirrus.com,gmail.com,kernel.org,intel.com,linux.intel.com,linaro.org,csie.org,sholland.org,vger.kernel.org,alsa-project.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 05 Sep 2024 16:12:51 +0200,
Jerome Brunet wrote:
> 
> This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.
> 
> It is follow-up on the series/discussion [0] about adding 128kHz for
> spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
> clean up the drivers that no longer require custom rules to allow these
> rates.
> 
> Identifying these drivers is not straight forward, I tried my best but I
> may have missed some. Those will continue to work anyway so it is not
> critical. Some drivers using these rates have not been changed on
> purpose. The reason for this may be:
> * The driver used other uncommon rates that still don't have a definition
>   so a custom rule is still required.
> * The constraint structure is used in some other way by the driver and
>   removing it would not help the readability or maintainability. This is
>   the case the freescale asrc drivers for example.
> 
> There is one change per driver so, if there is a problem later on, it will
> easier to properly add Fixes tag.
> 
> The series has been tested with
> * ARM64 defconfig - spdif 128kHz at runtime.
> * x86_64 allmodconfig - compile test only
> 
> Last, the change adding IEC958 definitions has been dropped for this
> patchset and will be resent separately
> 
> [0]: https://lore.kernel.org/all/20240628122429.2018059-1-jbrunet@baylibre.com/
> 
> ---
> Jerome Brunet (13):
>       ALSA: pcm: add more sample rate definitions
>       ALSA: cmipci: drop SNDRV_PCM_RATE_KNOT
>       ALSA: emu10k1: drop SNDRV_PCM_RATE_KNOT
>       ALSA: hdsp: drop SNDRV_PCM_RATE_KNOT
>       ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
>       ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
>       ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
>       ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
>       ASoC: Intel: avs: drop SNDRV_PCM_RATE_KNOT
>       ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
>       ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
>       ASoC: cs35l34: drop useless rate contraint
>       ASoC: spdif: extend supported rates to 768kHz

A nice cleanup series.
Applied all now to for-next branch.


Thanks!

Takashi

