Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0ED2B1C7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 14:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgKMNvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 08:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbgKMNuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:40 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACB4C061A4F
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:30 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a65so8578676wme.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EDpB8DJIxR3jn2HzXeLA+icgO29vYDcRaE35hFlk2BE=;
        b=xIlC+2K+XYDZ+rTp6LZiqDhAqdaaUgTdllMZL9+PC1pySaKIQasGv8o2+CQoxTqZUD
         L3p3GctSvAXx3y7UDhb5DSEO/nCrfdaHblbvRwS0vCzopYHsXxwlI8SF5JbJL4DZvl/9
         Adp8oG85dctR8fZHkUZO4a+7hHGgzbpR4w37rQulCOId2h1mz/HnPszo7lEjBvdJWlCL
         PgxsXrc0c2N8v+s/bIbJshbi08znIF3utk+UtULiHcTVPRxGvfPNsbgSKZZoCfEZCHJh
         7XOh94nci93PGpDkOnb/zlG0NX8NxJ2zel0a50LZG+SDsMRbAgPHo8b+rTPla0PT5LpI
         tGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EDpB8DJIxR3jn2HzXeLA+icgO29vYDcRaE35hFlk2BE=;
        b=O4matV5njONU94oeixWqagENbTBSNOxflv6GVRs1dd7BLr1rAFiREu46m6MltiLFpU
         /l5wgW7u7DpJyQvMTXok4EbnTaLojeEqJXc4ETEMv2A6fwO5W7U7TCzb3wkK/w8DWbim
         c+ZSxXEFS73WoVodyH/1mI4uFLdlOlo3kJEAhUqHA7BhpD8X0JwIPjsfg1fZ/TKq+mHE
         cI1Ay43p8OEWpcc9NA0iyhoE+5ZhnFk/4qwL4BDYgLXhRulccxQs3RM9xaqqIID2XF42
         j3OzaqMG9uRYynYjRkbI3p6uq8EYdpxUgxSrFAeWVsHB1Q0VByR1zuCP07nmoFSAR8Cu
         3yeA==
X-Gm-Message-State: AOAM532fZgqBthZSBQq7CxByR9DtVo+rWjaIrSTAKGxrz3RnQtF1YgoR
        u79ZMX5cBlcctlHDOtw+rnBzBA==
X-Google-Smtp-Source: ABdhPJwTMip6HQ19kIHE7kmLBaCswrHOb/GOeK3FDkjZ48e7s3r62xGVb1Rj8aohA/SUgBUz56aIhw==
X-Received: by 2002:a1c:61d4:: with SMTP id v203mr2625667wmb.1.1605275429063;
        Fri, 13 Nov 2020 05:50:29 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:28 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 38/40] drm/msm/disp/dpu1/dpu_core_perf: Remove set but unused variable 'dpu_cstate'
Date:   Fri, 13 Nov 2020 13:49:36 +0000
Message-Id: <20201113134938.4004947-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c: In function ‘_dpu_core_perf_calc_crtc’:
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:113:25: warning: variable ‘dpu_cstate’ set but not used [-Wunused-but-set-variable]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 37c8270681c23..36927fc04a388 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -110,14 +110,11 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		struct drm_crtc_state *state,
 		struct dpu_core_perf_params *perf)
 {
-	struct dpu_crtc_state *dpu_cstate;
-
 	if (!kms || !kms->catalog || !crtc || !state || !perf) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
 
-	dpu_cstate = to_dpu_crtc_state(state);
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
 	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-- 
2.25.1

