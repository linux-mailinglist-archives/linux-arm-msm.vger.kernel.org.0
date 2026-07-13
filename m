Return-Path: <linux-arm-msm+bounces-118648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ootSLFSJVGoSnAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:44:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 154147479F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:44:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RETpMi5e;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118648-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118648-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB682300B606
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8A8385521;
	Mon, 13 Jul 2026 06:44:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94770383323
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:44:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925063; cv=pass; b=Z3hvBRDhaGDnS91ZDDj6/acl0hFlSaXL1CCM3mL/Fk76B/qkpQGf+5Kf1CAzqkPTLxROwAG79B2TeL9CLbfMXLJmU+fWL8kV4+P4rMWjPaGjZLU2/m6HaElvkfvfgtQ+tUdnm2VqJkfLt7frIpvVc70fay5sSqD7ZM8tVWRbay4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925063; c=relaxed/simple;
	bh=tCZX3NCic6BVe2JnxKdTxhPYBW5qoICqYwNfWeZ3J/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K//WCtns4H/Q+fMVYUmkfCBTbmV2IPWQLzH0G1Ftv1F1bJT1xlFmPYmFu48pZV+/SuurAyMKla25jQnipxEdXiCf+eRP7ZBe7WkINavN6u7S23zDa87RGBfXJExljLo80DDlwjqmf9jJzwvdcRBuoJfzU7qcyzuNpHXRobGpxIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RETpMi5e; arc=pass smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cad8076b01so32560775ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783925062; cv=none;
        d=google.com; s=arc-20260327;
        b=THvaZHq0WjKi0iL3ESjalyRH7FjFwet5TlbX1P8fzWagS0Ucr1Ennb2KA6NRVFWKao
         nkCPtUBnKGDiFOo5DG+Ftm8yiJuK1R4lpKOt26Hx1UmHde6nemuQi4UZyshzJSI1q33n
         ge/OF6oqUngqRvmGEftv+S8FIf0l6mPem3y2N6idEWKoIDFpuPaGSghnP9utgQZzNVEe
         QnN/ea/B/6tSpNiTYqG1Dl7p7RvZT88g3Cbia0yDgPwPJevmjvf8idvCb1432iTSy3N2
         NmhoTd71IVcT4giAVBncB0zbmpMIAg5MSldEPZu+zl9+r+r8phhwqQUr/m8SYh1QJQ46
         tTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        fh=DCsbDl95reLulXLroQnhhOaE4J+nzWl1OHuoDgCyfCQ=;
        b=gmgnD6hh0kYF+V1ADiaq5SZJkR3xO3myXoLcFwqDFsQzGbRsPJzRaRE7Xksk8bAkj1
         FiMwY22dKS1gjtnfKc1Rg5g0fXX+rSVXsm7tw1sb0d6cxKEGS1sI9tgDvov2zspzKYzB
         xbp4JYl7GzVKO8rFZHz7ClZy8H0c0/V9mi7Wr+QweH4oFJt1t5/nicGxtm0otYvEPPI9
         uNzHLb3GuCMoh2LsIJVDYPFpiHIQpTMQufuUpL8zEh6Eo+o5SU9JXCvZn1poMwvX0Z7Y
         H7eGIo+F9MHc9DRSmwMu9Jyr6Yeaj/jGK8hYqvQbaJf/2vXZiNXYCekHoJBeanky7254
         qDJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783925062; x=1784529862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        b=RETpMi5e6FxiNi0K52vnUTjg17nG0WTZCfOipCRNhjhDDff1iBL/pk7MNJ6Cjz2bwC
         qPlOkfgzNxlQBQg4NThdOlnfQaKGbKF1Uy32C0R5xQFxFmoj6XIFE+XZ0h4TI7jr1tqs
         h9HhtJqzAig33xBkb3RdGCqr1Uk2d1N5LHqP71e7yQZj3lkt4ohFMFTqGmVDAvKx0H6r
         CPdUw0cbPO4gLDiBSEUZSzOeM+tN4M8hnLfGzTtHibyaClMziCj7pqzX2sua1d1NZjxX
         tXMaKzJ8+8wUN/YU0ZHn046UFXTrrMPRtAGPxKKZbZks1CSibmb6Xm/h+FZpUyWSQkPe
         l1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925062; x=1784529862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        b=JMN6S2D9AWdpGmUIpkeDyxLf/HY1Aopq2uet0e4Mhsfrb2OQc4jqIeHnESo1TTHOWH
         C9eYpQ07/WgudvOVK0FWigN6B6gPdg7gBIARxNs/3QSawL/3Opgz6OIX2i1YfA36lsnZ
         S90mSRmm9NgIMxL8p/3l5RY7VBSvxEUKPsoyn78bghh8wW1UC7VqtCU0X2VMB1chr2W6
         i6R6PqO+hsdYkJJFw2kFjF6/a4VL7nfbMGCwEP6GC4kwfE3OP9GMfCddFWh7cDOxSqwO
         tQb6tKUk2eeG1cUrSJ9Fh1MEEQ1zhbgsAigPGiLYOlP8mRY7Uk2xGuB41kTWzD1isNvO
         ki0w==
