Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8086616EA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbjAHQ5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233213AbjAHQ5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:05 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCC52727
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:57:03 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bt23so9496633lfb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
        b=au5mlBLngo5aQphj6Qo5sCvsVWk3KrTubxzRUEKvMm2OUTgpH26AdjgZemt3YxW8fm
         VsouXPpNz7Hyyjrp7CFOEqIJzfFvfst8AtVNf8e3PmfI8J/H6zoBM0HQrB4ImO8mtbjf
         WI7tvyCjRBWohgsNfRkG9jiwcelexz2eugv4vAtQL51of9SR5JChUjoCLiyzOOXdq4T1
         9M/pHYgjBSa2e5RrbJ+fZpd+q5aTKLbJqBmGAEvroA/Xko08nZf28p/TBvCfnW3o3iPf
         yFUHlucVkSezVVgqOoeSluDpK6rSYqm+v3nG2kKCLjQ3Pencj+rYLTV2zF/llVMgCSUm
         SCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
        b=vj6ShOZR+Wi/JPLu76aYXCkWFLzDUTDWtcCK6XdiRIzUFhGZ0IjxVknth4zmsW65DK
         QNSZUSFZmjHm0aJPNExC2fXKIZ6Sso7hE0m0OlqT2+E0eZFMj38VVHoojINnoX4vGpVW
         dcL6cgwRHf2KEzmEIXndzGaM4HlBxeAP9z5iIprb4isuqdzKnKcYVR2ghlha0oSjhF/4
         ggKb4L6sxUbtaTT93irp1wk67qqSsIZJ0h5b7BDXufQk2BmUlM5ya14V/o1BnV6jwvCm
         /ILxUafRMNkoi9Rkr/wHyha992Dz5HMWmkW7Nf2BwVDUcG/FsXUFDL3C9AVAUDqEGj2x
         ev9w==
X-Gm-Message-State: AFqh2kpZCGxxuD7dacYduJGC7MU9xzvnpAeHEsrOswo2Xo0PyzubLksO
        hIWQ/h6rD/skzx9Xlcw7ItSg6aSRXhJL4gsi
X-Google-Smtp-Source: AMrXdXs9tehp0AeUOGWV0u7MoShAVtbfl2A4h8VIPWPLu41zitPoXPnm0P+YDLpkJ2d9/trIymatIw==
X-Received: by 2002:a05:6512:22d3:b0:4b7:66:8231 with SMTP id g19-20020a05651222d300b004b700668231mr20113767lfu.58.1673197022219;
        Sun, 08 Jan 2023 08:57:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:57:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 06/13] drm/bridge: lt9611: pass a pointer to the of node
Date:   Sun,  8 Jan 2023 18:56:49 +0200
Message-Id: <20230108165656.136871-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pass a pointer to the OF node while registering lt9611 MIPI device.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index e2799a0df8f8..3b77238ca4af 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -769,7 +769,7 @@ static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
 static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 						 struct device_node *dsi_node)
 {
-	const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
+	const struct mipi_dsi_device_info info = { "lt9611", 0, lt9611->dev->of_node};
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
 	struct device *dev = lt9611->dev;
-- 
2.39.0

