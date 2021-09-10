Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184284069E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 12:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbhIJKPz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 06:15:55 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:43397 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232711AbhIJKPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 06:15:45 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id D64D92B013F3;
        Fri, 10 Sep 2021 06:14:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 10 Sep 2021 06:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=2hzEIPSbc5wkY
        vt/zitoXwWaQ6LFoXtgzPoVlTVzm0A=; b=O0GCdUGOGtlbB4T25fRtg/unFV7oh
        jmfMPf1NRY6CNssmwPLiH4okiWCZA4zFVd1AK7ntGgpRTAWXZneG9leGgwppzpQ/
        1JTrrWtIx4Uirk+hdUQv3oi/NHfmgSDKPBjB/DVFZAGawkDUKZOQvoG5et/P2aWP
        saz4AJ8tCoYEEWsCJsvCdIMYkSZ7/Fj+JjNVE65KGTBEgbHXtoH32DrscXJYeb4i
        2B+QUQBUiIdjhZ8dj/QpMFPX9/UZrRIWOK4aZ7JmvTP7OywbeAUig6rkAOOydwE8
        6QBGblzaiNsTtVjHjUlY2Oz+8Ws3Sso0AsBkTO/X0hERoWIdsjYN/1DtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=2hzEIPSbc5wkYvt/zitoXwWaQ6LFoXtgzPoVlTVzm0A=; b=GouFiGoq
        +27I3/LcrSZMUYF6eQYlmwmFdIBTCoo6GhQ46PAWqd/dEEH8GmwzfMv/4C8IauUx
        JzK6yk3/lJn6eJq5M1wcE1xyEQJR8Fo4h6bq/CFnBGSnlb5wMeAya7XTp+zPPrXk
        XMsQCdS/rmCCdI1WvePCaQpgHtfViZum1a3ha0R7tsEPH2bWiywJrgKxTCLIYsJm
        QclD9anb/kQRk0HKw+/gRFcgo5rYji+JAYfPxq/yfsLibVj4ZuoHpkrkCNJhOiNs
        3yxyicIsi7NJTE1JoHFYOuyyS1HglCsqbTiethdkuGGGf7J78ekt5gMUPnV6VA5I
        3Hi1ULkHGxc9Rg==
X-ME-Sender: <xms:BzA7YdFjhqTnMshcfjV_-Vtd8j4WZKpDchjsdApsIAPfkFwnhvO_Bw>
    <xme:BzA7YSViiFWeulQBz2cmin14az2z_2T4i4_EU4GMLM3F0JkxUrx9JTioDCAf-v4Nx
    w17OSDgBhtOUzbV1QY>
X-ME-Received: <xmr:BzA7YfJfu3ovOYD3M8L9eKbuda6TqnKQ5EIA8s-5Xjl1UiGHIfXFB4R2FHzXdLNQi1jA92A_OCP_xM1d_0IpjVhZ2HKjMnVXAqw7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BzA7YTGy9i1wL4DXIyPLvm-hezNHm3plQ_5qyJTReANsQxXLNyqfZw>
    <xmx:BzA7YTWpkTXpWwozJoXKRWXMMfBYucUYU5ZpAkqXRKADUniLdEq-4A>
    <xmx:BzA7YeNFzSDqbMf9HCV7Nixecl2yDVW2dezesniBIJuUVq3yM1oiiQ>
    <xmx:BzA7YSkgzzRD6Jax0Ie6vu92u8NUc9qpiPhz-iEAfNl1W1HWtPHPVXEB-Js>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:14:30 -0400 (EDT)
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
Subject: [PATCH v4 23/24] drm/kirin: dsi: Adjust probe order
Date:   Fri, 10 Sep 2021 12:12:17 +0200
Message-Id: <20210910101218.1632297-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Without proper care and an agreement between how DSI hosts and devices
drivers register their MIPI-DSI entities and potential components, we can
end up in a situation where the drivers can never probe.

Most drivers were taking evasive maneuvers to try to workaround this,
but not all of them were following the same conventions, resulting in
various incompatibilities between DSI hosts and devices.

Now that we have a sequence agreed upon and documented, let's convert
kirin to it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 27 +++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 952cfdb1961d..be20c2ffe798 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -720,10 +720,13 @@ static int dw_drm_encoder_init(struct device *dev,
 	return 0;
 }
 
+static const struct component_ops dsi_ops;
 static int dsi_host_attach(struct mipi_dsi_host *host,
 			   struct mipi_dsi_device *mdsi)
 {
 	struct dw_dsi *dsi = host_to_dsi(host);
+	struct device *dev = host->dev;
+	int ret;
 
 	if (mdsi->lanes < 1 || mdsi->lanes > 4) {
 		DRM_ERROR("dsi device params invalid\n");
@@ -734,13 +737,20 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = mdsi->format;
 	dsi->mode_flags = mdsi->mode_flags;
 
+	ret = component_add(dev, &dsi_ops);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
 static int dsi_host_detach(struct mipi_dsi_host *host,
 			   struct mipi_dsi_device *mdsi)
 {
-	/* do nothing */
+	struct device *dev = host->dev;
+
+	component_del(dev, &dsi_ops);
+
 	return 0;
 }
 
@@ -785,10 +795,6 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = dsi_host_init(dev, dsi);
-	if (ret)
-		return ret;
-
 	ret = dsi_bridge_init(drm_dev, dsi);
 	if (ret)
 		return ret;
@@ -859,12 +865,19 @@ static int dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	return component_add(&pdev->dev, &dsi_ops);
+	ret = dsi_host_init(&pdev->dev, dsi);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static int dsi_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &dsi_ops);
+	struct dsi_data *data = platform_get_drvdata(pdev);
+	struct dw_dsi *dsi = &data->dsi;
+
+	mipi_dsi_host_unregister(&dsi->host);
 
 	return 0;
 }
-- 
2.31.1

