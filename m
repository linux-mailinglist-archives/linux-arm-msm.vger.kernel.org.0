Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F39F369799
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243316AbhDWRA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 13:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243278AbhDWRAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 13:00:23 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B7EC061343
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:59:46 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso1522699pjg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pdcpo4UqRlWs4ocPfX4snuIEGMWz2iUneYKWicWu5Ps=;
        b=UiXErXemW2Z1PCdM9rdxduLgZdKkZp2cJ5UTIOMhKS/ZBUmVIriOjKreGnp1xfCQs4
         vE7OR5LEr7+0PS3EtSxsnORGB1XnMRLhtR/hwozuWTiDGTDzBVc+Z7heZxAXehNhWWu8
         mitoDjp0bgrk9G2vLOxRD91XRxARy41wepVMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pdcpo4UqRlWs4ocPfX4snuIEGMWz2iUneYKWicWu5Ps=;
        b=MsLPWOPps060ktDakW/v8yqIPSU/dqoa5EjCJwngsVDkkq4caWnLi3gahU1jRv5CSP
         EF1214aUlK0GDutP5twZP0pvRVsrrz/Jx+1Sxzt+m9YuKNaWNzuXGP8wEdJenDynHG3V
         h9xWMAhhoYvW8K/8AS5lxV0mv85RPRJyZebH8CGVCw2Y8zv1PxEdArFuXxGbBqAd0nlH
         fVMMhiRJ3Mj7lS266DTBk8FpwdFppglEl09B6Lr6/nvFhpH17E5EVP+BQqU/7LQs37La
         jhyHxqpfSRQaF+2GKhV6cJlr7V42CSdLvAyQNjbiyVJ52vfGoXPsiCYBk32Fw0IocjRT
         o8Rw==
X-Gm-Message-State: AOAM531aU77s1sKYtwSGGg2D3l6z/xti9ARDN9/TTe19aw96NgFLt972
        xU2Z3FVF7DNqZJHE3+oECc2c6A==
X-Google-Smtp-Source: ABdhPJyAWKVmxvEi9reu/EoUqAW7KcB819hFWrr09EJVcKqxEtEvh/AuypvfPYDZ1yx6Fv3YxVpHEQ==
X-Received: by 2002:a17:90b:344d:: with SMTP id lj13mr6661098pjb.44.1619197185610;
        Fri, 23 Apr 2021 09:59:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:45 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/20] drm/bridge: ti-sn65dsi86: Clean debugfs code
Date:   Fri, 23 Apr 2021 09:58:51 -0700
Message-Id: <20210423095743.v5.5.I5fe072753290c6a77eda736ebd5778e17b7cb0fb@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's cleanup the debugfs code to:
- Check for errors.
- Use devm to manage freeing, which also means we don't need to store
  a pointer in our structure.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Bjorn: I left off your tag on this patch since I made changes compared
to v4. Can you re-add if it still looks OK? This is now ordered
_after_ the pm_runtime patch so I believe the ordering problem you
pointed out should be fixed as well?

Changes in v5:
- Don't print debugfs creation errors.
- Handle NULL from debugfs_create_dir() which is documented possible.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 33 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 44d8395505f0..8aa36074aab9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -118,7 +118,6 @@
  * @aux:          Our aux channel.
  * @bridge:       Our bridge.
  * @connector:    Our connector.
- * @debugfs:      Used for managing our debugfs.
  * @host_node:    Remote DSI node.
  * @dsi:          Our MIPI DSI source.
  * @edid:         Detected EDID of eDP panel.
@@ -146,7 +145,6 @@ struct ti_sn65dsi86 {
 	struct drm_dp_aux		aux;
 	struct drm_bridge		bridge;
 	struct drm_connector		connector;
-	struct dentry			*debugfs;
 	struct edid			*edid;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
@@ -245,18 +243,31 @@ static int status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(status);
 
-static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
+static void ti_sn65dsi86_debugfs_remove(void *data)
 {
-	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
-
-	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
-			&status_fops);
+	debugfs_remove_recursive(data);
 }
 
-static void ti_sn65dsi86_debugfs_remove(struct ti_sn65dsi86 *pdata)
+static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 {
-	debugfs_remove_recursive(pdata->debugfs);
-	pdata->debugfs = NULL;
+	struct device *dev = pdata->dev;
+	struct dentry *debugfs;
+	int ret;
+
+	debugfs = debugfs_create_dir(dev_name(dev), NULL);
+
+	/*
+	 * We might get an error back if debugfs wasn't enabled in the kernel
+	 * so let's just silently return upon failure.
+	 */
+	if (IS_ERR_OR_NULL(debugfs))
+		return;
+
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove, debugfs);
+	if (ret)
+		return;
+
+	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
 /* Connector funcs */
@@ -1316,8 +1327,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
 
 	kfree(pdata->edid);
 
-	ti_sn65dsi86_debugfs_remove(pdata);
-
 	drm_bridge_remove(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
-- 
2.31.1.498.g6c1eba8ee3d-goog

