Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67BB16613E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbjAHH0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbjAHH0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:03 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690CD1D0F8
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:26:02 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bt23so8287576lfb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
        b=ZQe4KJDz4ptondq++o4ifOMaqWPCx8dqCv/EBBlz1pUl/CXtvA4TVX8b58inFkMQiV
         xEZ9J7W59nw4Bu2UyLe2zLEi2I4z9P8ZPbDPxZRkK2GYhlvAHEyMN3Pu5KQzvVU3BPij
         uEj0Ly0EsuBhuZTNgn3t4mpN0wjiOF7FFXcSPIWYCZg/7ulPBpURZQ3E9yeI3VCl00mN
         c9gXxbbphvs1VvE5wKr9/I5/4EAsXNN/jOCphCbCz7LMk2Lsje2QV3J90eYRoalzIiYZ
         m/O2Ep73ZXqCpT8hpsHniyWPnxydCYam29Oaptph5/qHOAyovtY6VZv4ErIFIuy73qWI
         Kibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
        b=lLjyX4m5rP/mm0Q0mMipNxq6HKFikJQVoH43+GvHS4iWOpOfxglwdZYR7P/8GyUoUS
         H4Z5P5tKZWmO0+jkcKBnv3irKMe2TAhy1Bm7BP53cJYyvzAnNBUkLRSasymBiksUvMUE
         avYA10ACaROnoBd3r6FGoFF31W7Ld7qDMqCwacf3QagAJxXfh7PHn0BfgIJRuAj3zi18
         LTbpeO8yvHEncQ2GSMPRytfr94PIqhIg2AOas3t1/6/xEUcvolSasNKXp/RybdUga4y7
         9A0ohsFLIHpX2eTetzwSnFcBJCyx12APznKrO9RTcrGCKrdiuOCI/29XpR5695ewVUnJ
         YPng==
X-Gm-Message-State: AFqh2koFOFloLnIljaM1OX5DhdyBpBQo+K4derIdHNtZC/Win1CJHLIU
        LkPH7LU3Wz8NYZpfCGAw/3y0cw==
X-Google-Smtp-Source: AMrXdXvFBev112O5sYS91DrRbcayDdq+LFoKfun7pxSfD9QGpC6eQaXo2u/E+mSxzuZpeSXR1YNORg==
X-Received: by 2002:ac2:446b:0:b0:4a4:68b9:66cf with SMTP id y11-20020ac2446b000000b004a468b966cfmr15491687lfl.26.1673162760795;
        Sat, 07 Jan 2023 23:26:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:26:00 -0800 (PST)
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
Subject: [PATCH 06/12] drm/bridge: lt9611: pass a pointer to the of node
Date:   Sun,  8 Jan 2023 09:25:49 +0200
Message-Id: <20230108072555.2905260-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
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

