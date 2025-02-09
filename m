Return-Path: <linux-arm-msm+bounces-47270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A432BA2DA82
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8706B165C14
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813CA243365;
	Sun,  9 Feb 2025 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iD36FmFZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F853E545
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071304; cv=none; b=YeUUxEoxuuJTV+c5e5ldpvMx2YFLn7wZ2kDCZIwqUTxlfbVBTZloZDk7BKZAdR0kUdma1UXo3KtmDU+6bOYUpLFgeJUwPxUZXU64x5li1L1fSeZmC6mVGPBW/o/OMc707rTVYGss5CdcGu65RaIYCb83S0juxNIA2qZqXxfMptQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071304; c=relaxed/simple;
	bh=emVhsAcPMXJo9jthW8kjkV7unV6UYdXutY3krP5kLuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbOh23+2I/Yphwq82wFc/wdTjAFYys9weXkh4i7hNfrCaVgN0v0G4EoGCYAwH19lkSXpgWphqCgDfkijTHKKd1iS6EFqtNkxkSIpxOU9NMTcOo1p+/6xr4jat4FK2yKgk0xprJQAv064GyC1I4+MpKGq4dT3pNcTotQxxTpGODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iD36FmFZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5440d5b30a8so3935895e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071301; x=1739676101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ku0sYwA6Z9dPRMZKA3dFauq5bkh59hsd6mNrzYvKW4g=;
        b=iD36FmFZQbgq5rKWG+bmb7bMTIS3e2D+tat/OEqKWfLl3A6oAVKnyLxEyvEYRlJsaw
         9n7r7hibdJ8abeLhUhdFbeF14Nus0TvcmPbP4NAoZikqrNA6v/4Z2nnLK6rFKCAD+aaX
         uXUnXUL0HqfkQAmZ8WBujmdap8FW3DgCOLYJm4l7jfCmaGF2Q5FbrjZiCwCV3xWGbgtZ
         HoETZNuTIiG+XTTwpVyzX5fZd1QK7slvbClcud39LHJ7T6XUmJQrRRO+TWdtyJSHTqmA
         4kjPdzqWK+4I97mIndXW7VSvYQ0k5yFM8folRiM1LxbUKEylI+tuJjGTTnBVM9PPNvMD
         Dl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071301; x=1739676101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ku0sYwA6Z9dPRMZKA3dFauq5bkh59hsd6mNrzYvKW4g=;
        b=McF9ydY1bDI+WeovHiCGfOfd1rdYZdz40iAWjNQZzdiKbZLafl33wWSZmsN90cer4a
         TiZ3gDN/NuqwW1sLMAEzJltMH4+SgxyrsmRWosTvcZiCZhhqmlEcjxMMlYiR0WdPKJsL
         6ewMhZK3QdpwCaKqWEh05mG43z7Eq5mkm9p04mJJ63XGLF8se4DX3/SZ0zyIfc6rUQYu
         YuKILzyQ0Hdbmw6yI+mHD9TxfX6xoJ/ZKYoNd3DW9FTMSdKxDGSIhA7owIBJZgRtppkL
         TT+2hN6E/75makEvTfqrUBQrcxv9seg4eWhmcWA4Ys4AmMjDGPr8ataf8xwD+leGASxz
         LzUw==
X-Gm-Message-State: AOJu0YwYiANTB2V1gV4GsCk6P8b6dzQzMtuLwbnIh7lFbZgqm9gc9Wwr
	vbKyNi2ydFqDx/OOlDo64DSIfAOqsQTq/r/LMJyssOu2SzBX8wAhmBo8dzVU1F0=
X-Gm-Gg: ASbGncvlZgoRgY7rf3u6BFYuEDavSz83HqblLCisWTJDmLuQYPWyh4rh+NMpCLApweN
	ggX4OSPr8FlniVtmPOx8sZ+5AXcbstJQmZCyFARuFG/9JdWTCLGEPrO+70hice8aN0vjZZx+9bW
	cBTK39xLoq67yrW4iLxVJwBLTiKPzxYuEqotKfTN6M9RlcdhFHhL7gGRQ7gEvWEos/e2aN431HB
	wfbqfHr8aYjf4zN0KdpyAyzIU+6j4KozE7O62vGcovT30zbsMqUaUhQzugr0WlvP0+NzfymRMbr
	Vw6rlnuXJlXkpcfk8NSgo8g=
X-Google-Smtp-Source: AGHT+IGePwGd1RebmPrp1HI9qS1UxYaPhesybFi+M1gkvl3CAIFaQZZ5SKnQHqSf6VHb6FtMneT2Xg==
X-Received: by 2002:a05:6512:1196:b0:544:1407:4e9e with SMTP id 2adb3069b0e04-54414aba30bmr2620571e87.29.1739071300792;
        Sat, 08 Feb 2025 19:21:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:17 +0200
Subject: [PATCH v5 7/8] drm/msm/dpu: drop core_clk_rate overrides from
 _dpu_core_perf_calc_crtc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-7-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=emVhsAcPMXJo9jthW8kjkV7unV6UYdXutY3krP5kLuA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8xGtaeqDuQnMeiiB+yFOQgI/3mzcHxIa549
 qctshj8PxuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMQAKCRCLPIo+Aiko
 1ZTXB/9tOXIbVITqUa0mxZ8LeScVG3PhyG4XYqZMYA31A8WayXVwL0iwO4z46BRMll56qDanQZY
 vb7kMze651Slxw8udpY5UsFJvTDGor82C1W2cOrn23AIYYTyx4p1uktvIgN06ADzBIoLCLl3B9r
 QoWqHsI2sea/zc/1Ezwl61bMm5uNGVAjH4FG9qKBtUEKg0V+iEqnUHx8gGPWqRmUMWzSBIBGUZe
 1eznQ8Q2LXrzksspjIomR4OtIS9+1C+mJhsHxUK03YchuANpWIA+QvjgIN4dvGID4+AfTwHBoV7
 00E2/FtsbwAWf6NxIVsI746DRodAdkR+3tXTtCHHtzaMZyU6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

core_clk_rate override is handled in _dpu_core_perf_get_core_clk_rate().
Drop imperfect duplicating code from _dpu_core_perf_calc_crtc().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..c8e20be08aa83c8bdd70065643b46676eeed610f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -123,16 +123,14 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
 		perf->bw_ctl = 0;
 		perf->max_per_pipe_ib = 0;
-		perf->core_clk_rate = 0;
 	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
 		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
 		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
-		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
 		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
 		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	}
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",

-- 
2.39.5


