Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3676C515474
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359274AbiD2Tcw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 15:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239127AbiD2Tcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 15:32:52 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6174ACFE78
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:29:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w19so15729033lfu.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjiWSb36gHEJ1pupckIvzivsOKw4TFaRqlM2gJWlkeg=;
        b=VvyHyWk9ss55mLpsJMhmDjLhAfzhgVwTosz5/KtUeXG8f7gtCjTHh9ta12MW8Q8Qv5
         4DCA1vAf+oNQJ5HTw+zih0F5/DyFy+nm53WCzwbk3uXoIyM8g/8pKcgK21gXn58WtvKA
         J4zl4mtbS1F+is88ser58AScok4CrSoRmJtjvvuNn1454jhm3si8OX9Qs6KdGc+I4Sgo
         RTcEoD6xMlh0TttERyIG4Zsvx0Pls4MCEJhOrW0XfLUoGWJVTMZPsBSPpFpBXd5mdirm
         hIGNDG+xAirjAo4pgoGFeJ08L39dxzZ1Xcn9luY4BXXFvAOC33bzkReV+4C0CRtn4fyG
         6shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjiWSb36gHEJ1pupckIvzivsOKw4TFaRqlM2gJWlkeg=;
        b=Ldsi6tzw7uJV2SbPGqnqOdXc3cIMLBrSyXDQ2nBvoHmYQigL7prgXeh2RdN7ALWwT4
         D3hLN5th2+ON4X05S7O2Duf58G9t5KmYFx8VxZIYmAs/mWVxzNckSFMJHsLh0DXBnSsU
         AGX+OPp7L3SlRzDJD+dGftz98bqUJGPVDa0S6ju6q8ay2qfH+U3uv5YW1PXi3lTT7VsO
         3p8y/ijjJhyB6jiTqgZCaVa3lEPnTQLxCC5Qlppx8ocLGHbYer4gNrPd4JIhGiFc01ew
         bBHy+GyfFlWYyM5VOttpvcxG5dWljL0g+mAbtnMwcfj/BEWAFdct4vLdoG3Q4d8WqQll
         CiOg==
X-Gm-Message-State: AOAM531EnpQBkuJHUAjIRmFKHwNtUh+mnE21viBT1EontwteZBF/3/58
        E6i05t7pCmg0LeT4vLFzx4678Q==
X-Google-Smtp-Source: ABdhPJwZsF+ismHXA1SwjcjwLTj06u3hcpcicsYABBKTikMY3EqCe2yKGTDrLfdc4eDJFLhtBjsEQw==
X-Received: by 2002:a05:6512:21cc:b0:46f:47c0:9c20 with SMTP id d12-20020a05651221cc00b0046f47c09c20mr572436lft.74.1651260571698;
        Fri, 29 Apr 2022 12:29:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y10-20020ac24e6a000000b0047255d211e7sm5522lfs.278.2022.04.29.12.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:29:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 1/4] drm/bridge_connector: stop filtering events in drm_bridge_connector_hpd_cb()
Date:   Fri, 29 Apr 2022 22:29:25 +0300
Message-Id: <20220429192928.3697407-2-dmitry.baryshkov@linaro.org>
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

