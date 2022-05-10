Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432E85224D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 21:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbiEJTaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 15:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235011AbiEJTaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 15:30:09 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747E12A76AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:30:03 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id a11so46550pff.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aenq/+payNfc0QfJK06n0457dQA2IsFpv+YO3oHnMIs=;
        b=CsVaXK6RqVBe6/OondZCpIqQ7YKFDn6kpSdzq7AGRLrpvTEGfziCDVpjEcn1dGwcxG
         odjvGogk7T1c8MDGI1PdHVpkNBpnOVPpOPHHqR6HCq0wqMfSHNnWHqHvuYz8j7jMzWft
         24EJaIJLYYXB725FpyUMI280VvP5MT0WzMCyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aenq/+payNfc0QfJK06n0457dQA2IsFpv+YO3oHnMIs=;
        b=5/IVwh1eTwv6F5RrxYOuvb2DgwxypXh/qtCZ+4Sr1nIXGCENFTASRTThfRfSwhzgNA
         Rry9G2JD2mBrWHK5O3NLtQ2bmgWo1uq/IkF7MgHjfXbMI5fh9kEayX7ri47i4XLOQWku
         PUQROrWLSgolevsgf4VjooS9Gca8dFuoKYRFpx2tdnUFUh4lgNTx9va2WrMExZ2yIB1S
         1QEE6vyFTAr6JZdim/uYHRm4wSiyDmTXGMF7BaMXs2p2gveJpcFHQVz30xe+y0fY0uai
         vbwnte/NUKiDL3NrhfgUp5hCV59n4j4tdTppWxi9c15dc/1YQSOqc+Bjd5fbovclRsK7
         N9Sw==
X-Gm-Message-State: AOAM530l8F0Q7fXggBa5wVf942TXSLdED/FmNkZeAPqLK1tK3AOz0jmg
        0ywnE4Ge5CEZF6tQb03F6vHgbg==
X-Google-Smtp-Source: ABdhPJyPgq9U3n6oXN3Vhj9GL6f0h6l49jG5QJ7lbqux34S+dYjO6ryIbGNnIKoQpI5HH+YnCl8/iQ==
X-Received: by 2002:a63:e5d:0:b0:3aa:3c53:537e with SMTP id 29-20020a630e5d000000b003aa3c53537emr18041665pgo.622.1652211002972;
        Tue, 10 May 2022 12:30:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6f08:624c:c762:d238])
        by smtp.gmail.com with ESMTPSA id s43-20020a056a001c6b00b0050dc762819dsm10786989pfw.119.2022.05.10.12.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 12:30:02 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] drm/bridge: parade-ps8640: Handle DP AUX more properly
