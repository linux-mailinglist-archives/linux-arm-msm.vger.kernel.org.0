Return-Path: <linux-arm-msm+bounces-113563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iC6LNoiBMmpT1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:14:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE082698E08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:14:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rBukvJJa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113563-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113563-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 719F831499EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B73746AED3;
	Wed, 17 Jun 2026 10:36:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E746AEE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:36:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692580; cv=none; b=YpWORElP8vupUlKpPj9fLbctimlPZdu2PmW7IkXxqp5Vhy9Ohcl9vyTHTUGXtUmBQlA/HsS4Xx5hHOZ3zpTTQrqMHkmsnzQ5DdSKM7rdOuVu7DKl97lED6Q4tCGVgmIXRkQRTooOyplSMU0C9xz6JQQqT312Dq1TIi+vUuF1Z/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692580; c=relaxed/simple;
	bh=y8ow6yxkPBd9p6g+ra0bZiCZf15W/mXoZiP9ucube1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvXTpIGV3DjErhgCVEfqvwyzEPvQVGq/v2Jqv1mL23cHcJ5JteHNAVqtdJgSRsG9atV87CZom46Qshptih6kC0/jCBi3o/gTXvUm9qHd6HFlN8oTb0UXlpvKIy1U9NAxwHIxwLnwjO/XQJehjjeQ/gx5TYKIYX0uhGwgGNSMub4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBukvJJa; arc=none smtp.client-ip=74.125.82.169
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304d8362a58so601777eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692574; x=1782297374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=rBukvJJavnwHKo3H/Bg9UN/15Rxbl3BQW/l67zj1Nbx+Z/FlqMl+WLu0DkDLFCug/O
         9FY0Vr6dhekp26bCf1D+OxXULLOmO7xTK17EE1m0w8GvgNDVpCwzoeK1BQHGqL1fYudU
         JoZXLMrZxvBhOGs0VI4TanD8caJ/4oQqGD9Q1StiSNfqKcW0i86nSZ7T4KAtmxG9fDcl
         WcQ+F8NVpx6Yh2blWV/HxykzaJpgM6swULAVnewzsrUWvAmHSiMoGeGS/vgRYKDQcRFN
         5VniePPFkxgruO/7cYlrtOxN5begiJG9Olbsco3oICrbT4gyvv7N6Nd1YUfdMMp894pS
         7y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692574; x=1782297374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=Ib0EHRTSj2+HlNlRBwdfdrYQVNL0y58hZMAijMwTtdCCTO8jm975JBX4sRUvK+6xLW
         pa1X++v8et2zAbqPnzRAvLRm4qffstmQOJ5bHuqiQE5wca/rPt3aK195XLnqr3g7D83m
         50CpjWYC7A0Julz7JFGPk7PfxhoOXGE1giaLtr9lRIDfYhqmeHdfw9q86mArvVaJlv8N
         9ayO/h12INDrHETJheK9zV3WuVoRSnJGmFWbsp0K5qWrS4VHHOGrol/1gclPLvObT91u
         2oMv9gS3u6pIwzdfb44Z14uKN2g4nuO4ZNOE4N42yRtabvc3l1LtjH3+db51mJcdCWyP
         aIKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ntEqg2hHxosp+G44TDNsX2sv7YQTDzsPRMNku4LfdSzU4OBB02b18ri4T20U4amnykSHQRHAvBlqi/K+1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzch0gnkNT7ub+ZjJLORXp2hQIrzvjNPuzaN+0wZ0g04wmm83AS
	Nt61RwvOn4A4EqPgtBRPA6+gczRb/9E0aLe/M0E/eTwxwIERNQ3R3see
X-Gm-Gg: AfdE7ckrXF3BKWAMYOHgY3mV/zcM+Dhrst3CN5rpE08816u2smTYJub1m/zlxIeCIDc
	Z7WPrApxGhpV4mWtLgYhPmQVoGwGSos4sM5rF/bOYYv9SlNbTdUT8K3NwXWYY+3jlhkLzeZVL++
	sIL1T/nMtqTG3ADb77crkqm9YMwVZu1oHJU8hZG193DNAFYdua9hLJpRVOo6BrGiSu8KvXtmpkC
	kFY9UUeclTH3wgrkTWnKCtpFYRK6otRCeXzFqSOMP9/JCuEKpO/eVv5k7uFZv9Q75YL45NRTA4L
	aX+qtO9SjuwyNE6UhriSJoAfdrwUDVwF1onnD+rFdx+5UOF96bYZLkNU4GlbVlmMAFBIoVuZSLG
	9MuX7qaJ2lOiTiI3XirLucQ0qrc5hxr5iDof+tMDomNcnwo8Ektoe1CZhU4G1jzgnVOZeQQ/qjT
	4p1j8HvioAF1m04BCtO5MfK8C4giiMIzJceB3XqrAiMdRi/Lc=
X-Received: by 2002:a05:7301:7308:b0:30b:e524:77aa with SMTP id 5a478bee46e88-30be5247ae7mr89541eec.14.1781692574470;
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
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
Subject: [PATCH 21/78] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:38 +0700
Message-ID: <20260617103235.449609-22-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113563-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE082698E08

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l90.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..978149245079 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2423,9 +2423,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2455,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0


