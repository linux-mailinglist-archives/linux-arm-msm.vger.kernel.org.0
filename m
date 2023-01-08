Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB1D6613EE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjAHH0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbjAHH0H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:07 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701FE1D0FD
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:26:06 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id cf42so8343700lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqXevD+zn0cGW9m9k0kXGrlQ8TzoQsHyNoh291zM7dc=;
        b=sUnuEPXHH6fUG1s9exm7c9Pc0/RHn7HCRH9+vByolQJongJmtjaY0OKDvVdIOJ3AaE
         f80Y2XaALUaZ8zU8gmeXKfpPlRHMAHTDuRaYqDAtOICUbXm/0eltJDMuzxCmH4+12sLx
         Ml55dKG8sI5tpUYMphFKnCQMsEFpSe3G1Q8fS97iOgjSFKrcbNszx9V5W8V7VxoyXDAO
         abdIU29c5igez7JAcHKHvvOR/I8Y+T1dMvdBC1zzPV0dXN/pmUa+A/88y72JwnwaTlyS
         mKmlaJVtGBZVjdJ146spWlzO68xq880u/BX42kt22f2IDOXpc/UO5lGYckE7fM6jtc8F
         CcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqXevD+zn0cGW9m9k0kXGrlQ8TzoQsHyNoh291zM7dc=;
        b=Ge5oKXqK2LKteAZAc6OtjKNwmvYfeYWn9iWrZ6DZqw816oVqYUaKPTQJTLyKHka9Ih
         ewWsEp6FYHIjny2vrFuXfLA/o/UP2Z9PjXg9JIUfRcRCbRaml+QodoYJD0az17Czw/4N
         7tmicOW8qo8+CbtnyPF3DSK8cyAaIWeA+Mg2PUGw2UTMGLGxSgKd8D+FLyU/Vr6mwhKL
         AvmHNAHYq3ebi1U4gJLHO/apoiFuOOk3reph4QdU75ppiG5QcVolICLG7A86cHBuavSo
         oZO9TezJlVs75WS/cpmzT03+dba8eKrHymkMcrRlDxO8iARQFU3xe6I7RVgddfP2MJVi
         H9qA==
X-Gm-Message-State: AFqh2kphXLBOGJ6eT9RH0ZefMHJzIrfBQusWXhtf5hLzWSsoOm5ImQis
        12RdHDkbBr8F9OO8/ZWr+35xZA==
X-Google-Smtp-Source: AMrXdXvU9lFIeEcTQXT7xd+gdplEDWKgKjlA32HvtX6wcC3eFNBqxngXu52ZKNxAwgDKo4DEFXwH3w==
X-Received: by 2002:a05:6512:3901:b0:4a4:68b7:e71c with SMTP id a1-20020a056512390100b004a468b7e71cmr16493081lfu.6.1673162764842;
        Sat, 07 Jan 2023 23:26:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:26:04 -0800 (PST)
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
Subject: [PATCH 12/12] drm/bridge: lt9611: stop filtering modes via the table
Date:   Sun,  8 Jan 2023 09:25:55 +0200
Message-Id: <20230108072555.2905260-13-dmitry.baryshkov@linaro.org>
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

The lt9611 bridge can support different modes, it makes no sense to list
them in the table. Drop the table and check the number of interfaces
using the fixed value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 41 +++----------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 82af1f954cc6..5acee43f1547 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -84,24 +84,6 @@ static const struct regmap_config lt9611_regmap_config = {
 	.num_ranges = ARRAY_SIZE(lt9611_ranges),
 };
 
-struct lt9611_mode {
-	u16 hdisplay;
-	u16 vdisplay;
-	u8 vrefresh;
-	u8 lanes;
-	u8 intfs;
-};
-
-static struct lt9611_mode lt9611_modes[] = {
-	{ 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
-	{ 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
-	{ 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
-	{ 1920, 1080, 24, 3, 1 },
-	{ 720, 480, 60, 4, 1 },
-	{ 720, 576, 50, 2, 1 },
-	{ 640, 480, 60, 2, 1 },
-};
-
 static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct lt9611, bridge);
@@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct lt9611 *lt9611)
 	return 0;
 }
 
-static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
-		if (lt9611_modes[i].hdisplay == mode->hdisplay &&
-		    lt9611_modes[i].vdisplay == mode->vdisplay &&
-		    lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
-			return &lt9611_modes[i];
-		}
-	}
-
-	return NULL;
-}
-
 static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
@@ -832,12 +799,12 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_info *info,
 						     const struct drm_display_mode *mode)
 {
-	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	if (!lt9611_mode)
-		return MODE_BAD;
-	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
+	if (mode->hdisplay >= 3840 && drm_mode_vrefresh(mode) >= 31)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->hdisplay > 2000 && !lt9611->dsi1)
 		return MODE_PANEL;
 	else
 		return MODE_OK;
-- 
2.39.0

