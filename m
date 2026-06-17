Return-Path: <linux-arm-msm+bounces-113598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgbBF7Z8MmrP0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E57698AF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="AO/RlTVv";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113598-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113598-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91C7030DC852
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FF847AF49;
	Wed, 17 Jun 2026 10:41:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D1D47885C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:41:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692892; cv=none; b=hh37GWMS9VHZ9g1i1CkWHBnTQQeOpNVDRSPj89rEqSSoaiNRtLbpHH1KWqDTg4DSSrt0z2Qi0sbKQunbQMWnMTP22cLp4Lxq05pZszlweER+IHzscobVRdNjOhS90DaechOj5yqcGoWVZI0kp8KmoIcVf2PlHrrDpHGyO9tMc9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692892; c=relaxed/simple;
	bh=CUFDizm8j2l+aG+O0iqDVpukA4UDOPYwQgm/2dCZpzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMFY2Vpu7WqI6C7iIWSTG3+zgD/cDVnX1HlYwGpH7aecy9EaY1rX7ZtEwrWwA88UtlN+nihWzGE7kjwceHpwcycxFqlNDAEWknqV6FetuPeExrjrZx/IQvIqtYUdMCO6gJi7RrWDW9iTGqZRz14722MNFs9zBw5A5G9tIvDba2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO/RlTVv; arc=none smtp.client-ip=74.125.82.47
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137335bc3caso6891541c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692890; x=1782297690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUF1nUSK8JjVFEerCymxn+O2TFW28hvbz/kOFuEnXM4=;
        b=AO/RlTVvD6fSYqF29OtDghAnCboUI9orKJmr5ID8kK2caCIPRDm18ZMBzd0cRXAN+u
         9mkr6oF+PqppVS3RXchI8v28A849GqJVDtenyKmSdrbfPyHiNYyiiH0A0y1CoWXZMAFH
         qdwZ/8R7V00AfmFlvVY7N9VA8ItSZeAELsiuyoloVIOhmkohtUXxJhjv8rWY5JgOOxlp
         +ZP7L1JTM+aspDZzmltO32vfT8Uk3p4sBP4jkCd/vP6zcRSRnjrU7rrONNJksDlxSB3Q
         i+XnRPTBgtofqkb+whDrqEB9U2SfkG6+uDjFx8LKaWNojl/XdAF3y4dquxeKrqy+UZcf
         YyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692890; x=1782297690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUF1nUSK8JjVFEerCymxn+O2TFW28hvbz/kOFuEnXM4=;
        b=MmlqLmvSGQ7aJUWhbOwQOZvJVzO8wAumoW46kC44OjKTpqY+Y5YUgKb80dUMr8zqgk
         KAFuqATq+EQcDO7B5f1u3Fumcs1ZxS5qhniMlWzk6E7ps4MJE2U6SOxGa5AMSkaSVqg8
         vlbCPSKYVq1HAzzKsvebY3M6VcOdxScwKnb80j1jdsK7LqfwtJKhpN2b37U9rMIRVgZQ
         qt28OEIe5geUQbuLqwc/xZbIeK7nOtbuosGwkHv4u+cHD5yW2L7YUOWZzFo9pFyazwlk
         ercE0PVBIpj/ok+1DXHt6kiAGv5H6J7XfxNeXoGX/VsKV9imxliawUsozr8cTG9GI2iu
         0HBA==
X-Forwarded-Encrypted: i=1; AFNElJ9sqZUhQfnqqfAHFaHu8EzukPQSn/bGum0s39/l0tJYwqOLG0zD4SVMTJ8shjZuoH5IfV6gkE3kqDREWmNz@vger.kernel.org
X-Gm-Message-State: AOJu0YychB4rwWEJ5vNvk7VQ2aS8gQQJATKJ1/sNpCFPq/1ygcT9G4pp
	KUSL55UU8TBaz1LNAedGuKs73ZwcAButDf72PFvsr324TXps2+2b3EgX
X-Gm-Gg: Acq92OGfK2irTXfPKH/JPmC5Ya7iq1VBx+1tXZyP1u0sx9SUuknJ9+7JKUmt0gz57/W
	hFNlKpfR8/7e8qp5HygGeF9lYePZrAUDOFGyT45sWnGnR6C8lEU1yPRlvfmEK6WGmm5ZDEGNtCC
	tN05ZS1ajXK3B8esKYoJLtpK8xtfBpXaKUXLYH9zplIRdYuLY9MYtVop2y5aMM9AQ3SSjyCUTXH
	SavgFd+l92716f4BYQzONTZmnWkkAgHvNWZ/DluF1PNcgctrOta0nguluaTvAIWlnckBs86rsny
	8Jf3NhVh3t4RZXJ8vZbaojWQR/whguQQYq3srBj28dLzLfAevnJLhXWH4YHQigeCO27TXAwu5hg
	Rarp/U6lKT3kGW2CzdJ6ghtm7w4SCau06sgrWp3JpP9pZR8ARAO+jmaMxOy0JyD19uMWKqIi2gl
	SBij1N2CthyQ33j7SqSdooU924tpBdKqiU24WIfJa0W95g/FANDdGeorOKkQ==
X-Received: by 2002:a05:7022:112:b0:137:edc4:a5e6 with SMTP id a92af1059eb24-1398f6b4762mr1323943c88.29.1781692889954;
        Wed, 17 Jun 2026 03:41:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:29 -0700 (PDT)
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
Subject: [PATCH 55/78] ASoC: codecs: tas2781: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:12 +0700
Message-ID: <20260617103235.449609-56-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113598-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7E57698AF3

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tas2781-comlib-i2c.c |  4 +---
 sound/soc/codecs/tas2781-i2c.c        | 20 ++++++++------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index e24d56a14cfd..85fcb33752a1 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -342,7 +342,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 	/* Codec Lock Hold to ensure that codec_probe and firmware parsing and
 	 * loading do not simultaneously execute.
 	 */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	if (tas_priv->name_prefix)
 		scnprintf(tas_priv->rca_binaryname, 64, "%s-%sRCA%d.bin",
@@ -360,8 +360,6 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
 			ret);
 
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(tascodec_init);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..f2b739780f73 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -843,12 +843,12 @@ static int tasdevice_digital_gain_get(
 	unsigned char data[4];
 	int ret;
 
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		goto out;
+		return ret;
 	}
 
 	target = get_unaligned_be32(&data[0]);
@@ -868,8 +868,7 @@ static int tasdevice_digital_gain_get(
 	/* find out the member same as or closer to the current volume */
 	ucontrol->value.integer.value[0] =
 		abs(target - ar_l) <= abs(target - ar_r) ? l : r;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return 0;
 }
 
@@ -889,13 +888,13 @@ static int tasdevice_digital_gain_put(
 	unsigned char data[4];
 
 	vol = clamp(vol, 0, max);
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
 		rc = -1;
-		goto out;
+		return rc;
 	}
 
 	volrd = get_unaligned_be32(&data[0]);
@@ -903,7 +902,7 @@ static int tasdevice_digital_gain_put(
 
 	if (volrd == volwr) {
 		rc = 0;
-		goto out;
+		return rc;
 	}
 
 	for (i = 0; i < tas_dev->ndev; i++) {
@@ -919,8 +918,7 @@ static int tasdevice_digital_gain_put(
 
 	if (status)
 		rc = -1;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1766,12 +1764,10 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	int state = 0;
 
 	/* Codec Lock Hold */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 	if (event == SND_SOC_DAPM_PRE_PMD)
 		state = 1;
 	tasdevice_tuning_switch(tas_priv, state);
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
 }
-- 
2.43.0


