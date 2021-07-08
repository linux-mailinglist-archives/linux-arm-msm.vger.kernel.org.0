Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15E33C1BA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 01:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhGHXGQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 19:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhGHXGP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 19:06:15 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E12C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 16:03:32 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id r20so4943032ljd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MmU1HG2iYGV6JEeDyyVDdrnq6JazLk/+ZHGeiYN3Id8=;
        b=Anr3Kvt0K7SA7IBK762lHz46n210rw7QKiWEqBL3utOUUXN4bUlk/wrVNTDcS+e0Uy
         kWOy1wIk/ekdX1gJbFoj1QhPwYDZL/+oZeNr+QqBXUefls4FPielGMNM4iLV+rqf1nBI
         6kLR/I7+iqde0yGrlScHVI7b2WBc+regzdzNrYbDkFWsuqBQx8A60A/cj+b5y3KZhDd1
         WggDi9JACFZNXFWgnylkmI21oPmR8dLpA8T/Nl+mDV0vdQedavfZumtqhSJvOnsiWL0+
         +Em3z5k/gjcO0MImgiXu9NREMxW4saXQdC9cY/grmR4mJD484K3kGzVT9JSCOBvkH6uJ
         KFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MmU1HG2iYGV6JEeDyyVDdrnq6JazLk/+ZHGeiYN3Id8=;
        b=niv4E4APqznmZMA261xwrzNKgv5z2P898z/7qwY9HcNxhvMUuUytdUBr+il1TQlYFL
         uifBAVjcJiR7SByABHSP5DILgA9P7aZuONqTO638y38Rzp1DDdY5lP5GTLw0hSh3FtTl
         3cundtgyZ/bPYZ6TitggQ7qvKUgp3Ea8YGEzReYgTIrSefo0KNJr2ATOdjUAxbWjtB6t
         xwLXUJWBe+9JwnlP9PVURt8gCSOgwJbqKaPsnXK59ItjfyBCC38sl19TABnfwYTLV3MM
         +WSlli1MMMdOxVVjQnZODBtIBlfr0FwuLegcK4vAD75D9G5Kvi+r2yzsIem9k02lKwB7
         kUvw==
X-Gm-Message-State: AOAM530j8G9ejZLhxXMltQDhusJhftx3Hp6F/SQ90v5jeETkpU2eXBhf
        8SE5jP+zsRn52R9WPvoQRLbH0w==
X-Google-Smtp-Source: ABdhPJzxIl8223mKfhnS0pkogb8o9xDXmjoMOzVaETRZ1t5uJa7cBM3z/jThF4QkjwA16wLzYvitag==
X-Received: by 2002:a05:651c:211d:: with SMTP id a29mr26605525ljq.115.1625785410259;
        Thu, 08 Jul 2021 16:03:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p8sm309904lfc.185.2021.07.08.16.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 16:03:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/bridge/lontium-lt9611uxc: fix provided connector suport
Date:   Fri,  9 Jul 2021 02:03:29 +0300
Message-Id: <20210708230329.395976-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- set DRM_CONNECTOR_POLL_HPD as the connector will generate hotplug
  events on its own

- do not call drm_kms_helper_hotplug_event() unless mode_config.funcs
  pointer is not NULL to remove possible kernel oops.

Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 3cac16db970f..010657ea7af7 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -167,9 +167,10 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
 	bool connected;
 
-	if (lt9611uxc->connector.dev)
-		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
-	else {
+	if (lt9611uxc->connector.dev) {
+		if (lt9611uxc->connector.dev->mode_config.funcs)
+			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
+	} else {
 
 		mutex_lock(&lt9611uxc->ocm_lock);
 		connected = lt9611uxc->hdmi_connected;
@@ -339,6 +340,8 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
 		return -ENODEV;
 	}
 
+	lt9611uxc->connector.polled = DRM_CONNECTOR_POLL_HPD;
+
 	drm_connector_helper_add(&lt9611uxc->connector,
 				 &lt9611uxc_bridge_connector_helper_funcs);
 	ret = drm_connector_init(bridge->dev, &lt9611uxc->connector,
-- 
2.30.2

