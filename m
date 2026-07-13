Return-Path: <linux-arm-msm+bounces-118620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ySPXINpMVGpfkQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 04:26:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF4F746965
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 04:26:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MEJWx1BY;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118620-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118620-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83B083001843
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA5F2E88BD;
	Mon, 13 Jul 2026 02:26:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1E2DA765
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:26:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783909588; cv=pass; b=YJY1vPz5l0LZATfIxaKp6ewVpq2rMh7b5QG+r9G11eqNFf2aQGy8iEjT8xdWHD8mVMhELsE5qVNNgSwCqhcLHlg05r6sgww1gJkNkfh5taheORi0KjXc96Gwi4hkOumSDTbLtKiv9z5izFv+XOqAHYAHPSvK5biv7P7z8LC2IJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783909588; c=relaxed/simple;
	bh=2vB+uhwFIY8gMPcGZcmqL/ngXLkazwzz1dcL9UAOl3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NS3mEXoZoN+NL+ZVqrvU8q1dq1G/qrzDzKTXkPFlY59g2Cij0/ZcoCwzV9U7w09tnEm9o3TOt0VhioRay7MIBG3yiAdj/8jQZH7ozwWVe1MBHC5hF9lILiZkHubzmzd11Rzg5O74d2K8MIp4Kh/9T/rtZdS0K240gFfmNQBbodw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEJWx1BY; arc=pass smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc97653887so29332835ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 19:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783909586; cv=none;
        d=google.com; s=arc-20260327;
        b=c19mWc0YaYycMa++HwKh6hEPfDVUJxbgykD35vnh7nTzRMq+5wxmTx0Ft1TpvJp0W8
         dht6dgfkvv/2fjLS8wsQr/fj0ia/Iy4z0yeAsGJAC4y0u4KlsMaO7hnRfk6Z+2AlWknt
         PRcioUkliTQzGt/+To8W5ytguirk+eddsmcM8TLHvz9gC7Jx5jA6pPIaEewUIp3CPhsi
         Ry1cpunkVxQa8dLdo2czvFMu5/U9BgdyFpUXQd0E4SACTsx5Am7XIS3vYmf9dk34yft7
         CDZ/DLd65WCc6u5RQnubVwYf9j/1uWczsq7aoDWppbrpPj/ftV3hxnaxEdkYoniUsGLe
         W5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        fh=ieuJKp5wokMxhmkVZMVauK3QCcTUYDrfeGqY12N06d4=;
        b=ORxwq3ROad45zNf1McuWPaspiJ3A89rbcGShq6bovGlHknmbLjaZjx8AE5GvxHwgSz
         NEC9xLrFvOoA4RrfZS432zJGJ+ZwgxhhFUoN2m1djzkKL/MCZoofkuEVhBKMymZHrLdr
         oxJrMrfDgu8i5LsP8yGyFLiUXIEVaQ3SXHut0GRRYi892dfdrEzVi1g4QT19m9iinWuz
         03senb76TMAQS3Z6haaaBFkWrC3gj++AShAIEf6AoeK8e0ZxNTVgntpaAHBjMaUguYd8
         Vc8WaRxrjOoYQeZpZc2hWa7yPPHR+UiUbUzGD1SrIK99YJiO1ixv38b0EBz8SAyKidBo
         j+zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783909586; x=1784514386; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        b=MEJWx1BYAAU6IPK72aJg9fQ+Vu0P9xWBzhLndGfqra3sgzedHSVHhkLuib8Ohfr8IY
         WE8oi0OvcLAr1VG77cgaF8rXcziXB2lhv09JiMV0bnhXNdbuDb6KLxexQzlvX2XN5qRC
         nBnpbHM5gN5wGRLtApHX9L/FB50ix9rnS3b0h7AnWj2K/JAFDtOUvioqaaas0g+HMRQw
         kxrVt1eUWLM36E1QutLQ37PU5SRJib3us5wzSk+yi8mM3xlQsdfvfQC/mdmKBmG/v6mD
         2mAibClTDMSEURw3kF4v8aKRS0HXzdQwz3E/EdKQPrMu7UbCKGyZriSJDcAhy9xtOJuF
         Hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783909586; x=1784514386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        b=AEKTOvWWllXvTzb9Ps164xTJuoYE8WU2bYsroSnhkJVMW96CRHhbVmmlKpzzjqtV0G
         xaCVFPJ2uVveHhRHK5dj0S9g4akHo7jyiSxvHGtlQYEWW3Ax6Q9Ve/2IEi6widSHSgpp
         /nVCqB/FgBjsdb9QytnWtURRqMHJCZZi2tSg8msRD4VqpVZOFhY9JP72GyW6tk5DBJdz
         yAfgR1dIAUb/jmeaCS001gQhS3Y+m5rTwIxbT8rshmtFzo2xUjGhQb/LWCvq9mf/1AcH
         lerAsdiqejfc/gfDzt0FU1BeZXlbj6yZp3X1elpS3yJBBW926ajrMXOVFQAodOOwQuGd
         F8Rw==
