Return-Path: <linux-arm-msm+bounces-113831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wv2qE8UgNWpqnQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:58:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3C6A5556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:58:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OiM+TrXR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113831-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113831-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7271E3012266
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2115A37475B;
	Fri, 19 Jun 2026 10:58:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656237267C
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 10:58:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866690; cv=pass; b=eICah9xtwohn9fsvuoNJUjBALnQFrPi7he2Hv38hRU2eJq/6kya6VmpNTtc3E7zAspd2NKbEsmx4L6A3NnzHzEG1iKPyLRG+0oobSp0KnOEMgcYUYSnYMd+q6ZcFYRyBcvpC4R0+e4t5QDxXlCYjK0C1WneI9XqpHkSkHzO4U/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866690; c=relaxed/simple;
	bh=hW1hHfit11KJ1/jbc3rz2OzpM401agNI/4AOURsyGfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0eVelx7ba0VuvZ2s8OGOvQAwVVvqbPiGtHg/6w3fmYH4+Q9BQFgrQPzI8y8/QocGZqT0btrNC5/am7qhfBLDfLPjIDPUlC2gEtAkBi+iKz6vPIVLhrSEVI1fk9KCWmSXFf4BLzBzNK8hwZhIPLitXBbwvulqOoWa6C5/n8KNE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiM+TrXR; arc=pass smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37cae9b7536so1193903a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866688; cv=none;
        d=google.com; s=arc-20240605;
        b=X/9N8g2Ga5Eqw9xROUrZpaVZMaa8MsAU/8qB3aDASRjtgg/kSjixCAzwqR5FdWiw2S
         vOKV3DHr33MBwYEbBBjoFZSzQUeDzA+d0IPJ+kpJPPv5Vrg4aEt2rK/p9CwdF/j3gOi2
         yvGzIFiObIFEH7mwin0DECEbZSh3ZfgRGOAmnmme/fiMGCVO2My3IrT0mkuPdN00XAjw
         SKIbMSTPdtZu/yHpWBjjRBbfOcwGbu7F4gcu6F/0ygMIWLCI+sNZzus/nIszcWmF6cUz
         NHe2EUhGHqfCX2M8WCjqau0zjHyz8DB/6IH4tHXDpvxdna47dHcTS93XtFiNpNoaYCAh
         uzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        fh=B3s+xBuxVx7mbs2yxnJVaal0cuBFwZT2f7iQGz4T43U=;
        b=XADHyzCMwuDxn23xm2dB1k1p0HudZ2csP4rJ15O9PWY5y2CuK5lDbcwpXNp1CussBb
         Jj853lSL1zWXwBk3BkaBgQQKBOifUZs8VZyioAyX5DiX/wGC/wLErFAf3uqivqfOpRr9
         QAKLVFpi068JcbgIugmsVwXYFD651GsZUU4nTz/KYJieqJDo2lwwac5vVGwACmXzk6u2
         uIJqBJ9VwPjBONpqW3QhXH3H6o4l4EEIihpaaiZE6vFY1MUbMKco8cnNzmZ7fvxqL3Yz
         lFgK6n15ufPNhSwWHSWVBrzNwbm/9keo9BeCwPLXchPg0tTbqhoxB/kCWwJjtW2SzYpN
         1K5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781866688; x=1782471488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=OiM+TrXRs1ialS4Tykcu0kogovr/yFJurFTQZd37c4398mW6xPlrBlQKnNlRckEhQg
         ox53b9zJcH9g9KP8ECxb6woPbfdnv88FGKVq8CgbJKcafxQ7YsEMXS3qON+33KEb7yJw
         RE+TDMD7F8Zwa0U52EdTjX8BaSPQcyIYnVvShQv/YglMyvTe1uurhd/lRLG8I9cIu3WR
         sXsiceNHZPuRscEg+PBpIf3E4lYVMnvWYeMIrXjyRoOtdcuCs8groLBC+ii4mB1atGx/
         q6/ODgJmdUEv0eEmBu8vwkPFGHVoPjcTDq6+2iv7DWcOk62W+LGOg700g6oU2iBPHLUZ
         sACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866688; x=1782471488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=k46mJJi7oW0748vDTDyidJhnQIs3jiumhV48wyPqgI3kv/fifQEAh/0H94oRwe+1RK
         04D+fQWAsa+OmhO5YpIjCgnDPp2uLpW3OMQ+QfRq0z2OBTKYRz1hgLd+XyxizdTl/cAE
         WgeFYfYAuKertsUolBHZVHwPQZBdnPi5GF5UqBRtr+Yb/G6whuTDK3fUbAk/Hdhy53ui
         Lggy9yACqm4E0Kms/mer2ucYqE6E6Joxi4l0QRhT2p1eFUPHO6IF8djKWu+ioyf/GTiD
         /ImQXRV5ipdJTuYZuIVVYr2hSWln9wxwpnrKVf4YnWFCs59uTLPQjIGFKCsw9WHcCKIp
         wTgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EFEMrbY1Mjubs14yzAgQLq2WhTSVP3zvLmcPBVX3LeeIzyo3/CkkP92QcfUa/jdo+5JmGE0O5dchk5Xfx@vger.kernel.org
