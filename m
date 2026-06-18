Return-Path: <linux-arm-msm+bounces-113740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rVM0L/7RM2pGGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:09:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0A69FA1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:09:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XYT96jgM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113740-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113740-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33D9E3034A0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776703F0A8E;
	Thu, 18 Jun 2026 11:09:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A03EBF02
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:09:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780988; cv=none; b=sxpd5BtDu1Ja21FnQEVbJoalcw1JLR9y9/LOF0asmukAKiqTL5e5/zYp8yGkW4FXOO8iysq1SZWXP5Lnainlr9G2AueSvVi48QoFNG7HGdOzdvRp9zgEWD770QYf6obZUh8HDaZceHhaCOS29T9GrXWnyHgQZ7VgddTxc8t735k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780988; c=relaxed/simple;
	bh=2YEFbdla4i9f3SYHqUh0C1+vGlG+s3hBs5AIA/oPVVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HO2enQqcCp5L7cQXhhS2QLXzTTYAH88e3m2mZQE30Pj+7ATs8D4qJOpVjVufeA9EALn3QBlPen7VzAhmcZuhCfNetIhbUG0iWEvJBYcCbjCSpPNYcgXTvRkJ60qTEfmJboD5+eg0LDbf0jIKQT12+IaRdFRnyRDUAmQ/IzhVCDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYT96jgM; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so723907a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780986; x=1782385786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+5iMTEe+TMtLaXRee64f4hO5oI+4SkVEwQJjwWAAKo=;
        b=XYT96jgMeGVJ/2txbRK6lmMO2nPM5E73K+SLd35gNju0B59lIWoBoij7Ei9vMI/NRY
         2xHFnxqgGc12GQjJKzb1y/9QihHDQX0K47EthgnQKtFHUqlMtUbozEP4By2FeSXZhEYU
         cymJuZfK2QccXPbL3WTw55gU07YfvTxTIQSu3IaWQMI30GVEEICtOkDCkJ/q2eGKhhcu
         cT4rIYjKPLmqZHzyhnUpBtV8dZJSiqPC+EMM7jtcU0t1sPosO9A/2IjtRyPB73RUsClJ
         rcR5R6uid5GBpUDR3xzw+mc0MSt44rNP8Ls6fOBrMF1QqjUcLSkEPtRTMxSQef8lgZ8K
         LBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780986; x=1782385786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+5iMTEe+TMtLaXRee64f4hO5oI+4SkVEwQJjwWAAKo=;
        b=Z1qDLHEbwNrP6S9R5prCT0Zx4sU3kj2cWFSyOmhO5dmLvqnckx22lVlM8i/GCHx3n0
         e8wSfj0SCjIMfxI5+eoy5cp/xqHQ2q3L0ElIGfLKmkLtXUxHSnOa2jJG4is8E3fH+Y9r
         RWFFHEiHLiVY2TTor7+tX/OWCF/ra2w8ASnT8ikkAjW4ZMFPORxZN5UY4Zj3nhpwuPA4
         hk2FN5NRLc4xXofxuVPgR4FX7BkOt80DAQB/720xu5K/NwO4jFQIl05M4T6M9W3pl2Eb
         8EncqVbSa/tALDpV8vEVIHQFEbRhjHB88VpQEhuGCjAZbxHJ9s1JoYpBmONHoBo0L/g8
         +bew==
X-Forwarded-Encrypted: i=1; AFNElJ+y4BXf8qk+uVPBdTnLWMyCoznsIzg5j+l3ngPQKGsGqBe1KvZFIBmQby7ZwGxq6EKciY1m9acSFTgznFWe@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKyj0MrVgiB56HloB3fcRBqkS2IgdN9O6Iq4gJrklO/d8/jDI
	eQIYn9sGkSGKBe4YnVrc+RC14AilEpR4LfxRHk/RJhKeeWTITCGhp5Js
