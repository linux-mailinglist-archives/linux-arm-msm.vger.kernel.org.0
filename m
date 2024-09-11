Return-Path: <linux-arm-msm+bounces-31507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 293DC9752B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 14:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 975861F21DB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F3D189F2D;
	Wed, 11 Sep 2024 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pZ9EfykG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1qiv1TY6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pZ9EfykG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1qiv1TY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEFD183092;
	Wed, 11 Sep 2024 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726058504; cv=none; b=WXgaj5qygwnp2jNYn2CjqTaCeuEnmMN8jTSt8mPHcJN3o0qa4CHcJehsBT96IG03VRyP7psyau5oowj/7wbS222Fg77BX3CEwKput4rPgnx2XulnV+JJcIChXE9SSwUvJ+bnbQ7SiveIYVRcAcato2faHIHCUkghNWP7t3DhyaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726058504; c=relaxed/simple;
	bh=RyZvahY/myfe8+jD8IB+VfIzKap/KOSNCMHgZR0X7u0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=imy1W1yd6b6wffFT3tWMFi5BsAFjvxymhpCBqpgsHxEcR0UkO1fLElLf5iiRZ1jTRA/Ut9o3KU8BsKu3nyB66TLdeOpO6bc8VD9zltUMYGQpbVt3tjo0yHsNIs4Q8JkHW/120Wtb5FdRBQZUi4DiBiIBe2s4jRsgghG/jViuyHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pZ9EfykG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1qiv1TY6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pZ9EfykG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1qiv1TY6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6622021B67;
	Wed, 11 Sep 2024 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726058500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErcldMOomOuYMXEhRc5d4j1g98Z9A7bYRweDzdDbWwA=;
	b=pZ9EfykGEMzAaT8f+YITRoX4M3xwnk7GZuqwMSdzcrTSBOMTcWGdIh5c44fYo+VCkFoFxG
	I+5yCIwAFdXXGLq2a0fz008kVpI2DVEWvyMc81D8VugSVvT3mJhTe6EcMxWMtMyRRF93RS
	xc/veb3x7OHSSPe5oWwIoR6DmLoBBr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726058500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErcldMOomOuYMXEhRc5d4j1g98Z9A7bYRweDzdDbWwA=;
	b=1qiv1TY6EKyoLfe79gLTWVuGlXQrW+fEUnSbHw3cphr75btCRfG0Q/nav8+K7StGoZwu4k
	QgIJuTA9CuE+qHDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726058500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErcldMOomOuYMXEhRc5d4j1g98Z9A7bYRweDzdDbWwA=;
	b=pZ9EfykGEMzAaT8f+YITRoX4M3xwnk7GZuqwMSdzcrTSBOMTcWGdIh5c44fYo+VCkFoFxG
	I+5yCIwAFdXXGLq2a0fz008kVpI2DVEWvyMc81D8VugSVvT3mJhTe6EcMxWMtMyRRF93RS
	xc/veb3x7OHSSPe5oWwIoR6DmLoBBr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726058500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErcldMOomOuYMXEhRc5d4j1g98Z9A7bYRweDzdDbWwA=;
	b=1qiv1TY6EKyoLfe79gLTWVuGlXQrW+fEUnSbHw3cphr75btCRfG0Q/nav8+K7StGoZwu4k
	QgIJuTA9CuE+qHDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9193132CB;
	Wed, 11 Sep 2024 12:41:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 263AKwOQ4WZxMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Sep 2024 12:41:39 +0000
Date: Wed, 11 Sep 2024 14:42:27 +0200
Message-ID: <87ldzy2wgc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,	Jerome Brunet
 <jbrunet@baylibre.com>,	Takashi Iwai <tiwai@suse.com>,	David Rhodes
 <david.rhodes@cirrus.com>,	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,	Liam Girdwood
 <liam.r.girdwood@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,	Chen-Yu Tsai <wens@csie.org>,	Jernej
 Skrabec <jernej.skrabec@gmail.com>,	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
In-Reply-To: <4f58ebe8-78fe-41f3-9fc6-720d314c026e@perex.cz>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
	<20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
	<1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
	<87ed5q4kbe.wl-tiwai@suse.de>
	<5c309853-c82c-475e-b8c2-fcdcfde20efc@linux.intel.com>
	<87y13y31kq.wl-tiwai@suse.de>
	<4f58ebe8-78fe-41f3-9fc6-720d314c026e@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,baylibre.com,suse.com,cirrus.com,opensource.cirrus.com,gmail.com,kernel.org,intel.com,linaro.org,csie.org,sholland.org,vger.kernel.org,alsa-project.org,lists.infradead.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 11 Sep 2024 12:58:53 +0200,
