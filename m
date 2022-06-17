Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79BE54FDDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 21:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbiFQTtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 15:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbiFQTtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 15:49:31 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1273135B
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:49:25 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c2so8441308lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSnYvcOuCiamnP9Z5uioqN+dnNbuGPozK0YcZA0yw7k=;
        b=O/L/3n1L4LiDtAaNQwitcfon+MtLonwl235pPq+SHbqRU5FO/IIftavNfH4qij99f0
         H57NflJWuDwG7bl0n16yfRM6TWlPnejy4z21nIBznJgwxEMGVq1WNsGYiX99BwgJHwyN
         OScWjDH/2ZJTOUpSvtf05wR3JQdJE+Vj/IlV7O0woIFvL5MNkz0mzPO914lMpSqYXUTv
         l8Kxi1/Aygjqwyxa1iHHvQNquigUqTSm1Szq97TAWfQ79jBL2VaBQnixenHE7iCEUwGF
         ooqQJygHkb2M4H1/9CRxNQTwMwOaRtakYsls3DOWi/KgxaZ+utt7IZyvdkicDpQWrPcp
         Zqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSnYvcOuCiamnP9Z5uioqN+dnNbuGPozK0YcZA0yw7k=;
        b=NqHU7GljXnS+FgS0mSaoKHVucMENWjAlxVwkSRxndoAefh0ejFExVvwDktAyNfGrVT
         7k2d4D7sIf+0xfYbJPr1CThltPTZ1eK15fDGJvBiqMcQ8Wfeyk/G6I7/TcLCX9ydY2fY
         5xyGmeMl3jwnefp+/rtNFiwZmxSYqi+GxLtiKajKB5oZlNLM/myTVPutVnsmx4bPehxx
         jHrGQw0WPZI9TYBXyrhCZbAO3d/Th2Pl0PceCu26WFu9dePjAQbinPH1gb3P4I1D5+Sa
         5TNlTMhnOQ91TQf5OYg4lSq++mYEz9mNesDOws7o8lukPuwjICg3QIg4nABp/aHiOlld
         iZIg==
X-Gm-Message-State: AJIora/WwZfMyRA8ynUFUvOTob1UPgZqzRGCoxqKDKKJRVi4i7QKjs+w
        9QoxIrzJqLGFTg/zRarKvutL0g==
X-Google-Smtp-Source: AGRyM1tPjB5/2OmOaXLxaLnLZSh/Doi8HeyHN4bAnQLWHQTTzWYTZwD7MFV9tZasuL1AvlniMnRgBA==
X-Received: by 2002:ac2:5ec8:0:b0:47d:af0b:d631 with SMTP id d8-20020ac25ec8000000b0047daf0bd631mr6443929lfq.170.1655495364105;
        Fri, 17 Jun 2022 12:49:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.60])
        by smtp.gmail.com with ESMTPSA id p12-20020a056512328c00b0047255d211bbsm738987lfe.234.2022.06.17.12.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 12:49:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dp: remove dp_display_en/disable prototypes and data argument
Date:   Fri, 17 Jun 2022 22:49:21 +0300
Message-Id: <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove unused dp_display_en/disable prototypes. While we are at it,
remove extra 'data' argument that is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1e34ac2126f6..42ceb4c5796c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -607,9 +607,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data);
-static int dp_display_disable(struct dp_display_private *dp, u32 data);
-
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 		bool plugged)
 {
@@ -856,7 +853,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data)
+static int dp_display_enable(struct dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *dp_display = &dp->dp_display;
@@ -893,7 +890,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp, u32 data)
+static int dp_display_disable(struct dp_display_private *dp)
 {
 	struct msm_dp *dp_display = &dp->dp_display;
 
@@ -1667,12 +1664,12 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (state == ST_DISPLAY_OFF)
 		dp_display_host_phy_init(dp_display);
 
-	dp_display_enable(dp_display, 0);
+	dp_display_enable(dp_display);
 
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display, 0);
+		dp_display_disable(dp_display);
 	}
 
 	/* manual kick off plug event to train link */
@@ -1717,7 +1714,7 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
-	dp_display_disable(dp_display, 0);
+	dp_display_disable(dp_display);
 
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-- 
2.35.1

