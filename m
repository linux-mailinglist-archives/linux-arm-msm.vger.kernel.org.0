Return-Path: <linux-arm-msm+bounces-103428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMQKMK7o4GlInQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:48:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C49AB40F23B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3FE05305C1AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C173E3D412E;
	Thu, 16 Apr 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKeS/fIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B33CEB99
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347089; cv=none; b=ME3iD5Ygs5UlwbVGDumenOFwdggZX93C7d4rzcWMH7o0aCdGpsVLxDqcljrzu6bLsS1J+c/KyfBJwHoL2De3+6ruDPXAfuPJ2WqD7cAE26jN79ErqIkUFsidaCUQ+R61Vli8INK571wxmrZUWLa+i42bSHzQZjP41zuREnsz48g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347089; c=relaxed/simple;
	bh=onS0/m/vDkiKzWD/tkw4RzM9xpJQaL3JH9xNGGk0fWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnIUJUER29Zu9dM2+NEL/MBDmDEKU9hRlt/zuJx3Erfr4xvpYGs2k7YUHxrkvec2cXd+Fd+teKeLWTFPjoFY9TLX8APFbqEz6Bp3JmOXjGKC816gyyBUcHTp63s2pHAWbyy++rTyrjIiCQVLm/Y9GZx+dOmGVo+ul+/3gWZ3Vpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKeS/fIr; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7b81f5ab95fso15873257b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347087; x=1776951887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q85WGONNVVR0+yKGqs+n47zXRUM373JSpoxp6zRqP4=;
        b=JKeS/fIrS24+QrCftHVpyQgkwuka/CElhnzLAkzVsAKfs9Rf2S6qUUR6DvQib4H3pE
         hLBcoX1fj2e+uvUp5BZ9NfvB6dEMpNJIpPKbVDlZfOpFEdchbIcrTU6v8hLUBBlmERMh
         5MGE+sfAp5aeFUtlOckadwx6z7kupLtEDsY8qwRJch1fFXJTCvOPgt2PevP7WY7ocHFm
         8EfZh9UfIYtIMdBlCVGaBKzQMf0zVfgGB8GJyUt0adofxIOthHSO1zg5JAW0gZzKnc+E
         mwwcL2J1ytU9j/0nR4j3I9i55HRbDJmRQe954emWkf7jMZsD8STjxVSNqZUvY2H31PsA
         tiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347087; x=1776951887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5q85WGONNVVR0+yKGqs+n47zXRUM373JSpoxp6zRqP4=;
        b=ObhVjAVD3Tw+xGtk/lIFR9wqjiQwO1PQZAHoDqIbiKl3fE9EdrgO/nyJBQ65US1tun
         NuX95zSEM4JYjchWKQbHcnB03Usctt8BVeCeouG2eoGpTk+s0CfabJo+X0NxdaXlQz+9
         GvobTuTmph64iaJBvx6qmZ7qpzAB+KPNunZFm/7r3Wg52mlgEedruCtzP0ZL15Fm1PpJ
         5140UsEKl4Qoj3un2Nacc3UOc39ipd3HmhefQ/lIz1mTv6sL79RV7Hof4F0wRTs9J4Wk
         5hXxhePPEX4ZM5w7fHy4Un1RmJZkI0BqDClE2G235PKO9Ldc+4MmAiGwxEFwLZs9sNlo
         QPTw==
X-Forwarded-Encrypted: i=1; AFNElJ8LbMVZkrlTjIt89Kh1K3ArStC9Hf+BEQIIskIGy6/+XVOrMVlL0cuA+JQn1PzijniZ4Iv5j3TOcfJmKBLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMT7JhEmvzRPk3L295JNgzvlhmh7kEoZakhrH90wOfWY9Zo0d
	Sfc7y2LQxonT2laQhDDo6PnUJ6+KFXyUNi2qkXrAeJddo84DmJni3ivt
X-Gm-Gg: AeBDieuCie/VuSFmbONiO4NJPcoo6PQF42xbupQiyNVLH7VgzYbDM/eG08xckyNJH0y
	FfFL52mWpxlKm9uUaiq5cMdpOCqQG/07+BGRV8v3HUiZzjHn/yDUAKDemH4WuMV1WYClekhdyms
	um0r7MyS4txUwAp1yD+/6thsPsU3XyRVRO1b0vzDMhIX5DA+psPCfJrp9TgDSsE55bYG6R6m0/z
	kdXpuHCZzcVjhKj6Lja2svIhW4/4hQlym+CzG32Ggj5TJtOAx7npbV4ZF4rpqXLST9prEPmIezb
	zTi0Szv5uw8yPUZm27af1dN1gZOo1v1KpRYsIEMa/XQePlvfSc2tYv4YBF3BL7pTnqmeI9LPNSn
	/GgjTqfEfkuF9z+J0NAeLaIpB3g0JzdZZ/hb7xC32DHKgUJQFScNW6jZXqM+jzEQLURMaVOT3iO
	03DR9lE3U7umjXg3CPBhMjFiTHPH5zd8FElpDz
X-Received: by 2002:a05:690c:a056:b0:7a0:4146:6ebf with SMTP id 00721157ae682-7af71e48dacmr224335337b3.46.1776347087013;
        Thu, 16 Apr 2026 06:44:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:46 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:55 +0300
Subject: [PATCH RFC 08/10] media: venus: move getting vdec and venc for
 later
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-8-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103428-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C49AB40F23B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call vdec_get and venc_get later in the probe, after core->dev_{dec,enc}
get assigned. This is needed so dev_dec and dev_enc are initialized
when we are calling vdec_get and venc_get, so we can attach core power
domain lists to their devices.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 12 ++++++------
 drivers/media/platform/qcom/venus/venc.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index daa8f56610c7..a4aacf5e535b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1792,12 +1792,6 @@ static int vdec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->vdec_get) {
-		ret = core->pm_ops->vdec_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1817,6 +1811,12 @@ static int vdec_probe(struct platform_device *pdev)
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 
+	if (core->pm_ops->vdec_get) {
+		ret = core->pm_ops->vdec_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..5f6844d3d9d0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1568,12 +1568,6 @@ static int venc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->venc_get) {
-		ret = core->pm_ops->venc_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1593,6 +1587,12 @@ static int venc_probe(struct platform_device *pdev)
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);

-- 
2.53.0