X-Gm-Gg: AfdE7cmEBOYIiOhYTnBkfqkzx8fEjZ4yCb1cn4zH4TZXkckCFbhcEiZL7/UWtOftyRI
	Znq8j80BnZwXILitauJL6ivwuJs7lKkyg4cEsS+7jetEsJ6/a8nKA61Vm+fQ5v4Y4hwuRibBFEU
	h4M/MeDPveZdJ+pcyq+/sI6wIzP5NJvI5gn5emFhxM0S7wE0I+MVwLegi80BlHqRKkznXAPIFj7
	Vfx4nKt2oOQ9wLO6j4kDDdYQv8zBL3OFnxzVuzBWMv5qk5EmTl0jBLCplWiDwbuXI8epoan8edB
	DeMhYkoZIrlr8quP64GhX5CAN8jSY3UFaqgmyys9GCDSYUdSObVzk5PBJo4C6QKXf7tEa7PAeeq
	W+6ehSatbi12Xf96DjIVXQK5ec9QcIsLQOUzNi5cDOoPsrOjDVyMjI2UCBfOZ3uNs7yhSJQiV55
	tRCIHO/IExlgTN1icE2caV199EsHIYfvogqopzO9Lf/fJ58Vo=
X-Received: by 2002:a17:902:f681:b0:2bf:175a:db61 with SMTP id d9443c01a7336-2c6e471a08fmr36744085ad.7.1781780986069;
        Thu, 18 Jun 2026 04:09:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:45 -0700 (PDT)
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
Subject: [PATCH 63/78] ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:12 +0700
Message-ID: <20260618110827.232983-7-phucduc.bui@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113740-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2AD0A69FA1F

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 142 +++++++++++++++------------------
 1 file changed, 66 insertions(+), 76 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index bb0c8478a8eb..b8e87d0b79b1 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -419,9 +419,8 @@ static void wcd_cancel_hs_detect_plug(struct wcd_mbhc *mbhc,
 				      struct work_struct *work)
 {
 	mbhc->hs_detect_work_stop = true;
-	mutex_unlock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	cancel_work_sync(work);
-	mutex_lock(&mbhc->lock);
 }
 
 static void wcd_mbhc_cancel_pending_work(struct wcd_mbhc *mbhc)
@@ -458,7 +457,7 @@ static void wcd_mbhc_find_plug_and_report(struct wcd_mbhc *mbhc,
 	if (mbhc->current_plug == plug_type)
 		return;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 
 	switch (plug_type) {
 	case MBHC_PLUG_TYPE_HEADPHONE:
@@ -481,7 +480,6 @@ static void wcd_mbhc_find_plug_and_report(struct wcd_mbhc *mbhc,
 		     mbhc->current_plug, plug_type);
 		break;
 	}
-	mutex_unlock(&mbhc->lock);
 }
 
 static void wcd_schedule_hs_detect_plug(struct wcd_mbhc *mbhc,
@@ -517,7 +515,7 @@ static void mbhc_plug_detect_fn(struct work_struct *work)
 	enum snd_jack_types jack_type;
 	bool detection_type;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 
 	mbhc->in_swch_irq_handler = true;
 
@@ -578,7 +576,6 @@ static void mbhc_plug_detect_fn(struct work_struct *work)
 
 exit:
 	mbhc->in_swch_irq_handler = false;
-	mutex_unlock(&mbhc->lock);
 }
 
 static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
@@ -673,29 +670,28 @@ static irqreturn_t wcd_mbhc_btn_press_handler(int irq, void *data)
 	int mask;
 	unsigned long msec_val;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	wcd_cancel_btn_work(mbhc);
 	mbhc->is_btn_press = true;
 	msec_val = jiffies_to_msecs(jiffies - mbhc->jiffies_atreport);
 
 	/* Too short, ignore button press */
 	if (msec_val < MBHC_BUTTON_PRESS_THRESHOLD_MIN)
-		goto done;
+		return IRQ_HANDLED;
 
 	/* If switch interrupt already kicked in, ignore button press */
 	if (mbhc->in_swch_irq_handler)
