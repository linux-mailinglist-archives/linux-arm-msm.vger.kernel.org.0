Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0883E370131
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 21:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhD3Tb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 15:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhD3Tb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 15:31:57 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A859C06138C
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id 20so33209492pll.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jKrCMFaUZYfC0G8NCT7F60Xv834i4CVQddCUf4DQYq0=;
        b=cTPHj+Vz4O5A0F8McNO8BVWBJKCM+QJSRwxLLEwWGmsMDEns00UnT5P061Rbph8rt+
         6EfiKvfguHCzoBDfVKTAbn663PqpZyTpotGSy/BkUO8EgBOUiYYIobp/jk8CxAZK3S7U
         dswSQJK4GMfzaZ4ToJ+bg2lbeTx+WbMmDD5Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jKrCMFaUZYfC0G8NCT7F60Xv834i4CVQddCUf4DQYq0=;
        b=Kj0t/oxFfSBVpsKTT2PY+x5luhTauGyf6ARrvmQZ51yC1AqZB6bLXA+zgfMuSAoe0p
         EUScaey0lrRf25m7Bw+fWe/DXeH1jcf71MDMnFR5CauBoh8V5uJI2gZ2D3cz2MTTGwmR
         qXAStkQW8+oXetjz6ooOptzz1YfrlH9/TdCXwFvGlOIFmcORsLZAtrSMcjy4tp0g03LP
         0KZrezVDXXTnBdoBnWWhlBGYWcImR8JaznciSSEIwNzRwneiu//kyMDaJEqzWy+wWpmw
         bWdylSJIEOBaqaeTR0wF2vTtkaUUtx95sqxBn+YT1XDzS9HXFKXO03iazJ+Xr1D67KkQ
         aW7w==
X-Gm-Message-State: AOAM533XTcvE/YrT0XkfFs6doyYIu6AoJtYMR0rLuRylU+Z+2wuDfz3U
        z4VE4fIAxZ7MQJXCmEYGPyzzolk+9/vZCA==
X-Google-Smtp-Source: ABdhPJyWXB03cIj9xky5L3f/X35TMsnbMkOr8+xmL7ReqVKkoBkiONcQBBzP1LUaiv5gnOs2rZuwyg==
X-Received: by 2002:a17:90a:bb13:: with SMTP id u19mr6766979pjr.96.1619811067805;
        Fri, 30 Apr 2021 12:31:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
        by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 12:31:07 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 1/6] drm/msm: Move vblank debug prints to drm_dbg_vbl()
Date:   Fri, 30 Apr 2021 12:30:59 -0700
Message-Id: <20210430193104.1770538-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Put these debug prints in the vblank code into the appropriate vblank
category via drm_dbg_vbl().

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c                        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 9a69fad832cd..9bb2d13a1f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -416,7 +416,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 		goto end;
 	}
 
-	DRM_DEBUG_KMS("id:%u enable=%d/%d\n", DRMID(phys_enc->parent), enable,
+	DRM_DEBUG_VBL("id:%u enable=%d/%d\n", DRMID(phys_enc->parent), enable,
 		      atomic_read(&phys_enc->vblank_refcount));
 
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 196907689c82..ad79c37d4df9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -683,7 +683,7 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return -ENXIO;
-	DBG("dev=%p, crtc=%u", dev, pipe);
+	drm_dbg_vbl(dev, "crtc=%u", pipe);
 	return vblank_ctrl_queue_work(priv, pipe, true);
 }
 
@@ -695,7 +695,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return;
-	DBG("dev=%p, crtc=%u", dev, pipe);
+	drm_dbg_vbl(dev, "crtc=%u", pipe);
 	vblank_ctrl_queue_work(priv, pipe, false);
 }
 
-- 
https://chromeos.dev

