Return-Path: <linux-arm-msm+bounces-118544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UhP3JGxrU2r6agMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:24:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0437445E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:24:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pDojmsfC;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118544-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118544-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FE403011744
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE8A39D6FA;
	Sun, 12 Jul 2026 10:24:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA938E106
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:24:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851880; cv=pass; b=Pt/hqiduCPCC9Fb6DK9WZVbayZUxk5LJAhnhV4KY5EB7acYiTU4utKSSJpM492hKl8l9m00yCEFkgkkAL0IvMx5yI3RJwXlWDGX3LjIKaiXuYHTsOd8qh3xLufN/cb1TxjsMyKXAr3x1rlT1i2himwj5I1Yk7b5ethTVU+212VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851880; c=relaxed/simple;
	bh=gO5G/WXSXTxf11dmOatF9hQcCgto02cM5ALw1laq7M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9AqW1xCg6MkxlvOyMH5xTAhkZ7KeELP6vl/q4vP8/L5DtYfj+vf632ByqXSU/HKX+tmX29qXaI8rd/Q5/HuMcLkdEiAgcSo+HmTNp8AFIg/jFaA9xcKClBwdP7kEJ571WEIJMnvQjSTdnnHge5eKNX2wSOMi6IDmL94JJVz7CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDojmsfC; arc=pass smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so2225802a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 03:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783851879; cv=none;
        d=google.com; s=arc-20260327;
        b=YYL3iTNxdKX8lzc9sRJb+JZkA1vO0OUzqs8fKmvNvyKXrxrqSs6Lo7DOvB4d06WuVA
         I5kewyKyQvP1AM+ecbC/Z/UJnVpic5bQhUlMTpTfPA0zHgxq2z8kKkf9brbUxMwaIacB
         TaKrOTE8YQgcPp2tlmJWN5o1Bt9h9J+QEt2ilI+oMkVq2rF0ampsqZdpestHmOgMh3RW
         1wxc4lZ4iogK87v6paPEHFYQgBsErFAR5OEHgRm0SnqRonU97M2ab4JgUNP/XGLrK5uw
         cV7xCgFP/dWFniAC/Up90ZRr/Fy8DKagTRNKXc8ha0qBp5s+govYpsDx/mTvgHAoury3
         U9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        fh=6ZyfXV7VUkxcuTuIFyVbUjr8W4RUlQ927dUgrITwCvc=;
        b=MEDGqBPb95DBD/68/EClUCkqO+08gJeLy0kktDVZ9jIBRj5U0r+Pmznuht+VfcQva1
         pV3+dBMkIEcCKhKD2nELeWWqrrFv5YQh6s1Ll18DUQDhvj7mII24RcM7L/akukvUu8Az
         v0m5pVLDGcIwk+EAZZQzPqdGchQ18Y0Ea9Z09DKE/5JcJ5U86mPCpdltQdIR3ftGJrvC
         0rEcuQSuEhMvq67GcGz6Ht5ExLBQf7fWFSBDamX/6GlWJS2SQmsWeC5+lcQtm915re8Q
         DJxaf2Err4hRCTqfb3UIHNpKcWeMFapYetBvaXUYifihLAaDVuOjSLvma/T5oCz3VHfH
         /1lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783851879; x=1784456679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        b=pDojmsfCyAf1iddwjq5DD/IOfHlu8KFqD3TattARpnKgLeHJ5lCelqhBDyIT0WWxRh
         WnaSDVwYtOX41l396rd7RyEMVyu1vdzEwKiKrqX/k5e4NmXLqnHKDAwLr1q3NoETg6nR
         ukgDR0uoT6uCAR3O6SxsehprSjOqLTJCVidTYFz1Idjl4qlKko8jSJQH+s+vr8qPgX2C
         pca7mIt7AF5vWWpRXL/KOO+3n6sZ17KjpWAj5rMjGuO4nNLDnJnwLg1M8roTPjF6FFkW
         a7H8qhLYBnIp4TgaKn4Xuk1V/gOaX5Sfpmz/vGibucPCUDALqnCyn+YrNHWLH/z6WkWk
         SQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851879; x=1784456679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        b=mAqjQNVGS48mjE54Pmmirxb1fzTk74sKmUln9cJiNceAAmqsCUZqeObueASu0g6DYQ
         3Pb9lZ59SwU/hUnO9yGKtcttLsnaNIMNeLz+pyo+nGz2fyFSg9WCiAzV6VDK36Y++c/P
         sW1H1fm6NUmIQEAdOTG9Ohe+ZPixPArH3lylnXKMIcMBEKxs8vBWvtBUDQZH89lHdMOo
         za7+7/nzq6pTNZnYhbaPTDrEBnZowucnD9xIQZn0XHxg2dFarVsShvdE2pkprOiuDq2s
         rVSn+2oU62+vuyFCrcHPG/W2nc0Fo7Qe9DjyrB3rYS02LEx+TIYVS1U+KrQaz4OwMOwY
         bwWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/PLuOZNG6t6MUETtxMJL/SyB96wTpt1kN/pU/KXkh0c96a0HAtVWlrXV3pJccHsxG3y6xYVnqXckv9KZu@vger.kernel.org
