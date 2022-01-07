Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6526487001
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 03:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344533AbiAGCBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 21:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345223AbiAGCBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 21:01:38 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22625C061201
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 18:01:38 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id h2so10226616lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 18:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mbm89ogoQZqGUNZ1cj9r9KOUuoZZufgU+BA4OgVhn8g=;
        b=HrN+k7FXfHQQe4fZOWaNS+ppaD7a7gXvvZDegmpMvzQKseetFljT8hqddGMz3fFiRT
         KyPsaxbZVyXpGYswOGyEsC+HU/omhYvjVaTGJuWzy+4ZNNR3ecNCcaSB0Q855PmBFGm2
         A3WgU8g+zFdAux7e5RLGjVaoCetcFKlNgh6fVjIhvljN2Emv7lwDwpQelIfHVpQ8VrN+
         bXpj/Aj4FvBRGYJYEBHa3RARSSHlMYA7r80qxbe5Rdir2H0sPTmcDHJdpMXECYxqVBYW
         pbliLniuHG0XFBZw8upVWYwr5AsrfaZOk7iqbbr9TTMOkNk604WgAMs5scr4yhZfC4f5
         cNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mbm89ogoQZqGUNZ1cj9r9KOUuoZZufgU+BA4OgVhn8g=;
        b=FTdjzJsbfsm0KbR/mS7oO+oBIGxPq9HHvm09oI6ePsIPg/gly5b68YR5zYZXKI4C3A
         NnNm6XzBDTYhkDjLSGxFtQDuW6JTszezF+PRO8ioiN8TcyQL+5ApAgSxfQfy+lQ8jJhc
         /+FkIM21yjs84I3UcThhr67wzgFK9jUGB+63WJ/3e1/5125qXz/U0eGeI4ohzXyygP15
         r42JU1RrDwwNJAycNhkBO8bhKFkIGdklHfnXRHeeU8adT5MCkhDmd42lhO5mxz4Fgcql
         NWqJavU9xgYVUHg3cN/ZF30ybtIRJb2Zc7XnxXCotYqrO3UX3y+Gk6JC9JEiqDXpZ4Fq
         X/FQ==
X-Gm-Message-State: AOAM5314j0/tik+hp0VXRq9glqXVneR6zMtiGJZphhGoRHjeWq/goaud
        gtrXQZDiyY3IE7omPCsCOcjQEw==
X-Google-Smtp-Source: ABdhPJzqGCxSeyXG4EZ555rEszU20hQ6kecmP7efeD5JbLRoJPhz/FF5Gk+/A0B/AvB+Ic5Nx4flsg==
X-Received: by 2002:a2e:878f:: with SMTP id n15mr49924515lji.347.1641520896414;
        Thu, 06 Jan 2022 18:01:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:01:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH 1/7] drm/msm/dp: fix panel bridge attachment
Date:   Fri,  7 Jan 2022 05:01:26 +0300
Message-Id: <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") the DP driver received a drm_bridge instance, which
is always attached to the encoder as a root bridge. However it conflicts
with the panel_bridge support for eDP panels. Change panel_bridge
attachment to come after dp_bridge attachment.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d4d360d19eba..26ef41a4c1b6 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
-	if (dp_display->panel_bridge) {
-		ret = drm_bridge_attach(dp_display->encoder,
-					dp_display->panel_bridge, NULL,
-					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (ret < 0) {
-			DRM_ERROR("failed to attach panel bridge: %d\n", ret);
-			return ERR_PTR(ret);
-		}
-	}
-
 	return connector;
 }
 
@@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 		return ERR_PTR(rc);
 	}
 
+	if (dp_display->panel_bridge) {
+		rc = drm_bridge_attach(dp_display->encoder,
+					dp_display->panel_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (rc < 0) {
+			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_remove(bridge);
+			return ERR_PTR(rc);
+		}
+	}
+
 	return bridge;
 }
-- 
2.34.1

