Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 418E16613E1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbjAHH0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbjAHH0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:01 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67501D0FA
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:25:59 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m6so8286149lfj.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aURTF4UTNK5+9lO/Hwf/8gndFQ6qOIZny88iB+hQmBk=;
        b=JQfLu38OzHhOGOpjHz6hL/thvfykYXwcXA/BrTqoxzOYKQi3haPoFARVyiugkivHoW
         +nOtE7nuFQew3yR5hqX/hW2GUQiK5S/ygrFFov2pP2yY+wetLO9tQ3b5oZ6b7v61n9RC
         AdtTjc6HexAqxkUKEyP1zUiMLQmoHW/ZQz2Z49HO+YHluJXWZrGfBuAeAC25u8CPsPYb
         i/6NItsEnxrr/jz1oL9VvY13JdWUwHHox1bDAE4XYJVh0LJH/LKYI0plp30z4nJBsdIA
         wRFIzn9aD++oJYTU0X7ilw/NAJfgZNYD6GtT+ExJxkfTIoEkg7xjgigpSjh/7O/YIZ9R
         sEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aURTF4UTNK5+9lO/Hwf/8gndFQ6qOIZny88iB+hQmBk=;
        b=r8wSPW/wNtcNRuoclNZijlS5ryuGn1CcXxUzG0fUBiO1Mb9MWpH/hq9uVhZJJigqjZ
         2e/ARTXFOnXeklIaFd7nVc4lFHaVa9woUT9XO/vyzA4uRHatWvMtlchwbIrOGjJPtWB0
         lul4MIWVEfZ0cruhbvxaw0TJHQlPOHU7DhjYRD314OucDell9X8oG4SPZ3vECENFug5E
         JrzONWmSTJJjfRUJSmH3USuLuWHVlLLUhx8fb/lIRG4h0SgH5A0w7ml6OMPLUaKW5T2s
         5BRKBxYNRYHNrITvJdL74nKN1UT9nBA/oPbcKgmfXfUwwVE3baZStDRqnByh+y1lmPSQ
         oXrw==
X-Gm-Message-State: AFqh2kqgnxQcrWOJaqavflKD7K32M6UGHHKzYe5g/PXvWBz1oZFcUTIn
        N9IhHFFRS3a+XcBniuyuaM26kw==
X-Google-Smtp-Source: AMrXdXtD1Ms6QHgJbyzw18g4gB+ZV+fLHCzDMEnc9sUT6uiMFlALRu+tVvuW2pgby722Jc3YGPZyEQ==
X-Received: by 2002:a05:6512:79:b0:4b5:43ef:a555 with SMTP id i25-20020a056512007900b004b543efa555mr16669900lfo.69.1673162758085;
        Sat, 07 Jan 2023 23:25:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:25:57 -0800 (PST)
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
Subject: [PATCH 02/12] drm/bridge: lt9611: fix HPD reenablement
Date:   Sun,  8 Jan 2023 09:25:45 +0200
Message-Id: <20230108072555.2905260-3-dmitry.baryshkov@linaro.org>
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

The driver will reset the bridge in the atomic_pre_enable(). However
this will also drop the HPD interrupt state. Instead of resetting the
bridge, properly wake it up. This fixes the HPD interrupt delivery after
the disable/enable cycle.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 2714184cc53f..58f39b279217 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -856,12 +856,18 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	static const struct reg_sequence reg_cfg[] = {
+		{ 0x8102, 0x12 },
+		{ 0x8123, 0x40 },
+		{ 0x8130, 0xea },
+		{ 0x8011, 0xfa },
+	};
 
 	if (!lt9611->sleep)
 		return;
 
-	lt9611_reset(lt9611);
-	regmap_write(lt9611->regmap, 0x80ee, 0x01);
+	regmap_multi_reg_write(lt9611->regmap,
+			       reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	lt9611->sleep = false;
 }
-- 
2.39.0

