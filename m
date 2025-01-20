Return-Path: <linux-arm-msm+bounces-45620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E749FA16F92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B54E160E1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08A71EB9FD;
	Mon, 20 Jan 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cFt3/o9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B541E9B19
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388029; cv=none; b=UxuTxEb4il9iSDfcvCkINU0utMrWuEZKIWq8Py8Of5/xEKBxjwPhbwC2i8kAmSrElEcSpk8Q6rAvErYM0QA6Z4KP9FvW7Ar2e0Eufo8Opi2gLDptAI101Z03ArMJ3cZrRcBYum2MyBYha00YtVKxu9ahTUmAGFZfBz2JA/rL4WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388029; c=relaxed/simple;
	bh=YDmfsVdEfslTeB5tlJT59e1gEl1IIeKoagoSAphy/v8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhSvqJi0C7eGf/ImfL4pIuAV8u1FOIkopzrCepFuEjCagE0Jz7XJDw0zNHclptbj7yDg4l6UtDsfJXUg2WNo8kWDhNNM+hKeeM33v8kY1bp1QvFDqwGvdk12m2ZoFZN10BsEyUhW2aFGAT7VQNqW77/VziH6LzDriyxSJdxBYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cFt3/o9f; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385df53e559so3612091f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737388025; x=1737992825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4YmIVvWntbAsllR5dKuT+D1ShEa9qyZfjT7/otOhdU=;
        b=cFt3/o9fPsZnl4xzUEKnmD/NPOr30p7zdDUADHnJWxPeh0ZVvxCirutv4yc/RA7Qj6
         Nv5jVdtwLrXoiNrZJiP8orbA4Gw5o7+j7YbyzyLR8dudIED84l6PpLAbbYdS9riRQwYz
         tFGcdeqUlKeiuCjSs7tCZiljyu/m1+0QN5L8Kdp7p4p079ViI/CCP5q9sGhH5Oi4STq4
         Kn3kbOJNY+ZCicMJ13lhy8Jxmzi3d29aBxhifrvuGRXoDbgPW8izS0eSF8lxzS9KCDLk
         hNhAC2czsv9qzJ8bpPRgsWoW+HDB/OqglZevzglbSpQ7yKHD7AJjq1dmS2JUvQWNnzFb
         cenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388025; x=1737992825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4YmIVvWntbAsllR5dKuT+D1ShEa9qyZfjT7/otOhdU=;
        b=ftaGhlIY6DuZ9fgDxYhJdyi4JB/6B4PAIlbWxdYTbO/idBz/aNpiWJxPiudFuRq2ii
         QOOkwwPcm1sATINVN7ifpC2c8jbectJRI1iweMcNN8YPHdMvFviKvwxT3OHKJyZYv82G
         zo0ipm9yThYyWE6i5+xHVvAiCLL3cJnKMBmjBzrzuKyeyqwaByx/AqJVPGTsmw0MCwBe
         L1FUcndreizgZk6+2svFwzPpyrQFyPSmmCiB/nTcf87D72sd8GdtOEd8H2RLg8NF02GW
         RCSDzt0kHwzaLxBM7uKG6LsrKZ9kKGdWF/FgSS+aYyDiQqWm2dSbTgyHOOrNO9wupvbN
         F1eA==
X-Forwarded-Encrypted: i=1; AJvYcCWCYxre9syTuAKyGkaDIRpnqA4TFRVkfj+MAXhBuSfPXqsX+6DcSTtWCuUZcQZGz3SkkhaL+/hWeRrvL2pa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl24rtSOqcjd94fIUyQREWZH9lyraYmo7LYYGsrr73LemlJ79h
	BPLQ7SGq/qRRFXAqlZO6rbqgkhUvX3+IyTxzd5O7M/GuqOnZf1ICSHmLtwsK8pw=
X-Gm-Gg: ASbGnctO5FdKY0Vsse5R4h1uDAOShVgcaByxYuMn0PrmRkuvH+Jm28upM556NQ3bbF8
	qo/q16mtGRbxAUOmckrTbGS2Ow5lXxzOPYCLWZXs4/Fk3k4AQEn3daQTfX0Du16YKxOO3aCHic1
	U7Wm4axb68SOU48Dim8a9RGY4ZgPlh38ojvNzRuqte4Q+RyOhNiGHhNbix63KwzUvkVF+PJugN5
	QC2ViU8a5DDGLH6uuYy4Jy725XDdq5tvCzwikxSmJAKXpkSJiozo2mr9+Ct2X0Bdo3/QdBt8DhW
	RjY=
X-Google-Smtp-Source: AGHT+IE+0NBhx/Co58J/f5Vb35XzclAS2LGnRT01R7FBkn5X44ZzL89KUzEdqtn7d/UqjjEY/nHB2Q==
X-Received: by 2002:a5d:5848:0:b0:38b:e1b3:16dc with SMTP id ffacd0b85a97d-38bf57d339amr12052973f8f.50.1737388025212;
        Mon, 20 Jan 2025 07:47:05 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10645766f8f.26.2025.01.20.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:47:04 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 20 Jan 2025 15:46:59 +0000
Subject: [PATCH 2/7] media: qcom: camss: Use the CSIPHY id property to find
 clock names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-2-44c62a0edcd2@linaro.org>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-33ea6

Use the CSIPHY id property to find clock names instead of relying on
generating the clock names based on the control-loop index.

x1e80100 has CSIPHY0, CSIPHY1, CSIPHY2 and CSIPHY4 so simple index naming
won't work whereas and 'id' property allows any ordering and any stepping
between the CSIPHY names.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 28 +++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index c053616558a73..c622efcc92ff3 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -586,7 +586,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	int i, j, k;
+	int i, j;
 	int ret;
 
 	csiphy->camss = camss;
@@ -680,23 +680,21 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		for (j = 0; j < clock->nfreqs; j++)
 			clock->freq[j] = res->clock_rate[i][j];
 
-		for (k = 0; k < camss->res->csiphy_num; k++) {
-			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
-								      "csiphy%d_timer", k);
-			if (csiphy->rate_set[i])
-				break;
-
-			if (camss->res->version == CAMSS_660) {
-				csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
-									      "csi%d_phy", k);
-				if (csiphy->rate_set[i])
-					break;
-			}
+		csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
+							      "csiphy%d_timer",
+							      csiphy->id);
+		if (csiphy->rate_set[i])
+			continue;
 
-			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", k);
+		if (camss->res->version == CAMSS_660) {
+			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
+								      "csi%d_phy",
+								       csiphy->id);
 			if (csiphy->rate_set[i])
-				break;
+				continue;
 		}
+
+		csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", csiphy->id);
 	}
 
 	/* CSIPHY supplies */

-- 
2.47.1


