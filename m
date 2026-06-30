Return-Path: <linux-arm-msm+bounces-115453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z81bNe3KQ2qNiAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:55:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6E26E51AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:55:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BVm20OHk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115453-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115453-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D22A301C594
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C119A283FD9;
	Tue, 30 Jun 2026 13:51:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F65334692
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:51:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827466; cv=pass; b=MNrY1EdukUzUWxacdxplFGO3gfAG3L7p/hWJW38xqGSsndqUKK9AkGVTBXNC5hADUP7tIg+1CquyEbf6SPKKI04iKvGiSo6Z7p8mcg2Dhe5983ygxWlMshKN6pMJTBT3AC9WvIyGgxkyOA6FfeX2j7sT4F8pcls6W5HQUrvrJHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827466; c=relaxed/simple;
	bh=57Qx2LhiFMuzG8d72fpu0Nv6Bu6S04EH6MNhdzbnRWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBovMpOGr5umh6SPDeTR2raep46x2Sqt9wjBOGMEg4jP5QgKl9+lZQIBSPur9LgS4x8PtEpvAajILKPmzgr9o2GPtQj0idx7GlXA1GdIyOwfJ1P8UbyO4rwpMRK0eq+9fDtiMukpz03vl0qlZzom9VDVPi74UQJx+Tz6aUQWNwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVm20OHk; arc=pass smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c9e89fded0so21706465ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782827465; cv=none;
        d=google.com; s=arc-20260327;
        b=DGc7KPSpmdGAgI8CPTpmcOtnjkfz8/UU4OK0HHJONrMYi3u4hFbvytYA4x5UYDc9xl
         +fNZnSMxubYFmFTj/iqyfC3CEkIKujX8Pr69Al2KIr0UADhO7ph08XVh+NqwhNpEDtLF
         dL8vptPbpphpUYVzbPVRms6CSxO3sOgzOZTb70CiOGG96D6lmaSuzWkrTPUJUtpGeU8L
         yb0OIjUohxhjkahHqJrsjdJGwSEAA9eHGkArklTKd1TCOrkrxbvpQX5ZPlm1mTTRxdGy
         p8zw3J/UOjL6U4mFF4VgGJkju0rVgkPXCHdlylaBiqSM6NyjBB0PHLVOyBs/4ujoip+B
         m3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        fh=DAhDI4Tq9KcWXRmtt2VqnU7jgTNzP76Q9yqjwdEDOmY=;
        b=K+NG8reRvjtAU5GYlXK4KKlfBOOqJtFA46AyV45gzypal3/ipubMx4fRhPO1JYM9Cp
         p3TschPUYuKpHR57/LMKBuyDSXW+XC5M8anHWDDSU/L5vRCpqUt2zLUHtLVjKhm7KvVD
         pLAJjqp7v+0Of1tkPRgjb1bYRK1I5sxbyy3Lb0XxQAHYdMTj02m0LmIQrJsPlF4eOVnM
         vp0Ndv+9yHP0h7LWn8v6TDAOiyoOQbkIlr0PoIvRfq3F+14c+9c6I8Yskz82aGvkCRp4
         jhP1nTFO/aaAb5TotxhdxFwg9ktcFeyM3FHCbuCfUDDnM1f2KZlwlbwudMEUJwCy8mQu
         HTkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827465; x=1783432265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        b=BVm20OHkO2ysV12cv+dia37H/g/sz1K7XHeB+B8efvfBHVWYEbcB/FU9z8Qdemmhvq
         GJmh1nWD2zM7EHAYABvKzHIGkGdhFON2AawSUFUZg4OZS4H1jTa48igQUc0exa+k4Iaj
         kfK6StxzwSmVTnwiUDWeaiAxR57ZUaij90eRBRizpNvdhyWhkNz4VvYPcW5uk6wrj0Fo
         4+Cgm+MTXoGRFSfpoR5LTH1mnrR+pV/AzLZngvAYOUBct1ahQ3e0VQiCiZeePlKlssVj
         G925LQcMdHwSsyRf3tPj2qv5X9QFadTMHFsVpZ96NNHLKiI3z6H8mvpwT+K7MmWekmjj
         zeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827465; x=1783432265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        b=XtS6V2NxEdW+ts3k1pprJ+q9r6g70JfeecBYxy9U8Ss2UIt8v2HzXdWbP5tYW2e6ct
         1FiNNwLIIJhNChPI2Hb0j5vOs2ba/PDRyNhpso7ySGYYdWufcL+q6Sr2B8+bZv3MHg2t
         nFmpNY1pR3x9QxSs5XGWoDIcsPrh7A8X5tPFDCJ4UuCe3b7ZryT9ISXL1Mnx5+kZoyOT
         Uu4KyKBatlAitJzyarfPsdKQwZAvyXS3mAECr319lC4cPOM9V1Koqd2tE+ukw3sekPJO
         35hIhuljlKt4wPOBqCK8TemkFupXa287khP5Fxd1HVC2b0hGP5sOIMOBdKVfn160LCvu
         lrEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBFElg44mncOnKSPztmBs8U17TTFnPephBF/b4nWhb3shPd60pIFL+Q0325YnOFIpKAZ2W6CaxOT3MYG58@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtotnD77kR/Eqkf+HnKeUd6Kfy353cgyN7ldS6ZbWbFRJ+fLx
	AvYjlRLaTuuiCQ5BmfaDKmsetBUUo4X3Iuzdqupu+cWH5WTKPLI6EirHSm06HH3qfTcTUR9Ym2p
	wfji2uJby0eZVvORTrs/r9gmiGiPmT9A=
