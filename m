Return-Path: <linux-arm-msm+bounces-113755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Uv/DTzUM2rPGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:19:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA869FB42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:19:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VcJynABC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113755-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113755-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393553082E6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98821AA1D2;
	Thu, 18 Jun 2026 11:11:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3DB3F0ABE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:11:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781117; cv=none; b=biCmux0YsfsG2gkAgmSFgXIyHoeqvAqsGv1Dem91gOs+QNIxx8OzJBX/881aOq1NR0nWUm4vWvUsAtqJ+XQh01E50lM2+MIMlejfEXOKK90vweyIvoP3+wvTDwQQjyEi+jNP4XCCiIJqFlme9M/CO/zss/8YV65dQWlxBfpgrzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781117; c=relaxed/simple;
	bh=AWgAFvAQViYaJeMV1jCt940qM9vOdEKhz9JyUk2u9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPuXxx51O5GeSKXOxWKcumlQh0wwpYWI5lPmkWxKL6V3Pt9DmO+z6iiJpdleU6o7F/MiQ/+sAynyn0Q0iL7RXFBS4FHZ6PWM1/jdxJ+qViFHJqHNhSASVc9hUomvQUZoTZh7SIaYtqrA6CGmIQVV3RLnDjyWT5y5BmFIxmeQskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcJynABC; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37c5b9d42efso1026539a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781116; x=1782385916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=VcJynABCq+v9JSZhdaCerbX4qRURPMt7x+r50O1YQ0Z6Czzy01iHSTHqROuTisp4QF
         77hoWRJm8DyEQuHyfi/nOdw/D0Z4xxJoaPsw1GX4zCls21UxLxegKyue3ykke7uE6luT
         NpTHBar64tpn315hJx5ritbtMC3zPOL8TmmBUu5u26GjDdYf+h/JzRw0PtcG9ruekkvv
         RZRNZPE7hZdCVuidC1gxTC9xTiQhho5lpFA1NbLFgeU/Ae900Bm0sDvRTuLlUOo2kr2v
         zfjIMhw2J9RWGzd0fxYBri6SL+f7WESfEYurBPYYfRYQ9+7235NZmRIzhUeR6NZ8qJVt
         cX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781116; x=1782385916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=oXrfu4k/qc13Pmuom48ZHEBP5uNX7HZfi56a/3ETpJ3zE3nW+59Z7BQyxY+svdhHmk
         FJpRIJ18izORBVm/r7UJac1SQm03RT1PzNOdtrV27LmoonFs2T03C2HiKMcZQkllVkqi
         ZeH+zNkqyQYLgCd1EVZ4BQlM5Ij8faxKYwuRuw0prXtWCI1uK/m694jkvtWtmHahCFQf
         R7fKOQcE2LpN6z/lc4MSsxor7n/hc5LCbfaecRIBZwqQ+diYeXpCw5F8XwBWyeva8ixq
         S/+BbZaXn2APZ+mLkQstmM2s4JMJS15rch14AxRproSZaXkk9tp9viSfDwxdA2hEqxS8
         UX0Q==
X-Forwarded-Encrypted: i=1; AFNElJ92Fh3S8Q4z+EqsKOgsFj/86CySuz6iuaz6LV0XU7csR96KJwxB22XVZyJEz1ezwCDyw8G30WF8ZQ4pnB4x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5qGu8s+u3aeBj5j1fUDytH4L+sN6Ryumnbwnau0YMOgcunI98
	22GMODKnUztcti5vlns4Lk9Ou8Vi4rBOkkSg7213wauBJI5/KuaZJIpk
X-Gm-Gg: AfdE7cmlGngMAm6/2XSVUfwfd+/hC5x4GRNrhyebpG8Fmz/rf8rZSdi2M1rgQgeYWOa
	9m+Pe06YBLRlYWEOPOXohHe/YweaukfirRRXqOIhe9zjAFMNkDZMgx8F8k8agK12rfNrvevAOHw
	t2QTtdeTasHLy6/8JSDRwmXHAyhkaaoicclAjYhjw39bnjqEQfZd+C2+D3uTCmoBbC7DYWfp5p9
	y75Zaxe63k8At+XAgDJaHTdS5rs8eTylvaSUxZbgATxzVSnqhe/s8Se9gsoFSnRno22kFRHSU5M
	9PxJ7TOM+d8IJ6W39tFuzp7laTmeUNpny6M21mOfsgEqyrjtdlwYTIeCJ0lt8Hxu1sgU6XVY/nu
	m/jpxwsq2oepLonW3GkH009Nj2nsrbuD9zihhv3ZEbHS3xiSbsULTSNBgVUoBwb+c4hz0iaXAKX
	JdBKEy+BFqr256eDOKvCjTKWLm42BxJ5tKDnsvma4XhITP4mI=
X-Received: by 2002:a17:903:3510:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c6e00b0e69mr29505545ad.28.1781781115885;
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
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
Subject: [PATCH 78/78] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:27 +0700
Message-ID: <20260618110827.232983-22-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113755-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 7EFA869FB42

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wsa883x.c | 10 ++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 468d2b38a22a..7d9e0ceba461 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1237,9 +1237,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1289,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 6c6b497657d0..89c560428a9e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0


