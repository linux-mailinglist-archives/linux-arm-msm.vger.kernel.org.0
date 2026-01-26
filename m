Return-Path: <linux-arm-msm+bounces-90603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDppO+Cld2lrjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:35:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E68B8C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9627302A513
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74E434A790;
	Mon, 26 Jan 2026 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj53pFdo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE8271457
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448907; cv=none; b=VdhsIsxIKVcNs8AjVAtfYM29NE5xLCBsovIMMJqySNfS1D8uiCifb3uQ9Bjxz1wErwifOuW3YlrIzKI48TmOUkui7Kr1McylC3v1DyrtKt8n2q2dzScpa8n+s5GfszBOchDEB36RWOKPufSs2wCm6HU2YfXCSuVCVedIzoYDwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448907; c=relaxed/simple;
	bh=05r0N/P1sH0YTipwKMxBYm438Ju3s7xaIh6VOJ1yiys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3mPPrFdPrX6EXzViH6Czz6Fsb/2PKQJu2oFaovHOg7TClcQdN2j0qvACQ2Fhfb2HxCpSbUHKEkDj//06d4TdTt2VjsdRRq3mwiZ/D7dqqUEdaE899dHkfWlOHERFmezHyJKZkFVfvDSmi5b7FZy3vl5dY15sDpI7g0Eb9iK+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj53pFdo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f102b013fso43568535ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769448906; x=1770053706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8RKPcwVeGZdKkCxqhj/W0dUP9zEkcKV20nHAwN/Abc=;
        b=Wj53pFdouH2W34UYnfK3JjUwXTprQzj2Geo9SyQTayRbw06oCwNCD61QPgqAIddi2m
         HvCvBrtwq/YuC9OqdSd7Ff8Gu8l7xS6AgUJ2CNr/P9gr8gVJqDnx4YeNcbIu9hiS4eV6
         hTZOt7BmVh0OKBAFwjRZUb8yGHG8XVom1R7tKxyxsVU2yMWrm0Net+PdBkyDpwwpY4GC
         zhuMrQO83baAnNWT7VjsteRai7kwpORq0KuPlVT/V6xCKrN0TX4nmPMUbvghyaMzW+jk
         ChK28HXwVDA/7BPiV0dhhmxJ1gnlfVALUnhBSiefQuHzFCUhRIbzgKaaYRShDn8mP2cT
         KxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448906; x=1770053706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H8RKPcwVeGZdKkCxqhj/W0dUP9zEkcKV20nHAwN/Abc=;
        b=MlzvVGo9SWelPK6/YIArR/I8kYigXP/EpZClymUk7wILwhdUYUbEN7qp4olL7V82tD
         5jQN+No9dZT6jHsPWb4oq/UZChE11WkcoWX97GQuwxAJUOyQhNYwk/cMSS1SFMVXQcBx
         6CkAKblqFV+duT1j9aT0CXiK3734TGoYeGkyZccba5mTRvmfWxIq2PPliVdR4s7+s+5+
         LUCoHCUE0LZdtSSjh0MBbpoXcrwF06k5eyDYn3wqGbruUp2ICLRSFmPaxvQSUSe3F0Aw
         bj+tX6nb6vAY31G130xGr+rHI3V+V+u/Ks8ieXr+jXlVtu+0BLR9FFWW1guyQIsYVuiH
         I8Rw==
X-Gm-Message-State: AOJu0YwUEQ+TTSNnJ879gDQXapeF9UOAGMulFTVXG8AgX7hBx7UMAcfI
	pI/1K2QxZreV0OuEknuY9QZ+stKolZzPZfDG//7mAJw5h6Kt7HM8UwQd
X-Gm-Gg: AZuq6aLHNZjOmDfzdhV4sei5I5tWU8EOANisHTu5Bg8PiGML8meFyUqbuTopg483r94
	7OrnvpYOi1wFw/c3kXMl7rwUBjtIKKKzV1dPneQg1ML6hvecYXFfvcEm62dkGsZUGsQk88jB0EK
	SIQeieoDLbGv4C3CN6FqY46TTRLyRFBygISu3kEMHwDm00aFGlkPbgLiCi+wlLIiQGAZ2msZIrj
	1vupbX0X7tgk8vYgDhAE1ZeTJYlpRBb77QJP7z/uq1BdbSxuseAktbdUAzLEqoNipLdVPxVRW/X
	7BYFYBfImm/p6JJEFTw+EYcMOQuXcjybyVAMC8meFHV9hXJMCRwQuKgvjwn8VAy+p2hfTsjw5h+
	XpiQR/oKPMklc75edFJll52xKNqFT6QxaiVDYsrpJ4M+D1zneXzngS7AHIdNs2PKitBHhSm904d
	JAp+bW9Z4064zQ5pva9b4Fv7n8zKt7Y/kkIO+s
X-Received: by 2002:a17:903:1a43:b0:2a0:86cd:1e3a with SMTP id d9443c01a7336-2a845325626mr44571925ad.44.1769448905944;
        Mon, 26 Jan 2026 09:35:05 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:e23f:af76:8280:9d84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm86787a91.6.2026.01.26.09.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:35:05 -0800 (PST)
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
Subject: [PATCH v3 3/3] media: i2c: ov02c10: Use runtime PM autosuspend to avoid brownouts
Date: Mon, 26 Jan 2026 23:04:44 +0530
Message-ID: <20260126173444.10228-4-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-90603-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 763E68B8C0
X-Rspamd-Action: no action

On Qualcomm X1E80100 platforms, the OV02C10 sensor experiences brownouts
if power-cycled too quickly (< 2.3s) due to slow passive discharge of
regulator rails.

Implement Runtime PM Autosuspend with a delay of 1000ms. This keeps the
regulators enabled for a short duration after the device is closed,
preventing costly power-off/power-on cycles during rapid user
interactions (e.g., browser permission checks).

This aligns the driver with standard power management practices used in
other sensor drivers (e.g., ov2680) to handle platform latency
constraints.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index ba8bbb4f433a..9f6c4e8b06cc 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -628,7 +628,7 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
 out:
 	if (ret)
-		pm_runtime_put(ov02c10->dev);
+		pm_runtime_put_autosuspend(ov02c10->dev);
 
 	return ret;
 }
@@ -640,7 +640,7 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
-	pm_runtime_put(ov02c10->dev);
+	pm_runtime_put_autosuspend(ov02c10->dev);
 
 	return 0;
 }
@@ -900,6 +900,7 @@ static void ov02c10_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(sd);
 	pm_runtime_disable(ov02c10->dev);
+	pm_runtime_dont_use_autosuspend(ov02c10->dev);
 	if (!pm_runtime_status_suspended(ov02c10->dev)) {
 		ov02c10_power_off(ov02c10->dev);
 		pm_runtime_set_suspended(ov02c10->dev);
@@ -983,6 +984,8 @@ static int ov02c10_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
+	pm_runtime_set_autosuspend_delay(ov02c10->dev, 1000);
+	pm_runtime_use_autosuspend(ov02c10->dev);
 	pm_runtime_set_active(ov02c10->dev);
 	pm_runtime_enable(ov02c10->dev);
 
-- 
2.51.0


