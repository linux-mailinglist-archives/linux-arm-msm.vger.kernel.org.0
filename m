Return-Path: <linux-arm-msm+bounces-94860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9MdoFEpspWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:54:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7C1D6E70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CE573015159
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250C335A39F;
	Mon,  2 Mar 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0K9B4Lfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5A3590B8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448631; cv=none; b=gs3xh+wRgmvG3Ek/4rcIm6L5Sn5n+8/as7jhKL0sVsLtZwjYap7CJDO+fS90NVNuVi0kNjR3quPdDzDL/yG9vmtNiRuKpkskgG9JeItK4jzEqsh02qgRk5N453+A4pSQ6yCR9DbIZuZ1Pfl2/HQZd/TJtg2gMUcvv3QLiTyCHsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448631; c=relaxed/simple;
	bh=aHRIOIA82B5UmiYNaDuGLIuutpMS1GzM+k8Df5VuVF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGaMj5azytJFJmh4HrpFoj7rl2gi4G1o1f0J8KnYUiBNcVs1We2LowPYV0DPQrMdC4UMrGw8hJsrUsVwggNPy1D6ZeHykezqI70Yy4YmSCK28mJCDVGlwhZ/IZlGUg/PG8HZKlwfBXYBKeVSgCOLNHNmY2ejpfdPGP+Dvx4k1c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0K9B4Lfb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65f73d68faeso6337857a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772448628; x=1773053428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CDK4BH+OoJnVpsxs1bAWWhwEzUlZ60d996yFctMRUA=;
        b=0K9B4LfbBsNqMeXrxpFxGOwU4vpOH+u4RbdDMFuLT8xd8qzPEzj58dIku2Yihw/Uqf
         zfnSFTr4ir4RppBO9SmQjH8Mw/EzPUEpeGkTSvzGW6SRdHA0MtE/MjlenRLlphFuwpmf
         dYDdvCf4WfthHVF9iOLY08BzXnb0cwrzJ2j/GRMVXgMoQtvWnTuNddVy9jK5JRMxcpTI
         R0B7L0AAvH4lhebqsqISamERauouaoTi8+/7RMQWX8XhPwG6WWe94IFlM3Go2XeGGtAM
         UeprBRqS41KSgVc5FZU8OPteNRZDJlbtLjtZMwH4HIr4HENGmEGCEN9jpz2UW2TsNd/0
         AOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448628; x=1773053428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0CDK4BH+OoJnVpsxs1bAWWhwEzUlZ60d996yFctMRUA=;
        b=UAMi3zv95y+WDTZPbyoBBg0adnI8JGDzrzcBzkzWApye+Ac73JAxLRlwJCfTvynnRh
         I8FKvPrsA/gdLzUf9rGNCs+iYMUlgAESD2HXMvhEaWuiT1Ayo56Nf3/1k8g+oO8Ikb6b
         Ca0oE4/RSc+goUmSVO31RPJUwehOm85SHb28Pib4DAmwpAJ1Y9F9fkjz2pEdGn3gUMu2
         E43RKSwWNeHV7HZdK6BrrIRB+QQcBzekjNFB5ssfjsLZLBr86zGNOD2Aac5El/HX78Kn
         Z6C2mRvGorPuhxA6bs+RHWSnwdtja46VryMZPAeJpWDffvGnw7DNW4FzwqBncBtkDbuV
         SGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/F3kxAkjkowy41cZM8T8qPUQjUzQ/YvE8ylPs1fxy2ydpz5GBnsh5Xk3sTZ/CKjr3qlhRjk1KQLy8qjqx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35MDKmh4hIsbQnsOjUcm0iH+T5DNK7sdFaHAc5VfK1ivbdy1f
	TrdpCWVWhgdKz6Uiop2TyE9NQAwAZJfOdYfIk6PcW2ZKZy1qs4uH+rQx9xVmmbR3qPs=
