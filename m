Return-Path: <linux-arm-msm+bounces-13959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B287A013
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 01:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6525428410D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 00:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A44610E;
	Wed, 13 Mar 2024 00:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="msnTkEpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE04A07
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710288843; cv=none; b=JhwGlrHFPI1xlScodypWTHSQ+tuVAHIhS99Kzk1sXwntPRe2sTAHIQpWxB76/gUNMhDmCrS6edl4U6t3VeuYY69emR0deN87oXQaSfNKgqxYxHTGdZcHMVaqboQ68cw3YR2lMO6hBceVeAFND7cKk+RVRXHv+ub3a/sRHIDL2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710288843; c=relaxed/simple;
	bh=bElXbKIJI7YYYdnLkLwCaCTRKoWU1jPMgaEDYI03NW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOfPr9Jm/U/+N+UMyniyO7TuMOSbAIUxeTvNrcMyWsD6OIMLlsih/v+xtFMQcMFMZZ6KrXCjEzc3ofPRqoBo00QeSFN0XOkEK33j5R8cmsRSi3+kUmbpS46ih7BrkHbOzftEAvJKqdnbCTEcooGBxNUo3aqpJDsOqB+xokYOh4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=msnTkEpK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd10ae77d8so46103265ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710288841; x=1710893641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zguE7sLhSNq0icr0rFs1uvOVo5Tuv7IbCk7xIUt0MUw=;
        b=msnTkEpKtWBV/8JlK3MIjGjBS0aAYNgAZKK1nV555aIRKhtcXoVWqswRInOWlh2hYp
         uqC8HRH881UzixiUUeTKYhHHU0M5qQOqqtRZz5IXA3fRCt03he8JcPTaTzfJK2LBak3Y
         wXmQulhCty8suM9RD7m6HfCjVl8frxSaGmhPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710288841; x=1710893641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zguE7sLhSNq0icr0rFs1uvOVo5Tuv7IbCk7xIUt0MUw=;
        b=UEMXqghFptq19Rj5nF4sEkvLUzV/14oQSObbONa10E5SUFFJ/1hLFOmogHZ74MvJoc
         LYPuIQ0swDB2pp8VrnQigO6RH/wgPFFKBWHDiCjrWGdIMt/nKikH/f0b3ABCLNt8PZ4K
         Uw3NeHq8RZsrvEc343lutCJRVd3ibT4HJjgpcuc7EMJhVV0JBHksw/zBibqBr4pAQwPy
         nGjyp5V4D3sGdgC9cV1Ty+Kb5mpu2f4kUB7gDUxDCgBWanYmq4Gg+4TDxVS/tYvq0nY0
         CZr3hxPUC5tzO19YYpyAUhC77JeEEj4eIVgABJG8+v2CRR9sPOfwiWUlSoe+rI4WSeH5
         CkDw==
X-Forwarded-Encrypted: i=1; AJvYcCV26TOqc1V08K+Y+AyGmg2tUQu5jMWtkZFeYQ7cqFxo7ZSIlZ3407mHRyvLri9X3WfrvwOVINvLotBPuQwN0dskq+4GvYIBdF76DEBG8g==
X-Gm-Message-State: AOJu0YxfGbi0jp4/2F1UUeHYb/3850nr2a7b2pI/MyQywGb090gHwVEQ
	oV3yCft9jZw4xyf9vshHJKJ3BQcUDhU5PY5odLxNCnxwIfy9AtkZ05G827Ht7Q==
X-Google-Smtp-Source: AGHT+IHleWIOjQ8m91s+SNRjR+JOLwIAr+kNSjLzS6dHYmUmGlbhttPA/0GuKKQLT1S7h93MHLmwng==
X-Received: by 2002:a17:903:258b:b0:1dc:728d:b1de with SMTP id jb11-20020a170903258b00b001dc728db1demr2427447plb.56.1710288841166;
        Tue, 12 Mar 2024 17:14:01 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:f8dd:895c:e876:6edb])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 17:13:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/msm/dp: Account for the timeout in wait_hpd_asserted() callback
Date: Tue, 12 Mar 2024 17:13:17 -0700
Message-ID: <20240312171305.2.I7758d18a1773821fa39c034b16a12ef3f18a51ee@changeid>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240313001345.2623074-1-dianders@chromium.org>
References: <20240313001345.2623074-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DP wait_hpd_asserted() callback is passed a timeout which
indicates how long we should wait for HPD. This timeout was being
ignored in the MSM DP implementation and instead a hardcoded 500 ms
timeout was used. Fix it to use the proper timeout.

As part of this we move the hardcoded 500 ms number into the AUX
transfer function, which isn't given a timeout. The wait in the AUX
transfer function will be removed in a future commit.

Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dp/dp_aux.c     | 5 +++--
 drivers/gpu/drm/msm/dp/dp_catalog.c | 7 ++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h | 3 ++-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index de0b0eabced9..fc398e8a69a7 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -311,7 +311,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	 * directly.
 	 */
 	if (aux->is_edp) {
-		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
+								500000);
 		if (ret) {
 			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
 			goto exit;
@@ -516,7 +517,7 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
 	pm_runtime_get_sync(aux->dev);
-	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog, wait_us);
 	pm_runtime_put_sync(aux->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 93e2d413a1e7..b45cf3174aa0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -253,17 +253,18 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
 	phy_calibrate(phy);
 }
 
-int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog,
+					      unsigned long wait_us)
 {
 	u32 state;
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	/* poll for hpd connected status every 2ms and timeout after 500ms */
+	/* poll for hpd connected status every 2ms and timeout after wait_us */
 	return readl_poll_timeout(catalog->io->dp_controller.aux.base +
 				REG_DP_DP_HPD_INT_STATUS,
 				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
-				2000, 500000);
+				min(wait_us, 2000), wait_us);
 }
 
 bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1694040c530f..4248c8de5cf7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -85,7 +85,8 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
-int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog,
+					      unsigned long wait_us);
 bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
-- 
2.44.0.278.ge034bb2e1d-goog


