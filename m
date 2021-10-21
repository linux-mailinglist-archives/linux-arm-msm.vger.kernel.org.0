Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFFF435C2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 09:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhJUHnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 03:43:40 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:33187 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231811AbhJUHnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 03:43:15 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 054392B01360;
        Thu, 21 Oct 2021 03:40:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 21 Oct 2021 03:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=aINb3yyNPEGy8
        1/IksR4f28ybF+VpRvrF3mAjvmMCck=; b=QQV2Mvx2KRkeTQPYhTlSUGsWBUPNJ
        SGTjldOlRPc2TNNwI4shLSorfsohptZkId8P0WAFON1rur7BCufxYcSr+Yxs2TyH
        dHfSgc7F2xSHK1ukDdUS7wJriLUqzgNvH/Y7Ie72a2q964AcjjDw8OaL2pEDMK42
        KLn4FyPElDg8gIQuETnhq/7Rsfllzl9VnZZ1vGJz5vzi5gorBpd0XZtuRRjb1P04
        OpzHLgkjxmr95OCc9GWvPqbhC1X7coy1VAXbzNF7hkrw18hjZbLHvc5F8r40MWMI
        dWKZ/T/mdDtzaL98HPpME0Wl8bDFahIDoW7G4rqWoPRuHcB4QkiSM8HSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=aINb3yyNPEGy81/IksR4f28ybF+VpRvrF3mAjvmMCck=; b=nNqTSuhb
        2J0GUp8g9neMvh6xfWrr2Ej3+PvHifgCQgNw66iDF6jY4a1I0DcL52vSt/0UhxdI
        fLaEpOQp2sHQlo3ivbcnoANpZ7eeO7yoQcYRskSaOtnOfcevt6FatrpbvXmknn8d
        sO9ZFYAJnYJdd0OV4utl73fdwAH0cUCifZREcG5kNis5jLHRZkDxL5uu4/VvoF7s
        m12Aqv9nn8QKeQt3Q2C4xC5ukgAKQY/KCps2AbqdoFJjXhITah22aR2UKqzjf8jK
        0k4g890ByL+bMSg7NwgXLEba+nY7armTcDzgfOXMn2pDEHY0OBG/aOp4+mQS/mDl
        kie0GOWMR3DTqw==
X-ME-Sender: <xms:iRlxYWlPeOO3bfLYWmT8QWCd6PPla-zhS-yJ8Es434y-hLYoV3Xfgg>
    <xme:iRlxYd1BVHwZ6cz6TXIQptLkbn1aDc93WF8qFUt4Wu03qIJsufX4sYMbRGGuvLagc
    RA4DMgTB179D20GSJw>
X-ME-Received: <xmr:iRlxYUrxKPgWK3OSy0nabUt24VIoZAPvv8cLc75IWSvaXgjpD52nlmq0uyzx17aCXhm0Dgrw7g8hNovs6CZx86XUH-tYiKuQpzoieDtm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
    heehvdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iRlxYamkUlNLV8RJtTuk9h_JC0eJCDNK8ZCwTttou-3g3_cjI715QQ>
    <xmx:iRlxYU22L1AbkLU8HQdzPJurRCQ4RXdB0o9_gnckMo70Dw13cMFv3A>
    <xmx:iRlxYRtp_FfTcBaf_NW6X73CTXhvL_lwCZjLctEacluIpFb7rYf4DA>
    <xmx:iRlxYbBj8fX7Ij6BLzMwEDm7eIMpZEBTZmRU86uMMVUE96MUX4XzBfoSnWU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:56 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tian Tao <tiantao6@hisilicon.com>,
        freedreno@lists.freedesktop.org,
        Chen Feng <puck.chen@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 14/21] drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers
Date:   Thu, 21 Oct 2021 09:39:40 +0200
Message-Id: <20211021073947.499373-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021073947.499373-1-maxime@cerno.tech>
References: <20211021073947.499373-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's switch to the new devm MIPI-DSI function to register and attach
our secondary device. This also avoids leaking the device when we detach
the bridge but don't remove its driver.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 3bfd07caf8d7..539edd2c19f5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -262,7 +262,7 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 		return -EPROBE_DEFER;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		return dev_err_probe(dev, PTR_ERR(dsi),
 				     "failed to create dsi device\n");
@@ -274,18 +274,14 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
 				 &ctx->bridge, flags);
-
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-	return ret;
 }
 
 static void sn65dsi83_detach(struct drm_bridge *bridge)
@@ -295,8 +291,6 @@ static void sn65dsi83_detach(struct drm_bridge *bridge)
 	if (!ctx->dsi)
 		return;
 
-	mipi_dsi_detach(ctx->dsi);
-	mipi_dsi_device_unregister(ctx->dsi);
 	ctx->dsi = NULL;
 }
 
-- 
2.31.1

