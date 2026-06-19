Return-Path: <linux-arm-msm+bounces-113823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F8SANVb9NGoRlwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:27:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED56A4993
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:27:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Xu2EGv2Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113823-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113823-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0F2A30166E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 08:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817D635E937;
	Fri, 19 Jun 2026 08:26:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642FB2D7DE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:26:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857588; cv=pass; b=aG6SUr+Q4DLaDW6DodcReFlOcHaz/Ad0Q7Zp4ytvH5X/CxaqRPMLwY8B3UoLyndzYVGDFDH12mKCD7ubxyOpu2c7Nsi2pUXw3WvhjYySOXLkTc1xk5YWF4INNDBQoBS9eoMpeNkgSnVq4cCIofYd9Z7hDY/LFhFFWDALG3TqtQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857588; c=relaxed/simple;
	bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t80KNRWC0jGK8v3tAdJREokoiSot841V6YJ4NZU8oGZT6gOQ/ZKqxFQ5VZ/xuJXxJsSX4cAxnfumLmR7UaL7z2yBhOAw/Pell8Jh92baqEBHIuy4u0oFf+qUFYoYwbGbczF7tdWAyh+T2kxaMRPKvK2Tj5Ubu5yIEcjfNSCdBlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xu2EGv2Y; arc=pass smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so1176653a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 01:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857586; cv=none;
        d=google.com; s=arc-20240605;
        b=NcO+hvf3QJQy5vayCjP8VMkz0GCH/+qstmHbm+6xYtUUzWMzsK1JgWk/iRrq5oJQFQ
         GtI5sHS+4hqxPzHyeohALAfAvNgIuYhOf8ZKVJglUU8khfd6j3k6yvZi/MnyZwhv24/K
         vHXTwa/OlnwdI0evStv9k6rk7piq5dFoGI1SnyZ8Pr9rYM/xlA5xDEW6DKef1J5RKf2Q
         oGafjjgeZbjCqHZ19o5KgjNFly4Jmx3rVQ2FdK96Wy7Vs59m3jnEpaYJr9j0P36SPsFC
         Z/jH8ZUOU6Niv5t+6rIgOuv0Q1e4IC9omuiFaFp7ucIcj8QijThmBYlRQYIIewKcywsZ
         g2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        fh=/cU7RjDFggGYGh0VL0KzaAkS26ORiFawm9E94Sa4QT0=;
        b=HEledQEYYnTFXpn9JdABNXD1yWa/BovkO+LhvEZYXrO1mDxYf3WvGmKPE2/D4UvL5f
         FQ6pWP9hjfKshqPLXqhmrZlj7wNFgfXRRVmRvS8D8iI3i1PL2dv39Wdux7Tng3ZgyL/4
         yLv9KXJJKEDciUMIdWkViw7EftN/kP3/gqIkSlaMVp8+D9WflVIZYafRdD/DVidPFvc6
         gZcnNlMF8sGrckynWSXMpsNDH4hX7knTYl3iPLr5Wkit71Be5TEVQJ4opEBf8m7Lytqi
         vb5iJtPK/H85NE7XIc5zL9oLZf5Wt2yyY8Op9DN3p0VyfFXl5Z84uj+nSjaqq53cHeZm
         tnVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857586; x=1782462386; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=Xu2EGv2YSGIjOWLNQEqKLgDFhM5g5rNy6TiQC1Z7Vn/8+DF3lLGaTeYdVPshX23EN/
         XwET/iqHrZBs+4kNw1rfO8vWkK0pIJNf5Ua3wwsdg4Ys6ThW5VUfml9ARu8s1ISXeX9K
         9nlZJxtihXj4LjuTKaJMadvJLJ7Q6Z1HxC+jMLpBykwZShBvWDRYV9FREnBcOo6BGMyH
         mWVwsPjcIxjhRvLrJFITMmsGpoaCRIl8e9STI0z6ya8y4ERrKFUns6IQmlWHU9HXm8lX
         wxoFJFLMXDqAODhAwk9aQQcerYug6OLZx8ruA3zJ8BgFKQejXj07xVETn9BChsHJ06OW
         e6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857586; x=1782462386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=DlD8nXo3jcm3ADB9N9G/njznU/RAE4nfbdc58FMF0c/liAf1jpAfkckdpuPLfHL3vC
         x1mx8WBNTDTzb5cL7k9R24OERcPxgd5uaDlyT5oY1x1w3q9vnGBQET/cYYRlxqw10JEG
         Id+wJBYnTPsQRt3XgriPRT3rCpkbQ+lkL74E3w9W/ugRa5djyGBgWRZI/hc2WMkPpMl1
         FepvJo1pkaSYPg11qcxs0dmpukOW19vAu2qfBobI7hyZEosRwT/39JInc0RdUQmaqOco
         d3mPZW2heslbghJTBxac6Ukc8PVpHrUguAmHyAwi1KHz+eDPli8rqiZLUo5ZaHkEmcLM
         pINg==
X-Forwarded-Encrypted: i=1; AFNElJ83RMuaYbc++BTr9H01L5jQoCYQJicdu3xPiMoVIP54EqcIP6w6nwmzY5I7cmaQVJnUMQAwaKBha5Wavuvg@vger.kernel.org
X-Gm-Message-State: AOJu0YynTUbxNao982kr59MJ3X24ivgV8LJlV1vUyXJ+jftEoyA+eWga
	8it9XUrsHdDQ3ZSbZhHpJGMT7Wa/Rb4TZFVklqv3dl4su47Oifd4M8sJSANHj0/ly9RVlM6Z8wt
	EpH1dkT0lkkx2Sj+l+vmNSUQTfKA9Bw0=
X-Gm-Gg: AfdE7ckznn6Wh16qTnjra9zhoLeF/VMPZwTmTYkvjZjOj9w3YOz4SUmGTGIMxLs+5SD
	9SdQJzGzfBBlYC0S43fnq14SZHQjrMr/ptmgCQR6bbqFpq0igqfyNGCYFpDY/tsOzdwCZAjVeh8
	tDYEIKoF2hgFn4MLMDm0EtxLxS0DHMrEh2RO4MvG5WrU5DhtViA/jb/ehMSZDsR9x7AuQ+8G3Rn
	WOVa+woAR5RIYDFDO0GsOnoBDzp977lQOt+puZtn0FOsoI+yrDpOJQACszTpP6YPnqDbPc0lYln
	iuHjK0pcB/2wtMlyqIUkKVAYWHg=
X-Received: by 2002:a17:90b:35c4:b0:36d:cc9b:2f67 with SMTP id
 98e67ed59e1d1-37d1e8d2625mr1979109a91.19.1781857585816; Fri, 19 Jun 2026
 01:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-12-phucduc.bui@gmail.com> <ajNud7QkwF369lBY@google.com>
In-Reply-To: <ajNud7QkwF369lBY@google.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:26:14 +0700
X-Gm-Features: AVVi8CddXW5ZNLmY1o-M3ykiX-yfQTjv2vw19gnq_6wH9bwOdl1r4oKcoEQ6Mfw
Message-ID: <CAABR9nGVAiUpnmnoszLiNDC9ooXx8e9YFmMhv5aWLfaik8tjHg@mail.gmail.com>
Subject: Re: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:ckeepax@opensource.cirrus.com,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:povik@cutebit.org,m:matthiasbgg@gmail.com,m:steveneckhoffopensource@gmail.com,s:lists@lfdr.de
 ];
	TAGGED_FROM(0.00)[bounces-113823-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,chromium.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CED56A4993

Hi Tzung-Bi,

> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>


Thanks for reviewing the patch.

Best regards,
Phuc

