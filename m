Return-Path: <linux-arm-msm+bounces-67738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C3B1ADC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 08:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E10CD620201
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 05:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0593E21A420;
	Tue,  5 Aug 2025 05:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tug+H6ce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H8q0KLd3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tug+H6ce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H8q0KLd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AE2218AB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 05:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754373592; cv=none; b=CjQwJgauUN1AKPsJrP4WyVANF43phrPckchKhwTNaH/wsR1YaaINMuhCoGkiqvpukSNRzB5DBM5/BZd7BOn+HnU414NF76PEngVD+HruBOzR/85Jd55DjEvt12uQa8QeTa/tW6L5QoQ+4vMzQLivD5aV62s+VLKCIk5ApdwGAjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754373592; c=relaxed/simple;
	bh=sojgiQeRm51eLDiy/q27riuhR53WS2lsRaHf4PkcqZY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K4zkDXa2E8QImfeQ7BwusFu+ylevH0zQ5iYBKA8vIHPKu5WLX31Lafqjf+ePibSRHZ5KdmXsxXlCSt3tkQDHKHiSLMIZfjZ9y09BZ3wxQNbcr7ol18sRESfbLOKmH4LTLkKA6I2zOuq+T+BxHAigKznkagGrVC00pfQ3EwLcb5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tug+H6ce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H8q0KLd3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tug+H6ce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H8q0KLd3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 13DE61F38C;
	Tue,  5 Aug 2025 05:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754373583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95adhiCyJGSP0NNJz+SWF3fmYOKDXZLRe3b8Jezgjx4=;
	b=Tug+H6ceJR8vm3tU+efCFaCzr96j/s1nLL2/WggUlxTKgD31WMWhvXdLI2j7nWl1LR3ZgR
	7Su5I6BdNuX3TOXtSELG2+ih/cYGHi5CoHvFNWsJgHxRDcbxIrW8FUF8CzS906QIKceo/T
	t2YT9KcYNX3zS9VGzl7RXtM4h0/nU0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754373583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95adhiCyJGSP0NNJz+SWF3fmYOKDXZLRe3b8Jezgjx4=;
	b=H8q0KLd3PporL8GiyYupV0VD3Y1AdExROpi6Ck5rPM6k9ltPqQkfywiDXp2u6R87uwiXQp
	cHxZ3CpOM7KO6dCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754373583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95adhiCyJGSP0NNJz+SWF3fmYOKDXZLRe3b8Jezgjx4=;
	b=Tug+H6ceJR8vm3tU+efCFaCzr96j/s1nLL2/WggUlxTKgD31WMWhvXdLI2j7nWl1LR3ZgR
	7Su5I6BdNuX3TOXtSELG2+ih/cYGHi5CoHvFNWsJgHxRDcbxIrW8FUF8CzS906QIKceo/T
	t2YT9KcYNX3zS9VGzl7RXtM4h0/nU0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754373583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95adhiCyJGSP0NNJz+SWF3fmYOKDXZLRe3b8Jezgjx4=;
	b=H8q0KLd3PporL8GiyYupV0VD3Y1AdExROpi6Ck5rPM6k9ltPqQkfywiDXp2u6R87uwiXQp
	cHxZ3CpOM7KO6dCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60DBC13A55;
	Tue,  5 Aug 2025 05:59:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yO5XFs6dkWiwBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 05 Aug 2025 05:59:42 +0000
Date: Tue, 05 Aug 2025 07:59:42 +0200
Message-ID: <87h5ym1f75.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vinod Koul <vkoul@kernel.org>
Cc: Joris Verhaegen <verhaegen@google.com>,
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
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
In-Reply-To: <aJGM2zXS6hOLDFm1@vaman>
References: <20250801092720.1845282-1-verhaegen@google.com>
	<20250801092720.1845282-3-verhaegen@google.com>
	<aJGM2zXS6hOLDFm1@vaman>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[google.com,perex.cz,suse.com,gmail.com,kernel.org,intel.com,linux.intel.com,linux.dev,nxp.com,linux.alibaba.com,socionext.com,android.com,vger.kernel.org,opensource.cirrus.com,alsa-project.org,lists.infradead.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLtwg9tyn6faipwn1aqsxq4m86)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Tue, 05 Aug 2025 06:47:59 +0200,
