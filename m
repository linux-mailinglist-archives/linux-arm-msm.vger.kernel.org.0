Return-Path: <linux-arm-msm+bounces-113541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 34fkEZ54Mmrh0QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:36:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E126988BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:36:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bxpu4Eac;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113541-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113541-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D819313DCA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243D73F39EE;
	Wed, 17 Jun 2026 10:33:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF23F6C58
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:32:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692381; cv=none; b=fMaGtIXisz3oKd+BGKYk3wGCgrHhO3LKDo5uHV2tHvAwz5dXa2retTPB7xkBVQ79vAMGSvrm7F8QgqKXyx2K/OHaVExkvg8v63b2/QVU9vtpfpQX23Ywc1JQUrN9cRBwN1MG38+udpleeOJ08nEGlCoK7L0YlgCXTqCDzokOIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692381; c=relaxed/simple;
	bh=UB/a7mDSvTJHdOqH8tC7wDihHMb6zdr57dJos5YfbBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DvrD29keGMzsxs0kET7yHV8WVriIEEClQFkOc4urrM0nh47hjpgBJSzrTWPYZI2oIZSpDDaAR//82R8H0A4ql4Fy++qgopqoKywLA0yoh9001UFRYopwRfyPsqjnFOAd71Ub/IW/ZgIvVYyD1p36z/QsQKmgSqfKic7TmIhsIug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxpu4Eac; arc=none smtp.client-ip=74.125.82.175
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3042a388168so428889eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692379; x=1782297179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=;
        b=bxpu4Eac4EvLKNNVmQKyLrNJr+Yek8DVfERBoHYcUMRqIucp6ByJ63LzuY1eDE+1N8
         UhbPvCAyaaRShW4o/oMJzU1TwP5VpCNMoFLd+YFR0xuVyo4r/cgvuGT4W0BmJw+4V5hS
         07IxzvDcuSZS+qAPF/kHl2Wl3XqiYWkKlIE1DdvFwtE1u+s/EezhixpkvMQo3b9ZES8v
         743nhXAlzymZtxiomTPY3CTE/RM+CszdH10ugDxCGVwvtfTzKV/K9702DLm2ZI2SrFBK
         JHY7DSw4+aOZBqMnQ5USga12fC9iwGIh336AE+MAXGSF0N2sZ025zUWMYb9ybAIVI7Jc
         YkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692379; x=1782297179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=;
        b=Ujy8CFPSLXnMzqYZGbSZu2pbic0oquXPVZ4jwlVCsQ8bxxrdfEbrXil6xHhmzmhR8I
         OF/03sWTeMtxirUjx3ttfhOTRWoSQXx/+pzIBBWo25+HBsZzc/BiGFFLIKKn6xRrtjuB
         z2PO00jd/MAPwjm/Dvge3kIUBGT6C0PkrsvWZ28JvKxjU6ynPPfO0BcisS+eJdbNn8nT
         /9XQ9f6qTmwCntQlWEnU8NY7wzjUrZOXLJQ8R/oZ32spKDc68g2LyvvoF66t6yr9oRU7
         PNsnVtIfNuQ4Jv8x5ZvT5jXP1hNonWyoUagl8gHyLW4ZcPtyBMWJfFL2YblcxlLOL61V
         nprQ==
X-Forwarded-Encrypted: i=1; AFNElJ/N3GKwRHIH2NmLWHKnKJq4Sg0GtK3/4/D6icDEt2MMgQJb8pFTA8eOxUiuAvwNGge8MsBplJxBTppGYyFw@vger.kernel.org
X-Gm-Message-State: AOJu0YzHk37kJK5OmQIU7qvf+C4IYCl5EwSu74zo1hodrteAxEAghczT
	/aqHkkUyay88umXXIrvi8oLf8YnrrxgJQUp3LeUzYvOjTnxskdUySuCY
