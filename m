Return-Path: <linux-arm-msm+bounces-90602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIaALtWld2lrjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:35:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 249458B8B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 988343028373
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D18534D4C1;
	Mon, 26 Jan 2026 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIhU9zFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91F233A9FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448903; cv=none; b=PhntbK7y7qFMDF6mKpF8QiHWSre1OhVsDNLQ4qdjj0TQ08cFoZccAdpAuWexP8RSBRc85ZU+OiCDxYhI6++AAdc0NkBB3fq0kTHCoeOvl6uCg99zZLMjfDuoUqjhGGnQfqlrevvPIvy8CcIeMcf739YiOeK+2W++S8bSl5niQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448903; c=relaxed/simple;
	bh=p5cR6L+r/9DlXjg+WOWfhu5skZgeastUVDPp9EDgrt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7l4MpShPR9yVByd8B9RP5cJiMMuCDZW9Snb9L68YZm9ywpZPdZqQy9lf4Of49ul9Lpurq8upJ+nzZ9WigPlQIoiqCeJK1/EK8OxETg+RqkxO8PDNBYSd7iiIhtRIIhoC1R/xMf6XLREGVQDLshafP0wAfJb4vzxMyuwK0CUfBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIhU9zFO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so4080692a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769448902; x=1770053702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RffcJHdsTonAwt9Ao2IhaDUDPGQyk+jkPGIUwU57TVM=;
        b=UIhU9zFOkmPOarF0TQTSox+haF5F5Ij+A30UR80iScRd2oDyBz20UEEfBtvOVhzZGS
         Etghy5KyCtvDuxGaGKJdU+Rp05X9yrEQN+m0wSwlZCts0b/VuM6KCcuPQ3mCja25WXO5
         UtVZ/9ZG/CnjVBeXW7+bnGHgKlO+rfT+m2MeNtsNbwgNmk0sue+mDMlM8uFjlFGlJ+2H
         OOvBpkJNgDoHr2D6fbVksHygIXshsqPOpDbVsjarA7EMhakBX3YdMXC1McYLMmnBMLRH
         m9fRXWAqZdrs/0/PWSvXjNdAI0w0NMBkHAtUg3O6+gC7QNJ0n2hHco+1qG/MwTXFLxEa
         VJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448902; x=1770053702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RffcJHdsTonAwt9Ao2IhaDUDPGQyk+jkPGIUwU57TVM=;
        b=XG+T5Rp9mp3l5DfrUnUFL/2rNphFc2WRopMxYc3vDzUExZeKCUKI/+N6NGLEWHDXb4
         cpDNz2935vU7r1f1zBmymBW3jRN06k9huUZUhyncb84VAMZMQmJp8RVoFRrXkvPus0W4
         8X7hG4hJFw5y+VSo3OYBakmHKOBAJWDArZZ2rs/NOkqWB21Ym5CcJLiayxUituEZgpKk
         bQtxYKB31A8+U6gH9MkK/HEcCNwmHgXFPkNpeF7ttDdfCL9vnHx6y4w54xcDTSaB+90b
         JaYPKj2ttX6kjDs+tIQBCX9+bfj1V1G8ddJa7EDBn0rMldd36mJeyZ6+WEEFs3ViXDNf
         t85A==
X-Gm-Message-State: AOJu0Yw3E3EtR6mw6RE2xO48Enk4OfxH8YiMoYSS2URz2/EaelzkpKho
	pMPWktRL9apIZ/YuK06MzfAll4N+Bm05KNehf0c+5K0KZCm/6F6h7aBl
X-Gm-Gg: AZuq6aKYpZBwZRSbi34jSmwNVjArZj6ExMPYsQXubWEiZfPMWK5wvO4JVyDmL32xb1a
	LRpuVmUEPuO2r1hKI14wvQ/nsIK8VtJnmk1SGxT72cIsBuslhC/7nG98rkuSnIPTf8EzeNmmc0f
	PKVSxwJ7kg8HL5y26X6+8p9eT2bPsLEmTVtPexMPXSw6L5Nl/xWHQmU04CUSZXbz9FV7BaeARIg
	sH+PiNeNONfTfdI1qDP8jvo8WfPQFiZxgyF3bS9kAuy7h3QUdZS/Zr2Wr8gz4pTtP1cNtwfIIjT
	hUeYxyrb3tUhWAiaDCO9uBF+uLWxmUfDO/PFEPQ0xOYBllVNDSiZUfM2idOpTINwaZWfpygxHxV
	skDrfzeQeVzeijSw2UOTYuw30VzOElwj+25nG8GL5jFs3iI/TsESmwiYR8Qv0aDrrYcGfQTmM8G
	OcydCtLRGVHOAzlHm2EfIGn2c7beUPpLRp7ipW
