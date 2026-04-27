Return-Path: <linux-arm-msm+bounces-104801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NqOG5ul72mpDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:06:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 083874782CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A9D331399ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2857D3F0762;
	Mon, 27 Apr 2026 17:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of5y5ffc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F9C3E8C79
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312762; cv=none; b=kHxEb+/JzePoQxlxFk8nV6vYBkhCVab3TZWpG2CscRBuq6AfBrchSvd81FHFjVhssMuSRYrQP5B8RYLRsLm8AIXUQ7UYZRy6z0TMq9btHwwrnB435Q+4s5kulWxVb11BzheJanltYgbOJZHtbdAOeF/azS5yORLpFeVRyJSGl2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312762; c=relaxed/simple;
	bh=tDAlsKcDHucm0PMV2skHLBx8pgweOOd/KInCPeBESn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ku+8cLRWy1r6ylWdbD5aOgSL1ZoBZvpn6z5hsJP8dtHtIq6yynYyS6I1hmaM+3EZdLAAF4ngVQTpswLZBxOTNiK6zmGcuqHWD565xRup+CQt06IAplIgi2vgpZVRdVMw5n9A5UvcQ5hL37nLDVXGclQiGhikLaSAxG+d7JRLvbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of5y5ffc; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-793fdbb8d3aso109987867b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312759; x=1777917559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=of5y5ffcKvBozRtgm8cIt8KvWU52gmHLEL2+saHvCzPQud50Oozy5PzvzdAdbD6BG2
         F8AWGZqhTeeMSzq4Ngb0VnDTYWZsaYMLjYzvVbuKRtEziRBBWVWIqcrXJ0oRX5OQ0B4y
         KB3T2up5ajoDDq+JsrCjfXK5xiuDGhU82ag/8z29sFcMxkxupj45rOUIIljdQhChqmTX
         Wc0h1xWSzF6fBBkvekeG35DZJbD5ZUE6qkZIZqzi0Uon9EVgnsnVg+xSsfthssafr/0z
         b0f4DvZOZxkVZYZyOeGLYOgFEmx18sXCElleR3OkqusqjU4mS7DLFyR46db28ZygkzZt
         DxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312759; x=1777917559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=oY4rlFOZr59gUH3J7dV0y+1qyi6jLLeaMYOGln98/zPoCXMErrMa5qkZfEQ2Bwlxi1
         hWXXwm689/EPZc4odkrMyhe7mTgAiOeWHMFBm1BnFH05Bd+U/NqTr5eFvkQT3hMURK7W
         KlHwBWuMaYQts0KXvC1p+hlhowwZjytSTc+yX/0dEKyu/UbbPmpYi5XaJKPoHzasZA5s
         K2v5gbrfV5Dq21KVfWpzQ/Di328XEXPFSB4vOouMk2cJRihzC8hsYU3RgqqxQtbYQpM7
         gbxPQT7LyATseZm/WSefm40uPMszlQQTcP7/8yvQ1cri1es+7G5FC3rU6piN6valdNMi
         vvWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+mfjf9+05CbBQ61ygPm4chK4uFvx0TFfO6WJNA7r7Bi7avLj2r0xcTxLOT+pX10SlxkEXrWl0GOssSmms@vger.kernel.org
X-Gm-Message-State: AOJu0YwazYUuGBW/NgiBVfp6GeATL5TAGHx5BHZ62NgKGoRhzEjM9n3E
	py8J4jkBQYpzekoptLSDunSx14zUsHs8ZjRVV6d1yM7ZcMOEfc0cLMZDkjZ7G1/w
X-Gm-Gg: AeBDieucX/5kAltauCFwRkNDLF7+YnYxB0C8im1T6kc87inqk1nXKM7mY7gc9EfOolM
	RKzbgfLPcD6XqF7BMz++ZY+8RQRw+Bs+aKAI1hVFLca6ahoZVB+GheByo9jTvnepEDUdymenEX3
	CNHfSdzIGsuSbzteJIB6Tgw4yh83xCdXv5QzH13H2H7SFYIJIK3jeFdNf4UlPHjatYkQVowHHdX
	M41bP2o8LQA2RJpvAXU0NCo+7wTAjb1XjDv3RbnqoNwxAMXQ1amFry/RV4C2V07VdhdhVmB9tFU
	4mtES/SnBUxdjOXEjt+aPHUSDf7NCRY7Wd1WCZqcGLAH967+/NAo3jM/veKFL2NSD6QARDR3L+u
	MzPsKj0aWgWpTj5mGCqftRjHiGAon9GtU5XmzSV+GsaHnY5MJ6vh+Cxf5YVe/OjW/3s0RZK3Ttv
	/DK+Rks3WZWAb0lHVP70sGn1e+mIKgB0FEOSX0
X-Received: by 2002:a05:690c:4:b0:7b8:bc4e:ad3 with SMTP id 00721157ae682-7bcee021207mr3161247b3.44.1777312759338;
        Mon, 27 Apr 2026 10:59:19 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:30 +0300
Subject: [PATCH RFC v3 08/11] media: qcom: venus: move getting vdec and
 venc for later
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-8-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
X-Rspamd-Queue-Id: 083874782CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Call vdec_get() and venc_get() later in the probe so dev_dec and dev_enc
are initialized when getting clocks and power domains. This allows us to
attach necessary power domains to dev_dec and dev_enc.
This is required for the subsequent patch which adds power domains for
HFI v1 and attaches them to dev_dec and dev_enc.

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
2.54.0