X-Gm-Gg: AfdE7ckNPmn/hzAC5J/Nf5pkahRN+Afr0NgPZ8gjBTu15t/HAEcOrMGw0d/5hG+HkqR
	4of9k6GkaRzjzlZ+NA2mnunA5m6PqHViIkZ01NcIgX+3UyT/SFRA5QJRFtIvyyW8dAXGHEHOR55
	GWde6KvCwqHCyCEesDpNU72mWsa91iTPh7rf4bf81gkyenCaZK4O8cxp5RWofrayk3d4+6d8QC5
	Ma1LWVGCf/j8wOdOR+JVoj69uyJktf822RMO1XKCseKaxydv+hunMZUaiCulHCYw/XX1eywf5TM
	qYbQ2kE3R8R26rnX8gJJALZ6yDG9VHwzfBRnkFp6IcwDrGk2rJEkmBabC19AMG9zipym0oN/UTn
	WaHifDB9tnUnlHDmwrqka6rqyKSfzzOcc+Xb9CzGVELvddhcMpAYPSOQwuRHLgkfN/YwF6RRu1a
	eyP6ovrBo7N5MkVlpQMRZl+9cHkX1IHN6QiZc3ptMe52GGDT0=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr687132eec.10.1781692378517;
        Wed, 17 Jun 2026 03:32:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:32:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
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
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/78] ASoC: codecs: Use guard() for mutex & spin locks
Date: Wed, 17 Jun 2026 17:31:17 +0700
Message-ID: <20260617103235.449609-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113541-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:ckeepax@opensource.cirrus.com,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:phucduc.bui@gmail.com,m:povik@cutebit.org,m:matthiasbgg@gmail.com,m:steveneckhoffopensource@g
 mail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,chromium.org,kernel.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0E126988BB

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in the ASoC codec
drivers to use guard() and scoped_guard() helpers.
The changes are purely refactoring and should have no functional
impact.

Compile tested only.

Best regards,
Phuc

