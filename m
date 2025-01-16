Return-Path: <linux-arm-msm+bounces-45209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A043A133E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EA0916385F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D114B1991BB;
	Thu, 16 Jan 2025 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojBYEkj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565271AB531
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012465; cv=none; b=mg5LhwcSeKs8OP2MU52AGmENlFIDjXD8bMwJsKzM6MGhoOmHHZZLgvHBnkEq+L27WMQxM5e24bGouY2hdflWi5rp5WPiDAUljgfks2SMUQxeshQ73FXjACQdPOZ94JsZD3uwpNc1XuwURc5cYo9Fz7pIuwoRput3tP5UsgT5YEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012465; c=relaxed/simple;
	bh=a64yZUVbmjveaxw7MvfAQcSIf9K7WyhFoHvJmze3ZhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3izUU+PUJ4vg2Zcm7eKy/Ic4snF8bCE6YQNcDRYaM3wK+AUlj2nu2IRuMW4KjPQrqYFhmcFF0/DZJqh2HgI6fe2ypuCyHWDo1OYsO0y675i9OjznoQtTOD+D49S2BVZO8gjuFtbyPm+fY6JgV6Vo3mWdGwUGvb21B4dHCJ29tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ojBYEkj5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216426b0865so9177745ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012464; x=1737617264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cu15j2NJTtLjV9+MVFGzHMBk+ND2a5wSao3sFlDFfjM=;
        b=ojBYEkj5ncw/5iGMUK+qKjbQkiiheGloXw9Fg82iTbTyZJpwbhE9panEDO29o71eev
         bALM3HCqmmLdA0EgvKBpZgv0T3zkXcNY6ZbJ2pukLLJoxQMgNJd9BMtvZyDTf2ubAlkj
         VzEex+PJbN4bw1SmYi4EqnrVHGpxkidB1Y3qDWsQbtWmPZQltCrncV3ntrBckPdYtzAx
         r2vhugmF/AGozNy7XodhSNBXzyAfpduLoq3XUmvpmy98NGYfJOjGT74lrDMdwIBoXoq+
         fA50/JGsW/TZvHjT6FlyRybBPc6MM4P1hal9y4vsB60ibwWHGvj0cCTtnyoH1ecHiKIk
         cEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012464; x=1737617264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cu15j2NJTtLjV9+MVFGzHMBk+ND2a5wSao3sFlDFfjM=;
        b=gqzCsIcphs8PlV824sP4Z+Rn4YqVQnezhOaGB7URaXc0TRCOHZFQF1XcQvykIB7Ckp
         xkFzDTue4SjaXHwc66Z9O6rP26E4qrCAKyJ1Vhtck89WEA6kJ6uyYCdboBZS2Vy3nxNo
         A7h5G7LkEP6vnoZASY9Z25YFZI2wCDc/yX/submRMug3jWRIAguiejhwr4e/I9CZmByR
         WK5WBoaTksbIpn7fE9TZ/9I7lkoff+XNzdXV1gcY2y8Q1y+KKFiZKh+mO2ypvEtD+wY7
         vg5rAGntSrYn2378G1uGDLOJ2/wqh0oIkrRtZMr+8cLX4cXzJu2keAbkxvyg7QZPo8iu
         X22Q==
X-Gm-Message-State: AOJu0YwFSpXRDEyy577BqZeCtES28JhN5xQBWjvFT8DwKycXzUJy3jgU
	wR52urpDSJeAY7RBaoe2Z+JC5WfvVWZ0nh9OD+5WCyKkffYzmZQ25DkDEZbXi6I=
X-Gm-Gg: ASbGnctGhO8DRW4SlX24Ss14zKoGun/xXfk8BwBLmptvnptzn1z5h7V9Vc0rNetpDUc
	JSk8oYi2xmbQQcT5ZRU29hjVSNWu2JIEg28TtzRyLMIo8Hl+qv6lwSIBmrUPacDwRo0iW4A3vTn
	3qgnTPl2xjOeqrQ481SOZOEm936ZG13rWakGZmDSbAikqvTaHbg7aJaC95cLg3zZ3ehbY6ZuyB/
	puXsZJAfFR45hdK6dLFN0wv8dJu3mwbo7A5FNaIKkaeMAHZiJ3YOA==
X-Google-Smtp-Source: AGHT+IFm84hxYMVEr0+ywyZZl87XBL/i+rgyjayVVPS3fcbervFdbTiM7rDGmDOi8kZxi6bOUnUopw==
X-Received: by 2002:a05:6a21:2c15:b0:1e0:9cc2:84b1 with SMTP id adf61e73a8af0-1e88d09e13emr58284163637.30.1737012463853;
        Wed, 15 Jan 2025 23:27:43 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:27:43 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:26:04 +0800
Subject: [PATCH v4 15/16] drm/msm/dpu: Disable SSPP multi-rect mode for
 every pair
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-15-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1058;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=a64yZUVbmjveaxw7MvfAQcSIf9K7WyhFoHvJmze3ZhI=;
 b=LoRxm2CbOnuyS1YwLYTxXBpcl8r2bdQkUNXgYvF+hft9P5kfaGuNni01PeJrfTD4ZqL9BRGpw
 br3iGNDQUQeBxgmEr7nhgvZ5pnPUIL5foVNY1SR8XTgMkoKii2K+cWc
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, 2 pipes are supported at most. It is enough to check id to
know which pipe is in multi-rect mode and disable it. Multiple pairs
are used and need to check multirect_index to decide what pipes are in
multi-rect mode to disable them.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d96f4405a4c26..d2e0fcfbc30cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1480,7 +1480,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 		 * clear multirect for the right pipe so that the SSPP
 		 * can be further reused in the solo mode
 		 */
-		if (pipe->sspp && i == 1) {
+		if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
 			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 

-- 
2.34.1


