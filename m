Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A5834DED5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhC3CyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbhC3CyP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:54:15 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA7AC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:15 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id y32so9531204pga.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9aZHg1XmzeEuWmP1Y9k5kwByteme6M7NQeVtbNkUCU=;
        b=C/RrhmHfFql2N/xoLubh0lDEHxjw4L7AWTRv0UuWixsW8lQIMBgwB+8VXVga1+vPpx
         tTauyVTEvRbcQpp9YFiGpINDqXOWBUqidzrOyuJk85ZUjFx8jlv8GVRroTOH154PGPGa
         8rKSWGuzQ6BYuBnDPUdGSqpTe/cxZfw84Xumo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9aZHg1XmzeEuWmP1Y9k5kwByteme6M7NQeVtbNkUCU=;
        b=EdUbFjlnJ1AXmAt51nPF9lJPpUh/qcasp2TNa5Eru2aGTiw1nj/GepIK8Z9XcUT2lV
         BfMvoCg2+r9BI2XeDxUUSBOkyP+fhoqa2qgsLwYqBtx7LLMWfHiWpwvE8m9mF55qD5AK
         EaxAMJBP8d9kVg+qRw5VOyCvheNWBfDQvaGyIcHZ/2poihFw0tZwRRbngf+EwnYBRQuv
         boz5xjekrC71aLYRmX+SiwshthRT3mmzb7VSGf66IFw1mlhTs4maZLxvx6JKwlXGyyXR
         Y2rOkjvaLWIoDfDshKb4+6eZxylV+Tw0hXEbSJRuv7La+wnKTz6NLJ1fo3L+Z5kTzvJt
         GLiw==
X-Gm-Message-State: AOAM531XpjmSJZ/kUFkSjjZqiwzcFYj2YdAA4yGI/AEpsWmmDHZytLZJ
        fym/E5PWlI0+/o7PpiOt60c1Cg==
X-Google-Smtp-Source: ABdhPJxr8EyEo9d+F9iFHOxEgEe5cO7TbKD9tvtR+Kk8T89iLex2MLCh1rb01WF9K+Rd1+GvPT8R+A==
X-Received: by 2002:aa7:8a4d:0:b029:211:92f2:658c with SMTP id n13-20020aa78a4d0000b029021192f2658cmr28475860pfa.29.1617072854696;
        Mon, 29 Mar 2021 19:54:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f599:1ca7:742d:6b50])
        by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 19:54:14 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/14] drm/bridge: ti-sn65dsi86: Remove extra call: drm_connector_update_edid_property()
Date:   Mon, 29 Mar 2021 19:53:39 -0700
Message-Id: <20210329195255.v2.8.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
drm_connector") the drm_get_edid() function calls
drm_connector_update_edid_property() for us. There's no reason for us
to call it again.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a0a00dd1187c..9577ebd58c4c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -270,7 +270,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
 	struct edid *edid = pdata->edid;
-	int num, ret;
+	int num;
 
 	if (!edid) {
 		pm_runtime_get_sync(pdata->dev);
@@ -279,12 +279,9 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	}
 
 	if (edid && drm_edid_is_valid(edid)) {
-		ret = drm_connector_update_edid_property(connector, edid);
-		if (!ret) {
-			num = drm_add_edid_modes(connector, edid);
-			if (num)
-				return num;
-		}
+		num = drm_add_edid_modes(connector, edid);
+		if (num)
+			return num;
 	}
 
 	return drm_panel_get_modes(pdata->panel, connector);
-- 
2.31.0.291.g576ba9dcdaf-goog

