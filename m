Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8E04069D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 12:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbhIJKP2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 06:15:28 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:56579 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232823AbhIJKPS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 06:15:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 824962B013E9;
        Fri, 10 Sep 2021 06:14:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 10 Sep 2021 06:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=6ZQTMH2JShBZm
        EFMLRUXSn5N9KUM3G2n3fySjX7bGeE=; b=kt3G+D8DNWxk+lIRMNBHQN6ieMO5u
        PZq4oEnO8mBCiHIU/N1Yrk2PcRn+9XtcarMoI1TyucBRWgZ3ofJ2LkXbtzr9C6rm
        8LHcdcqZofQlLKhTznqdJi4rh5A0DTsaIKuAH3d6RXnfiYYgzXk3FHtGxCU4BZNL
        NaKeW35SBnRHwJA5e1Q0Rz8ftxwL5RABwC3rXaZGNIIQnisp/dWU10yzMOfwuULw
        PONUa8akhaToSSYU0jMa9Jhcr82bGT6ibBFHkBK/jWk3KyVWOQewvvKytx4dvHUL
        zo97KqDROXjT8owHVuSWOFxvKTcEaKC3fiq5yjdrjj46zJPLpPZli+GMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=6ZQTMH2JShBZmEFMLRUXSn5N9KUM3G2n3fySjX7bGeE=; b=juVpdsQ9
        RCVGJ5OOg90+JWq+k6rZ2iuLT2fOfJC01Kc3cSt/K/y3W//QvAAUErp3hdfeDGdv
        6hvh0kfHsb7LNGFSp8U9+a0EQaegmkbkxBlSen8JvRagoQbGqB2z4CwrSbdIYNc0
        7t7PxLGkDdOxZD7gKHVnNTJd+40JLKGb9x0zp1nAJ+XmzyialCBnf4gwDwk8pJHv
        tehkLi6pAoUltXid2zerZ/ag9A6uHPLIvCH1a/HiaoB7X4MXEXCnosiKoBMLWbnv
        7CSS6hIAJ29Dt9huyq2U2pXZPGLa5TtO5Bo62aLu8AiOhgNIW1SJF9RdASbNwgoF
        i/p/T+Y9PB2wxQ==
X-ME-Sender: <xms:7C87Ybbu1P59Xkv2gKwFlF4ps5FiMoIVQcrtJffcXIz2PX7Xh3JDZg>
    <xme:7C87YaZD3_r3J2Uboj2FdaF9pJik5SQET-_tjkJy3FQlYv-mhw39X9Qwm8n5kbfkK
    9zEDyeNMbXn6ADh7ZM>
X-ME-Received: <xmr:7C87Yd9JP7A7WhpZWaveHjrWgr_v_UPUcvWXV0zm95zoftJYWgkee7qKGmaeK80a2M67CFJSkJynD4Db73Rw8PRn9iFPVvF8XxB4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7C87YRo6yKchDY5qA2LGR2KvkS4FXlqggTe1ztXR8R5BVBma7HK0Fw>
    <xmx:7C87YWrdr6ybMata5ck5uImQmjmCr4nd_UtkE4lxiciu3xTpy8hnYA>
    <xmx:7C87YXQebRLedmRXaC9hxPSeLfaNQM_48I3pFZoHOogEoABNsN-ftA>
    <xmx:7S87YTqVg1ssm41R-YaJiMLSw0gwQ43KAKSgjL_fkQsL1K3g_jmHm2clGoA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:14:04 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linux-kernel@vger.kernel.org,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Inki Dae <inki.dae@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org,
        John Stultz <john.stultz@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v4 18/24] drm/bridge: sn65dsi83: Register and attach our DSI device at probe
Date:   Fri, 10 Sep 2021 12:12:12 +0200
Message-Id: <20210910101218.1632297-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 80 +++++++++++++++------------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index db4d39082705..f951eb19767b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -245,40 +245,6 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	struct device *dev = ctx->dev;
-	struct mipi_dsi_device *dsi;
-	struct mipi_dsi_host *host;
-	int ret = 0;
-
-	const struct mipi_dsi_device_info info = {
-		.type = "sn65dsi83",
-		.channel = 0,
-		.node = NULL,
-	};
-
-	host = of_find_mipi_dsi_host_by_node(ctx->host_node);
-	if (!host) {
-		dev_err(dev, "failed to find dsi host\n");
-		return -EPROBE_DEFER;
-	}
-
-	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
-	if (IS_ERR(dsi)) {
-		return dev_err_probe(dev, PTR_ERR(dsi),
-				     "failed to create dsi device\n");
-	}
-
-	ctx->dsi = dsi;
-
-	dsi->lanes = ctx->dsi_lanes;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
-
-	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to attach dsi to host\n");
-		return ret;
-	}
 
 	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
 				 &ctx->bridge, flags);
@@ -646,6 +612,44 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 	return 0;
 }
 
+static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
+{
+	struct device *dev = ctx->dev;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	const struct mipi_dsi_device_info info = {
+		.type = "sn65dsi83",
+		.channel = 0,
+		.node = NULL,
+	};
+	int ret;
+
+	host = of_find_mipi_dsi_host_by_node(ctx->host_node);
+	if (!host) {
+		dev_err(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	if (IS_ERR(dsi))
+		return dev_err_probe(dev, PTR_ERR(dsi),
+				     "failed to create dsi device\n");
+
+	ctx->dsi = dsi;
+
+	dsi->lanes = ctx->dsi_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to attach dsi to host: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int sn65dsi83_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
@@ -686,7 +690,15 @@ static int sn65dsi83_probe(struct i2c_client *client,
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
+	ret = sn65dsi83_host_attach(ctx);
+	if (ret)
+		goto err_remove_bridge;
+
 	return 0;
+
+err_remove_bridge:
+	drm_bridge_remove(&ctx->bridge);
+	return ret;
 }
 
 static int sn65dsi83_remove(struct i2c_client *client)
-- 
2.31.1

