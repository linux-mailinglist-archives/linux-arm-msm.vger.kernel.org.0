Return-Path: <linux-arm-msm+bounces-70065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD472B2EF63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43B5A1CC3572
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 07:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E372E8E04;
	Thu, 21 Aug 2025 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e3/tC8Ba";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I1gAEid1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e3/tC8Ba";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I1gAEid1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE9287275
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760728; cv=none; b=ZYSkStDZDjCuNt1cfnskPJBazqqvwZWBxodi31WeFcjcz3yreOt4oJJV5BGtIfNyXikq3EdR8cyEEs+fIQltJFOlRbtdTPyOiq8BAANFgG599wKs6G7WlsGHvq/sg4I8mcZpqFqgJxSwCVWhtlaq7VNG/DKZDw6qHFRsH8KWTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760728; c=relaxed/simple;
	bh=oS4B0AdnrIV19OmSaXNY5Db5gt1901Tk/IfHLRsRVjo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUlne+XZY0/jD3vD3nHBgMio6yYMyU7D7e/0PoNsyT3TJAhlvb0wJUezsJS4Dc6uWIeqkiy1g/HTTR7PYWzbxF1IDS9VzWrOxe0w/D3JBMmy/QFfSauCX0Zrd6iWUw9Q0P/2VQ1w5v8LMwpDYPJGXd793lS+vM2v/ViOfjgYLr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e3/tC8Ba; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I1gAEid1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e3/tC8Ba; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I1gAEid1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 53EA21F7C7;
	Thu, 21 Aug 2025 07:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755760724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obRsX/8A/9Qh0CwHqev9anKpmT+VLQgy8OH1fNMPrdM=;
	b=e3/tC8Batqv8H9ZmNUKiG7yJYW8iDf+1WBR1MIywyIXa6M60v+uLf1VhTzwsh6NtJaO4FH
	kKEH/uA+m/0p9x9k3kShBk91xRkrGb/ZKfeLZwtOfkldMh29GySsOi4l/GmUByWyOUgX9V
	Y4Ha+B0DSM8BDhAl4IKfKFaIPPzPRjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755760724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obRsX/8A/9Qh0CwHqev9anKpmT+VLQgy8OH1fNMPrdM=;
	b=I1gAEid1hDYculmly3aGsaMofmBg4pB/7b6HHinl9NPBv17cK2mooBC12/Mcgh3VuT03aD
	7KNy3OBuB5psPwDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="e3/tC8Ba";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I1gAEid1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755760724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obRsX/8A/9Qh0CwHqev9anKpmT+VLQgy8OH1fNMPrdM=;
	b=e3/tC8Batqv8H9ZmNUKiG7yJYW8iDf+1WBR1MIywyIXa6M60v+uLf1VhTzwsh6NtJaO4FH
	kKEH/uA+m/0p9x9k3kShBk91xRkrGb/ZKfeLZwtOfkldMh29GySsOi4l/GmUByWyOUgX9V
	Y4Ha+B0DSM8BDhAl4IKfKFaIPPzPRjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755760724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obRsX/8A/9Qh0CwHqev9anKpmT+VLQgy8OH1fNMPrdM=;
	b=I1gAEid1hDYculmly3aGsaMofmBg4pB/7b6HHinl9NPBv17cK2mooBC12/Mcgh3VuT03aD
	7KNy3OBuB5psPwDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A540413867;
	Thu, 21 Aug 2025 07:18:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NREmJ1PIpmihAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Aug 2025 07:18:43 +0000
Date: Thu, 21 Aug 2025 09:18:43 +0200
Message-ID: <87bjo96t2k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>,
    Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>,
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
In-Reply-To: <aKQGuPgwXE-Unzeq@vaman>
References: <20250801092720.1845282-1-verhaegen@google.com>
	<20250801092720.1845282-3-verhaegen@google.com>
	<aJGM2zXS6hOLDFm1@vaman>
	<87h5ym1f75.wl-tiwai@suse.de>
	<aKMzGRzeRqkOwTNS@opensource.cirrus.com>
	<aKQGuPgwXE-Unzeq@vaman>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,opensource.cirrus.com,suse.de,perex.cz,suse.com,gmail.com,intel.com,linux.intel.com,linux.dev,nxp.com,linux.alibaba.com,socionext.com,android.com,vger.kernel.org,alsa-project.org,lists.infradead.org,google.com];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLzj6aswpe58r68z1acwzd13oz)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 53EA21F7C7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01

On Tue, 19 Aug 2025 07:08:08 +0200,
Vinod Koul wrote:
> 
> On 18-08-25, 15:05, Charles Keepax wrote:
> > On Tue, Aug 05, 2025 at 07:59:42AM +0200, Takashi Iwai wrote:
> > > On Tue, 05 Aug 2025 06:47:59 +0200,
> > > Vinod Koul wrote:
> > > > On 01-08-25, 10:27, Joris Verhaegen wrote:
> > > > >  	ret = snd_compr_update_tstamp(stream, &tstamp64);
> > > > >  	if (ret == 0) {
> > > > > -		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > > > > -		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> > > > > -				   &tstamp32, sizeof(tstamp32)) ?
> > > > > +		if (is_32bit) {
> > > > > +			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > > > > +			copy_from = &tstamp32;
> > > > > +			copy_size = sizeof(tstamp32);
> > > > > +		}
> > > > 
> > > > Most of the applications and people would be 32bit right now and we
> > > > expect this to progressively change, but then this imposes a penalty as
> > > > default path is 64 bit, since we expect this ioctl to be called very
> > > > frequently, should we do this optimization for 64bit here?
> > > 
> > > Through a quick glance over the patch, I don't think you'll hit the
> > > significant performance loss.  It's merely a few bytes of extra copies
> > > before copy_to_user(), after all.  But, of course, it'd be more
> > > convincing if anyone can test and give the actual numbers.
> 
> That would be better
> 
> > I am inclined to agree the impact should be very minimal and the
> > only alternative is a more complex implementation. I would vote
> > for leaving this as is.
> 
> But yes, we can for now, go ahead. It is internal kernel flow can be
> adapted anytime :-)

OK, Joris, could you submit v5 with correction of what Vinod
suggested in reviews?


thanks,

Takashi

