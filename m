Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E8A515478
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376657AbiD2Tcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 15:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377206AbiD2Tcy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 15:32:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C85DCFE78
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:29:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j4so15736992lfh.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SqMz6+QA40GWihsDI2sybGR2gK7KNbiJwJGp8fjNk80=;
        b=Ko1AxuJM2eP1Ei1Sjoh5rpqurh+hCqMjC52gROd4yaSlDbxO7zSgfbtz0UhkBYrzV2
         SkhLCSxxlE5wug28wbd7kYDf2a3o3Sj2eoQuBDC2fmRTUl4NzyM4IcY5t5ClBhVHuaBQ
         mQlYjciWeICPTJW6WMAy7UfpQHqCgL543Lip7ScUrF+WvDagfV9PdNHH9kGq4EOA/1J+
         GsQmIM3UH0VtD/u16A/r9o6haeCbGPLYtcGAZnvBAJNiI5jCO/q1kSExLl4Rd548a5EW
         K7apr6klMxiwt055UZRhJHnONtcASn1cl8CgP1lsqQ5Nrjag3F+Xne48rXY4KdcqFc2F
         4fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SqMz6+QA40GWihsDI2sybGR2gK7KNbiJwJGp8fjNk80=;
        b=fbAGN6ECEPNJGbganlaxXjDOSSKHyd9sIowUaN1u4Uu4bAAueMnMJ3NbNi0b43ibce
         pc4IbsZAebi1aLS70CGBpP1OkcSf8qhAZDulYw0+ZZnD/PHufY72fA3PJTKMtg5QBCyf
         BcZDHXJksl48M6SBz/KFC5W3oG3Eog3pTQdTOAa+0i/F4VjvyqhjQEn/s/xE29Rdt+Gf
         D9bfhPUSbqzG1dWvihRptD7EIYg4giEMLxXjifY72fqj8pabxkkRnKsD/jdf9RKYg1yZ
         7K8sibBacPeN2iyA/x85FnJsogSg3/5klz4clj4qv+95X5ee62U+ULu5D1Pvd39Dps4K
         4tUA==
X-Gm-Message-State: AOAM530K9Q65ZC9P3HV6qYMOFnrPg2Ej2KV4jV+vNCAKhuB6x21Vm0So
        Niq9mfu9COK6R235QLIcog8oJw==
X-Google-Smtp-Source: ABdhPJwaHubY6aVhB4RinSAXXT9idb/jHyZNS0vOzM4aU2LS5OIMn/oSoxCOAWQdtDpsekahizZXrA==
X-Received: by 2002:a05:6512:4021:b0:472:2513:4503 with SMTP id br33-20020a056512402100b0047225134503mr495697lfb.357.1651260573643;
        Fri, 29 Apr 2022 12:29:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y10-20020ac24e6a000000b0047255d211e7sm5522lfs.278.2022.04.29.12.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:29:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 3/4] drm/bridge_connector: implement oob_hotplug_event
Date:   Fri, 29 Apr 2022 22:29:27 +0300
Message-Id: <20220429192928.3697407-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
References: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
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

Implement the oob_hotplug_event() callback. Translate it to the the HPD
notification sent to the HPD bridge in the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index a0b742ebb330..b14af1c7ac07 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -123,6 +123,17 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
+						   enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hpd = bridge_connector->bridge_hpd;
+
+	if (hpd)
+		drm_bridge_hpd_notify(hpd, status);
+}
+
 /**
  * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
  * @connector: The DRM bridge connector
@@ -233,6 +244,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.35.1

