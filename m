Return-Path: <linux-arm-msm+bounces-113884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CUO8MlekNmoNCQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 16:31:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA1D6A9030
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 16:31:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Hgpzl+hm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113884-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113884-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AB05300A7C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 14:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E498F3749F3;
	Sat, 20 Jun 2026 14:31:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE70315D33
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 14:31:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781965908; cv=pass; b=ZlWIVXFnW5P8XD31lKshLe3Nr4LoXvbWhuD9QP2Uf1bRuN+wDk/FLjU1dSdjB4Qu01AaoK/PGrHsYO3z6gVf97cEcLy1lUjlnpVNRflCRyISsU7753//8pmLeZWc+YDD8yzq3Noq1PJ78WIZ1DjmQ08J5iwwMhoWuhTotxnUaNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781965908; c=relaxed/simple;
	bh=wuw9iRRPLEm93Drmsp59C6lLObU7hu/HqKhoKxWsquk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeNQMQ9Jgk63NqaymzUou74lInRzwkj88Fh9zYPEHDhwDuy0PtL1A4h2uxw8UR5OVUsVIB7jODqndZG11TjDiEj6yJXPHXLmA17hglOt0nbxui3ULe5bCy4QVu66d0adqjuj1iDdkWLte9/d0GIaGCU9BBhdLxUFVRTCNnV6q0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgpzl+hm; arc=pass smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so1798078a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 07:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781965907; cv=none;
        d=google.com; s=arc-20240605;
        b=iXIUwXTUsjIcwSuyiL0YKDz0h9nfZKDFqVW09tCbfo6IeNSoGA1yZ2tgS3n1nQs+3p
         aRIZ353KpprpDk+x8MIzjHV8D1dI4o0+enhDFeeu3gYJLBmbO85aLvRP/kY05KqlwCbc
         iISVFjWacvT5IjDCXBdPoeNAIU+OHcMUmGk6G7OVa6sh12WM2960ekXH8rEwRm3Ab+X+
         P8hNAJ88iZsOMTdaCFJzqTym4bULXhCDdBwemSsxRbIDbXBxQtj0QmXyIlUzKJDL3siL
         Btyt9xPJdOghjjeYLJpnJPnzFzqLN0qF8gDukXt50Yf5Ab9aEJP4jDNaTyfY04OxRqdZ
         D9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        fh=CAsonMl1TD6LxCdXwx0unyZw3sp3m44+VebSj9nYpo4=;
        b=hWE2SDCor0gmbUkmBhIA5PhADOarSp/nSYwxZCCcsvLXYbUzugeNdBEQeWF1FOIWcX
         K7fG181kVa7xgzPTLi7GWxgf/CQoZCMOnYLBquT6ofozGgI2v1GUw27c1TiCsbpEowrY
         AjNMDPjULLTbGdBJ24GYcjgVFEmDgmbysc34lnPDNZF6FE7TEMdzqsIZR76o+BROSMOg
         Tekc0Ml6czUCMm9qNf03uJC/khpAbQsv1fA5fxQbq/QawM+qrmWuIzvVhOjT9iwfGdpv
         HNTI7hn1pBfp+iYzqn59PbdqKJK6tGDAAQjO59v3UQ60EymPqRFxWUUUnpUSuNzEgIVX
         7zBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781965907; x=1782570707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=Hgpzl+hmkAd9PE6RkAQMcORHGDcILvPnTKjDdtKuAsFuVeH/CdHJaq+8dqUC54HKng
         nMQ2EqToqmfRaWzsZy0y1ngwOoPzbySIzTD2c8ZtHgG2hOwJW08P36E+lNGv69hVluhc
         VRMriCIMJjcc5TKyboyWczT0eyCxncPfOX7MldfU57kyLEW1WaZnT9iFJEaFzLabjGWk
         xW/SSPj/UDIk8/Q51DE88zBuI9YRvIByKY9ynqytOy4tbDMK0Rg8NQ9o6dTEUD8R9a3S
         0dMXv6bKlKjtCUGZYY8/EKUBLE95PVfZZtqUdKv67h1tVULtTepl6347kyszEQU8Sy9z
         MjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781965907; x=1782570707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=IuDhr2062G7V8nyme6KC419/TFPbvaPe3ew8AbRNZxSU2ruEhCrhvj+0gjx6yocrGt
         gR888LBFDWtYfQ2ITrGi64VhNJASfA6ihcvVhjweML3ABaNjkiiJL9nc8VyF/XZy8o8S
         fw5obR4FMXBCCEOUzo7ZRe77ukTERZhgEtrS6AZJ96UfIhO49ViDZrkBhMBKS7JkDpH0
         pDQe3DgfSf+ZXSl8PM3Vetv+1yPBTv7tJ9NSq3WO5Z5fwIEhHCOwxoSr0ksQe5094Lv4
         CljiUQPujs1a8I2la4uMTGUCwkEF48Ta8Qq3QuMoQc4f6irqd9fidUPa+FUHlyPwxr+y
         LtGg==
X-Forwarded-Encrypted: i=1; AFNElJ9icH5sDXxACR8iucts/gXxW163QVBii6BNRnSojcQM8NHJ1DWqyDrWAf08RJvOHOFaqjd0YnCh0VzUWQuC@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9Hkp0FeYfuLciT7s/9CFJqe09v5b2MpGSsvKqEBDwizrSQE2
	X46g0Ua20n+RILUsS5zfW0Rcx4zgwtF2U64f5/roxlhhv2+cMdvEj9VNMSdkjBehaK3u7UXuRLn
	b330HatFjugranO7Rc74yXO5l7OH0tQw=
