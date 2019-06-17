Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE4749118
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfFQUNq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:46 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46964 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfFQUNp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:45 -0400
Received: by mail-qt1-f196.google.com with SMTP id h21so12357105qtn.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fDopIqI87NuKfsetWNyXbj/fkfbEd9K2X1YOScDx9RI=;
        b=JPWAGxKksuKYU8RDsDDM4EUum72rinZkJzX8ksj/hS6MtLwM93Dq9MD1dhV/pZ690v
         wcT8tW5WKLwDCa+GcSlLgFLAC8bVOP/SDUNsvLrWknjSOR8RGqd/iDOfm3t4MN4DXpw3
         uS0qZBhoZ88UUCd1IabRJ8KzNcTjWgybF3IQZtG8DYJl1WxRXqXZVP0kWmms7s5vt85n
         sUiXOXJK5pl5Rq67Pgzc1ScZXrpKcr72YEbvMfBvC7HunKOJHpcQTnji9kRG31UGktqC
         gNiXOpfwmBps9Fukc03SvQRw7GpYeArH1RExjUUCjSUuNOHlIc5HZX4zzGf47o9Iw49X
         edtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fDopIqI87NuKfsetWNyXbj/fkfbEd9K2X1YOScDx9RI=;
        b=sfJ1txG9BZDTDH2lrw4ZOpPSQbvgy2b+eAUiML7baVtGSJ/YIUY+WwRcKauNOGVeoK
         nkS5BkJEqP0mvRnilpF+J2OJNt3U8ukOWaeXKe8OQChkk1H3/L335/ebwX1ZX8gzssts
         J2xkEJlLureqjWnqOsmK0HLMKGiUUDs1znsNjyTEFA/18+J8a3NGOkdRCy4s3Vh0seFr
         oNkkNrqU4LR/FN3SSP17f88lSPqnEZu58fZAyFCSfZZ0JIVLWAMGW9uujOlQy5XYYlBw
         7jFzWyoKnAo0BsjWmYIN7dB2pfs26tgp5dpkQnd6n03mlXfOIupCC69K7NZCY90gy/eH
         ePgg==
X-Gm-Message-State: APjAAAUF4nTWFSS6AwzeauKHKWbpMgocfZ62yQkV+KooqUFyBjeBQZHS
        dFwuplZ5qzs26h2aW/IpF4Zljg==
X-Google-Smtp-Source: APXvYqy1jTG2HR3hZvPT0PMKE5ePTuohZtRekInTF8heouwOGhe6MshqztZzlb/5YEpiIIyEVpP2KQ==
X-Received: by 2002:a0c:ee29:: with SMTP id l9mr23210987qvs.43.1560802424979;
        Mon, 17 Jun 2019 13:13:44 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:44 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 12/13] drm/msm/dsi: Move dsi panel init into modeset init path
Date:   Mon, 17 Jun 2019 16:12:57 -0400
Message-Id: <20190617201301.133275-9-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Since deferred probe from the modeset init path now works, we can move
the panel initialization from detect() into connector init. This
avoids doing work in detect() and hopefully will result in a more
deterministic boot sequence between devices with a dsi panel, and those
with an external bridge.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 602953b90cab..5db43c7ffafc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -312,13 +312,6 @@ static enum drm_connector_status dsi_mgr_connector_detect(
 	int id = dsi_mgr_connector_get_id(connector);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 
-	DBG("id=%d", id);
-	if (!msm_dsi->panel) {
-		int ret = msm_dsi_manager_panel_init(connector, id);
-		if (ret)
-			return connector_status_disconnected;
-	}
-
 	return msm_dsi->panel ? connector_status_connected :
 		connector_status_disconnected;
 }
@@ -631,7 +624,17 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id)
 
 	drm_connector_attach_encoder(connector, msm_dsi->encoder);
 
+	ret = msm_dsi_manager_panel_init(connector, id);
+	if (ret) {
+		DRM_DEV_ERROR(msm_dsi->dev->dev, "init panel failed %d\n", ret);
+		goto fail;
+	}
+
 	return connector;
+
+fail:
+	connector->funcs->destroy(msm_dsi->connector);
+	return ERR_PTR(ret);
 }
 
 bool msm_dsi_manager_validate_current_config(u8 id)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

