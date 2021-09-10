Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D284B406997
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 12:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhIJKOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 06:14:03 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:55911 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232303AbhIJKOB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 06:14:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id C43592B00945;
        Fri, 10 Sep 2021 06:12:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 10 Sep 2021 06:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=mPYAwqaA5A1+8
        vX0cCT56YjCJN3riLl5hfFxuO80Js4=; b=4HFmdcMDJwZK/SlLz0N8ap+PXvrFt
        nsRtlP8p0rl+MieyYkKGxFMm3qLvYvPGLghSdQaMskExVFFgF+KCQL4B5qL/1buq
        Y4WuEEGo/Qb490COVqbRR6dm91oGRROFVN1FFBIiW/5xDOjYxDt5+w6TU7ASTah9
        nzX5z1nEKuSLSVXJC9xWquwhbfvkZtDntg6gWKnb9Pdd6tWmmLhuM/75ihraQ3Ix
        2emTTP4xxPcETOLqxqmebwglibNNrgdpW1PK1NqfZaefqouDlIIvxRuxXr6BIHF/
        LAnBTX5Yx9fG5BMqkMEQn5ktDLA9gN+UtyYprwMOG9IUeyTNs+NQ2zlQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=mPYAwqaA5A1+8vX0cCT56YjCJN3riLl5hfFxuO80Js4=; b=HmS7HnO+
        /DOPZLLpi2BEnd/LqpStR3q2VpohqdZJgLd8808aXfMZaPBXn4Lx3QunOZPFuK9v
        deOOQhvikJ2ADgJo5un/lFHz+fp4FOYcSqdzsc5uiFE1H5BzCE0bYYmrVCHEc9bR
        L7DYCLGX4JlQXZSOnci3BUDE6PyesyFMeb4t2QV5pvVv5Fbk4ebIxH6OUS4NNGE9
        VqI3+kPVjoD0bnbFXaui4RpIiwgiCG5WTG0uM9Y8Q3H5QbXQVxRufG1UUB+In+mL
        haqnCnoX4DXUu4SCTUcqKktUXv8LtGsaktM9POZhJlS3WNtGX1PagfyJPTGAZeVR
        HTmzGawJ1Poq/Q==
X-ME-Sender: <xms:mS87YX2Hc750F3hee9oNaj2H26sTVPVRtWZBA20Y-pvGzkT-TeDQxQ>
    <xme:mS87YWEaHXgwGJ9JWzuVmkGdubiWSV-6yfH327Pcc6hxjQdShiwI-E_yWeJ1aRX-v
    yImzm_0GXavKkze_jc>
X-ME-Received: <xmr:mS87YX6547DlMairDYIWkbS1dFO6_MBw-mlFRW8gNr5e8V2we4QQNT84JvKq3PsPj388_2AG2RHM4ls6ijlaqGQY6-VIhGKCVRcK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mS87Yc2aqHKlwCh87t8I_DJjbYNxMqx0yJV0goJPh5hnj44GzHO5fg>
    <xmx:mS87YaHbHQS5nnP9C3iLVifJDxdT8lURjtwQVqsXYSEpcRPyM4OCgg>
    <xmx:mS87Yd_FWyumd3bquyPRHGHRnBqjdWXS-Y4K5oY92q-2G83T-s-VUQ>
    <xmx:my87YSVO6fzXMIhptyQ6lFvcF4ohak5nSI88Q3L4ZM8EQH4c97Yubnwsqdk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:12:40 -0400 (EDT)
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
Subject: [PATCH v4 03/24] drm/mipi-dsi: Create devm device registration
Date:   Fri, 10 Sep 2021 12:11:57 +0200
Message-Id: <20210910101218.1632297-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Devices that take their data through the MIPI-DSI bus but are controlled
through a secondary bus like I2C have to register a secondary device on
the MIPI-DSI bus through the mipi_dsi_device_register_full() function.

At removal or when an error occurs, that device needs to be removed
through a call to mipi_dsi_device_unregister().

Let's create a device-managed variant of the registration function that
will automatically unregister the device at unbind.

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 46 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  3 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 5dd475e82995..ddf67463eaa1 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -246,6 +246,52 @@ void mipi_dsi_device_unregister(struct mipi_dsi_device *dsi)
 }
 EXPORT_SYMBOL(mipi_dsi_device_unregister);
 
+static void devm_mipi_dsi_device_unregister(void *arg)
+{
+	struct mipi_dsi_device *dsi = arg;
+
+	mipi_dsi_device_unregister(dsi);
+}
+
+/**
+ * devm_mipi_dsi_device_register_full - create a managed MIPI DSI device
+ * @dev: device to tie the MIPI-DSI device lifetime to
+ * @host: DSI host to which this device is connected
+ * @info: pointer to template containing DSI device information
+ *
+ * Create a MIPI DSI device by using the device information provided by
+ * mipi_dsi_device_info template
+ *
+ * This is the managed version of mipi_dsi_device_register_full() which
+ * automatically calls mipi_dsi_device_unregister() when @dev is
+ * unbound.
+ *
+ * Returns:
+ * A pointer to the newly created MIPI DSI device, or, a pointer encoded
+ * with an error
+ */
+struct mipi_dsi_device *
+devm_mipi_dsi_device_register_full(struct device *dev,
+				   struct mipi_dsi_host *host,
+				   const struct mipi_dsi_device_info *info)
+{
+	struct mipi_dsi_device *dsi;
+	int ret;
+
+	dsi = mipi_dsi_device_register_full(host, info);
+	if (IS_ERR(dsi))
+		return dsi;
+
+	ret = devm_add_action_or_reset(dev,
+				       devm_mipi_dsi_device_unregister,
+				       dsi);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return dsi;
+}
+EXPORT_SYMBOL_GPL(devm_mipi_dsi_device_register_full);
+
 static DEFINE_MUTEX(host_lock);
 static LIST_HEAD(host_list);
 
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index af7ba8071eb0..d0032e435e08 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -227,6 +227,9 @@ struct mipi_dsi_device *
 mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 			      const struct mipi_dsi_device_info *info);
 void mipi_dsi_device_unregister(struct mipi_dsi_device *dsi);
+struct mipi_dsi_device *
+devm_mipi_dsi_device_register_full(struct device *dev, struct mipi_dsi_host *host,
+				   const struct mipi_dsi_device_info *info);
 struct mipi_dsi_device *of_find_mipi_dsi_device_by_node(struct device_node *np);
 int mipi_dsi_attach(struct mipi_dsi_device *dsi);
 int mipi_dsi_detach(struct mipi_dsi_device *dsi);
-- 
2.31.1