-		goto done;
+		return IRQ_HANDLED;
 
 	/* Plug isn't headset, ignore button press */
 	if (mbhc->current_plug != MBHC_PLUG_TYPE_HEADSET)
-		goto done;
+		return IRQ_HANDLED;
 
 	mask = wcd_mbhc_get_button_mask(mbhc);
 	mbhc->buttons_pressed |= mask;
 	if (schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400)) == 0)
 		WARN(1, "Button pressed twice without release event\n");
-done:
-	mutex_unlock(&mbhc->lock);
+
 	return IRQ_HANDLED;
 }
 
@@ -704,14 +700,14 @@ static irqreturn_t wcd_mbhc_btn_release_handler(int irq, void *data)
 	struct wcd_mbhc *mbhc = data;
 	int ret;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	if (mbhc->is_btn_press)
 		mbhc->is_btn_press = false;
 	else /* fake btn press */
-		goto exit;
+		return IRQ_HANDLED;
 
 	if (!(mbhc->buttons_pressed & WCD_MBHC_JACK_BUTTON_MASK))
-		goto exit;
+		return IRQ_HANDLED;
 
 	ret = wcd_cancel_btn_work(mbhc);
 	if (ret == 0) { /* Reporting long button release event */
@@ -725,8 +721,6 @@ static irqreturn_t wcd_mbhc_btn_release_handler(int irq, void *data)
 		}
 	}
 	mbhc->buttons_pressed &= ~WCD_MBHC_JACK_BUTTON_MASK;
-exit:
-	mutex_unlock(&mbhc->lock);
 
 	return IRQ_HANDLED;
 }
@@ -768,62 +762,60 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 		return ret;
 	}
 
-	mutex_lock(&mbhc->lock);
-
-	if (mbhc->cfg->typec_analog_mux)
-		mbhc->swap_thr = GND_MIC_USBC_SWAP_THRESHOLD;
-	else
-		mbhc->swap_thr = GND_MIC_SWAP_THRESHOLD;
-
-	/* setup HS detection */
-	if (mbhc->mbhc_cb->hph_pull_up_control_v2)
-		mbhc->mbhc_cb->hph_pull_up_control_v2(component,
-				mbhc->cfg->typec_analog_mux ?
-					HS_PULLUP_I_OFF : HS_PULLUP_I_DEFAULT);
-	else if (mbhc->mbhc_cb->hph_pull_up_control)
-		mbhc->mbhc_cb->hph_pull_up_control(component,
-				mbhc->cfg->typec_analog_mux ?
-					I_OFF : I_DEFAULT);
-	else
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_CTRL,
-				mbhc->cfg->typec_analog_mux ? 0 : 3);
-
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_HPHL_PLUG_TYPE, mbhc->cfg->hphl_swh);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_GND_PLUG_TYPE, mbhc->cfg->gnd_swh);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_SW_HPH_LP_100K_TO_GND, 1);
-	if (mbhc->cfg->gnd_det_en && mbhc->mbhc_cb->mbhc_gnd_det_ctrl)
-		mbhc->mbhc_cb->mbhc_gnd_det_ctrl(component, true);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, 1);
-
-	/* Plug detect is triggered manually if analog goes through USBCC */
-	if (mbhc->cfg->typec_analog_mux)
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 0);
-	else
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 1);
-
-	if (mbhc->cfg->typec_analog_mux)
-		/* Insertion debounce set to 48ms */
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 4);
-	else
-		/* Insertion debounce set to 96ms */
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 6);
+	scoped_guard(mutex, &mbhc->lock) {
+		if (mbhc->cfg->typec_analog_mux)
+			mbhc->swap_thr = GND_MIC_USBC_SWAP_THRESHOLD;
+		else
+			mbhc->swap_thr = GND_MIC_SWAP_THRESHOLD;
+
+		/* setup HS detection */
+		if (mbhc->mbhc_cb->hph_pull_up_control_v2)
+			mbhc->mbhc_cb->hph_pull_up_control_v2(component,
+					mbhc->cfg->typec_analog_mux ?
+						HS_PULLUP_I_OFF : HS_PULLUP_I_DEFAULT);
+		else if (mbhc->mbhc_cb->hph_pull_up_control)
+			mbhc->mbhc_cb->hph_pull_up_control(component,
+					mbhc->cfg->typec_analog_mux ?
+						I_OFF : I_DEFAULT);
+		else
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_CTRL,
+					     mbhc->cfg->typec_analog_mux ? 0 : 3);
+
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPHL_PLUG_TYPE, mbhc->cfg->hphl_swh);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_GND_PLUG_TYPE, mbhc->cfg->gnd_swh);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_SW_HPH_LP_100K_TO_GND, 1);
+		if (mbhc->cfg->gnd_det_en && mbhc->mbhc_cb->mbhc_gnd_det_ctrl)
+			mbhc->mbhc_cb->mbhc_gnd_det_ctrl(component, true);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, 1);
+
+		/* Plug detect is triggered manually if analog goes through USBCC */
+		if (mbhc->cfg->typec_analog_mux)
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 0);
+		else
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 1);
 
