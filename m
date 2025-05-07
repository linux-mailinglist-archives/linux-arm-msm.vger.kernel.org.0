Return-Path: <linux-arm-msm+bounces-57190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9988AAEC3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 21:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A7074A55A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 19:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E30728E570;
	Wed,  7 May 2025 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+zhLQ1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BB11CF5C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746646545; cv=none; b=Tph/wUU/VZXD5XQ49XbRSPkIXtwcp9evyJiRruswcq6iN76STRHXFurC0ovLDxwEydnA+g515OzpTdMmoymCAMrjv2Pb51fOw5ZldtuAhc/zg+0IO4sAE79crJfDegxQG1PzeXm/9gIWna4dCRP5lEpqwqA3tt+kT57ypXWacxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746646545; c=relaxed/simple;
	bh=7XrujFspiBdrrtn2D8Lkjt+TTmGIqw31SmioCIyICXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wi0Do2tHQ6PH1wERf69tCWnDj7nuJRjnOLhlwxBU/p0MGZPjmSETAFB9hCQHyoQ1OSKYRxGhUAx3bfOXh0bNGDAJuIqDKsVzWKMVKsmBfY93JdnvY7wdmq+wN9eSAbuIphTeYRFvhfFR4sH3DwIpcRlCpXA7Ih9aItkblyxQYq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+zhLQ1H; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499cca5ddbso30352e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 12:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746646541; x=1747251341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBGWEaSSPZ+Q97XJTP872I0ALcCOso1Sz1JLgKAI3qc=;
        b=B+zhLQ1HRYh6inTeqLJi/C7LzGHk3NwAwfKR7z+GmBJZQNcc5UJjvSbVD4VLxh14Pj
         14BXH1Vod9FYyHitCRVtpf3TlKV4WRI6q5IVM3L0bs6pNs9ailLYr6zgcY2jlNZYaC5M
         7YTltG4wBKh6YuwrFdFXPyz5axwNvuCLLmi15IpY637cL2tX4lvPIdWOnvQzGROYbSKH
         Rj2ACvXDSItJULX19ZbPBephAmv8kKj+yIznnrZSZdAEsTNC3p+WzaU1b8kbVojV6VIn
         PtzQh+thPm4HYt3bH0pFuMxnmKUlemDX9bQWc3+cjELSBV8xWZPrxJ05+sj5yBYALW5Z
         QFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746646541; x=1747251341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBGWEaSSPZ+Q97XJTP872I0ALcCOso1Sz1JLgKAI3qc=;
        b=agNBSu4fFPQyuebtU7XkqbreRL0rNeX5JadfyZfAkK3vPe3Vn7lGttrbPKgXVWD7Sh
         UpsJKmNpDo/LMf8S0pp3iIdJyga3c4EbbbnZcMltv5Evz7NWpsX39QdLPZRp3ITJg2EG
         ZJeZCVKLCdwSk9V/YoCo8NhmJm9gffOaQIh2mqV5podgfRiMjwG+1N2+aw5JYWXV6Dcd
         UdHROCwgWX2mZBpUGq5qg0+TAArwqWeI1pqAk9CJxXj/K23uJ2V9Gj4kLR0zdE60YGzl
         YSg8gMAIQiQQq3smvC/Ni9vbolyWqkWmRp+XGb78pkXiMN5upOSoGebv627pSmco9sDv
         aSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgm93WrFSFwQNrvwY/1R5x7mEq6Sf0DpvHNNfjqeJNuCtMI9omgqhRGbTnxY/ZRwIb7f/aUEp1lipe7Jng@vger.kernel.org
X-Gm-Message-State: AOJu0YxFwygn0fnAjyXlXt7I5+tpYV3g1TyEVNXKrDiaKTURF0jZJflk
	ikf7pMwMlCYu7m7GDPOb4JV/qddWczUeX4+koOl9DIjDQfqwMYD/PETy6K1FgJs=
X-Gm-Gg: ASbGncuLtnwwwHyW6b2YTRmzlF5PGXxEup08fOeErOIHVRq8TmvBkKoXhzndQ0oVScE
	W4Mim0VHR3bu8cLbltJD1569Da6VJtYDw2xtbK2hO/JQO4LS0QK+jxQdmxjOqvLomzI3mjHJQgY
	/SWlheDnzO5eVHlb53pFTX7wla6SJ1gdicDibuyhT2T5gigwBX8AGEfLliDFsSgCPglaWxxDIEM
	MjkdGN467W+tUOAOnDy9qwlpLDOxPOZtO5KR9CTdFvLZV3W0h1y1LEn+aPIDd+hIjwOEKD5/OJP
	k9DMwMAc8TMaQwD1vqTtvny5a5gNpvvvsqkQgQ5AzGUcPn1lTw0xUYSt4h24JW+fao0XpZV0n73
	y8GKWJg1EvhqVQE1T1wolLQFaNyJlqQ==
X-Google-Smtp-Source: AGHT+IHtds5bXFRbjMaPBJlpofIW978QDvrZvNl3nQjdXjulUScc7U1SYUPoyT7fCQI/v3vFhasjCw==
X-Received: by 2002:a05:6512:3c86:b0:54b:117b:bdba with SMTP id 2adb3069b0e04-54fb965209amr591699e87.16.1746646541125;
        Wed, 07 May 2025 12:35:41 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee00fsm2432066e87.120.2025.05.07.12.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:35:40 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: mdss: use devres version of interface to populate children devices
Date: Wed,  7 May 2025 22:35:38 +0300
Message-ID: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial change, there is a managed device resource version of
of_platform_populate(), and its usage simplifies the code a bit.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402..116e8f93f8c8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -550,7 +550,7 @@ static int mdss_probe(struct platform_device *pdev)
 	 * Populate the children devices, find the MDP5/DPU node, and then add
 	 * the interfaces to our components list.
 	 */
-	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
 		msm_mdss_destroy(mdss);
@@ -564,8 +564,6 @@ static void mdss_remove(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss = platform_get_drvdata(pdev);
 
-	of_platform_depopulate(&pdev->dev);
-
 	msm_mdss_destroy(mdss);
 }
 
-- 
2.45.2


