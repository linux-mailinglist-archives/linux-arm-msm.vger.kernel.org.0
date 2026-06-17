Return-Path: <linux-arm-msm+bounces-113542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jt9jGa14Mmrm0QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:36:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2A06988C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:36:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pKm8a6Y5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113542-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113542-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 460CF3029245
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E393F8230;
	Wed, 17 Jun 2026 10:33:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0213F58C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:33:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692392; cv=none; b=PaYcubRn91ItCZBF4vvWl48YsoALgUlZtqGff+BI+AVvC2OAPN07EyX7vYtsXpzCnhXip1YkyOu77A2T2RJHUnw0RcIBmPxp0HZDz/c7X1miXvT6g1QFyvYEm3y1Mzo26w8eSO1dplTB3BBqqw2TaGoYEfB/bLYjhp9rwKGlaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692392; c=relaxed/simple;
	bh=wDcPckElgAa4leEaZuFHYXPup44IDtUb56bKeLoBSxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iy2Geya/bS/cTGRSorTcDHEto/F2fGY5jMQ9Cz1oLN9LHjQVf0szLKG8LePa0ts39hKrLOr3TfC8APhF4AtpzBPaH8moNAVWYZ+/zXOOrERPErssFP1eCFwcEDmlGZL4Ran4DQ2x3isFhPtV72b197VEHRLa5sFdl1jDBHCt/GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKm8a6Y5; arc=none smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30be4a661aeso100448eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692389; x=1782297189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=;
        b=pKm8a6Y5e4w6UVtZBi/LQDcrpV23R2Ef9pI5rrULIkwG5pSbqojT4wSyI6aGNo/vh4
         YWzo20F7aj+APAJqM2UsBAxserJX50L7AXopOuPvvzjmnr3aoNrLlmpMS4+tz+bpSZ5Q
         qCwH8nxg6HmhlchVCGdoT1NyCwCF+6k1I3qqZGDAfpxR3x9sNpiB/xfZy5gGRjFZ5N/f
         RJtHqzC7i8aFyEXfY42Hy4T6vJh2cMjnpYgqdRIj3S0ft3NXriDTKROcfZBsZnK3b/2f
         vt5LcVNU6DKOA4HzaAQ1RRod6Go/PdlH8DVb+k9RirlQU9+dKgeGAu3Mb1R4x/f8sMZu
         24/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692389; x=1782297189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=;
        b=Mpxt4wEgq54Gu9Sa0t1U5ssP81m+3beNw+LDbFiClylrS4Uaqcp/RzIKCW32btdUjL
         ZlgLkAbSES4ppCLN1UbSi715jLgSQpNjlGNJfY+Ydnj1U6ron+hBFLwvyA4FEllnMfnK
         EDhMiu1kvW2cXEMYONiD3WbXGJ9pFWbuammXfS0OskQnefNHRqdb/v5YLUOvdX+LUTYe
         TDR9N0jEU5nTXWcWOqmkAxvz85GDg2gEN/1+NshlJBVA9W+Ue4ryd9Wq9WYBGzBc6Ksp
         VeIXFqaxuE4GdHvebYwBZ0wTmAZE37xpGjz/k9ow+dyOYwDVouXR0UuH6jE7hwPuy26e
         BnEA==
X-Forwarded-Encrypted: i=1; AFNElJ9ipuoBhG+6lZ2RhENwdF9ZmqleyonIWmk0j7qje47ildQTmCvbq/MaMV02FrRMFtPwxxEgCT8GI0CwCs3L@vger.kernel.org
X-Gm-Message-State: AOJu0YwRBcCQMq8XsuL7yP0MTp7C7C+MEcHWsAMunGQq3RkDXByrhxxc
	Sv2ao5t3zRJiQq6685pvKmVKAkMZuLX58T15t9W27d6apoV1Awsju6Cu
X-Gm-Gg: AfdE7cm5lcKgH+NSQIKbHp8Ah3tGHg/YgLUnlbhAB1KpnjHjhn8hI8pI5DU6bo5lo5V
	Xroc9EL3isNpSSvkEDtw2tOZSlu4/mU08p3ri8ZPFC8v/LN7uef2MhZ5mNXnNdTO5p/WKv/YRwC
	54mNypGCqY0qD0vwjLTpAY0IYk303ypANAHWYXTwJ7lo2Ai15DSrGlKs+FUSjNIzeWNGIml7czt
	z0oNHGEjIb4bt0pKtgXZU9qYA9YQwR9a+gXWZqpXVGmXUqOO2s3OGRBuCVz/ZjFvnOkpepWUyli
	XRWkAQT5r8g0UpVNY/BRrxoiqo3TcFHWNnQPgReiHggxVirod3bxwU+f8lfVWWDZSCYZvJKOOFI
	8mXEXkUUrfPEzpCwNgz/sPFyZwxtOkPqbL8/Y7x90tZ9t0FoYxeO9XgtXhcXB5uD2zkt7cPuTv6
	P+v3zZ/NZHLx0Upo301kEGvuOLg/n/I/XvrThGHZfLMIHVDZU=
X-Received: by 2002:a05:693c:2d94:b0:2ed:2942:34ab with SMTP id 5a478bee46e88-30bc990c00amr1603108eec.3.1781692389024;
        Wed, 17 Jun 2026 03:33:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:08 -0700 (PDT)
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
Subject: [PATCH 01/78] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:18 +0700
Message-ID: <20260617103235.449609-2-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113542-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED2A06988C6

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ab8500-codec.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..20beb830fd62 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -989,9 +989,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1013,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1024,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1043,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0