X-Forwarded-Encrypted: i=1; AHgh+RooqmApm6aX+TQ0q62HcswLeyp/BGTwnesUcK9qYruKWRo0Rjg+4Jkrb8u67HAg2GcHS0Ojv1mF6kQYdv4S@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLwwiFg/bc4AI3aU/oLw4vKSUifJgMDUlg3t5ZayROXvZ3YCd
	5VdGDzbTZQm+GhRNQMHBnPz31P2wZk+/jvhCBwjv0xxlft3KKvOLUYIdOVtZrUb/JB8eSzRfL2n
	WbXHy6PMZoA/n5HAlO+OhpJUee0P3xEE=
X-Gm-Gg: AfdE7cmevyjM5ivKeUhxgH1dCGA9N7U+1YLvEwBQ7tX9WQMOeBkNLMpQ0gLsUdUhxly
	jSk7cX5bL+av20vBpnezoiqVzsRNui/Drjd2k8vKaZnzS57Iax1Z2NsfSBh8sl5jnv0miVr50if
	BbMOQEWvNDCpf8h5IaKC68Nhu+L2wTfXdg9wolGmbV9QMS0NJrw3blwie2dz8xGE/BeqJAl/j7C
	RVw2IIqVifh7+47tC1BLwGT0KtUjU9xHEfhkPKA8994v5UY08w8zhE8aiik0lM9w/wOtM9OS5lx
	Hfo4/wFuKl0mn0wX1+BNLjcGxos=
X-Received: by 2002:a17:903:2983:b0:2ca:d666:df72 with SMTP id
 d9443c01a7336-2ce9ead1556mr77128045ad.21.1783925061877; Sun, 12 Jul 2026
 23:44:21 -0700 (PDT)
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
 <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com> <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
In-Reply-To: <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 13:44:09 +0700
X-Gm-Features: AVVi8CeGlggaa6vmgFhAFOdY55QEWtxhqiyXAaixKicXSNM4i0jdxY8z3i5uafQ
Message-ID: <CAABR9nHvhufH-+2qg9DDa+2PsU5T_qn9EV25pNwirKdPeSdX0A@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118648-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 154147479F2

I'd like to confirm one more point.

As I understand it, cache_only must be disabled before
re-writing the paging selector registers. Otherwise, _regmap_write()
would update only the cache and return without calling
map->reg_write(), so the hardware state would not actually
be restored.
If my understanding is correct, I'm planning to submit a follow-up
patch like the one below.

---------------------------------

bool cache_only ;
cache_only = map->cache_only;

map->cache_only = false;

for_each_selector_register() {
        if (regcache_read(map, selector_reg, &selector_val))
                continue;
        paging_ret = _regmap_write(map, selector_reg, selector_val);
}


map->cache_only = cache_only;
-----------------------------------

I'd appreciate any feedback.

Best regards,
Phuc

