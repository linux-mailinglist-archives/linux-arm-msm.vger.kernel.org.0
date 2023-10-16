Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209B27CB0A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 18:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbjJPQ4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 12:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234457AbjJPQ4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 12:56:41 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8053845
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:12 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4066241289bso49055605e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697475250; x=1698080050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDlsbj0O4m938XJJJjIOKHw+A0HfBTEQDaR3qGbI7EM=;
        b=ebRdFCkTp69mnesA4vlUP9qPwXgAjbDp4ttEGNZADsJK35BzSGJpjHDA6dB6/IbUl8
         3B7tBYYoe3uS+wQIHeyXN0EcdR2sFJU1cxV7sX21nhk+riZphRYMr200XHEkeeu3Axzx
         iDFVhkIm0Uh3t9bbBnWA4B+shgKFsONE1jjTmn2k2L5m7N37dSOej+B94a1noOPIEoNG
         PnoG3QjLrsw5OPp7qdnMGQGgmgelvKtvYAohwU3ggc2wsCTh11IsDutMQQJBFHXM42kL
         0rMDZ4yF5V23jfH4u+pLiaNGgIvbZZC9uWDtk31IenfRM8rqhR7j1cyc2gsA22XKqQOp
         OCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475250; x=1698080050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDlsbj0O4m938XJJJjIOKHw+A0HfBTEQDaR3qGbI7EM=;
        b=qhY5SL8eFI58daHFakmPZbgG+WVPWqoTeu5z+F1hjJIi+MoD1snG5fUlmwFcXB0vZD
         XkB2kI0J5xWKX8HacEKJMzQbVBDjA73eVLmygbpk/qh4XwRCGaesQluKvb5sbDcpI1j5
         E8kemljfuG0Ba5io+7AHYe7wxYvDbqAA4UJtutceektjIVTWPYHnD9kBY8lfBCIgZS+2
         os6/dMEyH68gywR3mK8GiQpe/EFL7CtBXiwcVSI8EIvAqtXb73AIW/S+Unfg8uMS5ghl
         AX2hivm1qzytKxgtrkkW1oTGviC0PhKrxor+3TGRNoKZQZORe739zLIVh59h76ttvXGD
         wefA==
X-Gm-Message-State: AOJu0YwEja1IgdYr+AdzYPkx449oEHNqJ/PJUCtrxHPNMBdok0u3JeUq
        mQAX3WnTEyTKmv+Rs1CR/E82oA==
X-Google-Smtp-Source: AGHT+IHo4VTLj6QFSkMq4vzDZuAnsr0A18LuIJLePvTKSU99Hb1c9SVuY4KiSXHIr1fuYLLcUJPY5Q==
X-Received: by 2002:a7b:c7d7:0:b0:3fd:2e89:31bd with SMTP id z23-20020a7bc7d7000000b003fd2e8931bdmr30618680wmk.14.1697475250508;
        Mon, 16 Oct 2023 09:54:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
        by smtp.gmail.com with ESMTPSA id s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:54:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 07/10] drm/bridge: ps8640: require manual DSI power control
Date:   Mon, 16 Oct 2023 19:53:52 +0300
Message-ID: <20231016165355.1327217-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Parade PS8640 bridge will fail to start if the DSI link is enabled
when the bridge is being reset / powered up (even to the LP-11 state).
To ensure that the DSI link is powered down, require manual control over
the DSI link state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8161b1a1a4b1..6c5daaa70cb7 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -458,6 +458,10 @@ static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
 
 	ps8640_bridge_vdo_control(ps_bridge, ENABLE);
 
+	ret = mipi_dsi_host_power_up(ps_bridge->dsi->host);
+	if (ret < 0)
+		dev_warn(dev, "failed to power up DSI host: %d\n", ret);
+
 	ps_bridge->pre_enabled = true;
 }
 
@@ -468,6 +472,8 @@ static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
 
 	ps_bridge->pre_enabled = false;
 
+	mipi_dsi_host_power_down(ps_bridge->dsi->host);
+
 	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
 	pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
 }
@@ -562,6 +568,11 @@ static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps
 	if (!host)
 		return -EPROBE_DEFER;
 
+	if (!mipi_dsi_host_power_control_available(host)) {
+		dev_err(dev, "MIPI DSI host doesn't provide tight power control\n");
+		return -ENODEV;
+	}
+
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(dev, "failed to create dsi device\n");
@@ -572,7 +583,8 @@ static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps
 
 	dsi->host = host;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
-			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			  MIPI_DSI_MANUAL_POWERUP;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
 
-- 
2.42.0

