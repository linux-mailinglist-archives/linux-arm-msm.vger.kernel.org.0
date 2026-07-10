Return-Path: <linux-arm-msm+bounces-118427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mO6qOcxzUWp1FAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 00:35:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579173F92A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 00:35:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=opOCEBEc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118427-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118427-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33A8D302BBED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 22:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9878404BD2;
	Fri, 10 Jul 2026 22:35:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC73B42D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 22:35:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722953; cv=pass; b=P5brk6iVy6FMVEUEFp99rVTzNU9/CB4RIXU/lIN2hfwuY2/7kI6fi9YdYzLJrM6yvRvVrqTpokJhU7RjM383St465ZCF5j5MA3KautGwHcM26ke9V6hoCkGvnQ4YyzDqhXED2zchMpNUTbDWGKaZiXcCnYG7WK9L5XeGI/lNTwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722953; c=relaxed/simple;
	bh=bF6mnDIsCnLF3CpiNDgMvY2beaAe2wRXN0+14PO5j9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtYr9nmQcecH2197Wa1nX+pUNGYaB1LNIZbpQa5SwwP7uCkfXeNUaBwU7Tlnw3YSkQAcehZsdWOXpP3wc2V4NTsaW9GwMnogFhI2q2RcnA0UEudw8JgArHA/6L85B8qER4vGEdN07VKKFPngLiGqjzv04ri3nXwNBxmO/iTk7wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opOCEBEc; arc=pass smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso1507909a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783722952; cv=none;
        d=google.com; s=arc-20260327;
        b=oaWNu2KTkZW/+Dvo7LBFcjjsbTnG0ucX3alG1BbUdrfudZf8JOVheEFjZyd8V3aBSY
         RnBEEIGbtr7Ox3rnw67gYU1YKLCVkKM0A6oGsijbmRYXhW3WA7+XCoTJCGHnMYm7aYps
         Qo6z+Bkrl/L4jwSjMJKEPBZVZmUjgtOkx8yiuGCHp0mZSxt3bvuZ5mKGAgiBrvuOn9L4
         0uX4ohJHSXuhWbYEdjURlrM7zR6b+y60AdQU9Ei6HLMdz0EijmUFvBVOHqjnw90Nt/lK
         6vYJBx1MtRBdxIKQiJ+xm09BjgWOdnGCQl20uxL6OaYhnPyozqgxSuNke0U/eMB29qes
         rt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        fh=U4bPqZHIQKeK/PFSfY8zdrAfRus96nWHLixDoU/q7wI=;
        b=Lud8PzaifeucOIAy6nDXyAJd1x3rCKo6O2YkeAMafsAPLP+OxI2i0INATskDw/Qvuz
         ExLiEDc2b3QETyMO1PTmJjv4xsfgDSXYSDQsWjonKlckv8lCEv8/3fxD5F3Ea8vcp41h
         UtTLao0poyBHCJ/WtbCsCd+MZE3YbTjt2Thq6VVGJkQih8ZCaB8yEnWUweOp4UsCfOct
         9Yrn8yqTphQg3/SM4PzEbYYJdlYJyEmCP22eXXbwEtBbLqffzI8YnSWhSYEwyE3JAVUi
         /s+P+xtu3ohv0KYKL71tv4vc0YuGU8i+3MF+qpv9sFOo0KzgvGM9MR2ggBkANNF/LkVC
         u3XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783722952; x=1784327752; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        b=opOCEBEc8XvTohSnHHBVlCkyVt7VnYD3M1A49pRz+UvofD7L6pQQR4CiS2NYaw01Ei
         3+l7kAejDLDSCC2d1JuPVKHB2RhMp9F+NK1jzxvIM04WsiggTVN41A0sPYfFDBQWqPEY
         26N7vUBhNelaGbYxc/CiIzvluy8Z9wigJtgQolAJeE2oxKwd/y8iOBxvyjtaBwV/Gv/1
         lgXyICRXFWMUbrTyaenJq6QjqNMGEsoJj/S/E470TuhFIIlG9dqM2QJq9jqKNuFL58hz
         MvQW3+u968sude1+AF5A3IctIQTMt3Jl2epWR3EA9lmM1O0luiqekU5vXOaCcJvPlnjT
         +1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783722952; x=1784327752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7+hIVLQLM/sGDz5ot7h7L83Hul9pDF/wx6nn+5acERA=;
        b=iVF4g4BULuvTUExe9037LzNnmCA/SkrvBRkvY1gtNlgqrwO01spmNPx6ILJM6Wv4MM
         E4N+4KqTuzCGnBo0COwS3IbSGBEf8hW28CHYWZ3cG1SciqWvbp1hWRHQAXfz2hd4iYzX
         1fuD3VwdoWhVXhi9wXmRxvZz1OR1y9dBCNQtZxSVoQeUHtsoO/vDVJnzITu885dypJ4X
         9dVuHwiUyOSw1yZeHeHPP33BvIhBODFBbzQlDar4k0KM9FrMTTy9FAeBkbjTf/PMBoiu
         5JFBi+Bwmg/hIxn4MHyvzlMvjZwdxl+1m0SGFd3py2kSi8UMXThV6IEitIon3EwxzvwC
         YAPQ==
