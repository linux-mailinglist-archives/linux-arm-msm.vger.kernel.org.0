Return-Path: <linux-arm-msm+bounces-113639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nR23CyGbMmoA2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:03:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C12699F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:03:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=L1iKvp6n;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113639-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113639-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC220302DCFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656114028E6;
	Wed, 17 Jun 2026 13:02:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB52C402432
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:02:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701336; cv=none; b=C+3dLc8Ddx+Xq3foWJAkw9TR+gGKFIAb2OumS3AklT7dCLZ+QA0LrfkeSWejHCcZ6Vl3ziUutYEGWPA00tVDaXVyrwstIr3Qk8PDXTYx4IP7C92lXgEpzeX5SEX1JSvfvM5hrh8K8+xchHnnWJEsV7KsZcceQnG1j/hMLnHPjbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701336; c=relaxed/simple;
	bh=ER7cBoORTtCo7YHQmTGpBnqKr/GhDtCtpgQSSh5vv20=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBRB5cPURJXun9ke6OcovBP1/yEHrRRWB55l5hWHQ9QqC9cQNfjs33uq91alV1kGgAVJH0cAZ11cK6Z6G7xBDxBIwPpH5+rFXIYjeJusln0CtsP2QvX7gM83RvTlyuBUDxzdEbgCxdDZVEY+yd0VkJsZVHJfSdJkg6lsgW74MhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1iKvp6n; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b64c8311so55927505e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781701333; x=1782306133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=L1iKvp6n911t1/z4RYAVzXONkBcZHcMSNrWXpD0u2bS8HOIQ34kFk7X6awUB7pVQ4N
         218Ufk2su+5ij6kCRPLZjz78DZLtdmj3inQiOglyjBdUQU0JHf0/mYn+kA24ZCYXBHr5
         YtrftHA6ZH02alaH3DcjucF/kG+P1w2EeFx6SjPdzy9Wirc2NrZm72ONjLZbj5zlk0eA
         KotaMTkmVn8gCxyhqoGzKbgjItmnAGfVe0zww95D854sqmHW81mMRZoPZ/GRvRNrsQZq
         oyA6CMMkDvVh9yc6+lFS1nyOVqchpQkZN3G6Z/5V1Fye/gghO4QsTxvL8XpUyYXjqBEq
         1zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701333; x=1782306133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=UbcDSpMp77LsR+EVWbw70ifbe2SMTPkhsn0x2RAeCdD41TLiuL7mBuGR5j99Z7xbVR
         FvRcDtOOb8UQ1uGSioFWRq1OWiN/rKCa6GtnSKAdgZKyEkWEz1yDn7I1TG3K88nF9IV/
         rrhbDesDojNnAhYlClcUKZm2ptamcmEZGRs+2ZHMuiQSzbskTvJugEIMUJUoRdPsuSOL
         3pj6oyLtfQLgM/ONRo6X908XZ+6O15Ey13I+ucWJXNO+zFQKEwfWl05bozXSdskwf/HG
         pJ/NrXiaULGMWdnu181LT5xe3P1JZ77OXy60HGFvjFgSBS+gtggfQM4WzBy0SoDoeV/2
         5gVw==
X-Forwarded-Encrypted: i=1; AFNElJ9xULF4vBvu3XLgZ9GUtRLWivBsGsTn9HCmABswxOr0/POdWK2J1AWQVvaeWkGHRmmj9/aVVPfCU+NIGxrx@vger.kernel.org
X-Gm-Message-State: AOJu0YxftVNOBm4GuPjMzogojb5SI5mwt8G7mBgWVvCCE9pWgiuStEVA
	mer7JAVJpfo0+dzmR4vHQ1JNOA9FlVVzrCxosrTIdGGt2yorOlJRAHcu
X-Gm-Gg: Acq92OHhSQu4rqVOvXNrxytI1RINU6EeajCxEHy1ROp92UBW55m4Rd5ZCpinL7qtH+r
	EGU2YwXCxJVr4B5bPzcyzXPLFqljQRV4ln1OrPy/OilbJozW3KCH7LHRXi2ZdyZuXOEFJEAY2uU
	YWShxWYilNbemNurcSPIHfhxwSIQpK2XXsfGR9+THtn/3Ax+5S2rKRzOJu4ZopE3T5xtoEybFua
	xAAtS772KuFRbgdoAKPrT9NJ5cXxvJuseexAEI96wnAU0hz2EoJBXmWQGFM48cxz6pp6indrQL1
	8aj7sviKupCrLTD9R4wv8jGKfoJyxrdhENTeZPboUS2JTzQjGMe9h1DAu8+RPYfi6YyHJOsNauK
	CbPMwzKjskQU46iIKoCQb/iE/M2ykhdKy/sBmuRhZ0dt5rq0tQwSvF4N12pDeUyYZVY/oq2hVwj
	Aobl264fQpY+6iftTtq3o4YY56sPbgYDQgL9CFqJggTQoiRIQj3g==
X-Received: by 2002:a05:600c:8189:b0:492:32a0:7f92 with SMTP id 5b1f17b1804b1-492333aabe8mr70111375e9.12.1781701332662;
        Wed, 17 Jun 2026 06:02:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4ff67sm157906775e9.6.2026.06.17.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:02:11 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:02:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, Benson Leung
 <bleung@chromium.org>, David Rhodes <david.rhodes@cirrus.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, Support
 Opensource <support.opensource@diasemi.com>, Nick Li
 <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, Srinivas
 Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260617140209.3f89706c@pumpkin>
In-Reply-To: <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113639-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ckeepax@opensource.cirrus.com,m:phucduc.bui@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:phucducbui@gmail.com,m:povik@cutebit.org,m:matthiasbgg@gmail.com,m:st
 eveneckhoffopensource@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,chromium.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,pumpkin:mid,cirrus.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0C12699F10

On Wed, 17 Jun 2026 11:57:49 +0100
Charles Keepax <ckeepax@opensource.cirrus.com> wrote:

> On Wed, Jun 17, 2026 at 05:31:32PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> > 
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> > 
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> > @@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
> >  	if (override >= e->items)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&priv->jack_lock);
> > +	guard(mutex)(&priv->jack_lock);  
> 
> I believe you have to use scoped_guard here, as there is a return
> from the function above, if memory serves it attempts to release
> the mutex on that path despite it being above the guard.

Indeed.
I believe clang will complain.
That makes these mechanical conversions of existing code dangerous churn.

While using guard() (etc) can make it easier to ensure the lock is released
when functions have multiple error exits, I'm not convinced it makes the
code any easier to read (other people may disagree).

	David

> 
> Be worth having a quick scan through the rest of the series for
> this as well.
> 
> Thanks,
> Charles
> 


