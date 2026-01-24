Return-Path: <linux-arm-msm+bounces-90400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPu+JD9ydGno5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 08:18:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EED777CCA0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 08:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CEA33009171
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 07:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C70A1E1DEC;
	Sat, 24 Jan 2026 07:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKik73H8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A0A286A7
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769239089; cv=none; b=D4lK7hlaPQYoLLdRP492sO/7bUA8qWZjNorbf245ZhfdLOPsjX+2Y6OyHJJKn6CJVxiU95bE1GB/3iVDcpcjfKq19JZpdDSbv8xtjQ1Zed549iWclC2afcRTH8AwNh7rEJwevMW5EKiBP9SLCnzztKNqQB6JTaewAbCmRNJ+R5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769239089; c=relaxed/simple;
	bh=IiJ/cYJ4n0RP+J8Rc7baN81IkMcZHUCVfNjY8Jv389s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSGrmQ9bMIpJcLA836fi/IC0mvFsQfrDap7RH/w5a1lkuqUSwtpd7TT+4iFkqgyzZcLrniLj6ONfcJSgvFMTgoahVrgGD6OeYRG6CHqyPk2ckpEK7nVG/5m0hgqlJD01TzrjkRIzKOvoHMVRndJ79z+Ic9z1qK0k8AxtD5Qm7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKik73H8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-352dda4a34eso1445808a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 23:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769239087; x=1769843887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65fawTJZ+ikw9zlGDfXENaUkwvZFguR8RCpycg7xIRs=;
        b=RKik73H8JN/GMTPkLbCcZBFaHiJYJPM1d1fx0aKIc2eECHVHmscWafrdETlBPEry9r
         dS0RVB7qTMhVjDgWOgPXYWgPSumtlYGO7eihUz0nfExI3j7Vq7c7b4+2GzNOXw7SQNfu
         CNz03tmpvcUdJPdg9LsbFsbN6yE17qKkKQsS9uRJRIKvTvsGYJjiROpb1HQ4oqxjSAkj
         /n9RBGLjNuUhJ2uogbrpflBPKnK2nCjgh2WeNNBtunCnlA4hlD+Lu0R6zCZQgvXOxnH6
         ahBdi80FbtcWDJzUc3CXNLkDi61SCJnIMug3MX8jtAj94eEOM8tZrVXydVL21F4kQKAR
         Pmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769239087; x=1769843887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=65fawTJZ+ikw9zlGDfXENaUkwvZFguR8RCpycg7xIRs=;
        b=dWnRUKs6uOCynDJY1R4NVdGCrfGno5gyKJSYAUqxysIBXVGjWUyXaokt/Tlis3B5dU
         Mfts5LDmxqrPipu4awlSTzS47MPVDr+XV7sMt+DDVgC9k6T0kCbD4mjUYzb1xHJ/tZ5J
         ikcjBIlJFfHd5yBtuRLR5N9Zl87vsPn42GDhWgsNHnQFcVCharMzo5jSP8QA/a3rqFWa
         d+vClV7yyj+uWRjKRFa2M4eAoKBhDrH1K2MQnwPeNwlbeMqWmboT/PHJER3VxiMgZqnq
         pzwl/5ju8ox0ZV+1K7CQSH+MYsdCrpsPerr8M+Mly3HaHlYCukmozj2wYbYJSt6uTtbb
         NXeQ==
X-Gm-Message-State: AOJu0Ywr5YkW1yJ2L/R80n20V5KSvfl4WCOaxaw3n4FH+ooA/NeIDv++
	SBxo4BKYsiSzQihFvfIDb+pGUyhC/9J+qrZJXh2wk8Do9WMjpOugMu1T
X-Gm-Gg: AZuq6aIavAfW+OSa0CY2OAmV43VEn9VN4PTqAP2jcuMfB+wjG3S8oVn7PB5JhlRK+6i
	oj0aDkyHfD9zRsg1o5Lyz6gTrW/3p4koZ2quiHWGFte80ufSeXaH9MahiXx6o2RrsDLl/iDeGnE
	DLrcjjaK+ZD+bzKCgPjO7v7oSFcyXJA/UNPTbwkpIfbUaK4GDLSf6K31CEXMXbfF5GgmYfGRYcP
	2YkiA1D8pRH+h/0MhnodCR42Jo/CCXMzeT2p13rZxnbr8S38Rtt2X2ViskNJmN0ZFW6lfe5cHx2
	lk0FC9z8lMpfQ9il8LTJT98zCU/+TMSQgmmX7pyPxBUXCIvr+5VjSIUiJGyLX0WKrX6J3hOVl7F
	Uyd25RYM9KmXC23zeqfeUn8EukWt6rGXPggO0pCG6LRIByG91kxOVscwLNdfI03qWEary8a95p1
	Vm6b94bUJTsmoOaVzyPQBnJX5y0yuN6m3ZPtI=
X-Received: by 2002:a17:90b:2b43:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-353670109ebmr4371040a91.3.1769239087482;
        Fri, 23 Jan 2026 23:18:07 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1ce:3fd2:e11e:72d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a42e8ecsm3645344a12.32.2026.01.23.23.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:18:07 -0800 (PST)
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
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] media: i2c: ov02c10: Check for errors in disable_streams
Date: Sat, 24 Jan 2026 12:47:50 +0530
Message-ID: <20260124071751.5885-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124071751.5885-1-bjsaikiran@gmail.com>
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-90400-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EED777CCA0
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
lock, permanently locking the camera (see commit 044f54e7c).

Related-to: commit 7673f757858c ("media: i2c: ov02c10: Fix race condition in remove and relax reset timings")
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index b86cae3d2b74..db191dccff75 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -629,10 +629,20 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
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
 
+	/*
+	 * Return 0 even if cci_write failed. The stream is being stopped,
+	 * so we must release the PM runtime reference regardless of hardware
+	 * state. Returning an error here would cause pipeline lock leaks in
+	 * the camss driver.
+	 */
 	return 0;
 }
 
-- 
2.51.0


