Return-Path: <linux-arm-msm+bounces-67224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A86B16D5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD70B17932D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662AE29E10F;
	Thu, 31 Jul 2025 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eem3bXSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A028D8C9;
	Thu, 31 Jul 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753949975; cv=none; b=M1nLnwp/bIfpAK534wlBMs1oHpmejeM9tE9citRYqA3Wggg229i9dSU+EMZC4vzjsohazf/L+7YJ6ydCYju3Se8QHGMTOZu6EUKdPhH/+l/3nrGyZr8Xd9PN5xnr4NyR6ojSErd7vG2390CIuwKZLQLcA7E6+IbYWa3um+iZ1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753949975; c=relaxed/simple;
	bh=PxsBR5tp27NRMZoMBwZZRy3k4oipyo9hQ2NqIO1xk8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DB7fxc9e69bqxW+biDuU2GTMRo+PZ/A85Z2EjSIlopYoU8W4dfK+9BF7QHGLK+m3Tm6mRs1nq5S8Z0i1B1UxeyIwc3u5qKC0U1xKy3yXxmRzI6BxvT+uiufqkU54ejFrmCYTX8xmXKBL4xg8FbWMCqo+Mk8Xd3Uwiw6RIfu7MFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eem3bXSS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45622a1829eso589305e9.1;
        Thu, 31 Jul 2025 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753949972; x=1754554772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcoomw/1hAL3KvzlKNuykH0cI7TxLyZBhhHk2RTTvDM=;
        b=Eem3bXSSU1OoawncizhCfO+OQlHBMOX+0qP+9m7LnISsrLs9EGT6sZd1XHsLid6c47
         5O7IYeij5GIWgNv7Vbn+LqmRGhvB+PFjiqIZKsYVppB/zaEoFoQ8XSd0RtiSykEG86tM
         Rb9okvX0lVDLPnYiEeOoRxp1EM884D6910COfmNTpq3lEJkPzNpgTrn4HkaYzDG4MFg2
         cn6zVMZLJpAawNvXcLsu6rGbk34aAVZIcJFlIyNvSu0t2j7R6SV3Hx7VEu/XW8WM8bJR
         LdnSqb25Ecb69KLBxoVvAK93AdmVt/jznn9F5aX3dNffu3rEkNMJhwRwen7x9z8ZrB9J
         YNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949972; x=1754554772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcoomw/1hAL3KvzlKNuykH0cI7TxLyZBhhHk2RTTvDM=;
        b=lypmPRFPh1iYMGf8HcNRCTjp5X/M7bHArdorq38C2SmtIgg7in/UcnJInjKSMro18G
         6D5FL/K217UhgU4o7uvgWsYwZElk0WhgiIQeTEsB+P8MXwWkpR7ho6X7sk28s/E1GMKh
         MyZTSOHxi/pMugESD8eJN6Q+CVy69OLnxZweogrPj0SWbJtnJN4EDoQE9mf/FY1ij4cd
         DEAmKVN6G3lcoAUV4sdg1QmrS7v5jL2S1HcLpBm0gKNQ13fLKGq2AgnhgsH+vDL6itVD
         UEp4OBbN/g8dmUsIg4iLl6VRSa4ggitzUxMJkDTTv3hoUvp3sm2B0TS8TS7BLJSiFZ/u
         BQsg==
X-Forwarded-Encrypted: i=1; AJvYcCU4tTi/0dM577E0Ren90gLDVL+/03mfwChnU3+XD4RXKfhQwbnqf1SYCCBq4M1wdahrKvY7vVTIyIPZ5Qf8@vger.kernel.org, AJvYcCVmXrkOIR6u0nEiYuDA1UntQDC8mQ41LmCfebrkUOBHnnNaNS8IM1xj5Vw8PW/4z65xVK4b1LKr6NF8Pzbr@vger.kernel.org
X-Gm-Message-State: AOJu0YxWQ9Azhb4IZ2DxFoDMe7+N5WdcHuJiO868oB4WQfAkaBjhw0ZZ
	5DBDuLS2CAcPPzsC+o4MQNxNTZcg0cTxH7rzKflJAtPpSXkuDhVKl2aVt1w9I7g/uAqnCw==
X-Gm-Gg: ASbGncsFGKksmjhgJCdA4S2IZkntVtRUtwaykwvRwrq8oKpIRSDHnOowuwmTg9GhoJ6
	ur/+sI8L/fQcPhoZxpOiWTqx0erlagsN745u4fBmKtJP0aL79QidIgJUdmorjMjB95+lKxVaXVh
	wvqqlFqMCuVetiYtgnNlbxdRSs1WF3Wc5R5T2yccs0BTXN+xVWFiCKbhpXisMeAwzvz0DjrrDYO
	qSKNgQTHtu/MHQcal5zuwiQwDN96eeN6nrE/VAIZEQ6CYVH4GGxMq3EZh+Kfw3EX9y3B39Y2OLj
	v1nsyTu5YIw2USurNjKVDIU/qU4jgs2lTROhY5svxr0UX7Wyt/sLIwRLzquuD61xCmYCv8TmwOk
	T8Z4LvdFcfXFg+5SuY7Za8B1Mhibshn0=
X-Google-Smtp-Source: AGHT+IHNFINuB2qnm+mYjJQTsDwzlFYJuyZc8VGKOrPRokvjoYXrZDyXCOjo94KVV+XJTnQmPhaYqw==
X-Received: by 2002:a05:600c:6308:b0:456:1121:3ad8 with SMTP id 5b1f17b1804b1-45892b9cfacmr65956625e9.10.1753949971926;
        Thu, 31 Jul 2025 01:19:31 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3b9074sm1516092f8f.17.2025.07.31.01.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:19:31 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2][next] drm/msm: replace minor->dev->dev with dev->dev
Date: Thu, 31 Jul 2025 09:18:54 +0100
Message-ID: <20250731081854.2120404-3-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250731081854.2120404-1-colin.i.king@gmail.com>
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer dev has been set to minor->dev, so replace minor->dev->dev
with dev->dev in the DRM_DEV_ERROR messages.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index da618720cf8a..97dc70876442 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -340,13 +340,13 @@ static int late_init_minor(struct drm_minor *minor)
 
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");
+		DRM_DEV_ERROR(dev->dev, "could not install rd debugfs\n");
 		return ret;
 	}
 
 	ret = msm_perf_debugfs_init(minor);
 	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install perf debugfs\n");
+		DRM_DEV_ERROR(dev->dev, "could not install perf debugfs\n");
 		return ret;
 	}
 
-- 
2.50.0


