Return-Path: <linux-arm-msm+bounces-113832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yFn9MrEkNWomngYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 13:14:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5106A5631
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 13:14:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NdgT9um1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="g7Yl/P5L";
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NdgT9um1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="g7Yl/P5L";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113832-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113832-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49BFC3016819
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 11:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF976375F9C;
	Fri, 19 Jun 2026 11:14:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDFA371067
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 11:14:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867692; cv=none; b=HifHLQFbWdqIFh9tcrKLh3JSdJxo30PHUhnnDZqbGy39YqLNGREPrTJ7L0s+IZ3abZlHXPdbfLiXg8+2R5R7+yu5QzVlyBOB0pe/XRHMVP0ERr9gBt97KydeBEdbD5LyFLwmQFKkuJjvI5hTR44RqHxyzrBZh/geXrZ9zd4JF0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867692; c=relaxed/simple;
	bh=WFB9ZDoOqVm9cu0zzHzoJnb9cghOb9BIO4ocviwzJkE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PCpPqhmidOTqkyQVfwHamII2678drFg+nKEtXMq+ZpM264LhTqQu+6WwkZppgjRMyxgLDHZgzFSNIdAubUqvGOpVrpxtUeMjLQ/3kjHdI3pW1IevYQ9QKWUO72I1t5sVhdYJlV+jlc5RlNU+v0KhLiZzdzgP6utk97bHn2xiAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NdgT9um1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g7Yl/P5L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NdgT9um1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g7Yl/P5L; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE63675F42;
	Fri, 19 Jun 2026 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781867689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vA7XD4tzqECot2FsGyw2UfmWr3fnKsx8iWlkrI2RB3A=;
	b=NdgT9um1MgonkyxrgX+0f7d+CyCvpxEmUhqmJKbQW9+jFKtud5k2Rb8jTDdo4uC75+O6MO
	pkXMlhuHQiwfPe4FcHod1i8KGjyuwPRgROIN7fFbhjMYsk6JfyqP1Mcbj7DzUvl0+n4RJj
	4gSmQEhJlLmViXN9IZBt7t7zquN9v+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781867689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vA7XD4tzqECot2FsGyw2UfmWr3fnKsx8iWlkrI2RB3A=;
	b=g7Yl/P5Lz1lvm6VHoMQF1QsbJXVPzTeuORP/mZ0Ej0TGUhh/byZGeItazEsRqhWtqfYfrY
	KuovKhphpK/l3ZCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781867689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vA7XD4tzqECot2FsGyw2UfmWr3fnKsx8iWlkrI2RB3A=;
	b=NdgT9um1MgonkyxrgX+0f7d+CyCvpxEmUhqmJKbQW9+jFKtud5k2Rb8jTDdo4uC75+O6MO
	pkXMlhuHQiwfPe4FcHod1i8KGjyuwPRgROIN7fFbhjMYsk6JfyqP1Mcbj7DzUvl0+n4RJj
	4gSmQEhJlLmViXN9IZBt7t7zquN9v+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781867689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vA7XD4tzqECot2FsGyw2UfmWr3fnKsx8iWlkrI2RB3A=;
	b=g7Yl/P5Lz1lvm6VHoMQF1QsbJXVPzTeuORP/mZ0Ej0TGUhh/byZGeItazEsRqhWtqfYfrY
	KuovKhphpK/l3ZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8791779A8;
	Fri, 19 Jun 2026 11:14:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kz6MM6gkNWoGWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jun 2026 11:14:48 +0000
Date: Fri, 19 Jun 2026 13:14:48 +0200
Message-ID: <871pe2kcif.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	David Laight <david.laight.linux@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
In-Reply-To: <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
	<20260617140209.3f89706c@pumpkin>
	<CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
	<20260619101346.2ec49087@pumpkin>
	<ajUcTfG3vSGz3n3d@opensource.cirrus.com>
	<CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tiwai@suse.de,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:ckeepax@opensource.cirrus.com,m:david.laight.linux@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:phucducbui@gmail.com,m:davidlaightlinu
 x@gmail.com,m:povik@cutebit.org,m:matthiasbgg@gmail.com,m:steveneckhoffopensource@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,gmail.com,kernel.org,perex.cz,suse.com,chromium.org,cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,suse.de:dkim,suse.de:mid,suse.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A5106A5631

On Fri, 19 Jun 2026 12:57:57 +0200,
Bui Duc Phuc wrote:
> 
> Hi Charles, David,
> 
> 
> 
> > > > > > I believe you have to use scoped_guard here, as there is a return
> > > > > > from the function above, if memory serves it attempts to release
> > > > > > the mutex on that path despite it being above the guard.
> > > > >
> > > > > Indeed.
> > > > > I believe clang will complain.
> > > > > That makes these mechanical conversions of existing code dangerous churn.
> > > > >
> > > > > While using guard() (etc) can make it easier to ensure the lock is released
> > > > > when functions have multiple error exits, I'm not convinced it makes the
> > > > > code any easier to read (other people may disagree).
> > > >
> > > > I built the code with both GCC and Clang and didn't see any warnings.
> > > >
> > > > My understanding was that the early return exits the function before
> > > > the guard is instantiated, so it should not affect the guard's cleanup
> > > > handling.
> > >
> > > When a variable is defined (and initialised) part way down a block the
> > > compiler moves the definition to the top of the block but doesn't initialise
> > > it at all, the first assignment happens where the code contains the
> > > definition.
> > >
> > > However the destructor is always called at the end of the block.
> > > So if you return from a function before the definition the destructor
> > > is called with an uninitialised argument.
> >
> > My understanding was exactly as your David, but it seems that isn't
> > the whole story and indeed I had to fix a bug in our SDCA code
> > that hit this.  However testing this out, results in some things I
> > find very hard to explain.
> >
> > It seems as far as I have managed to test, the code below works
> > fine as Phuc suggests. It does not appear to run the mutex_unlock
> > on the error path.
> >
> > int function()
> > {
> >         if (error)
> >                 return;
> >
> >         guard(mutex)(&mutex);
> >
> >         stuff();
> >
> >         return;
> > }
> >
> 
> Thanks both for the clarification.
> 
> > The situation I hit this in before that doesn't work was actually
> > this:
> >
> > int function()
> > {
> >         if (error)
> >                 goto error_label;
> >
> >         guard(mutex)(&mutex);
> >
> >         stuff();
> >
> > error_label;
> >         return;
> > }
> >
> > Which in this case it does run the mutex_unlock and NULL pointer.
> > Will try to find sometime to look at the generated assembly, but
> > this basically totally blows my mind. Very unclear as to if this
> > is supposed to work this way or just does by pure luck.
> >
> 
> As stated in cleanup.h, mixing goto-based cleanup and scope-based
> cleanup helpers in the same function is not expected, so I think
> we should keep a consistent approach here.

Right, and IIRC, clang would complain the mixed goto case at least
with W=1.


Takashi

