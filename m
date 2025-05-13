Return-Path: <linux-arm-msm+bounces-57706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E2AB56F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A575189B45C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 14:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C068D2BE0E0;
	Tue, 13 May 2025 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cio8mBlS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E567F28F520
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 14:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146246; cv=none; b=BJrkRYFE2gCCqWASTRlCwSHtb+ZEp3CDhuEH4NnnDnCPrQb+xVoDZhHPeLitzyHG4eUirIdbiXQ7vI0DmPntPz2ul2tyKdMtjpibz1N2kg/Waw/x5NvGzOK/7mHrKVDzutpDLLbU7YkduZkZq+ynZvzYsYSB9cgbT9rJbMquxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146246; c=relaxed/simple;
	bh=TEtk0BAez4A9tbONJb+ibjQlQfyN/iZx4xrxbWn0Z5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5LicVoTC8GREOA2YjGMPtNQOaxwKpRvHqvN1aaTf10sFh8LQOBT2ORFDpWLRgXa8GlQMIMvBEncFHykYgdoFck99LemrakDYD1Ceqqh0j0E1p1reuG0J7XatI1ovqqgO+Yj/4UnF4DqK34wb6WYXFEqAlC44xFxoZW7A/ZRFTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cio8mBlS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54fc4a9b290so749834e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146243; x=1747751043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87PeNSaoARSO0xJcDgxfba3OS94iBFvi7PfmwqCHUmQ=;
        b=cio8mBlSTllkz4DWRti2TqDfgmP3xcLsZoPnt67S8yS8fVSR6a1n7xh17mudDkS/z8
         sMCdCCZR3huskBa1YsHzCDv6sjYdjz/auEH6iOAsfGjurZtZzve/C1VZSbWRp0hSLTQf
         0cqy/KMwMgvObEjCEcW/QObTMRnTIvCJsqfI6EYF75IW+gdvwRchskgnqDbhz0uTxeAd
         PZsGeeB9ieMpYKA353z4zTzCObxk2If7jRKj96mzIJ6RPO/VDxJhEx7+O5bXmtKnJOTO
         GcLvYj5WqDpi//ya/S22vYYvnEguvxHHVLsH2tfwe8oFBpm6xV7rvJtQ4oub8CuqW2vY
         L4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146243; x=1747751043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87PeNSaoARSO0xJcDgxfba3OS94iBFvi7PfmwqCHUmQ=;
        b=etzgcaRsP22du1jYLciJZk3LKuznjGIYt4MsUfU0X0OeyUEoM+gd3/YBowLusRET5t
         Gj5+SsBKLTb19AVxAVrPvb/M6ZPqIX63IRLUAmYcE+lVo2iKB42cUnj1PgxYv2Ez56KU
         s0JB2u8Sx2Tuh66Gl+yGtVeSDiuMNygTb4Q7V37apefiIkM9+Z4TL1AbtSMf8HQoQ0gt
         2f0uDNoiJNybm4pT79GddIWMGFmOgyMvIAWNx/YNewET5hRoKn8Z88Reo6rReTFSvgD+
         moPHb/TNXXDxFBY5wG/mNxvTBHPluhhROTMv0AVrY+AK2/oro0EU4By4t0pKM2PMwXb/
         7rTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4d/W/cFpvnbFDnsP2FSpq2Fv7d+lIfBOu0Cq5tEnFzi5AjTu8Rb7r+7h8rYnGRhbEtmUntedyPNUsd704@vger.kernel.org
X-Gm-Message-State: AOJu0YwXHni+/G9e/5moQIZFEERZjye/N/oXR9ovubuqkAieeuUAnITJ
	/IJ0lQ0DUIkclkwYmbxhhjuo6paQdgBtiL3sog7qT51nn2PWJDeeFX719VoBJ8M=
X-Gm-Gg: ASbGncuxsyHp1DnFZCufYBgZ22s7Ehw9tlry6ugvYHjpvSLyui4Zwo6uqSj/zm+m1+A
	QlTJiYcg3uxjoT0pqgXdBT1cxRlysXTem6FR0tANkkrPpmxi6HIDAqxYH1YFX+vFPed4hDbTXGC
	e3P2V8metRQ8L+NRPyyrcnuUdNYK4s1mSqHb8oZkObxTBq6umI5xZEEIRi8UronPXF2p+Abv21V
	XMu1HSnZGp0pRxd8BvU58MYq7Rks7/A73b/rkN09TMAjPRtszTM3u3kYagWHC+AdE9YgNqV2EeT
	ud8Aqz/56oqHvIhNbCb/xOgmUQ4kU/NxRfUjBhSdt9I4xCfBBH4Y6E2iA3HgXmyQ8X1UlptQNZu
	bWcsgVjEV2QbKI4LZ5FlAsImv04v4ExZQSdt4vrFL
X-Google-Smtp-Source: AGHT+IFCj6ItwkApXIPWgFlOj214q7Cn7XzHyhJB7R1HfvQX2QzqVdxWqZtWqd1cP42fxdofZLJTcA==
X-Received: by 2002:a05:6512:acc:b0:545:2f92:ff5 with SMTP id 2adb3069b0e04-54fc67cead0mr1820285e87.11.1747146242900;
        Tue, 13 May 2025 07:24:02 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:02 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/9] media: qcom: camss: cleanup media device allocated resource on error path
Date: Tue, 13 May 2025 17:23:45 +0300
Message-ID: <20250513142353.2572563-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A call to media_device_init() requires media_device_cleanup() counterpart
to complete cleanup and release any allocated resources.

This has been done in the driver .remove() right from the beginning, but
error paths on .probe() shall also be fixed.

Fixes: a1d7c116fcf7 ("media: camms: Add core files")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f..f76773dbd296 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3625,7 +3625,7 @@ static int camss_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(camss->dev, &camss->v4l2_dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register V4L2 device: %d\n", ret);
-		goto err_genpd_cleanup;
+		goto err_media_device_cleanup;
 	}
 
 	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
@@ -3680,6 +3680,8 @@ static int camss_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
 	pm_runtime_disable(dev);
+err_media_device_cleanup:
+	media_device_cleanup(&camss->media_dev);
 err_genpd_cleanup:
 	camss_genpd_cleanup(camss);
 
-- 
2.45.2


