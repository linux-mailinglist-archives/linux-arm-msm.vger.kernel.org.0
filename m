Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183F970DC41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236650AbjEWMQT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236763AbjEWMQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:16:14 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4ED18C
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:08 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f4b384c09fso2149679e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684844106; x=1687436106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRCcVx5yqkWjx+j8HRIisuUziAvNRbEhBQXvfMXuZd8=;
        b=iJC8cOHW0X4kvVER7XhLHnQWxkC+jbzri8i0MSx1FWzm1j3TgBoKJEus10S6ncpEAK
         DZHgtbe5CSmiS1kT64zbTG4hR6qrLUvhfvpstMG0lUjREEOQbg6NnSHZLHPM+cx/8VZa
         0k5wf8cRNQEmr3gnjDbgqS9mV0/+AU8YkvOYxkQShYze+C455NHKiS3vFFgyBRYjzUp2
         ETvYqSNmMRncJhyLTNm3pI2nWj3zzRDQaFijvBKyBZQtynIE90HbTb4jtKT9xCF54p3G
         ReLH6SmJ7a/4A2aOI4UaYI4RKs4PLNkiEM0lc3Q8NK/pVbL4EegKUnYepXO+PObstRho
         BVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684844106; x=1687436106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRCcVx5yqkWjx+j8HRIisuUziAvNRbEhBQXvfMXuZd8=;
        b=YEEwD21Vl71DsFYgd1XWd4Xzijb85UtyiMKz6ga1YVoumwf/qCkdjmf3N+6EBcG1SX
         +cJbuN/t85it06TctJNQU3Gk/hqT5g4+izxO7CLfujFNieM6mamhjzpSs+WVPIWSzT3X
         01iBg5695Db6k2IPbc0bzNGqcVOJs0HzZGOGX2xIisnHz8rSCMYKDQH4F6BCrBuyMRZg
         w1tZ6Sd25ApOBHjRIx+5NWH7VVJqJV/mq03zzzQof39Qfs5vwzjena8ZxCtNuJ+BgpQh
         +vo8fzZfrBfChg8spvAwbQZ7JIj/2ObewczM+ySGWlyNa3cAEJ8y9a/M7NRWIw7nkaDi
         aipA==
X-Gm-Message-State: AC+VfDzuti1iWvyn/PLoqHHATYNouKG3paR+KFOT7DpqGaGCJs+p4HCm
        RCLXHPtLZy719CmDzRI4ffRaWg==
X-Google-Smtp-Source: ACHHUZ5vlFenZbIB+tk6w5Wm9JFARuGQkoC34ibzwpD/wshwINCjNKESlnZMABksaf1XUycVFfSF6w==
X-Received: by 2002:ac2:5a0a:0:b0:4ec:a18e:f985 with SMTP id q10-20020ac25a0a000000b004eca18ef985mr3960269lfn.13.1684844106606;
        Tue, 23 May 2023 05:15:06 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:15:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH 11/15] drm/msm/hdmi: switch to atomic_pre_enable/post_disable
Date:   Tue, 23 May 2023 15:14:50 +0300
Message-Id: <20230523121454.3460634-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation of reworking the HDMI mode setting, switch pre_enable and
post_disable callbacks to their atomic variants.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index fbcf4dd91cd9..f9293f7d8f34 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -128,7 +128,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -154,7 +155,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -291,8 +293,13 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
+
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.get_edid = msm_hdmi_bridge_get_edid,
-- 
2.39.2