X-Gm-Message-State: AOJu0YyrUNbS6rqsxX51X/RIvjlwl5+rQW6C0mIf9f1bC4lbLgoxhAtv
	CiClC7M5BEZs28RUjWGZGakThQDcoU60cj509D96tdJRgKwTT8BpVs4Leu5hXF6RnAMbo0oMPlW
	N04YRYCM6yhiOgH+gLhkVMhLjTTARhTU=
X-Gm-Gg: AfdE7ckTN77qIbh5RpY1Vj5L33Eo7lo3p2A1R0Q2r+Asjg0PD/fO+nhP/dzRDTfDAqg
	BIHsTeVpFiXhL2/NEj3awIQhc3SosNw40MhUZMWlHTP5Loco+OVGYMaZVrvnnDOg71tpky/kOVR
	JEr6CC5dCEZGJmACl3NlIpbMNYqNLrtCqEIh4PGiP2GiUtKINmSNeOtjwRaNtqoRsfJKWI1fNQw
	fzUA9xpsHiHPO6bNoT5dd3aK3UDxXGR3dPfRHEe0qiq7AuNVwedFDdIGQkApvZTtBVPZbxi87Tb
	n6l8vsh56sVg4ZpmeG6eGj30+7Nqkl56JjM7COMUF1Fe4+zkTq4fQWwgye+1KA==
X-Received: by 2002:a17:90b:3846:b0:381:1fd3:e4ef with SMTP id
 98e67ed59e1d1-38dc774cd1bmr4524877a91.25.1783851878641; Sun, 12 Jul 2026
 03:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
In-Reply-To: <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 12 Jul 2026 17:24:27 +0700
X-Gm-Features: AVVi8Cca40gsSncc4EvdD5aUN3fJc8X0TaVsh-jOUWXPUjZCZtF3SWItFvK7afQ
Message-ID: <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118544-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[suse.com,foursemi.com,bootlin.com,diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE0437445E4

Hi all,

While looking into removing the goto label in rt712_sdca_dev_resume(),
I dug a bit deeper into regcache_sync() and how it manages the
cache_dirty flag. I'd like to share the analysis and propose a small patch
for review.

1. cache_dirty state before the out: label in regcache_sync()
Before the out: block, cache_dirty can only be in one of two states:
+ true: if writing the patch or the sync itself failed partway through.
+ false: either it was already false from the start, or =E2=80=94 after the=
 patch
   has been applied successfully (i.e. the patch loop didn't jump to goto
   out) =E2=80=94 the subsequent sync() call also returns success (ret =3D=
=3D 0).
=E2=86=92 The logic here is sound and consistent.

2. cache_dirty state after the out: label in regcache_sync()
If _regmap_write() fails when re-pushing the paging register here,
none of its three error paths (-EIO, regcache_write() failure,
or map->reg_write() failure) touch cache_dirty.
Only the cache_only success path touches cache_dirty.
So cache_dirty simply keeps whatever value it already had before out:
(as described above), even though this write genuinely failed.

3. Proposed patch
-------------
ret =3D _regmap_write(map, this->selector_reg, i);
if (ret !=3D 0) {
        dev_err(map->dev, "Failed to write %x =3D %x: %d\n",
                      this->selector_reg, i, ret);
+      map->cache_dirty =3D true;
        break;
}
--------------
This ensures cache_dirty correctly reflects a real cache/hardware
mismatch whenever this write fails.

Feedback welcome before I submit the formal patch.

Best regards,
Phuc