X-Forwarded-Encrypted: i=1; AHgh+RruAYnU/gJvKmHYeZDaNo5ETAq54oYHpqlN7eeFVG+BxPmiuVLwMibZinjAKEkyLe/mHEzrO930T6KLi5Nj@vger.kernel.org
X-Gm-Message-State: AOJu0YzNzvZyk6AvSAY7szCtJgwkqXr3GRtXnASFC+W4Hq9dU0uce2Ms
	z1w10Tu2GRrIS7CXh7N5WvzP5mXyJhImGwS5ia2oaZz3bO4G9aEIpFZbEPtBl3vfz6CCmw6mxDv
	Sn/cX68dmjFB8jCG9MEtsZw/J9RpfkEA=
X-Gm-Gg: AfdE7cmbAd7XBElt8OJUckYL1FXcoZP+i3YUES6To+se4zvHT1xiGJEOatVqJdAZGIE
	bXbKtRPcTabqNtNcsqIAvaL0w7zXT27Pb2Mj08rTk9AtpNsUj5pYOoXpMk5NgmbNpkeAZ8/Pd2X
	Ulp8XfpinwJQF/+nK7tF4c2tSq34KlUwaTMDDSs9ZSVzU5doUKDDL9kJCSdpETiqmOdemJU0pvV
	VvHb1hv1MTsv9faXlCqa230PEAXZ68lYIlkurlK6smhTBwTitz+KDYIx5TwFg1mkVYmnHZ+DvmT
	QEIEXIiygGHK3YG0uLOTJkaSmHcNI4GiyrT3gD1KPSPS5S6z11J5G6sHk+BXzy4w85ZC4W3t
X-Received: by 2002:a17:90b:4b83:b0:387:e0db:3d8b with SMTP id
 98e67ed59e1d1-38dc77c6073mr661104a91.38.1783722951858; Fri, 10 Jul 2026
 15:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
In-Reply-To: <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 11 Jul 2026 05:35:40 +0700
X-Gm-Features: AVVi8CcV1gryT8dmwOHw2o14YhUF82x6D_iNoN6GwcJljlfAz-HFYF2Z94CVwBU
Message-ID: <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118427-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5579173F92A

Hi Mark,

Thanks for the review.

> This function does also have some goto based unwinding, there's a
> similar thing in the rt721 changes.

It seems this goto block was added recently, and I missed it after rebasing.
Sorry for the inconvenience.
However, looking at the goto path, it seems we might need to unwind the
states more completely. What do you think about rewriting it like this?

------------------
regcache_cache_only(rt712->regmap, false);
    ret = regcache_sync(rt712->regmap);
    if (ret) {
        regcache_cache_only(rt712->regmap, true);
        regcache_mark_dirty(rt712->regmap);
        return ret;
    }

    regcache_cache_only(rt712->mbq_regmap, false);
    ret = regcache_sync(rt712->mbq_regmap);
    if (ret) {
        regcache_cache_only(rt712->regmap, true);
        regcache_cache_only(rt712->mbq_regmap, true);
        regcache_mark_dirty(rt712->mbq_regmap);
        return ret;
    }

    return 0;
--------------------


Best regards,
Phuc