Date:   Tue, 10 May 2022 12:29:44 -0700
Message-Id: <20220510122726.v3.4.Ia6324ebc848cd40b4dbd3ad3289a7ffb5c197779@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
References: <20220510192944.2408515-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While it works, for the most part, to assume that the panel has
finished probing when devm_of_dp_aux_populate_ep_devices() returns,
it's a bit fragile. This is talked about at length in commit
a1e3667a9835 ("drm/bridge: ti-sn65dsi86: Promote the AUX channel to
its own sub-dev").

When reviewing the ps8640 code, I managed to convince myself that it
was OK not to worry about it there and that maybe it wasn't really
_that_ fragile. However, it turns out that it really is. Simply
hardcoding panel_edp_probe() to return -EPROBE_DEFER was enough to put
the boot process into an infinite loop. I believe this manages to trip
the same issues that we used to trip with the main MSM code where
something about our actions trigger Linux to re-probe previously
deferred devices right away and each time we try again we re-trigger
Linux to re-probe.

Let's fix this using the callback introduced in the patch ("drm/dp:
Callbacks to make it easier for drivers to use DP AUX bus properly").
When using the new callback, we have to be a little careful. The
probe_done() callback is no longer always called in the context of
our probe routine. That means we can't rely on being able to return
-EPROBE_DEFER from it. We re-jigger the order of things a bit to
account for that.

With this change, the device still boots (though obviously the panel
doesn't come up) if I force panel-edp to always return
-EPROBE_DEFER. If I fake it and make the panel probe exactly once it
also works.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Adapt to v3 changes in aux bus.
- Use devm_drm_bridge_add() to simplify.

Changes in v2:
- Rewrote atop new method introduced by patch #1.

 drivers/gpu/drm/bridge/parade-ps8640.c | 74 ++++++++++++++++----------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index e2467e58b5b7..ff4227f6d800 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -537,7 +537,7 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.pre_enable = ps8640_pre_enable,
 };
 
-static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridge)
+static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps_bridge)
 {
 	struct device_node *in_ep, *dsi_node;
 	struct mipi_dsi_device *dsi;
@@ -576,13 +576,40 @@ static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridg
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
 
-	return devm_mipi_dsi_attach(dev, dsi);
+	return 0;
+}
+
+static int ps8640_bridge_link_panel(struct drm_dp_aux *aux)
+{
+	struct ps8640 *ps_bridge = aux_to_ps8640(aux);
+	struct device *dev = aux->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	/*
+	 * NOTE about returning -EPROBE_DEFER from this function: if we
+	 * return an error (most relevant to -EPROBE_DEFER) it will only
+	 * be passed out to ps8640_probe() if it called this directly (AKA the
+	 * panel isn't under the "aux-bus" node). That should be fine because
+	 * if the panel is under "aux-bus" it's guaranteed to have probed by
+	 * the time this function has been called.
+	 */
+
+	/* port@1 is ps8640 output port */
+	ps_bridge->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
+	if (IS_ERR(ps_bridge->panel_bridge))
+		return PTR_ERR(ps_bridge->panel_bridge);
+
+	ret = devm_drm_bridge_add(dev, &ps_bridge->bridge);
+	if (ret)
+		return ret;
+
+	return devm_mipi_dsi_attach(dev, ps_bridge->dsi);
 }
 
 static int ps8640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct device_node *np = dev->of_node;
 	struct ps8640 *ps_bridge;
 	int ret;
 	u32 i;
@@ -623,6 +650,14 @@ static int ps8640_probe(struct i2c_client *client)
 	if (!ps8640_of_panel_on_aux_bus(&client->dev))
 		ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
 
+	/*
+	 * Get MIPI DSI resources early. These can return -EPROBE_DEFER so
+	 * we want to get them out of the way sooner.
+	 */
+	ret = ps8640_bridge_get_dsi_resources(&client->dev, ps_bridge);
+	if (ret)
+		return ret;
+
 	ps_bridge->page[PAGE0_DP_CNTL] = client;
 
 	ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client, ps8640_regmap_config);
@@ -665,35 +700,19 @@ static int ps8640_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	devm_of_dp_aux_populate_ep_devices(&ps_bridge->aux);
+	ret = devm_of_dp_aux_populate_bus(&ps_bridge->aux, ps8640_bridge_link_panel);
 
-	/* port@1 is ps8640 output port */
-	ps_bridge->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
-	if (IS_ERR(ps_bridge->panel_bridge))
-		return PTR_ERR(ps_bridge->panel_bridge);
-
-	drm_bridge_add(&ps_bridge->bridge);
-
-	ret = ps8640_bridge_host_attach(dev, ps_bridge);
-	if (ret)
-		goto err_bridge_remove;
-
-	return 0;
+	/*
+	 * If devm_of_dp_aux_populate_bus() returns -ENODEV then it's up to
+	 * usa to call ps8640_bridge_link_panel() directly. NOTE: in this case
+	 * the function is allowed to -EPROBE_DEFER.
+	 */
+	if (ret == -ENODEV)
+		return ps8640_bridge_link_panel(&ps_bridge->aux);
 
-err_bridge_remove:
-	drm_bridge_remove(&ps_bridge->bridge);
 	return ret;
 }
 
-static int ps8640_remove(struct i2c_client *client)
-{
-	struct ps8640 *ps_bridge = i2c_get_clientdata(client);
-
-	drm_bridge_remove(&ps_bridge->bridge);
-
-	return 0;
-}
-
 static const struct of_device_id ps8640_match[] = {
 	{ .compatible = "parade,ps8640" },
 	{ }
@@ -702,7 +721,6 @@ MODULE_DEVICE_TABLE(of, ps8640_match);
 
 static struct i2c_driver ps8640_driver = {
 	.probe_new = ps8640_probe,
-	.remove = ps8640_remove,
 	.driver = {
 		.name = "ps8640",
 		.of_match_table = ps8640_match,
-- 
2.36.0.550.gb090851708-goog

