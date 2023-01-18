Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125586716DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjARJAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjARI6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:58:48 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34577ABB
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:08 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id ss4so73993888ejb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z21qabX0zA0LOCrjyd5BOA9oMNili5LM3YkrVmBV2Eo=;
        b=miHFnkPBaZGBZf/Q+RwZ03zBxicSB0GC4It/AoIceWlaEUI3cB/wA8NvOSz78BmNR5
         R/BFzSoHyY7rSq5HDWmm8qXH7rSOihIbgusOus+AQSFdokZMIOM8fauF5pjGcXscgyCG
         yFf9eXa2FimHCNRBjYhLJ33HwHi0scOQcuWSKa5/Sc2I9JPEY2FxeFIAwABOL28SNWBP
         KvXK7ewf13f2QlTzY3kLLb3VywOZWmrOK2axqdSu5RnJ0J0K9HGVhG2pvAJpEXXNMCnc
         FlK/xF0bLFZLBzeatC5lsPaGfWZKOP+M9kUmDxbGHat+33jcnLX3pjwEDDhxk3xN7X9y
         ogFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z21qabX0zA0LOCrjyd5BOA9oMNili5LM3YkrVmBV2Eo=;
        b=oODB3fwPxXBXhL9Wg+WxJ5uRUP9EtrcL33FVQSczS/vtS8F1N+uLtF9CmXkObFVOwo
         /6DqGphjZqOQxhQEWDRUR9OJIYar7z9F+Kr+FfDw3SH/ybwu/GGPpDbMhRaIJ682g/+i
         WYnSiFZUs/rF3NpsX0yQY2gXDXjzbzTB4G6lfTyaeY3kKouZnRKIpFdQgwWSqhE7S4T1
         G6LlZploKnL8zkQgGKYMpmt5dRv54wILH3ojM0QgQlfIcM53QJPvJxPV5m8F7VVR/KAC
         uWqimQCWWhnCgbibnMzDDYfc2Ezaq6XI+53GQNGXfCDuUyWtCTpf189/GE6Z4VBmUzv8
         bovw==
X-Gm-Message-State: AFqh2kpvLMYQX1nNgaVX7VmZO+omjdlaVRvypsvAKmic6KWpKIOTAKrU
        evR3cGeDrau+Zdcg/gBuZHgYvA==
X-Google-Smtp-Source: AMrXdXv54Cd9vgBkUt9dwbHyzGs5tvEicxpFcmTNq4XN69Jnw66LcHPusI+mYcTMN6hVRR35tkYctA==
X-Received: by 2002:a17:907:8d16:b0:84d:43a0:7090 with SMTP id tc22-20020a1709078d1600b0084d43a07090mr6629133ejc.77.1674029826804;
        Wed, 18 Jan 2023 00:17:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:06 -0800 (PST)
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
Subject: [PATCH 06/13] drm/bridge: lt9611: pass a pointer to the of node
Date:   Wed, 18 Jan 2023 10:16:51 +0200
Message-Id: <20230118081658.2198520-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

