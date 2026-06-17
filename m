Return-Path: <linux-arm-msm+bounces-113559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6FOwAkd7Mmpq0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:47:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CFB698A44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:47:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CextnTQJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113559-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113559-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B29931C8627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A013A3BFAD9;
	Wed, 17 Jun 2026 10:35:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B198244E049
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:35:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692545; cv=none; b=d/3wThrd5i+5h0Kwk+mALHmRBIBUxjp7LqhaZ9KJoCCHUCIXnNOLydxA/rvmluEBu9NgUbHgxFjSi549u7jUzW4vV7ehN9Uuh3CAzQ5hB8NdFRXashAW+m1s4zr9/T7kItovUf94Mvw0FIogK04kksHoHp8HzCn5e9/dSSIjJ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692545; c=relaxed/simple;
	bh=FvCY6IHEvGanI+XwNJYJXJPRA6+zOndXmAvYxeKo0xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUZwNiI+kS1hy3TutzlYWW73cChe8F8U+dSwESMicl96nqahIcgWfWi8e9PgQqSPP/SNsuFETFZr0+gQw1lVzINJhYS1OPW9dT7YrYt5PK5hcZDoTXBxrgnq74Qa79Ym3z0yf20WE64Xy0LxYOgoyFSxVsKOJ6KP5rfMjyJsgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CextnTQJ; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304d8362a58so601384eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692538; x=1782297338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=;
        b=CextnTQJmemHuOXg3DNx+beYzx/sVRS1SEGmfBJsjnCLrFziqeFOJwCxJdpOMoEOfY
         FU/4U2bxjXbezM7avrKM5zeIaDv3IMZIHQT2mjoUGI8wLwrQqhJYvrtnljyKBRJMmnzG
         G4HP4Ax1cWQP0rEEZgW4Eu+Xl07wH45FpB7ilgvTU0OsVKhVifbHGJ3QQ1oDGewqhZvP
         K8jesq9uwt1X3NZ+39MV0Dau6Vr5vjqGEsYUfXXKOYtwO0Qk1MOPi3EtNY3EI/rtl0yC
         R/h5x+tlaqxYd/lO1TxgpN9knDqZbBt1AoHoKam5sED8m1kaX3WWFMsteWPEI7xRSJ6h
         Xkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692538; x=1782297338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=;
        b=dZU8/CvKDmp2Br9fNmh7pOYb3W1shvnMqaN+fRSLaPxFKVFq/pTfSPIT6kMuL21Xn3
         Z9/I0XN+j+IPgvsxhfz6qExoM6wu5cQjC3DMvz6pua+wZXfBcFZq+uDnsYbHspeTxadE
         VsX65RuplM22fH5mYUOmQPQTRrn7jfRcl4hSvQY4pJ4E7cs7WLV0iwr2YCZqM9zeIxyQ
         z+5QMElcjveHsPH4v6Ps308O/gt1o9/17kbb8pEo8yxgAprd1HPkjquJee5OElrbPgZL
         obEZLpebLIXL2tXNA/JZ+0Dnp1AgidwRgLe82M7XuvZhHTRIKtZ50ormhT0g8Tp0kMOT
         tG2A==
X-Forwarded-Encrypted: i=1; AFNElJ8RiFkaDweiTYVMe1vosNSC/P1LjNUstAX+p4/xApOolev5tL+M/r3y2VHs30VvxGl0V2FgZsRzOXT7Wdo8@vger.kernel.org
X-Gm-Message-State: AOJu0YwUhJMRZOaUR5uJpqUhKlI+GhoxN4PLVz3RH1ho2f84e8U6vTVq
	l7LlixI1JreJPwrbdrOVmB4G2uoyHY1zageJ3mz3WbD4+UW6IE63r/iu
X-Gm-Gg: AfdE7cnr/Xh+sK1Tdlfdhukhb8MseMk2JouGmREKKFzAx/6xZn5oHNEiUeeRgSLFhnm
	t0ho2x5yP0rG7+GBqmMMExE8D1l6zzkipcsQmSiYoh886xNRIwprLtZ2/4hK7oEzH1b7CYPMHZd
	5HR3g32amS2Y/hFXzM8MDPKsgDgoUECbk/eBHzLeNHAY3PY50EKfNi/JGXRLPMNc9fedSaJG2OO
	PhlEg0+G8t6kofZJS3ZjmqhKLFdFgPlDSlWnpSoB4YUuRIa+Y62SJHv8hkQBIVf3e074ecw4Fvk
	tmJirfOJjNtX3xpUBXOOJsMDD2ZRwYCbQsZgtRrFax08aZfZB8K6aXXCoXUyc9ri591bpZHDllU
	OhjJu67fx3NWOH+UWXDr1u3jrpNT5Tf0j9y57SiNf47KP7us8HtkDpbv/UUz1zN4B2MzqYVpDyu
	57z1AG9m+HPXA0rzMzT1O3/W5Y0BKXDwk1Gyt0TmXgDv6G0Ro=
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1289238eec.9.1781692538389;
        Wed, 17 Jun 2026 03:35:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:38 -0700 (PDT)
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
Subject: [PATCH 17/78] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:34 +0700
Message-ID: <20260617103235.449609-18-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113559-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79CFB698A44

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs43130.c | 96 +++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790..5e7472e9e107 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -818,26 +818,26 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (params_rate(params)) {
 	case 176400:
 		dsd_speed = 0;
@@ -881,26 +881,26 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (dai->id) {
 	case CS43130_ASP_DOP_DAI:
 	case CS43130_XSP_DOP_DAI:
@@ -988,14 +988,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	if (!cs43130->clk_req) {
 		/* no DAI is currently using clk */
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
 		cs43130_pcm_dsd_mix(false, cs43130->regmap);
 	}
-	mutex_unlock(&cs43130->clk_mutex);
 
 	return 0;
 }
@@ -2132,18 +2131,18 @@ static void cs43130_imp_meas(struct work_struct *wk)
 
 	cs43130->hpload_done = false;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* clk not in use */
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, CS43130_MCLK_22M);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
-	}
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* clk not in use */
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, CS43130_MCLK_22M);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-	cs43130->clk_req++;
-	mutex_unlock(&cs43130->clk_mutex);
+		cs43130->clk_req++;
+	}
 
 	regmap_read(cs43130->regmap, CS43130_INT_STATUS_4, &reg);
 
@@ -2215,12 +2214,11 @@ static void cs43130_imp_meas(struct work_struct *wk)
 	regmap_multi_reg_write(cs43130->regmap, hp_cln_seq,
 			       ARRAY_SIZE(hp_cln_seq));
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	/* clk not in use */
 	if (!cs43130->clk_req)
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
-	mutex_unlock(&cs43130->clk_mutex);
 }
 
 static irqreturn_t cs43130_irq_thread(int irq, void *data)
-- 
2.43.0


