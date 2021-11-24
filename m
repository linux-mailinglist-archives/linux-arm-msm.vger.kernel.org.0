Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C32045CF49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351726AbhKXVlp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351980AbhKXVkr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:47 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46132C061748;
        Wed, 24 Nov 2021 13:37:37 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id gt5so3562602pjb.1;
        Wed, 24 Nov 2021 13:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yTbQCjulQBoWfNm8VTWUyI1TCP6QzxDwt8c6rBboG24=;
        b=DsPEv8IFzOcaBYcPcOuPtreqIjaPeD5EwaiB3duk9luTEQXdzyPAXIDMnaJi3GFhd1
         D7w6FO0/xirYyx23Z8xpBv8maclCfpEnIlwcOS5D3EpetpaJpUiagNGbRGF4DfPHjWKp
         nTa4yun0rieNXobyXeFVvZO0EseyH+8puKHJo4tFHCj3pOecldjNsDaiXf3Z7KkbFiIe
         0LsJKKbz5QlPfLLjsa8DBT4r/HftW6oJT3IJnQ90J6eHgLy6t/4Y86XDczuhfM8oTrGW
         z/axZh0kFLf9nptE1cRE0iDFtqdduNaUwwqDaNbcpDmI3S13QK7MjuAhCp77TNv+i+aj
         JUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yTbQCjulQBoWfNm8VTWUyI1TCP6QzxDwt8c6rBboG24=;
        b=z6JSaA51GLCsQCXp3ktFcJWVv2GhAu0OLcEuZzl5Tjuvtuse9bCl1gfrl65AB2Waj9
         vTbx+zTOn07NkaAbKjJIq9BFyWBS6ejZ3FIrNSdHH0ebKMuYNKWHHcjarBV9VjtFEMcQ
         A1jPEmHc6TJhpHo5RUVtRRe9bq4YSW50/oA+fz4h2neNsS16EAecH9HdxYjAnFoAs/0O
         Kxg3KIAep7sLWJJvqbY9p4QdEVdcccpO4gB3IzYktmBRGKlaFqUWo0srvN9AvdKuR4O/
         MhGdYkavTgbnUXrg3vK8TOHODnzRiMgDrVyJMlJo3a+gas+HmB+XMMQoNX30pSqGIZy7
         XVRA==
X-Gm-Message-State: AOAM5337NJW4Pxv26xrBWb+rs2DSU9JbYpKbsp4dGVEMhT5LlyrHt9Vs
        cJcU0N0wY65mjUIQIGFnAXs=
X-Google-Smtp-Source: ABdhPJz9Mmil4+4+Ed7DAslPNuwEoe+cRh9O085x7A67qlbViJUVHCJ3XNrVOV78FUCiia3X+45mNQ==
X-Received: by 2002:a17:903:248c:b0:142:9bf:8b0 with SMTP id p12-20020a170903248c00b0014209bf08b0mr23087864plw.70.1637789856787;
        Wed, 24 Nov 2021 13:37:36 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id h3sm691398pfi.207.2021.11.24.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:37:35 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/7] drm/msm/gpu: Snapshot GMU debug buffer
Date:   Wed, 24 Nov 2021 13:41:34 -0800
Message-Id: <20211124214151.1427022-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It appears to be a GMU fw build option whether it does anything with
debug and log buffers, but if they are all zeros it won't add anything
to the devcore size.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a84ba8982cb8..bdd0059a81ff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -44,6 +44,7 @@ struct a6xx_gpu_state {
 
 	struct msm_gpu_state_bo *gmu_log;
 	struct msm_gpu_state_bo *gmu_hfi;
+	struct msm_gpu_state_bo *gmu_debug;
 
 	s32 hfi_queue_history[2][HFI_HISTORY_SZ];
 
@@ -983,6 +984,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
 	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
+	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
 
 	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
 
@@ -1274,6 +1276,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 				&gmu_hfi->encoded);
 	}
 
+	drm_puts(p, "gmu-debug:\n");
+	if (a6xx_state->gmu_debug) {
+		struct msm_gpu_state_bo *gmu_debug = a6xx_state->gmu_debug;
+
+		drm_printf(p, "    iova: 0x%016llx\n", gmu_debug->iova);
+		drm_printf(p, "    size: %zu\n", gmu_debug->size);
+		adreno_show_object(p, &gmu_debug->data, gmu_debug->size,
+				&gmu_debug->encoded);
+	}
+
 	drm_puts(p, "registers:\n");
 	for (i = 0; i < a6xx_state->nr_registers; i++) {
 		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
-- 
2.33.1

