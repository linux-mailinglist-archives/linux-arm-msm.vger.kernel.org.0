Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3F7515502
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbiD2UAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 16:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380443AbiD2UAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 16:00:54 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48744286D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:35 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s27so11751209ljd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjiWSb36gHEJ1pupckIvzivsOKw4TFaRqlM2gJWlkeg=;
        b=lij9fO8pcjPHTrP1kFRt0lMkgTB2GXTjLFrp7Ml+bSuhx8qXYRZUUM42O0AINyVr+0
         YKtq1VPjsf9iZScpJ/jqI8BVh9dlQIuuNZVp4agu1ayr/9awisvXtlEf5CVj4qEFwtYk
         hbrvGU2UZNRs33SNozRgh4I0hJzjwr05bDvPb/b4rABV8x6Y7vwaFMKF/vJlNoOL+abP
         93JKf0x0F6qLx4GgZjgZ0q16HWPI4tMUXVJ0VLegU0IMtGIIaRR90fsS4h/lEMu39811
         tzLiBEEzuQ7hDxPP5apqrXcg3aCUM4nOmfELNwNNkuBHScBAgWGDln5S166E0LeI1HnT
         J7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjiWSb36gHEJ1pupckIvzivsOKw4TFaRqlM2gJWlkeg=;
        b=1cWSAn+K6FCPGavGJYvIFa9TNLkmEYOgXtK3F8eBMn7N1Jd947v0Y5b1YL1EnQzwa5
         wKWH4L/f+59FtRrSt7G8za87pTyovF0h3Lfx7VsWewJZr22tI6nV4jcTDHA+ReW5lgOK
         MHxpt51Xy7vW95VLGZKYMojklWkkUuXvhUCWNbR5+qu1k6yQ49VwKeo3rEayPRSPQuxH
         eEDBUW3aF/V1zcbQpi9SKDJTiZSicNmWMyOCxohdNe/MLUYiT0rBOHhRuGrGRchup/5y
         Kt6X/9emE+Ah9gM1idugRENQYk+Suj+V6IfmAQH+9+r71MLQihrkMB7YlHuVqSFa/0WO
         pbZA==
X-Gm-Message-State: AOAM533rDhnBBercwKZzqSANT6EUHGlkXBFiQt/PsOGQXu6IY4UnzFcO
        uc7VC1ktu2ywda/O/m/0ThByu8UQ/qBSzQ==
X-Google-Smtp-Source: ABdhPJzR5DzzxHAxz5dGqxksq45CF6WCBsx4G187PW4k6MkQh7rOCWAka06NGoLxJqkXPm4p4zoQ8A==
X-Received: by 2002:a2e:a5cb:0:b0:24f:233b:d90e with SMTP id n11-20020a2ea5cb000000b0024f233bd90emr501851ljp.83.1651262253549;
        Fri, 29 Apr 2022 12:57:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j17-20020ac253b1000000b0047255d2118csm10601lfh.187.2022.04.29.12.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:57:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 1/5] drm/bridge_connector: stop filtering events in drm_bridge_connector_hpd_cb()
Date:   Fri, 29 Apr 2022 22:57:27 +0300
Message-Id: <20220429195731.3716446-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
References: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
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

In some cases the bridge drivers would like to receive hotplug events
even in the case new status is equal to the old status. In the DP case
this is used to deliver "attention" messages to the DP host. Stop
filtering the events in the drm_bridge_connector_hpd_cb() and let
drivers decide whether they would like to receive the event or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 60923cdfe8e1..a0b742ebb330 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -113,16 +113,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
-	enum drm_connector_status old_status;
 
 	mutex_lock(&dev->mode_config.mutex);
-	old_status = connector->status;
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	if (old_status == status)
-		return;
-
 	drm_bridge_connector_hpd_notify(connector, status);
 
 	drm_kms_helper_hotplug_event(dev);
-- 
2.35.1

