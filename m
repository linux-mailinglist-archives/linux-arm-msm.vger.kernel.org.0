Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3313C5154FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380448AbiD2UBB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 16:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380444AbiD2UA5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 16:00:57 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6D5694B0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:37 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id l19so11734102ljb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SqMz6+QA40GWihsDI2sybGR2gK7KNbiJwJGp8fjNk80=;
        b=MtCRAIFnfLZUrDUX5UFQZqf2hTBZYDYuPU1iAUIBIABeOJn6mQ/ulydY9I6+XwXAlh
         a+YJFB1B6V0UCJvEb1bk4uzcXfViufL71Woz3R/7aTKdSBmpkOEiztGmhrycjiB+/Ocj
         AqPnacpAjusZiSM9aI/5VlsYczvM59+jzoDErjspgXvmWoxeAtY3PjxaQue2Ti62uaMi
         z3RtlHH5NH1GvbXfOVZ1/vegXyOSlvGR+xNmnzPOlsfbNOBQG15LEeb5WXG92NJ/YWn6
         ni2JtozGH8fXugekhAx5zjgy/VOcfF1j2YquUAw4EcNGbW/JSJ6DegHDhZCb/WJ9pv/+
         wgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SqMz6+QA40GWihsDI2sybGR2gK7KNbiJwJGp8fjNk80=;
        b=idugJI9j57+Z7WG9EUgscI6Bf8CFLZUeWPKl1ND2KXnrAu3Rr8k8AZQK4cxvlaDZLB
         77s2vvwbciQxQIr1zD+iIkstg3hNHuBVnn8N5+OczUkGwbfXbt4e5z7RidrDQn5ff1A8
         w+ecjHQ0pE+MhLRnZEETIzJzERbdT2E/h4vsjF+y6qqpn/Z/SV5DQXATqx2o9ElFT73Q
         7jW8wvVhp9so3tBVHff6ioZtmsMsjJ8k0GJa9WTioDemmsj/DzVd+8mAWWJi2D178Dtd
         3ieWDZX4wySOizJMtSWpscbbA8TgtfhQj6qJU34LQzhmB84FfEstieyprmmFj1AEfCnV
         CQnQ==
X-Gm-Message-State: AOAM532o3UMYjhdX48R9mATO6rSqusaoHybA0JSi+U7BaOExziJmXn7t
        mAM1FyTdyHyKhRaM7ZR1qJK56L/qd56KRQ==
X-Google-Smtp-Source: ABdhPJwutlRCQm7Ts3tuPRWgP036d46B10TsEYXjiWciXpakVkQ8/p7sXMJj+y6carkW0PXYyxz80A==
X-Received: by 2002:a2e:bc0c:0:b0:24f:166c:9279 with SMTP id b12-20020a2ebc0c000000b0024f166c9279mr498455ljf.504.1651262256130;
        Fri, 29 Apr 2022 12:57:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j17-20020ac253b1000000b0047255d2118csm10601lfh.187.2022.04.29.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:57:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 3/5] drm/bridge_connector: implement oob_hotplug_event
Date:   Fri, 29 Apr 2022 22:57:29 +0300
Message-Id: <20220429195731.3716446-4-dmitry.baryshkov@linaro.org>
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