X-Gm-Gg: AfdE7cnQpdRYlWBaTgWnBznXeeKxDw4fupPhAYxaur2m/ymEO2ibSpyCHY+L2Wcps7e
	8dgUzKILkecM6ByMzKYIlj5Hg8C8WIH7QGQFKA5CL9UYQb77u4P/4x0RPFh8lH85H/5mJUNPqYQ
	aV7urtJAsWXOryX0/MGxCcNftD2NqGzailQ1M6feA8HBNoRqTUg01di1vcs0PZ49/NI4Ho35RWR
	ObGmMvFI+1pJNdESiQ6ApwROzpThk2GjxjI+4N9/gH5ob8yrZUp/ggLY6dezKQY9Huj/6S5k/au
	LZ5B2TletYkKU9lUr8WYXMdYR9Y5tQYt3wHvSwOx2LSbqQcAjnaIXcrjXSzryQ==
X-Received: by 2002:a17:902:e947:b0:2c9:c517:d078 with SMTP id
 d9443c01a7336-2ca2ea32743mr30876155ad.36.1782827464698; Tue, 30 Jun 2026
 06:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com> <20260630092821.650c30ec@bootlin.com>
 <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com> <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
In-Reply-To: <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 30 Jun 2026 20:50:53 +0700
X-Gm-Features: AVVi8Cc6YVwHmJJJBcmL6xlBLsZj8Ul3JarMT_3ATDvT8NUt9u8sy29ELCp0KAM
Message-ID: <CAABR9nGGTRTWTSDmzZ4OcXmQ1zmWgnm8yPN5vM1DFLyn=AgwOA@mail.gmail.com>
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Takashi Iwai <tiwai@suse.com>, 
	Nick Li <nick.li@foursemi.com>, Support Opensource <support.opensource@diasemi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Srinivas Kandagatla <srini@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:herve.codina@bootlin.com,m:tiwai@suse.com,m:nick.li@foursemi.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115453-lists,linux-arm-msm=lfdr.de];
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
	FREEMAIL_CC(0.00)[bootlin.com,suse.com,foursemi.com,diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E6E26E51AF

On Tue, Jun 30, 2026 at 8:29=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Got it. I'll make sure to trim the unneeded context in my future replies.
Thanks for the reminder!

Best regards,
Phuc

