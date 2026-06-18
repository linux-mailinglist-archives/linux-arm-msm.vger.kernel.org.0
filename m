Return-Path: <linux-arm-msm+bounces-113752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id riR6NGTTM2qhGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:15:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDF69FAEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:15:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EH596rOh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113752-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113752-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 040A33040C9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCC03F1643;
	Thu, 18 Jun 2026 11:11:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFBA3EC2DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:11:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781090; cv=none; b=t/IdEdb3mCeM5/xh9Idki2QYHKqwdF9VLu7ev/t9LUbR+aoYYOyG4EfljYJz9nQTuSwaI1/Td9x8kkuiu+OLo6eM3Sr2Oyl48xfCDriB5+Eg4ukhGAVnyKnpZjEcWELljoEFsXmQtJaipOflo+lM4/Kmp2jhdaEyZ1bRSSG4dY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781090; c=relaxed/simple;
	bh=86Mglw3sAgj0wl4SUUHXpfzbY0JBBRM8KnaSg4QllDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzrmOE4ub31UsHrhnyYVt0TKqucIOoaN8sXtjTTXtWVtA1eLKH3Uhn5nYeRX8zItu3Y5QxtXvE6vfguzfsypNEDV7bYc52llJal6kqWjM6mmdfJ/LqnVcY7qiMS6/R4gpBJ3Al9JWjbUI8LGB4rDbu3xOKXBHwy122WYpm7Tlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EH596rOh; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b8d414666so389189a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781088; x=1782385888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=EH596rOhl7P6CX33r4ZAwfaVvoiTb/XrdQRkm2fZmf0CIFDZ45rPPUZcD4yaiPDqBY
         vvWyT6Dkakm9n2AMb3yZ6v048v7pZMxJTht1rAHX9sHnqLkfuKQvHAxbOs5EoHJig+QK
         qhu1kPYV2kARymRu55fAKzO63TCDLzb+ky5beD3sjLKR/Rw++TtOiGrnAN8IqFskxuIz
         rk5+uV2EqlljZwSlhisjUKp06uAnd2DibgPKlS2RsnXRVEw0QcznP7c10FZhg+4gEj8a
         jF8CCoUXzOMSMMXketj76Qc5EypRP+6EODI5umJrO8u2WTXS4jpYu7GBilXXuz7PA99k
         zmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781088; x=1782385888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=Oh420JJhqdMtqeqrhXZwJ8RZwodXKOQn58cUo3nTnZgr+qnMKWF3V+eGjewSLB1Gxv
         +HjV52FhnzbjIMKu0SxGS/eDhG2F7hrVIzozBPgBCaSH5npKkszmCgCsocTeou5ZNayt
         Al6K4hMCqrvPFw2FDKjV4GgxJiZL6bvA+gHjobCE6iKiGCKzXgyEYdJa182JsfCYbBKz
         HzqcHqLlBR0CXQJfV5sj7MgutyJzDMbc/hLPNcvwcBTUhaEPESCJaR5eTpdlK5U9GzRX
         ScxUHUDEWbByVCixURnJYUoAjK4T5oRMwTtLiKdaS2g4xC0Upj7N5NjysjZjlN4QrPnQ
         5TMw==
X-Forwarded-Encrypted: i=1; AFNElJ//1K6+CyzUdXXfmH9rTJrJ/quRDL5cCKMqHbL7E0IxZZ+rhIKDOIl4EufaM98LVT2PnuIWv6K0+EYxAdbB@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9mE9lqP7bKw/CxWp+WSz6j5G5Q299MthfBl1BCOKfp1VPz2V
	8IB5r5mNe9kzkm+qbryDl27aDIXWk4riQMuSj0bDOyUzzSSl9J3E7HWT
