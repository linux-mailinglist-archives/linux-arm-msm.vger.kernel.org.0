Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 409FF4B30D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 23:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235884AbiBKWkM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 17:40:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238734AbiBKWkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 17:40:11 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6CED62
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 14:40:09 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id o17so14419428ljp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 14:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wQf3XP4BZfuzc3ylEELAJ2OjaNg6jTxSBCBJwv6w5qM=;
        b=DHUDXkodYg67FoSIT/jyDwu8mai51ctlRRP+iWjmYaBMn7H74cJ0iXyxOMtA9CdYf2
         Dvo+Ly8DjcW/FBEf1N9HChiPIEVIoKSslEznKV/Mk1Fg8PkonubmzrZzhCc9I79/bpgl
         Thahc/0zhXOY9qlHD1SSp9lQOtG5HjWGL/7dqnlFjqL1/YsiHUYByNo+6mgNLkxV3p6U
         RfL6A2HepzBInkrjkCUSYRUE1Jv0UM72YLFjGpaj3xDKQEhwOvHam0Au3aOZ3vc1bkOv
         XHog+VMigQ4eCHAfiGf5YGfgTGPQEquGI3Kk+8/TwT0RVr7WfiAoF9+B88gM5J3hcV4L
         estg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQf3XP4BZfuzc3ylEELAJ2OjaNg6jTxSBCBJwv6w5qM=;
        b=ajqZYJDjmdgPhKJoIv9Fcbq5DAXVLA7MLUx87X+rrbt1u+YmP/dRudz1Z3GbgxbPAl
         3lhHK+OXhKVMoQuSvCXy197WIZtpCle3fAiKUi4QWMKBSwUS58vkKPn7M379RSL6332l
         KYmgCc2wBq6qUnvv9sbPRzVXtQW5Hi7eJshOdkPBxZfiW8wZW5lYqQcl1B98o/f5BHCp
         ilqsaCIM8xDr1NTlmU4ZvAzaFJxsFufJQqobA/3ifrIuAzxUwgVQ9G44uIo7anweg6ko
         Ag+lo7Fs68BEO2C8pH80jwi0cd27aIG6u+C3a+qs9XePdns1+tUzNc1IvrPWhI5Th6I3
         ZkQg==
X-Gm-Message-State: AOAM532o002miKNc+fK9hvpoF+KlgyqqFfDQdPzzPfGbLJ4mI8XvoGTA
        MaC9bXN1rmy/tU7TgFxt/YkraA==
X-Google-Smtp-Source: ABdhPJyGY6YZViUMDnHZZ7OR3CbJA9wYqdkelPBYfJ3WWwaqTKia3n3PZZK3fvt6ud9y9cz/ZvidYA==
X-Received: by 2002:a2e:5810:: with SMTP id m16mr2204599ljb.261.1644619208126;
        Fri, 11 Feb 2022 14:40:08 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 14:40:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge attachment
Date:   Sat, 12 Feb 2022 01:40:02 +0300
Message-Id: <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") the DP driver received a drm_bridge instance, which
is always attached to the encoder as a root bridge. However it conflicts
with the panel_bridge support for eDP panels. The panel bridge attaches
to the encoder before the "dp" bridge has a chace to do so. Change
panel_bridge attachment to come after dp_bridge attachment.

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