X-Gm-Gg: AfdE7cluxKp25Dfhr+M2UCJQwg3ruyX8oNq2jEvGiuijQ+aGcqK3MXZ9GZ1B4agzpdh
	H7Vg45Cu4iYKs216oF/YwsiqJGHOESxVXZCIbHAwX4BDK6zPpTQaY3hE6yPVODD/lyr6Uk+uE9h
	pLbQ3esMx5DGKLG8saAC1fOmN3qnJpZ8GcD/SBH+obcnQolrEbQwdDpLqzv3xgq2o0DPTS3XdKW
	B6JVe6pV+UUwCEPKIYvnGWes/jNNotnglczxkKNNEIPvUPzLOL+rOaEDhFq7+bmK2dC6lZky7PS
	GXeMCtjx45WqRkwB0hGPysbnletMDwJpHCVBwqwkYqc5g6qj/N9aooDgGi/PPA==
X-Received: by 2002:a17:902:c40f:b0:2b2:4d36:7ba with SMTP id
 d9443c01a7336-2c7252a8057mr74037005ad.0.1781965906891; Sat, 20 Jun 2026
 07:31:46 -0700 (PDT)
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
 <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com> <871pe2kcif.wl-tiwai@suse.de>
In-Reply-To: <871pe2kcif.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 20 Jun 2026 21:31:34 +0700
X-Gm-Features: AVVi8CdmzIZOlmsJ02kZGuh_kzjdhPUos4g5dG2tFnwGhCYx2Sp6G_przK0DiY8
Message-ID: <CAABR9nEdHwXpg8+6J5L9Af1PvybGt3KSfRy=LnMHXSQSHnd25w@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:ckeepax@opensource.cirrus.com,m:david.laight.linux@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:davidlaightlinux@gmail.com,m:povik@cutebit.org
 ,m:matthiasbgg@gmail.com,m:steveneckhoffopensource@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113884-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,gmail.com,kernel.org,perex.cz,suse.com,chromium.org,cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FA1D6A9030

On Fri, Jun 19, 2026 at 6:14=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 19 Jun 2026 12:57:57 +0200,
> Bui Duc Phuc wrote:
> >
> > Hi Charles, David,
> >
> >
> >
> > > > > > > I believe you have to use scoped_guard here, as there is a re=
turn
> > > > > > > from the function above, if memory serves it attempts to rele=
ase
> > > > > > > the mutex on that path despite it being above the guard.
> > > > > >
> > > > > > Indeed.
> > > > > > I believe clang will complain.
> > > > > > That makes these mechanical conversions of existing code danger=
ous churn.
> > > > > >
> > > > > > While using guard() (etc) can make it easier to ensure the lock=
 is released
> > > > > > when functions have multiple error exits, I'm not convinced it =
makes the
> > > > > > code any easier to read (other people may disagree).
> > > > >
> > > > > I built the code with both GCC and Clang and didn't see any warni=
ngs.
> > > > >
> > > > > My understanding was that the early return exits the function bef=
ore
> > > > > the guard is instantiated, so it should not affect the guard's cl=
eanup
> > > > > handling.
> > > >
> > > > When a variable is defined (and initialised) part way down a block =
the
> > > > compiler moves the definition to the top of the block but doesn't i=
nitialise
> > > > it at all, the first assignment happens where the code contains the
> > > > definition.
> > > >
> > > > However the destructor is always called at the end of the block.
> > > > So if you return from a function before the definition the destruct=
or
> > > > is called with an uninitialised argument.
> > >
> > > My understanding was exactly as your David, but it seems that isn't
> > > the whole story and indeed I had to fix a bug in our SDCA code
> > > that hit this.  However testing this out, results in some things I
> > > find very hard to explain.
> > >
> > > It seems as far as I have managed to test, the code below works
> > > fine as Phuc suggests. It does not appear to run the mutex_unlock
> > > on the error path.
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 return;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > >         return;
> > > }
> > >
> >
> > Thanks both for the clarification.
> >
> > > The situation I hit this in before that doesn't work was actually
> > > this:
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 goto error_label;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > > error_label;
> > >         return;
> > > }
> > >
> > > Which in this case it does run the mutex_unlock and NULL pointer.
> > > Will try to find sometime to look at the generated assembly, but
> > > this basically totally blows my mind. Very unclear as to if this
> > > is supposed to work this way or just does by pure luck.
> > >
> >
> > As stated in cleanup.h, mixing goto-based cleanup and scope-based
> > cleanup helpers in the same function is not expected, so I think
> > we should keep a consistent approach here.
>
> Right, and IIRC, clang would complain the mixed goto case at least
> with W=3D1.
>
>
> Takashi

Thank you all.

In fact, I have only been using GCC for building and testing. It was
only after David mentioned Clang that I decided to give it a try, and
this is actually the first time I have used it.

Also, thanks to Takashi-san for adding the W=3D1 build option. It helped
me catch and address warnings more easily.

I will send a v2 to address a few remaining goto cases that slipped through=
.
In addition, I will switch to using guards for PM runtime to reduce
indentation and improve code readability.

Best regards,
Phuc