Jaroslav Kysela wrote:
> 
> On 11. 09. 24 12:51, Takashi Iwai wrote:
> > On Wed, 11 Sep 2024 12:33:01 +0200,
> > P�ter Ujfalusi wrote:
> >> 
> >> On 11/09/2024 12:21, Takashi Iwai wrote:
> >>>> Wondering if this is backwards compatible with the alsa-lib definitions,
> >>>> specifically the topology parts which did unfortunately have a list of
> >>>> rates that will map to a different index now:
> >>>> 
> >>>> 
> >>>> typedef enum _snd_pcm_rates {
> >>>> 	SND_PCM_RATE_UNKNOWN = -1,
> >>>> 	SND_PCM_RATE_5512 = 0,
> >>>> 	SND_PCM_RATE_8000,
> >>>> 	SND_PCM_RATE_11025,
> >>>> 	SND_PCM_RATE_16000,
> >>>> 	SND_PCM_RATE_22050,
> >>>> 	SND_PCM_RATE_32000,
> >>>> 	SND_PCM_RATE_44100,
> >>>> 	SND_PCM_RATE_48000,
> >>>> 	SND_PCM_RATE_64000,
> >>>> 	SND_PCM_RATE_88200,
> >>>> 	SND_PCM_RATE_96000,
> >>>> 	SND_PCM_RATE_176400,
> >>>> 	SND_PCM_RATE_192000,
> >>>> 	SND_PCM_RATE_CONTINUOUS = 30,
> >>>> 	SND_PCM_RATE_KNOT = 31,
> >>>> 	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
> >>>> } snd_pcm_rates_t;
> >>> 
> >>> As far as I understand correctly, those rate bits used for topology
> >>> are independent from the bits used for PCM core, although it used to
> >>> be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
> >>> it's clearer only for topology stuff.
> >> 
> >> Even if we rename these in alsa-lib we will need translation from
> >> SND_TPLG_RATE_ to SND_PCM_RATE_ in kernel likely?
> >> 
> >> The topology files are out there and this is an ABI...
> >> 
> >>> But it'd be better if anyone can double-check.
> >> 
> >> Since the kernel just copies the rates bitfield, any rate above 11025
> >> will be misaligned and result broken setup.
> > 
> > Yep, I noticed it now, too.
> > 
> > Below is the fix patch, totally untested.
> > It'd be appreciated if anyone can test it quickly.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > -- 8< --
> > From: Takashi Iwai <tiwai@suse.de>
> > Subject: [PATCH] ALSA: pcm: Fix breakage of PCM rates used for topology
> > 
> > It turned out that the topology ABI takes the standard PCM rate bits
> > as is, and it means that the recent change of the PCM rate bits would
> > lead to the inconsistent rate values used for topology.
> > 
> > This patch reverts the original PCM rate bit definitions while adding
> > the new rates to the extended bits instead.  This needed the change of
> > snd_pcm_known_rates, too.  And this also required to fix the handling
> > in snd_pcm_hw_limit_rates() that blindly assumed that the list is
> > sorted while it became unsorted now.
> > 
> > Fixes: 090624b7dc83 ("ALSA: pcm: add more sample rate definitions")
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> This looks fine. But the topology rate bits should not depend on those
> bits. It's a bit pitty that the standard PCM ABI does not use those
> bits for user space and we are doing this change just for topology
> ABI.

Yeah, and theoretically it's possible to fix in topology side, but
it'll be more cumbersome.

Although it's not really a part of PCM ABI, I believe we should move
the PCM rate bit definitions to uapi, for showing that it's set in
stone.  Something like below.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: pcm: Move standard rate bit definitions into uapi

Since the standard PCM rate bits are used for the topology ABI, it's a
part of public ABI that must not be changed.  Move the definitions
into uapi to indicate it more clearly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h         | 26 --------------------------
 include/uapi/sound/asound.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 824216799070..f28f6d6ac996 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -105,32 +105,6 @@ struct snd_pcm_ops {
 
 #define SNDRV_PCM_POS_XRUN		((snd_pcm_uframes_t)-1)
 
-/* If you change this don't forget to change rates[] table in pcm_native.c */
-#define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
-#define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
-#define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
-#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
-#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
-#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
-#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
-#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
-#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
-#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
-#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
-#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
-#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
-#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
-#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
-#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
-#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
-/* extended rates */
-#define SNDRV_PCM_RATE_12000		(1U<<17)	/* 12000Hz */
-#define SNDRV_PCM_RATE_24000		(1U<<18)	/* 24000Hz */
-#define SNDRV_PCM_RATE_128000		(1U<<19)	/* 128000Hz */
-
-#define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
-#define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
-
 #define SNDRV_PCM_RATE_8000_44100	(SNDRV_PCM_RATE_8000|SNDRV_PCM_RATE_11025|\
 					 SNDRV_PCM_RATE_16000|SNDRV_PCM_RATE_22050|\
 					 SNDRV_PCM_RATE_32000|SNDRV_PCM_RATE_44100)
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 4cd513215bcd..715ceb3eac7c 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -272,6 +272,32 @@ typedef int __bitwise snd_pcm_subformat_t;
 #define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 3)
 #define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_24
 
+/* Standard rate bits */
+#define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
+#define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
+#define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
+#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
+#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
+#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
+#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
+#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
+#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
+#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
+#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
+#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
+#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
+#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
+#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
+/* extended rates */
+#define SNDRV_PCM_RATE_12000		(1U<<17)	/* 12000Hz */
+#define SNDRV_PCM_RATE_24000		(1U<<18)	/* 24000Hz */
+#define SNDRV_PCM_RATE_128000		(1U<<19)	/* 128000Hz */
+
+#define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
+#define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
+
 #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
 #define SNDRV_PCM_INFO_MMAP_VALID	0x00000002	/* period data are valid during transfer */
 #define SNDRV_PCM_INFO_DOUBLE		0x00000004	/* Double buffering needed for PCM start/stop */
-- 
2.43.0



