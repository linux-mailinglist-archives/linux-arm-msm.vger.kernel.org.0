Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0243334DECF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhC3CyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbhC3CyI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:54:08 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F017C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:08 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x26so11207560pfn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OPXUOmfQRekvQeQvsP70z1DtiDzMfmRzBeh0Ag8UFxM=;
        b=OaZPcHG+xa8TmTWZTA0Hwp0y/rk+j9Ba1UMowY1egymnOB4p+aNxLcC2BSvqDs9q5q
         4alN2gzkfnk3Pm8vKeca7tvK6mDFvMGmm43+hA3Wj3N4MWwTz4FQMcOux+jyfjfXcW7v
         cVWAmDIe8H4TDNqiSVKQWU3ft/UkzrUp2AksE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OPXUOmfQRekvQeQvsP70z1DtiDzMfmRzBeh0Ag8UFxM=;
        b=piO7yXf/ggAVNTtNxhkRiSkmCyUlVt4aVpTxE5n7nbGEKFNwPvQAOXzxH1/TPVlhWC
         4d/Lj9Kmo3DipKtJjjKwpb2kfvfxGVba72dVNwIppA8bwHLfnYSwTqEsQGNL34YszdSA
         2ZZNkD1CNW3uEftu1ypZ+C02CZdDLje5afSDNGvQjFR2GIlSXHCvxfbqNTskTadBPbV4
         jPKpHeW18mg6aRIUcoHYECeFy2Gwiuk6oKkxc+Tr68VcUU2zfKO8hxy7c2nBiZ86Ytzq
         sFpCtkOAUWUDZkufe3QGc81TUwy8QUB68qp22HOeU9pkKpq+mBp2mYaiTuN8bQdxHRtA
         6ubw==
X-Gm-Message-State: AOAM533wk4spB3fe693AxGZToxPDJYDvUxJbt/hlqewjzlcT9rKVhsWy
        bHmgcrfSPNNQp+OsdY6HGBL7Gg==
X-Google-Smtp-Source: ABdhPJzNB5xuvOvavd2lC2JLfMQFcwfveLVKJQBZBZzHvrCJVMqsfbDPgPl2Nyg9excKNq+Ek1sJvw==
X-Received: by 2002:a63:2265:: with SMTP id t37mr14590832pgm.452.1617072847654;
        Mon, 29 Mar 2021 19:54:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f599:1ca7:742d:6b50])
        by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 19:54:07 -0700 (PDT)
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
Subject: [PATCH v2 04/14] drm/bridge: ti-sn65dsi86: Reorder remove()
Date:   Mon, 29 Mar 2021 19:53:35 -0700
Message-Id: <20210329195255.v2.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's make the remove() function strictly the reverse of the probe()
function so it's easier to reason about.

NOTES:
- The MIPI calls probably belong in detach() but will be moved in a
  separate patch.
- The cached EDID freeing isn't actually part of probe but needs to be
  in remove to avoid orphaning memory until better handling of the
  EDID happens.

This patch was created by code inspection and should move us closer to
a proper remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 76f43af6735d..c006678c9921 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1315,20 +1315,21 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	if (!pdata)
 		return -EINVAL;
 
-	kfree(pdata->edid);
-	ti_sn_debugfs_remove(pdata);
-
-	of_node_put(pdata->host_node);
-
-	pm_runtime_disable(pdata->dev);
-
 	if (pdata->dsi) {
 		mipi_dsi_detach(pdata->dsi);
 		mipi_dsi_device_unregister(pdata->dsi);
 	}
 
+	kfree(pdata->edid);
+
+	ti_sn_debugfs_remove(pdata);
+
 	drm_bridge_remove(&pdata->bridge);
 
+	pm_runtime_disable(pdata->dev);
+
+	of_node_put(pdata->host_node);
+
 	return 0;
 }
 
-- 
2.31.0.291.g576ba9dcdaf-goog

