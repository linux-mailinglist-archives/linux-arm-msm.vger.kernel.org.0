Return-Path: <linux-arm-msm+bounces-113547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EGzyL595Mmoi0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:40:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507E698977
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:40:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DYKoZ2QB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113547-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113547-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D19930E486A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFA83FDBEE;
	Wed, 17 Jun 2026 10:33:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B883F9A08
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:33:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692438; cv=none; b=h3D+y4amM78Zzff7dFb627WfO1khx4rckDBDgKcx/xLwSwEh7aAXzbMaXjh2KqkMAuzNHSv1PPDRVqRTBHktILJeK0s+MHkWGUf/Ml5I4B6qtTO6kHgK37XCuHJ4Fmfn5ooSd9GqZvuBctQyhHTeWgl7GOYNmjd2yD6bUun7HDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692438; c=relaxed/simple;
	bh=S7IkiFODoPFXZtj5+rPYNsWBbtzbNnr/sTl4Y+gY4xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gU9z7jqh+u95XR5ok+8M7mojjmH5rfNomEP4/vJBEVh3Bqt8BspTuvZzRTvViZ3L+PVz285Fu0ZbFs4BHQrusqsUW6AXlsFex4hYFl9IPlYYdgmZtYN70HafzY2RsoJ1mDbr8VpyzbkG+J6IzwzsQ6gEzTzzlFa3zjdKTju3Zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYKoZ2QB; arc=none smtp.client-ip=74.125.82.176
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304d8362a58so600308eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692436; x=1782297236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=DYKoZ2QBar2tzj/lm/oRsksPdOMxMwV3/auHTB4uk6Ttv/cMqXBbC5febKg+pfwKBa
         OSwejhGh4ileBTSgVRh+5GtfOzyoL2HEhPiKGKjTCRxynjWVnWUzk31M6UDTj2cznl7S
         b5gWNuPbOWTDojfV4maS9MELM5zkq2YnsHKxJzHe7zl1THfJDuhQWhnveda6sH0Wcgk2
         7yhUigAPP4W96NVCoDXmT5zDY7kAyah69q4TujetSI6pA6U7AAqiMUJk4s2rFrhc3e4n
         XJb1bCnfFWD14OgxPXxCWzDJCKdKrx0p4jdoodM9y+q/RfX/nD4mAzA7KcAaqOFmBdRv
         KS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692436; x=1782297236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=fPwG93D5xWayzwoTtxeE07SES5VmE3DI5EhdrBj7msmX/25QmToyiMUE9hdupCH2dX
         +wbdswIzk4zWshgfE4nRIjhcKt3Y3/gVPr2OkryitPVbXNjM87apBrpzK2jpG1XK9YBA
         lQ5vxPSh2voQG2MscNMPWnakUmCzpCIadJ7FKF0tUX6GF9HFzsC+JGg2x/bKkkONmrRx
         oe96hAB0UBnNgmeqygxOduXSKHH0v7afq+ziglRBUf4mtoIPgF+7Rxb9k3iHzm4gYf6u
         vzxOaO12aVMMkRghY3h44Q5ltBsJMm6UnP1H8onBgiv5ZnZ7vwPchk0hqQEPUkiFlEI2
         uNnA==
X-Forwarded-Encrypted: i=1; AFNElJ+bk7So94j0K3tWi6Cf70puhuJBwhoPWS6piSk52B7v7zHagV8TgK0eLIVcFZ8pkbOjT7bLnkAx+11InfEy@vger.kernel.org
X-Gm-Message-State: AOJu0YzZcMMVbLwSFlVxCum+41vzK3actkZml91rBhwlKj7r8Bqfg2SE
	QJkFW9OYj+UBC5e4yJzo9nmW4VBXO310Nc4JjZje/e3PQ3jaZuf/myT+
X-Gm-Gg: AfdE7cnLvSIy0nZM78JGgihN8t2vCeY7KIGGBx0u2C7gMaYTCjpvNT7eTawEDdpreRj
	oywDktsCd503vx3jKUgbyV6eCvrVWDIvZtmdaNEVrSnCubhe7pAsel9C9kv4yxz9dQdcV8u2xkl
	Ke0Qnky+XqVwdqvEcPIR6cmGiC8zQl67F2etGuLvQT0gEARvDTPR/ipBDcWTAkXX2MwpSthLetY
	3A14nUoaXNO48U+8zYKmYf6qIDTVMajt/Kr7KD8h672yeVv0RHc6h9SYtvq3gdau2/0uiCasFNj
	BI2YHCXRzMbBnJVh33owBSOHxh8i+gwH4eg7OijDu7dFnIXm/LxixZV1Q53IxgX/yfYH9ZtQULI
	4vlAGgVal5RzkM31mblRgKWfxAKFbjNjmjXbxK3WXoLTiM8zOZMxWbgywJwkiUa9AZRW2U8KM5+
	dwL3Elovab6Rt03sEfecXpqgHjtG2viRkWWTcu3N3OOXMb1yI=
X-Received: by 2002:a05:7300:da13:b0:304:56fc:775 with SMTP id 5a478bee46e88-30bcf567d78mr865158eec.21.1781692435786;
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
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
Subject: [PATCH 06/78] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:23 +0700
Message-ID: <20260617103235.449609-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113547-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,start_work.work:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3507E698977

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88081.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..fce56a249a1f 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -763,9 +763,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +941,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +953,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1161,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1172,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1183,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0