bui duc phuc (78):
  ASoC: codecs: ab8500: Use guard() for mutex locks
  ASoC: codecs: ak4613: Use guard() for mutex locks
  ASoC: codecs: arizona-jack: Use guard() for mutex locks
  ASoC: codecs: arizona: Use guard() for mutex locks
  ASoC: codecs: aw87390: Use guard() for mutex locks
  ASoC: codecs: aw88081: Use guard() for mutex locks
  ASoC: codecs: aw88166: Use guard() for mutex locks
  ASoC: codecs: aw88261: Use guard() for mutex locks
  ASoC: codecs: aw88395: Use guard() for mutex locks
  ASoC: codecs: aw88399: Use guard() for mutex locks
  ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
  ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
  ASoC: codecs: cs35l56: Use guard() for mutex locks
  ASoC: codecs: cs42l42: Use guard() for mutex locks
  ASoC: codecs: cs42l43: Use guard() for mutex locks
  ASoC: codecs: cs42l84: Use guard() for mutex locks
  ASoC: codecs: cs43130: Use guard() for mutex locks
  ASoC: codecs: cs47l15: Use guard() for mutex locks
  ASoC: codecs: cs47l35: Use guard() for mutex locks
  ASoC: codecs: cs47l85: Use guard() for mutex locks
  ASoC: codecs: cs47l90: Use guard() for mutex locks
  ASoC: codecs: cs47l92: Use guard() for mutex locks
  ASoC: codecs: cs48l32: Use guard() for mutex locks
  ASoC: codecs: cs2072x: Use guard() for mutex locks
  ASoC: codecs: da7213: Use guard() for mutex locks
  ASoC: codecs: da7219: Use guard() for mutex locks
  ASoC: codecs: es8316: Use guard() for mutex locks
  ASoC: codecs: es8326: Use guard() for mutex locks
  ASoC: codecs: es9356: Use guard() for mutex locks
  ASoC: codecs: fs210x: Use guard() for mutex locks
  ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
  ASoC: codecs: hdmi-codec: Use guard() for mutex locks
  ASoC: codecs: idt821034: Use guard() for mutex locks
  ASoC: codecs: lpass-macro: Use guard() for mutex locks
  ASoC: codecs: madera: Use guard() for mutex locks
  ASoC: codecs: max98095: Use guard() for mutex locks
  ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
  ASoC: codecs: pcm512x: Use guard() for mutex locks
  ASoC: codecs: pcm6240: Use guard() for mutex locks
  ASoC: codecs: peb2466: Use guard() for mutex locks
  ASoC: codecs: rt5514-spi: Use guard() for mutex locks
  ASoC: codecs: rt5645: Use guard() for mutex locks
  ASoC: codecs: rt5665: Use guard() for mutex locks
  ASoC: codecs: rt5668: Use guard() for mutex locks
  ASoC: codecs: rt5677: Use guard() for mutex locks
  ASoC: codecs: rt5682: Use guard() for mutex locks
  ASoC: codecs: rt700: Use guard() for mutex locks
  ASoC: codecs: rt711: Use guard() for mutex locks
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721: Use guard() for mutex locks
  ASoC: codecs: rt722: Use guard() for mutex locks
  ASoC: codecs: sigmadsp: Use guard() for mutex locks
  ASoC: codecs: sta350: Use guard() for mutex locks
  ASoC: codecs: sta32x: Use guard() for mutex locks
  ASoC: codecs: tas2781: Use guard() for mutex locks
  ASoC: codecs: tas2783: Use guard() for mutex locks
  ASoC: codecs: tas5805m: Use guard() for mutex locks
  ASoC: codecs: tas675x: Use guard() for mutex locks
  ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
  ASoC: codecs: tscs42xx: Use guard() for mutex locks
  ASoC: codecs: tscs454: Use guard() for mutex locks
  ASoC: codecs: twl6040: Use guard() for mutex locks
  ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
  ASoC: codecs: wcd934x: Use guard() for mutex locks
  ASoC: codecs: wcd937x: Use guard() for mutex locks
  ASoC: codecs: wcd938x: Use guard() for mutex locks
  ASoC: codecs: wcd939x: Use guard() for mutex locks
  ASoC: codecs: wm0010: Use guard() for mutex & spin locks
  ASoC: codecs: wm2000: Use guard() for mutex locks
  ASoC: codecs: wm5102: Use guard() for mutex locks
  ASoC: codecs: wm8731: Use guard() for mutex locks
  ASoC: codecs: wm8903: Use guard() for mutex locks
  ASoC: codecs: wm8958: Use guard() for mutex locks
  ASoC: codecs: wm8962: Use guard() for mutex locks
  ASoC: codecs: wm8994: Use guard() for mutex locks
  ASoC: codecs: wm971x: Use guard() for mutex locks
  ASoC: codecs: wm_adsp: Use guard() for mutex locks
  ASoC: codecs: wsa88xx: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  11 +-
 sound/soc/codecs/ak4613.c                 |  72 ++++---
 sound/soc/codecs/arizona-jack.c           | 194 +++++++++----------
 sound/soc/codecs/arizona.c                |  25 +--
 sound/soc/codecs/aw87390.c                |   9 +-
 sound/soc/codecs/aw88081.c                |  17 +-
 sound/soc/codecs/aw88166.c                |  23 +--
 sound/soc/codecs/aw88261.c                |  20 +-
 sound/soc/codecs/aw88395/aw88395.c        |  23 +--
 sound/soc/codecs/aw88395/aw88395_device.c |  39 ++--
 sound/soc/codecs/aw88399.c                |  14 +-
 sound/soc/codecs/cros_ec_codec.c          |  17 +-
 sound/soc/codecs/cs-amp-lib.c             |  10 +-
 sound/soc/codecs/cs35l56-shared.c         |   6 +-
 sound/soc/codecs/cs35l56.c                |  56 +++---
 sound/soc/codecs/cs42l42.c                | 222 +++++++++++-----------
 sound/soc/codecs/cs42l43-jack.c           |  57 +++---
 sound/soc/codecs/cs42l43.c                |  16 +-
 sound/soc/codecs/cs42l84.c                |   9 +-
 sound/soc/codecs/cs43130.c                |  96 +++++-----
 sound/soc/codecs/cs47l15.c                |  10 +-
 sound/soc/codecs/cs47l35.c                |  10 +-
 sound/soc/codecs/cs47l85.c                |  10 +-
 sound/soc/codecs/cs47l90.c                |  10 +-
 sound/soc/codecs/cs47l92.c                |  10 +-
 sound/soc/codecs/cs48l32.c                |  28 ++-
 sound/soc/codecs/cx2072x.c                |   4 +-
 sound/soc/codecs/da7213.c                 |  36 ++--
 sound/soc/codecs/da7219.c                 |  59 ++----
 sound/soc/codecs/es8316.c                 |  30 ++-
 sound/soc/codecs/es8326.c                 |  29 ++-
 sound/soc/codecs/es9356.c                 |  29 ++-
 sound/soc/codecs/fs210x.c                 |  86 +++------
 sound/soc/codecs/hdac_hdmi.c              | 116 ++++++-----
 sound/soc/codecs/hdmi-codec.c             |  16 +-
 sound/soc/codecs/idt821034.c              | 120 +++++-------
 sound/soc/codecs/lpass-macro-common.c     |  11 +-
 sound/soc/codecs/madera.c                 |  31 +--
 sound/soc/codecs/max98095.c               |  34 ++--
 sound/soc/codecs/mt6359-accdet.c          |  12 +-
 sound/soc/codecs/pcm512x.c                |  17 +-
 sound/soc/codecs/pcm6240.c                |  27 ++-
 sound/soc/codecs/peb2466.c                |  15 +-
 sound/soc/codecs/rt5514-spi.c             |  20 +-
 sound/soc/codecs/rt5645.c                 | 161 ++++++++--------
 sound/soc/codecs/rt5665.c                 |   7 +-
 sound/soc/codecs/rt5668.c                 |   9 +-
 sound/soc/codecs/rt5677-spi.c             |  35 ++--
 sound/soc/codecs/rt5677.c                 |  77 ++++----
 sound/soc/codecs/rt5682-sdw.c             |  23 ++-
 sound/soc/codecs/rt5682.c                 |   4 +-
 sound/soc/codecs/rt5682s.c                |  16 +-
 sound/soc/codecs/rt700-sdw.c              |  13 +-
 sound/soc/codecs/rt711-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt711-sdca.c             |   7 +-
 sound/soc/codecs/rt711-sdw.c              |  23 ++-
 sound/soc/codecs/rt711.c                  |  19 +-
 sound/soc/codecs/rt712-sdca-sdw.c         |  34 ++--
 sound/soc/codecs/rt712-sdca.c             |   7 +-
 sound/soc/codecs/rt721-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt721-sdca.c             |   3 +-
 sound/soc/codecs/rt722-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt722-sdca.c             |   3 +-
 sound/soc/codecs/sigmadsp.c               |  16 +-
 sound/soc/codecs/sta32x.c                 |  12 +-
 sound/soc/codecs/sta350.c                 |  12 +-
 sound/soc/codecs/tas2781-comlib-i2c.c     |   4 +-
 sound/soc/codecs/tas2781-i2c.c            |  20 +-
 sound/soc/codecs/tas2783-sdw.c            |  89 +++++----
 sound/soc/codecs/tas5805m.c               |  15 +-
 sound/soc/codecs/tas675x.c                |   6 +-
 sound/soc/codecs/tlv320dac33.c            |  77 +++-----
 sound/soc/codecs/tscs42xx.c               |  44 ++---
 sound/soc/codecs/tscs454.c                | 106 ++++-------
 sound/soc/codecs/twl6040.c                |   4 +-
 sound/soc/codecs/wcd-mbhc-v2.c            | 142 +++++++-------
 sound/soc/codecs/wcd934x.c                |  46 ++---
 sound/soc/codecs/wcd937x.c                |  24 +--
 sound/soc/codecs/wcd938x.c                |  21 +-
 sound/soc/codecs/wcd939x.c                |  19 +-
 sound/soc/codecs/wm0010.c                 |  63 +++---
 sound/soc/codecs/wm2000.c                 |  27 +--
 sound/soc/codecs/wm5102.c                 |  12 +-
 sound/soc/codecs/wm8731.c                 |   3 +-
 sound/soc/codecs/wm8903.c                 |   3 +-
 sound/soc/codecs/wm8958-dsp2.c            |   9 +-
 sound/soc/codecs/wm8962.c                 |   7 +-
 sound/soc/codecs/wm8994.c                 |  51 ++---
 sound/soc/codecs/wm9712.c                 |   4 +-
 sound/soc/codecs/wm9713.c                 |   4 +-
 sound/soc/codecs/wm_adsp.c                |  87 +++------
 sound/soc/codecs/wsa883x.c                |  10 +-
 sound/soc/codecs/wsa884x.c                |  10 +-
 93 files changed, 1330 insertions(+), 1863 deletions(-)

-- 
2.43.0


