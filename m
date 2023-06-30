Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89986744395
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjF3Uzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjF3Uzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED673C1D
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:37 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb41682472so3720171e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158535; x=1690750535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt6huJ+EuWBL0aSnKMH030neuBzp1AaZT2Qutfz1m2E=;
        b=edDy7iejQT05eyP7VZDU+E5ct5JHw8io17dNHvgko5M/GloGZYjFvnxD0/tquZ46Ut
         X8UFy+0I0udnlFkiZNTsGQM6lsYq7TKdme/WHJolcSYH+MSDJRjm2Wt74ifNfDhnz3AP
         jRKSn7KapOt9IiBnHuJFzpU+yq2YZfKfuK+U6T+sYTJzJWeTsqkmFEeKleWNONcItaeJ
         m3GRTzwQTE1wdc5ZowIJF+jcEnPG0YO6GTDTKCz9ToI/z80J1kZOagChBOQhdj67pCg/
         QRiDri04v8LBDQHeSvrZVdnyFDWz2xwIXPaTr6+kL8fj1oZAWFGlkVeG0nfTrk0CYjLO
         Dgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158535; x=1690750535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wt6huJ+EuWBL0aSnKMH030neuBzp1AaZT2Qutfz1m2E=;
        b=Y0jM5NrpQ8i7zZQyFlPzUqKlWp8Jx50q85HmO+HqwvHFLbx23UmzsYVWduWJG2cj1a
         rzHacfZ/ZNVckFz/VBRKwA2/+qffWTi4Zt6HM5VDNoekhuphkPcAFmD5WPLf2+wmpq3e
         xt52l98O5AAb7FW3G2ydHXD1udnHMSs8XwPwFwH50nKEV3+d50ZsYR0e2wAiSVwn2/01
         I1MCjdZ0Qld1kQEfJTXJFqURpyx2g4A0u53kSjwsbGAHBFM7GJkU+fs5PsVPFaDFsT+B
         KX/gNVt2bOgPEvHvEEN0U90P/MEfiegwjjDqBj+s1gx9rproly2hGMONM90iBnpZPX10
         VFKA==
X-Gm-Message-State: ABy/qLah8KnVnjjCgnIzIVM6jyEsdd4WWJUoikKgqkKRwMKO4wuy2Bth
        W78m1VBPDehRgqQLk3zYf/78nQ==
X-Google-Smtp-Source: APBJJlESGq62jFOcvJfGD+ngpxA6olDUqDJI57PWUwbzW2bFNxqoWA5QrV6wWGNGlMKbAl/Kk951Mw==
X-Received: by 2002:ac2:5f6d:0:b0:4fb:8b2a:5e07 with SMTP id c13-20020ac25f6d000000b004fb8b2a5e07mr3158963lfc.36.1688158535552;
        Fri, 30 Jun 2023 13:55:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 15/15] drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops
Date:   Fri, 30 Jun 2023 23:55:23 +0300
Message-Id: <20230630205523.76823-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HDMI driver already has msm_hdmi_hpd_enable() and
msm_hdmi_hpd_disable() functions. Wire them into the
msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled
dynamically rather than always having HPD events generation enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  6 ------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  6 +++---
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 11 +++++------
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ec109255ee17..e1a16e20890c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -208,12 +208,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = msm_hdmi_hpd_enable(hdmi->bridge);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-		goto fail;
-	}
-
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e07450fbb521..165b85a0b0f3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -220,8 +220,8 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge);
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 01630445a664..86196f090ac9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -13,9 +13,6 @@
 
 void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
 {
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-
-	msm_hdmi_hpd_disable(hdmi_bridge);
 	drm_bridge_remove(bridge);
 }
 
@@ -299,6 +296,9 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.get_edid = msm_hdmi_bridge_get_edid,
 	.detect = msm_hdmi_bridge_detect,
+
+	.hpd_enable = msm_hdmi_hpd_enable,
+	.hpd_disable = msm_hdmi_hpd_disable,
 };
 
 static void
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 2080e7c6700c..04d00b6f36fd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -70,8 +70,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	unsigned long flags;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+	if (WARN_ON(ret))
+		return;
 
 	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
@@ -99,12 +99,11 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,
 			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
-
-	return 0;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct device *dev = &hdmi->pdev->dev;
 
-- 
2.39.2