X-Received: by 2002:a17:90b:1c01:b0:33e:1acc:1799 with SMTP id 98e67ed59e1d1-353c40c66bbmr4815618a91.14.1769448901662;
        Mon, 26 Jan 2026 09:35:01 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:e23f:af76:8280:9d84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm86787a91.6.2026.01.26.09.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:35:01 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v3 2/3] media: i2c: ov02c10: Correct power-on sequence and timing
Date: Mon, 26 Jan 2026 23:04:43 +0530
Message-ID: <20260126173444.10228-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126173444.10228-1-bjsaikiran@gmail.com>
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-90602-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 249458B8B0
X-Rspamd-Action: no action

1. Assert XSHUTDOWN (reset) for 10ms (T1 >= 5ms) before enabling power.
2. Enable regulators and wait 20ms for ramp-up stabilization.
3. Enable clock and wait 10ms for stabilization.
4. De-assert XSHUTDOWN.
5. Wait 20ms (T2 >= 20ms) for sensor boot before I2C access.
6. Perform software reset (0x0103) to ensure clean state.

This eliminates potential race conditions and stability issues during cold boot initialization.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 57 ++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index fa7cc48b769a..ba8bbb4f433a 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -22,6 +22,8 @@
 #define OV02C10_CHIP_ID			0x5602
 
 #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
+#define OV02C10_REG_SOFTWARE_RESET	CCI_REG8(0x0103)
+#define OV02C10_SOFTWARE_RESET_TRIGGER	0x01
 
 #define OV02C10_REG_HTS			CCI_REG16(0x380c)
 
@@ -616,6 +618,13 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto out;
 
+	/*
+	 * Delay before streaming:
+	 * Give the sensor time to process all the register writes and internal
+	 * calibration before we assert the STREAM_ON bit.
+	 */
+	usleep_range(2000, 2500);
+
 	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
 out:
 	if (ret)
@@ -660,13 +669,13 @@ static int ov02c10_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
-	gpiod_set_value_cansleep(ov02c10->reset, 1);
+	if (ov02c10->reset)
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
 
+	clk_disable_unprepare(ov02c10->img_clk);
 	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
 			       ov02c10->supplies);
 
-	clk_disable_unprepare(ov02c10->img_clk);
-
 	return 0;
 }
 
@@ -676,27 +685,53 @@ static int ov02c10_power_on(struct device *dev)
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	int ret;
 
-	ret = clk_prepare_enable(ov02c10->img_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable imaging clock: %d", ret);
-		return ret;
+	if (ov02c10->reset) {
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
+		usleep_range(10000, 11000);
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
 				    ov02c10->supplies);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable regulators: %d", ret);
-		clk_disable_unprepare(ov02c10->img_clk);
 		return ret;
 	}
 
+	/* Allow PMIC to ramp and stabilize */
+	usleep_range(20000, 22000);
+
+	ret = clk_prepare_enable(ov02c10->img_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
+				       ov02c10->supplies);
+		return ret;
+	}
+
+	/* Let the clock stabilise */
+	usleep_range(10000, 11000);
+
+	/* Release hardware reset */
 	if (ov02c10->reset) {
-		/* Assert reset for at least 2ms on back to back off-on */
-		usleep_range(2000, 2200);
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(5000, 5100);
+		/*
+		 * Wait for sensor microcontroller to stabilize after reset release.
+		 * 20ms prevents black frames during rapid power cycling.
+		 */
+		usleep_range(20000, 22000);
+	}
+
+	/* Perform software reset to ensure clean state */
+	ret = cci_write(ov02c10->regmap, OV02C10_REG_SOFTWARE_RESET,
+			OV02C10_SOFTWARE_RESET_TRIGGER, NULL);
+	if (ret) {
+		dev_err(dev, "failed to send software reset: %d", ret);
+		return ret;
 	}
 
+	/* Wait for software reset to complete */
+	usleep_range(5000, 5500);
+
 	return 0;
 }
 
-- 
2.51.0


