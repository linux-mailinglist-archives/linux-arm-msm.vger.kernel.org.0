Return-Path: <linux-arm-msm+bounces-90472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLyfDHtQdmk4PQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 18:18:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0D81948
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 18:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE22F3013A5D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 17:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444CF23FC5A;
	Sun, 25 Jan 2026 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZzVFnCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7AB22A4EB
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361485; cv=none; b=oDjkkWqr5Fhf55WXLdMWR3ZNZnq3VhnpKoM+rnaLG4FxB2NL7NDjyJcmM7vJ+AQSMbkY7i3TcZ3/Rdx/cdnWKB32EjYpeWAI9zGhSeqrn8UlqI+PhVuYRhm7zD73b/DzN+E3KG6ClYJRjFC8p3kz0e5uIPvhkXTF/jACRspc3IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361485; c=relaxed/simple;
	bh=SoaC+bTBADZsZ6lBW8YnpUI8AOZA6Bnbyobzs3M9ObI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AT8jZLj1BeghjvgGwiZqP6gE6oul1vbcAONwnbLm1XPqEKmm1ukFt8UiTd7TBTG/afTaduDL2sQ5LZAHroQzawRbeWMvq1kgwIhaFKQDK/gc1EQjyPN8+kmbC2hD0K5Li6QQMa7iV/rCXVCi+0tR2z4kzWk3DZxOXuNIbBO4C+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZzVFnCD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7d98c1879so19288325ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 09:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769361483; x=1769966283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9H4UePuprwIqygwTYXIxu8X5uuYTZS1QdaUvyOfOkw=;
        b=RZzVFnCDOydk6G/N+EnSGCb0lhH/ldFiFgLgYCZFSN42B0rZKqsKOCGbTEkxPrx98r
         WoCCwYRavF/HYnQ+/qWzhQ5L1KyeqHhHmCGm6EPA0RvbYH7G5oF5pkFN8Es1rJ5JZyxA
         1nluzrj+yfZr2inGwLY0gmVaGoJuftFt0mI8Ngqen20pDQQT6uchQwRd3ZRt1rhUoi5K
         u8DRUQ0XBF4c7+sc/p/d0T8GFzN51m4Kf9uBzf28yAibDaAuhtyVpaNBFMY+ycUA2RTn
         A6E/kDSO9yTvbTklIMmENi6Ssr6TW/4aOK0reNL6kYpHG6R9H3kCMiGkr1IX68Ic37bs
         BL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769361483; x=1769966283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9H4UePuprwIqygwTYXIxu8X5uuYTZS1QdaUvyOfOkw=;
        b=gESee20RqOU+cajdCzJwpy3ywLpS+KAjQ4bYHw78+fgvHyADFXrHjGTnChZokJL5x0
         0V1b6A7COEa/iOjxe9uGYPaZ2CvIafrv9l3QkUigmQUXhcF1jv8ti4BvVUO1isDayuOo
         vjMWUq0hSJaSoExl6WXs+g8DXhQiE7BUkjECFSj+bL2h6eCGDgFPez2W3srvARLWxuGP
         JXcNXs9xQvBhPVLcO1PoL7onZrr/xR0pKPP4Rb4H2f8u0ACuRq9gEl3gu1B/0MAKjWjd
         Hr8wJI1BYDNzRxPvDpT3tmd86jnyzzl/yBU4ZS9lxoCsp23OeGp2roObwN/9s/f3YhqJ
         Gg9A==
X-Gm-Message-State: AOJu0YzrvzK3PTKj2WzrHCvVWoBDEBNuKzy7suNyZ9JWys7LNOCEaBmw
	VSN/DvwwgUB2j4tHN49wlIt9QRjOVCPCeu4xLD8aS/KMeFIrMITMyOUW
X-Gm-Gg: AZuq6aIck/5FPMiHxXhD2P83vP7W7x/3IMvpg7sBsHuqHwy4wP0xwiHZ7nMKB8Ff2+T
	rFYq30W6hJjc9Ob/q825KTFo2RrQNu3cmgoxwiR3ywONx/iqvvQJ83e60mPEpEN1iBLQsAwb0UO
	DaxZdaPOz5ZHmLYjMGbEwrWTTQfd7xFf24Fq3HGLGB8YKYULC7TsahY2PCAgxRmi6gvylmQuvUw
	uX66dD1TnimPC0Cg0pXqv4InBvOOp5bw+3W0tRmj0+oi0EujV8hANJ7a0Pw5qIQ62T6RNSADE0j
	tzUMSu469qDrbnIFR1dludcr3PfO21zV0sHyUbhiDjjDoMYbnx7HGFC2t5AKBfCa4uQYJGENhFb
	Touo8yZehS9BCv9OPs87WK1lTwpBnOMdQi7QSiDFQyKWDZGXbBwhzRPkyPy2Un7jeSAaT44nlwm
	8zUdsGH7ZSIW6+Oak6YrAi6zdSkTJy7winftxu
X-Received: by 2002:a17:902:f541:b0:29f:301a:f6cf with SMTP id d9443c01a7336-2a8452f0c27mr22161865ad.35.1769361482880;
        Sun, 25 Jan 2026 09:18:02 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:35ca:7619:a2ef:5e6c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f2e12sm6924293a12.22.2026.01.25.09.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:18:02 -0800 (PST)
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
	Saikiran <bjsaikiran@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: ov02c10: Check for errors in disable_streams
Date: Sun, 25 Jan 2026 22:47:45 +0530
Message-ID: <20260125171745.484806-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125171745.484806-1-bjsaikiran@gmail.com>
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-90472-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73C0D81948
X-Rspamd-Action: no action

The ov02c10_disable_streams() function ignores the return value from
cci_write() when stopping the sensor. If the I2C write fails (e.g.,
due to CCI timeout, power management race, or device removal), the
error is silently lost.

While we still need to return 0 and call pm_runtime_put() regardless
of hardware state (to prevent PM reference leaks and pipeline lock
issues), we should at least log when the hardware stop fails.

This change:
1. Captures the cci_write() return value
2. Logs an error if the write fails
3. Still returns 0 to ensure proper cleanup

Returning an error from disable_streams would cause the camss driver's
video_stop_streaming() to exit early without releasing the pipeline
lock, permanently locking the camera.

Fixes: 0e98938b0157 ("media: i2c: add OmniVision OV02C10 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index b86cae3d2b74..743d8544ac53 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -629,8 +629,12 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
 				   u32 pad, u64 streams_mask)
 {
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
+	int ret;
+
+	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
+	if (ret)
+		dev_err(ov02c10->dev, "failed to stop streaming: %d\n", ret);
 
-	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
 	pm_runtime_put(ov02c10->dev);
 
 	return 0;
-- 
2.51.0


