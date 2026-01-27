Return-Path: <linux-arm-msm+bounces-90842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG8ABwHteGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:51:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3497F8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6746300D5E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B0C3624B9;
	Tue, 27 Jan 2026 16:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lau6TCtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA3F3624D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532656; cv=none; b=MqjVat0mrvj4V4lMowwIycRwqPkCMVvOOMjql8pEcmbjW0pgoIFac52ko+U9WFyWNoumpNe91z2JmHTm5SDhshn++wWqy58tyOdXJRCQLKHMWp7Y0sbKgvghK/LNNF5yXaSQPHrnbtL4qSKGvwwzeR5SM/fsFLgRxGNXhvrAKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532656; c=relaxed/simple;
	bh=nuy9kCIcT6D2JU2yrVi1wvj+w0vJ76rxXT7o2vo9aSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMQx3oFjDPXdAPLsR5A+KU5FCJOXDaVbEyRKHSCKhOByylGvw0X7kZnPCImHC1/QzZoIiAkHcSWtCSFltcb1RnWg+C0DXLLwCMrryhumBzHvFjeakzn5/gipslfSMXId7D7r8OoCyYIzs7kzfEX05fWnEpVL7S+Pa6LBSS8Jy4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lau6TCtt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a12ebe4b74so57409765ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532655; x=1770137455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BKn4aFL+2s1aT9WYTZvpY1Tv/MFVpnlV48wAgQcplo=;
        b=Lau6TCttDiAvq1/mIDoYn9UZEi1GT1qTVdLNU0rmEXsr5hMuS2BQwEpDMl7hLZnga+
         vQ1gBY4Kuc1M7MPiPKEN9BhhFKMEpeMfus5Wu5wW2eNjpQvc31tTNT6HPrff+RRhyL0a
         Tgib6kOvBoi5r2g+GbtEkXexZODoOw5CJksV10Yww1FnzCDXAznpn95yqn6UUVdyT+Xf
         44tbGYEHpfR+/lhcOz44HGj+FQtb4n6DH7pnoQrdtImPFwAuYa8sUcbUP7LPMfpkxd7X
         tu9L95oKFBRHlKBUUN97f3mBnp/4FOLS2vL21X+rIrsdhlpk/TsuiGDtdLpHkxw7cYd7
         tAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532655; x=1770137455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BKn4aFL+2s1aT9WYTZvpY1Tv/MFVpnlV48wAgQcplo=;
        b=VxbJsH08byY+k5FT6e+xcnUwNLCDXr56Ja4fL3JOZ6FloQtyj+KFs/yWeSAX+dWHb9
         LVDoaJhmaJnfqiFz6g9/0fR3zk5zYh+o0WXRjC6RmOuAjl2LeAIFTv35QbygmUtV95ww
         EP+VG8klXuMX/yXjXfjl2aTKAk8MJkzs+f26kggDobmLzdXr0O80aOBWv6IXJVO3d6SW
         I1f0sdrEoHfMdan0IEi8AjwXbqofR4/0Uy0RNUcV/lWz/vDzT74wVCIFTmuTEEVzZJKv
         zrslcOIPw560sqRX9GU5m73555+1GmjLVCnp/5hHpkjiDr4y5xQ0Tc6QfqsmVeL/R2ch
         OX1w==
X-Gm-Message-State: AOJu0YzCYPSYB7TacOhOmGvoJwcgwOgvxM7XCbQu356kDRvdRRTtm67y
	pS5V37XltO9ZzqarJZMTexckd7BJJqHlOiGlGJesIYkwR9be4WYUMykS
X-Gm-Gg: AZuq6aKw6P7cxgaH6U8iWybXRVa/T588u8NpyE+Jjyk9pcQEVPFnsB5+m1R8CYvEc8o
	PygTTiHMk2oNEBkpJVne0/bwPBUXgemru8YW6Jxsdayf/oK2VGTT6+aVBOZM1Po6qojjWbB5bai
	Az+GhSh6ebVg3u5vHhWo3n3R0SrfWBx6Wz9z6WyIa8TPy//wfwoe8MbVwn3IWarNlssiQUjLFSf
	WrEH3RveIKiu1YTMT+cBTdIgjAGmsUYzPtvWhVxD6tR1x+UVwVeElc3ba4+i8pAC6fjgWc7EP5B
	rl83/TRN6jeGEIwdGN9HzZVJMGSDefB9FfxZao1SFoRhxgNUpweFAA94AVLA4Em5M98tnctq1Tl
	+3XOXy6C2EUtRJLhJ10NnnMWfi2MA3Tk63l+kvRJIy+0YQ2BCuQbZ/euJWKnmVztv1s8Lsnuhev
	NATcSLzxFWy/Q6fEVuJBuOstXYdlCE2SVhAYejl487jnnZ3Q==
X-Received: by 2002:a17:903:3504:b0:2a0:d5bf:b271 with SMTP id d9443c01a7336-2a870e18902mr23308865ad.32.1769532654708;
        Tue, 27 Jan 2026 08:50:54 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:d29a:ea37:2567:751])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa46fsm120318675ad.21.2026.01.27.08.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:50:54 -0800 (PST)
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
Subject: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and timing
Date: Tue, 27 Jan 2026 22:20:24 +0530
Message-ID: <20260127165024.46156-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127165024.46156-1-bjsaikiran@gmail.com>
References: <20260127165024.46156-1-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-90842-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2D3497F8B
X-Rspamd-Action: no action

The previous power-on sequence did not strictly follow the hardware timing
requirements (T1), potentially leading to initialization failures on some
platforms.

Update the sequence to match the datasheet and maintainer recommendations:
1. Assert XSHUTDOWN (reset) for 5ms (T1 >= 5ms) before enabling power
   resources.
2. Enable clock and regulators in the standard order.
3. De-assert XSHUTDOWN.
4. Wait 5ms (T2 >= 5ms) for sensor boot before I2C access (using a wider
   range for timer coalescing).

This ensures the sensor enters a clean state during cold boot.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index fa7cc48b769a..3bfbd0deb126 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -676,6 +676,12 @@ static int ov02c10_power_on(struct device *dev)
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	int ret;
 
+	/* Assert reset for 5ms to ensure sensor is in reset state */
+	if (ov02c10->reset) {
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
+		usleep_range(5000, 6000);
+	}
+
 	ret = clk_prepare_enable(ov02c10->img_clk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable imaging clock: %d", ret);
@@ -691,10 +697,8 @@ static int ov02c10_power_on(struct device *dev)
 	}
 
 	if (ov02c10->reset) {
-		/* Assert reset for at least 2ms on back to back off-on */
-		usleep_range(2000, 2200);
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(5000, 5100);
+		usleep_range(5000, 5500);
 	}
 
 	return 0;
-- 
2.51.0