Vinod Koul wrote:
> 
> On 01-08-25, 10:27, Joris Verhaegen wrote:
> > The previous patch introduced the internal infrastructure for handling
> > 64-bit timestamps. This patch exposes this capability to user-space.
> > 
> > Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
> > applications to fetch the overflow-safe struct snd_compr_tstamp64.
> > 
> > The ioctl dispatch table is updated to handle the new command by
> > calling a new snd_compr_tstamp64 handler, while the legacy path is
> > renamed to snd_compr_tstamp32 for clarity.
> > 
> > This patch bumps the SNDRV_COMPRESS_VERSION to 0.4.0.
> > 
> > Reviewed-by: Miller Liang <millerliang@google.com>
> > Tested-by: Joris Verhaegen <verhaegen@google.com>
> > Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> > ---
> >  include/uapi/sound/compress_offload.h |  5 +++--
> >  sound/core/compress_offload.c         | 19 +++++++++++++------
> >  2 files changed, 16 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> > index abd0ea3f86ee..70b8921601f9 100644
> > --- a/include/uapi/sound/compress_offload.h
> > +++ b/include/uapi/sound/compress_offload.h
> > @@ -13,8 +13,7 @@
> >  #include <sound/asound.h>
> >  #include <sound/compress_params.h>
> >  
> > -
> > -#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
> > +#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
> >  /**
> >   * struct snd_compressed_buffer - compressed buffer
> >   * @fragment_size: size of buffer fragment in bytes
> > @@ -208,6 +207,7 @@ struct snd_compr_task_status {
> >   * Note: only codec params can be changed runtime and stream params cant be
> >   * SNDRV_COMPRESS_GET_PARAMS: Query codec params
> >   * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
> > + * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
> >   * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
> >   * This also queries the tstamp properties
> >   * SNDRV_COMPRESS_PAUSE: Pause the running stream
> > @@ -230,6 +230,7 @@ struct snd_compr_task_status {
> >  						 struct snd_compr_metadata)
> >  #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
> >  #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
> > +#define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
> >  #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
> >  #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
> >  #define SNDRV_COMPRESS_START		_IO('C', 0x32)
> > diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> > index d3164aa07158..445220fdb6a0 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -736,18 +736,23 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
> >  	return retval;
> >  }
> >  
> > -static inline int
> > -snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
> > +static inline int snd_compr_tstamp(struct snd_compr_stream *stream,
> > +				   unsigned long arg, bool is_32bit)
> >  {
> >  	struct snd_compr_tstamp64 tstamp64 = { 0 };
> >  	struct snd_compr_tstamp tstamp32 = { 0 };
> > +	const void *copy_from = &tstamp64;
> > +	size_t copy_size = sizeof(tstamp64);
> >  	int ret;
> >  
> >  	ret = snd_compr_update_tstamp(stream, &tstamp64);
> >  	if (ret == 0) {
> > -		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > -		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> > -				   &tstamp32, sizeof(tstamp32)) ?
> > +		if (is_32bit) {
> > +			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > +			copy_from = &tstamp32;
> > +			copy_size = sizeof(tstamp32);
> > +		}
> 
> Most of the applications and people would be 32bit right now and we
> expect this to progressively change, but then this imposes a penalty as
> default path is 64 bit, since we expect this ioctl to be called very
> frequently, should we do this optimization for 64bit here?

Through a quick glance over the patch, I don't think you'll hit the
significant performance loss.  It's merely a few bytes of extra copies
before copy_to_user(), after all.  But, of course, it'd be more
convincing if anyone can test and give the actual numbers.


thanks,

Takashi

