Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A69616B96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiKBSHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiKBSHM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:07:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6AC2EF58
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:07:11 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o12so29512612lfq.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
        b=Z8ogY1BJAIZ4+jO969Bq/HqGLXfZ/qg7CSEPRxvkwtsP87akwunEvyOSrm8L+2yemH
         lNdPn9rkx15SNRnA0f2F/9U+hUoAKzSyUrmSjn2nI6ZAT72r8KnN/j03CKH8N8l2SZNP
         Jvec9DTHGEYzMnrvU8zuSD95wSEitdcT21OtZ+j0Lj+rt2BILRWlELLl5mxeGTTlrAVF
         XASkeYu4M/xCyVkCNcx3WW73hiYCe2QgPKbu9+mdtcRRIZDrwXGhWRWTMC0ja61V/j0i
         V5jVrOPCaX7wKOwdgfjfSm23hZJMkMFGrFraKemBTmdmNJaxYEPY3LBjyFEVqoJhxRFA
         draw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
        b=QZMFQyPa1/x9EYWWwr0aZBD8oC9h02/cUMYpOAaQrhq8VagxBebyQkC0fcGBSnVLzq
         BlWL7Zui2/vu/vjspq8/ZztpdL3/ZHVZVcsMV5ncU09ikT1BmxP9GbjIgLSH2yOl+uCZ
         0765D6fbZVScGGqb8fRyvLUfEd4mM79ZCa33Gf6yiyp3EFQaM8/YEAouJP2zQS8zIeZC
         xwlCauS397fiRL1278bK5JBGvpeZazAR1dS/a8x8y+Tm18NPKtomlKFJTCDTCNWooJW/
         OgssugAOZ2pikyGAEjKvs3QJmJiA5UibOfynFMbLUiHQLlBwru+s/tXy0kBaX3OfiuS+
         OZ7w==
X-Gm-Message-State: ACrzQf35rI4+5djRdoA9Jg/OtJtqlWJzm7nvL0zTIfNTqGZA72WKv4JV
        1P2ZFnqyED5HTPnEhskZSc4uLA==
X-Google-Smtp-Source: AMsMyM6OCSRVaMGSi8KIwIUfDuj88MqMcv8eYzHtBW28QWceUSqNJcenRHrHsMPUtNRwVRLuuQtxnQ==
X-Received: by 2002:a19:5e4e:0:b0:4b0:1305:7cb8 with SMTP id z14-20020a195e4e000000b004b013057cb8mr10702352lfi.290.1667412430002;
        Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:07:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
Date:   Wed,  2 Nov 2022 21:07:03 +0300
Message-Id: <20221102180705.459294-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..a540c45d4fd3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	drm_bridge_connector_enable_hpd(hdmi->connector);
-
 	ret = msm_hdmi_hpd_enable(hdmi->bridge);
 	if (ret < 0) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-- 
2.35.1

