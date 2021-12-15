Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FBF475CDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 17:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244427AbhLOQJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 11:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244498AbhLOQJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 11:09:20 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99B9C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 08:09:19 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id l7so34098172lja.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 08:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QdlZYDEg2Npa2/UOZIIxAI9S4NIeOJrywA2dsCR6BOI=;
        b=z3fLO+k3D0KXKxgHVZ/qrpAwc/J/XXxxg+KWwgi1W2ARobrtO6/lZmbwxHcAVc5UF/
         MbvvXZWUSAzT5FXrlxUNBR2KGQ5fbmWw4JckHPYxqnyR10NSoXdfOX7mpC1RVjBsdspJ
         qzse8CCQjFytx+KpIroNnru2jv2KtinxjNMkpb6AYVriYFZ1Ovj8CKozzcKo5c2BtHwB
         MQqcUzCYkPyx6yni2SifrXydTSrvbaiH8HUCBSXgtB/xUZ3yoVTRbI6mWjOOqLad3ZYg
         p8YpzeKLnELSXkNvNsevwGKgWoWVvszDl3w1ZIxQsJww3lTNX0HWCKpouaS6alVKh4m3
         WcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QdlZYDEg2Npa2/UOZIIxAI9S4NIeOJrywA2dsCR6BOI=;
        b=YWK9Mdp00d9/pMOAAQ92eLJOhXu6AHdIrzJRfVdm8LDoTz3Tk02+RE12nViBq7Bpgl
         9e9gzc3pq8CGx4ZMg+SJe648Ly2WMR5BSwpfQJqzYO3Wo48abjhAy//rR+VEU6Ej3TvF
         RPZFGOkQAWLdTW2Z8FLiRInrOwMkyGluWcKMu6Uqna3316psKJGvilXOBavkXflaHnQu
         mc1LYff1dsQ1f6sdQzupe/wKTg7kPAQ3Q66Nj+oFk3O3mqdPS/vpk237N7lizf0sTPux
         DlKrkLLql5pGOJ+GHRKXbArGHRdxSBudcJORJQnQNwSiufol6qaykzX99aotHXouT9zC
         db8w==
X-Gm-Message-State: AOAM532xXyKzfIJSV/YkW4nywBO7lvNir2cyWNmFk7cfAxohGr+6TIm2
        2sDg4oHUptE/rx09hfC/mCamMA==
X-Google-Smtp-Source: ABdhPJxJy+yy9jINDuvepRp9N0wcx4oGTHViP6LIEndAKbsS4l47bJquWjs8tvQEFCChTxEtYmGPPA==
X-Received: by 2002:a2e:7216:: with SMTP id n22mr10870580ljc.44.1639584557936;
        Wed, 15 Dec 2021 08:09:17 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id p3sm384429lfo.162.2021.12.15.08.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:09:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: add dpu_plane_atomic_print_state
Date:   Wed, 15 Dec 2021 19:09:12 +0300
Message-Id: <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement plane's atomic_print_state() callback, printing DPU-specific
plane state: blending stage, SSPP and multirect mode and index.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index fe2f8221ab6e..bdecbe39a12b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1305,6 +1305,46 @@ dpu_plane_duplicate_state(struct drm_plane *plane)
 	return &pstate->base;
 }
 
+static const char * const multirect_mode_name[] = {
+	[DPU_SSPP_MULTIRECT_NONE] = "none",
+	[DPU_SSPP_MULTIRECT_PARALLEL] = "parallel",
+	[DPU_SSPP_MULTIRECT_TIME_MX] = "time_mx",
+};
+
+static const char * const multirect_index_name[] = {
+	[DPU_SSPP_RECT_SOLO] = "solo",
+	[DPU_SSPP_RECT_0] = "rect_0",
+	[DPU_SSPP_RECT_1] = "rect_1",
+};
+
+static const char *dpu_get_multirect_mode(enum dpu_sspp_multirect_mode mode)
+{
+	if (WARN_ON(mode >= ARRAY_SIZE(multirect_mode_name)))
+		return "unknown";
+
+	return multirect_mode_name[mode];
+}
+
+static const char *dpu_get_multirect_index(enum dpu_sspp_multirect_index index)
+{
+	if (WARN_ON(index >= ARRAY_SIZE(multirect_index_name)))
+		return "unknown";
+
+	return multirect_index_name[index];
+}
+
+static void dpu_plane_atomic_print_state(struct drm_printer *p,
+		const struct drm_plane_state *state)
+{
+	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_plane *pdpu = to_dpu_plane(state->plane);
+
+	drm_printf(p, "\tstage=%d\n", pstate->stage);
+	drm_printf(p, "\tsspp=%s\n", pdpu->pipe_hw->cap->name);
+	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->multirect_mode));
+	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->multirect_index));
+}
+
 static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
@@ -1388,6 +1428,7 @@ static const struct drm_plane_funcs dpu_plane_funcs = {
 		.reset = dpu_plane_reset,
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
+		.atomic_print_state = dpu_plane_atomic_print_state,
 		.format_mod_supported = dpu_plane_format_mod_supported,
 };
 
-- 
2.33.0

