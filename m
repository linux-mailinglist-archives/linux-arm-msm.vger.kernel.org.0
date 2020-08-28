Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E6F25557D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 09:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgH1HnF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 03:43:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:40076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgH1HnE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 03:43:04 -0400
Received: from localhost.localdomain (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7EBA620776;
        Fri, 28 Aug 2020 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598600583;
        bh=hwP7Z1Qw6TB+HuWMynMqgGLHide/4Ajq/hNm8rqV4M8=;
        h=From:To:Cc:Subject:Date:From;
        b=OlhVIskDIZNItaSs02q3XH8z3VGMmLh/fO8UGAfQdFl19Mx+30v3O2wvJOlp7Jbke
         MSvZCRLWiTlIA+YT1VRrGbNK81UNEF1rf/RsYJbnpS5nQlwC+ojb1JUzSp5V3nk17P
         vMkqbXiRtTVjFwZ6ofvhObQ/ha92Sq8TL7c89GiI=
From:   Vinod Koul <vkoul@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/bridge: Fix the dsi remote end-points
Date:   Fri, 28 Aug 2020 13:12:50 +0530
Message-Id: <20200828074251.3788165-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSI end-points are supposed to be at node 0 and node 1 as per binding.
So fix this and use node 0 and node 1 for dsi.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1009fc4ed4ed..d734d9402c35 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -960,13 +960,13 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 static int lt9611_parse_dt(struct device *dev,
 			   struct lt9611 *lt9611)
 {
-	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 1, -1);
+	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
 	if (!lt9611->dsi0_node) {
 		dev_err(lt9611->dev, "failed to get remote node for primary dsi\n");
 		return -ENODEV;
 	}
 
-	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 2, -1);
+	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
 
 	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
 
-- 
2.26.2

