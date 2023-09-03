Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F27790E2E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Sep 2023 23:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348648AbjICV3r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 17:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348732AbjICV3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 17:29:46 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C51103
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 14:29:42 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so13090091fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693776580; x=1694381380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTYtN9ceXzi2tGhWn5q5e7ybJcm3lf5yDMeSzJkSqgc=;
        b=oN1qyjNhPGdRsawgrQHtWWYdDlemWn3CPoDeosfFzdg7YHrqq/uvBrE+jWZfgJE6oo
         hEdkIKhFNGS4BJ6PfGTMvmoGuJrl+5BwvzyCh/Q/TMesGiebj+fFQBVo1QsUlunVgOK1
         6ccNUSappj4mFhHj2YkWa4b1vTgCiyQhWZf27lal6wmkD6O8hB4T2joz98ghBkvaf/cA
         e8IfMi54Tdl3ab7S5CSzF+/8+PcKuoFSiF+m1ttHOtJSY2Wk6+PYGm4kJu/LllqtM1Z/
         pdM5wa2w7Z7LRvz+BftSbj7bmqY1TuhIMqPo8T4uLn/pce7/rPR1vEg5nHVDHAdLG97v
         rl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693776580; x=1694381380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTYtN9ceXzi2tGhWn5q5e7ybJcm3lf5yDMeSzJkSqgc=;
        b=Wl2yTLDogfkUgS1zChc/hyFGURenECAOH+cdT+dsJXfxybZ+/5HMawZiVz+HZoz6kE
         mc7tY/9v0HQ3nXsbHlkHaj65S+TOK/RUUAT2lA3dn1/R4rCkAlzWO4IR79KS61vci5vc
         omAV3i379RuKZAt8c8Dx1W1PGZAOIvNW0ntee3tM2HWYgWVmtAFzR5tTv4XvNWJyWiR5
         ImuwzRq0jq4gwBncgjhbQgEAJ7fyyI5qe2RCzuAET0UKTFbq4pLBfXx4GZ4K/iZW1BSa
         FUeKzH69HB5JM62+IgCEMSojQG6KJlfzE5mT7MPQyP0+AMhRWPYpKLKyEPuWoob9xYo+
         Up6A==
X-Gm-Message-State: AOJu0YzPrT/wBoM3UwCSrhMK7kULpUgUxuD0UKxY/g8Mkem8kFtLazLy
        /nP3nKcRG4PkMJD4dcpXVePwoA==
X-Google-Smtp-Source: AGHT+IHhuu1XpaE+PO25+uVWIsSs6HgoMj+d3EKB5ectySV1k+e2KdlfTqc8aDVm4kOQSBo9dpyfxQ==
X-Received: by 2002:ac2:58ca:0:b0:4f4:d071:be48 with SMTP id u10-20020ac258ca000000b004f4d071be48mr4760118lfo.14.1693776580258;
        Sun, 03 Sep 2023 14:29:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id eq11-20020a056512488b00b004ff8d9ed368sm1412352lfb.258.2023.09.03.14.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 14:29:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Simon Ser <contact@emersion.fr>, Janne Grunau <j@jannau.net>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v7 2/3] drm/bridge_connector: stop filtering events in drm_bridge_connector_hpd_cb()
Date:   Mon,  4 Sep 2023 00:29:36 +0300
Message-Id: <20230903212937.2876815-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
References: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Reviewed-By: Janne Grunau <j@jannau.net>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1da93d5a1f61..10b52224db37 100644
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
 
 	drm_kms_helper_connector_hotplug_event(connector);
-- 
2.39.2

