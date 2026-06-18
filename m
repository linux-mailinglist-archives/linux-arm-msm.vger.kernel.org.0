Return-Path: <linux-arm-msm+bounces-113744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GFWYMn3TM2qrGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:16:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C269FB03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nZmftjfe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113744-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113744-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13F9030D6577
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782F33F0A95;
	Thu, 18 Jun 2026 11:10:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3264D3EBF02
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:10:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781022; cv=none; b=UP0Y03JCAhDhlXtqyxl5Er+KUmmm49ApGwR4fnMMYMRiGd6IrnRXojGrLGeYcxoqYVUpkm/X1jn47amTdVq48K6Qz2HEY2hv+y191DKO+UBkhqGC1TJEnWk8+qXMGAsLQJB9c7q2Lb/bCPH9XMpu1lfxHMV4lX7oQEdynone4PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781022; c=relaxed/simple;
	bh=8buMC4ZD9JZFNnEFGS/4j6mdWskmC/d/IQI+0wOvt4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E427l7+N0ONrCcUTOcO+CoOVPwFxYuelllhzzPxquREQk49car0AOg2QSFnWWJgwnRXGNtgaeEJwrsowufSoo5OHzkfoH8dogQ0+ZlKHeVKDzjqvACZLEAppsfHsYpNCsGDjL6R/SZTB8oXtuPjgo5iifOK6VfRux7qj62KWQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZmftjfe; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c68190ade4so14539215ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781021; x=1782385821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=nZmftjfePDSEEt6YvZeBQvd1i0RyS4ReYGifcdFr9IXtpWg8KTTSz5LpR/NXOvYW/w
         0j78qQT5b/liiJS2dWzCTM3PUxO758gSpKk4iaI5XeZUZ5yAeYjrX5/BXu1JvjAt7z5q
         0UeX2CwJiZ44gnjCIGOpuMDY4t13ObUK0iBS1r4qG9mp4Jlzx7YwHiN8uL8/b7k76CZ6
         OZeYwBsWeXY4JeXs1O74dyGD//KeZoEy7vmtlOD9k25Hs1g/FenILsFWvg/x7V0y/ImL
         OxDsKLTypjtwVMlmDHRUqxhduetrWqcKkINKTZUegXlX3FiQlkOV7id+7k+dIWPn6T+6
         Kpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781021; x=1782385821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=X8fEJsu+mvFcty9bxcnOmiF6O579Z6cbMpgelhtc2C0/gA+qXAADKMzPLmZWcvKJO0
         qebFKXpvF3iKikKpmgZ6Xs/5IdRdfa+qIaDppotLKWvMDukKXGEiqs2/d2BIowiPW1YP
         blzucH2RnCmgwel5NquDyP56klaCescLMl2uZT2Wsb2dihWRxP1vc+YkEoqeII5XU6TC
         KUZ5sIpZQmXNr4D5+duAUNprx5R5/AU6j35/XcjzgvI/fRYYP6G35VqCO4tUCP9nkLvG
         suJO8DGeEr3XH2inklvVJIQZG5c36fQEODC+zCBjw5cn+Y7a9Th20BJZc3KVtmj9dH6D
         euMw==
X-Forwarded-Encrypted: i=1; AFNElJ/LeMAlx9SDs+OoOs8s1W5jJ+UNbNUx3GS24+PORcsSvDFVkEXLwaFEnCWvbv90RLbKNgGFquk0bU8sRf7M@vger.kernel.org
X-Gm-Message-State: AOJu0YxyoR84LrhV04+5JWTpTDteIvpbHdQjOUUDzQQDqAlatHUeW3LN
	z9qnrpQVbRviJbF9hPn9Go6gTs/V28qHQMwg4afo86WARvdZDhAMMd35
X-Gm-Gg: AfdE7cnBYmZHMG/d49XKtuvPPA8HfA7gcPpId1PwxPQ+rSVjk8+VpUiyWYW2t339lTi
	wiyh0lntjLovwzv1le3Pdfr6b0h28m0VjLtyZ6qhDZhKruxVgg0DDMN09BAp0ur0FTjyNOnlf5+
	fjdr2Mo8+lM8lSjj7G8T/N2kU0QXaZp7J/RFg8Nou+x6+T0WT7tg/lh3HnXAfk2AkGgZDEDcsjh
	yGWrGz1ew6z+ysh0AgrvTO7xrrrxpyRJwhw6+z5s5v+JKaQCh9IfM6AcIbiPmozoqd9hrZoIuik
	cvb35HalIf6PZkQBDVe6m1LZDbSey17gvZ5QuGf7F8yk92dCZ2qSjSHOa/iaPpbK0bpgJIKM2X7
	9nQR+YJTPuzGCCBE8ACPFRdArj3EWIrKumUsqhiNcgVgTmP9CV5nuIZkQKDbVIBXWwFBQeFrkqq
	JBopb2IttOpi3EKV6kypRoG/1IS3eRbG1xh8Fg3Lv0O0vq36A=
X-Received: by 2002:a17:903:19ee:b0:2c6:c9e0:2c17 with SMTP id d9443c01a7336-2c6de3f353emr31079685ad.8.1781781020504;
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
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
Subject: [PATCH 67/78] ASoC: codecs: wcd939x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:16 +0700
Message-ID: <20260618110827.232983-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113744-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 664C269FB03

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wcd939x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 010d12466722..922b6a0423a6 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1923,7 +1923,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1941,7 +1940,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1957,15 +1956,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = req_vout_ctl;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return req_vout_ctl;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
 		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
@@ -1990,9 +1985,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		usleep_range(2000, 2100);
 	}
 
-exit:
-	mutex_unlock(&wcd939x->micb_lock);
-	return ret;
+	return 0;
 }
 
 static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0