X-Gm-Gg: ATEYQzyyIMdEbn2a2XWXufUjf8JxqTMQm9SAwXvv0SCDToEg0Rnqq6XKDDOcTlYnLfz
	MWe0yqp4EH91sBs5DfhiEhAPq0cV1JkCBa3uBbnc+lO2Gf7ymowuxellYcagL9lrfPeosRv/KUr
	gKNWfs4vnPTHsyidd4SJM+ncwcw9PYoxAA8GzBJ4ktf8JVyH9XQIM4ghmDoGH5AKBpHrEsmX2g7
	3JJ2V70Bj9BK25AVm3WnsztlgOve0+SN/H2qefxU1XtgKfRZgmXWUHycOLwwlOdiNlc6VI6F2/C
	Q25jjI0g/cGl0uwLLq237lOQPi907uDlHfPDru5vyuA8r2nL7KYdN9vY1I4yD+YjXFreIUyNb1J
	Pe2fpwr7v5ogEtfv2LG3LOf/cwup/Zp6pWa9pesFGFpCBbikstGt70Eo9q9nTHtgq3xLEA0N2+F
	hsHaIRXpgg9cmkYdB0AZpCND5Pz4DTKr3OjVhQ6Kf9Wh4KHDTkivjE/y0W1ib8cUeM8BvqISdfd
	rjMT2xNZQ==
X-Received: by 2002:a05:6402:270a:b0:65c:1483:a716 with SMTP id 4fb4d7f45d1cf-65fde4d2c45mr7809332a12.29.1772448628107;
        Mon, 02 Mar 2026 02:50:28 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabbd98bcsm3511769a12.0.2026.03.02.02.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:50:27 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 02 Mar 2026 11:50:25 +0100
Subject: [PATCH v4 1/4] Input: aw86927 - respect vibration magnitude levels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-aw86938-driver-v4-1-92c865df9cca@fairphone.com>
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
In-Reply-To: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772448626; l=1926;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=aHRIOIA82B5UmiYNaDuGLIuutpMS1GzM+k8Df5VuVF8=;
 b=QMUHIQaI7C7oB7r2/diS3hfpVF30i0LI3lK0cwpYVvIDTd0cQRED/RbflRKKga8SAU/4jkimw
 eC1wRcjWk1rAAPeFM+vtN7HNuSZC0ScZYhdrByBcr5bMHIou20tHfAp
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94860-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email]
X-Rspamd-Queue-Id: 97A7C1D6E70
X-Rspamd-Action: no action

Previously the gain value was hardcoded. Take the magnitude passed via
the input API and configure the gain register accordingly.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/input/misc/aw86927.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/misc/aw86927.c b/drivers/input/misc/aw86927.c
index 8ad361239cfe3a888628b15e4dbdeed0c9ca3d1a..7f8cadda7c456d7b5448d1e23edf6e3f2918ba32 100644
--- a/drivers/input/misc/aw86927.c
+++ b/drivers/input/misc/aw86927.c
@@ -180,7 +180,7 @@ struct aw86927_data {
 	struct i2c_client *client;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpio;
-	bool running;
+	__u16 level;
 };
 
 static const struct regmap_config aw86927_regmap_config = {
@@ -325,11 +325,12 @@ static int aw86927_haptics_play(struct input_dev *dev, void *data, struct ff_eff
 	if (!level)
 		level = effect->u.rumble.weak_magnitude;
 
-	/* If already running, don't restart playback */
-	if (haptics->running && level)
+	/* If level does not change, don't restart playback */
+	if (haptics->level == level)
 		return 0;
 
-	haptics->running = level;
+	haptics->level = level;
+
 	schedule_work(&haptics->play_work);
 
 	return 0;
@@ -376,8 +377,7 @@ static int aw86927_play_sine(struct aw86927_data *haptics)
 	if (err)
 		return err;
 
-	/* set gain to value lower than 0x80 to avoid distorted playback */
-	err = regmap_write(haptics->regmap, AW86927_PLAYCFG2_REG, 0x7c);
+	err = regmap_write(haptics->regmap, AW86927_PLAYCFG2_REG, haptics->level * 0x80 / 0xffff);
 	if (err)
 		return err;
 
@@ -409,7 +409,7 @@ static void aw86927_haptics_play_work(struct work_struct *work)
 	struct device *dev = &haptics->client->dev;
 	int err;
 
-	if (haptics->running)
+	if (haptics->level)
 		err = aw86927_play_sine(haptics);
 	else
 		err = aw86927_stop(haptics);

-- 
2.43.0