X-Gm-Message-State: AOJu0YyWYtHu13z6aDelznR2thkD7vBvvaaHBXfmpmulGI7BoeT5BPhh
	6YOwzmOjnl0q98vl4i4K8j9viqxbZYjGJpoBFrBIatK/ps6QUUjvnlEB2WiQzTXPDXntL5VaT5f
	8AWjvrlbXHVC2gHEKiOpS8eRsDdA27Ls=
X-Gm-Gg: AfdE7ckNr4BwEacdnEY5oPEqXXi6IF2I/fS++mvJoCgKfE3OP8nvI2nfttlGIobAnEQ
	0qzQhqTSlsBvaWndaLdQggwDUNYoS2BVNuxLEbAGpGLA7yMiPeM78h3HPGVmjU/jhtvy8Zz5iMN
	Ybi0VyzVk17ixviEgMPurEg8XA9FC8ZN8FC5kxbPR/qU1uqIDTtVVVZg6Vd88QhYtSIkI//+j3/
	5fMq3I9ZgQC3sJ25UmycnC6BOGIwXfARfS0ZLGtQvzoQmmnRAScNoCUqH1WABbxi7CxNE554bAI
	QClXQYwyxu84CMxCzg9Af66SHBs=
X-Received: by 2002:a17:90b:3847:b0:37c:7090:821b with SMTP id
 98e67ed59e1d1-37d15cb4614mr3550684a91.10.1781866688090; Fri, 19 Jun 2026
 03:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin> <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin> <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
In-Reply-To: <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 17:57:57 +0700
X-Gm-Features: AVVi8Cd_NlwUbIL4avZasgAe7DuOI7f8OOig9UU05BKU2wbfQ972D9fz9PREhwc
Message-ID: <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ckeepax@opensource.cirrus.com,m:david.laight.linux@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:davidlaightlinux@gmail.com,m:povik@cutebit.org,m:matthiasbgg@g
 mail.com,m:steveneckhoffopensource@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113831-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,chromium.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DA3C6A5556

Hi Charles, David,



> > > > > I believe you have to use scoped_guard here, as there is a return
> > > > > from the function above, if memory serves it attempts to release
> > > > > the mutex on that path despite it being above the guard.
> > > >
> > > > Indeed.
> > > > I believe clang will complain.
> > > > That makes these mechanical conversions of existing code dangerous churn.
> > > >
> > > > While using guard() (etc) can make it easier to ensure the lock is released
> > > > when functions have multiple error exits, I'm not convinced it makes the
> > > > code any easier to read (other people may disagree).
> > >
> > > I built the code with both GCC and Clang and didn't see any warnings.
> > >
> > > My understanding was that the early return exits the function before
> > > the guard is instantiated, so it should not affect the guard's cleanup
> > > handling.
> >
> > When a variable is defined (and initialised) part way down a block the
> > compiler moves the definition to the top of the block but doesn't initialise
> > it at all, the first assignment happens where the code contains the
> > definition.
> >
> > However the destructor is always called at the end of the block.
> > So if you return from a function before the definition the destructor
> > is called with an uninitialised argument.
>
> My understanding was exactly as your David, but it seems that isn't
> the whole story and indeed I had to fix a bug in our SDCA code
> that hit this.  However testing this out, results in some things I
> find very hard to explain.
>
> It seems as far as I have managed to test, the code below works
> fine as Phuc suggests. It does not appear to run the mutex_unlock
> on the error path.
>
> int function()
> {
>         if (error)
>                 return;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
>         return;
> }
>

Thanks both for the clarification.

> The situation I hit this in before that doesn't work was actually
> this:
>
> int function()
> {
>         if (error)
>                 goto error_label;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
> error_label;
>         return;
> }
>
> Which in this case it does run the mutex_unlock and NULL pointer.
> Will try to find sometime to look at the generated assembly, but
> this basically totally blows my mind. Very unclear as to if this
> is supposed to work this way or just does by pure luck.
>

As stated in cleanup.h, mixing goto-based cleanup and scope-based
cleanup helpers in the same function is not expected, so I think
we should keep a consistent approach here.

Best regards,
Phuc