X-Forwarded-Encrypted: i=1; AHgh+RokjZE268rucXNvOC6QVE6JJp5bPULWEirrSsHtkA+vnKmuY6k3F3W2hdPlzhGG+SLNi6//kdtHEReusOS3@vger.kernel.org
X-Gm-Message-State: AOJu0YwmA+5ZifFiU15WIiyyZUsD6D7WfptZgP8Ar9GZz4aD6cFh4woo
	DW7bu+wrv0DgP0T4IDY06XVu+Vymcc8SFJiA5QsyeaM5+3z3FJjW+ciHPOy44LCUz100bf931bI
	1OWd6RYXlSgiXyDWZlQ9XcEQkEejDS7I=
X-Gm-Gg: AfdE7ckq7wOsftizq9lVqRsCFgKVQAZSTk5o3CV2X3HnpJeWvecQNDxCPwr1/cQ6nkW
	gvjqy2hwuoeKhXsXBFyRITUwd8Ucdi63vs32ol3o8Lwo2kd/awYAHCoOMZzC6ajuwFu0Quktm/8
	mCIIkP0OFR+32sONTfNZo3LoCk3ZQFi73vHj+y9Fympof00BHCcwbq/PCVclZIeNHpqCYE4+ZF9
	AfpsXBgWGuD6x9grsRo7PYskQsRZl/kKsK2qWgzBULd5krKMEJoXsOBNDvQFLd7ukip0sIufNQa
	f2tOSMQwkkeAOOHPLkMpDoAAHKbgqTkTtOFD9Q==
X-Received: by 2002:a17:902:fc8f:b0:2c9:97a8:afe5 with SMTP id
 d9443c01a7336-2ce9f27e6dbmr67887935ad.40.1783909586414; Sun, 12 Jul 2026
 19:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com> <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
In-Reply-To: <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 09:26:14 +0700
X-Gm-Features: AVVi8CcDb4bcqHg1Mp91TuPyHToFqGPv1UxLDhLLf3L4cwg_2AzYrLa7QzDha2M
Message-ID: <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118620-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[suse.com,foursemi.com,bootlin.com,diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AF4F746965

Another point is: when should regcache_sync() be considered to have failed?

From my understanding, if patch application or cache synchronization fails
before reaching the out: label, then regcache_sync() has already failed and
should return that error.
However, the function currently uses a single ret variable throughout
the entire flow.
To make the failure semantics clearer, I'm planning to submit the
following follow-up patch.
I'd appreciate any feedback.

------------------
int paging_ret = 0;
 /* ... */
  out:
/* ... */

paging_ret = _regmap_write(map, this->selector_reg, i);
if (paging_ret) {
        dev_err(...);
        map->cache_dirty = true;
        break;
}
/* ... */
return ret ? ret : paging_ret;
-------------------

This preserves any error that occurred before out: while also
reporting errors that occur after out:.

Best regards.
Phuc