X-Gm-Gg: AfdE7ckOP3zy5TOUXlO1Mk4s2S9VEYaPjSToekls7XxW5Hpobf9qSZH7sudgVEqW92U
	sgaBHZ0zXGqky3xx/VCuhKVOvT2kZ85o8n2TnhAMQfMY9ZrtMaqhY++tQcuB6CpT55/1808ADA3
	ra7GPdfEGeS6YhpboTjZaYEEuRRiqv9vRd9Jn+XgrRR8qK0ABIbHKvE3p6qknDK0LUJU2riQ0xH
	mHeMM8TXSVvH0U9bumYUEIP+obdN0fLfre2Z1sTemoQ2mpvlUG+3iNYUuozE9GdcCki2KjV/KbV
	kDTRUSDDjsznVLnlpxZSbZLWidlcjTJTodNTgREPN9zKDl96V5w787k7GqxP32dGQ5qtmglJ3JC
	FL4st8fjiwnCxX/9OfGqAJ1m6EKibwGhak36g3WE5j9+FnMIoBJE9N2QyniwJwKIY+K64cAHMVg
	i6Kip2TG5PMsvJbd8tBOr6+GgTtoMPvXGnzCWljtDSTVsZpWKHP2D0UmHGZA==
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24421195ad.1.1781781088169;
        Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:27 -0700 (PDT)
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
Subject: [PATCH 75/78] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:24 +0700
Message-ID: <20260618110827.232983-19-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113752-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,open_circuit_work.work:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48CDF69FAEF

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8994.c | 51 +++++++++++++++------------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 1d64c7c42ed1..58f18bb0057e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -766,7 +766,7 @@ static void active_reference(struct snd_soc_component *component)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount++;
 
@@ -775,8 +775,6 @@ static void active_reference(struct snd_soc_component *component)
 
 	/* If we're using jack detection go into audio mode */
 	wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_AUDIO);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void active_dereference(struct snd_soc_component *component)
@@ -784,7 +782,7 @@ static void active_dereference(struct snd_soc_component *component)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	u16 mode;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount--;
 
@@ -800,8 +798,6 @@ static void active_dereference(struct snd_soc_component *component)
 
 		wm1811_jackdet_set_mode(component, mode);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static int clk_sys_event(struct snd_soc_dapm_widget *w,
@@ -3704,7 +3700,7 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 						  open_circuit_work.work);
 	struct device *dev = wm8994->wm8994->dev;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm1811_micd_stop(wm8994->hubs.component);
 
@@ -3718,8 +3714,6 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
 			    wm8994->btn_mask |
 			    SND_JACK_HEADSET);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void wm8958_mic_id(void *data, u16 status)
@@ -3785,27 +3779,25 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_dapm_sync(dapm);
 	}
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	dev_dbg(component->dev, "Starting mic detection\n");
+	scoped_guard(mutex, &wm8994->accdet_lock) {
+		dev_dbg(component->dev, "Starting mic detection\n");
 
-	/* Use a user-supplied callback if we have one */
-	if (wm8994->micd_cb) {
-		wm8994->micd_cb(wm8994->micd_cb_data);
-	} else {
-		/*
-		 * Start off measument of microphone impedence to find out
-		 * what's actually there.
-		 */
-		wm8994->mic_detecting = true;
-		wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
+		/* Use a user-supplied callback if we have one */
+		if (wm8994->micd_cb) {
+			wm8994->micd_cb(wm8994->micd_cb_data);
+		} else {
+			/*
+			 * Start off measument of microphone impedence to find out
+			 * what's actually there.
+			 */
+			wm8994->mic_detecting = true;
+			wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
 
-		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
-				    WM8958_MICD_ENA, WM8958_MICD_ENA);
+			snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
+						      WM8958_MICD_ENA, WM8958_MICD_ENA);
+		}
 	}
 
-	mutex_unlock(&wm8994->accdet_lock);
-
 	pm_runtime_put(component->dev);
 }
 
@@ -4028,11 +4020,8 @@ static void wm8958_mic_work(struct work_struct *work)
 
 	pm_runtime_get_sync(component->dev);
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
-
-	mutex_unlock(&wm8994->accdet_lock);
+	scoped_guard(mutex, &wm8994->accdet_lock)
+		wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
 
 	pm_runtime_put(component->dev);
 }
-- 
2.43.0