-	/* Button Debounce set to 16ms */
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_DBNC, 2);
+		if (mbhc->cfg->typec_analog_mux)
+			/* Insertion debounce set to 48ms */
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 4);
+		else
+			/* Insertion debounce set to 96ms */
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 6);
 
-	/* enable bias */
-	mbhc->mbhc_cb->mbhc_bias(component, true);
-	/* enable MBHC clock */
-	if (mbhc->mbhc_cb->clk_setup)
-		mbhc->mbhc_cb->clk_setup(component,
-				mbhc->cfg->typec_analog_mux ? false : true);
+		/* Button Debounce set to 16ms */
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_DBNC, 2);
 
-	/* program HS_VREF value */
-	wcd_program_hs_vref(mbhc);
+		/* enable bias */
+		mbhc->mbhc_cb->mbhc_bias(component, true);
+		/* enable MBHC clock */
+		if (mbhc->mbhc_cb->clk_setup)
+			mbhc->mbhc_cb->clk_setup(component,
+					mbhc->cfg->typec_analog_mux ? false : true);
 
-	wcd_program_btn_threshold(mbhc, false);
+		/* program HS_VREF value */
+		wcd_program_hs_vref(mbhc);
 
-	mutex_unlock(&mbhc->lock);
+		wcd_program_btn_threshold(mbhc, false);
+	}
 
 	pm_runtime_put_autosuspend(component->dev);
 
@@ -1327,7 +1319,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 	unsigned long timeout;
 	int adc_threshold, output_mv, retry = 0;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	timeout = jiffies + msecs_to_jiffies(WCD_FAKE_REMOVAL_MIN_PERIOD_MS);
 	adc_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
 
@@ -1342,7 +1334,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 
 		/* Check for fake removal */
 		if ((output_mv <= adc_threshold) && retry > FAKE_REM_RETRY_ATTEMPTS)
-			goto exit;
+			return IRQ_HANDLED;
 	} while (!time_after(jiffies, timeout));
 
 	/*
@@ -1359,8 +1351,6 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 	wcd_mbhc_elec_hs_report_unplug(mbhc);
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
 
-exit:
-	mutex_unlock(&mbhc->lock);
 	return IRQ_HANDLED;
 }
 
@@ -1622,10 +1612,10 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 	free_irq(mbhc->intr_ids->mbhc_btn_press_intr, mbhc);
 	free_irq(mbhc->intr_ids->mbhc_sw_intr, mbhc);
 
-	mutex_lock(&mbhc->lock);
-	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
-	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
-	mutex_unlock(&mbhc->lock);
+	scoped_guard(mutex, &mbhc->lock) {
+		wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
+		cancel_work_sync(&mbhc->mbhc_plug_detect_work);
+	}
 
 	kfree(mbhc);
 }
-- 
2.43.0


