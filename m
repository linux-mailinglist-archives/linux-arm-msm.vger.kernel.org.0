Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB6F5500B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383337AbiFQXYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236917AbiFQXYk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:24:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9039E6622C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:24:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id e4so6205975ljl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e45UG9mTlTJvPbiZWbY0ZYbiN8aB8KaEsAK9Yi9aKWU=;
        b=qSUG0lk3OoQ2cOPgN6PQc4jGVavTHVqq4u00LXAjSMmFKrF5QDWtkTU6pm2qnWsdJB
         /lK2RLjATzgI9VDLgQqxa4txNnKq5Du3M6PRCcNYBNTorZsToEIsRZWSuxV9tUeN+m/W
         cFBlo0VRTIv9cbh9+r9ATpMcVJTdNYezumpdXRvsEDI0VEyoec0vOPnqp3Yuu9d07V3A
         8gjRTi2qH1PvQ6Cy9RTIoDdgOuD9GjxThUUzgqCPmsTPMSR3zulHetn9qMMC7UF43CQs
         oSI1vig3ERY0EDyzSL98+qI4eLqXE3qW3Vg+e7eBvz9aJ75A4n3Lp1qDDF84UoE3De4b
         LGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e45UG9mTlTJvPbiZWbY0ZYbiN8aB8KaEsAK9Yi9aKWU=;
        b=7/F+A5Lx4Wt3wCr0iH8omlABUkJmYB6tgYCPhPrxo2fUsVGILYZrxgxNdbKrYOuN/U
         XKs9ekYjH1QvCK5LPF0X87NogNxRQH76pIFtCb54OCh8418tu3+fHW2DHvPihjP7m2/x
         rwJ7rwBAM1ZhL0XEx/DNV44TLRiwBHTJ5JxwsAlmYQlWVMgZYv3dAQuZEgIgip95te/3
         24KC6N4KLOTb2jO5opR3cOVW9q5xqrxjmXmVt5HbIbuGLCVsbXcR76lFeW6XAm7o/0Ha
         8ruQJZby00y+Rx6iyHxAaOM+3v4K3i74YXiooF1lVCZ+ODK7a6UDlc4cnS7DRmF6cQeL
         G1Sw==
X-Gm-Message-State: AJIora9bqxeqQqrn3cnBpK6QN+r6YrPqZysAkiI0s7i2UpCSB3bGp5HN
        iz4KPSGBvZQpaqZlR2/YSzgwcQ==
X-Google-Smtp-Source: AGRyM1sAbE/LZM8y3KLOdVfrC2vhIFcVXRKQL12NmosiqD2uFaZO7EUb106lmfkZr7u8XkIT1Uwe6Q==
X-Received: by 2002:a2e:9781:0:b0:24a:fb54:31d3 with SMTP id y1-20020a2e9781000000b0024afb5431d3mr6146842lji.242.1655508277901;
        Fri, 17 Jun 2022 16:24:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a7-20020a194f47000000b00478f9517a60sm802742lfk.38.2022.06.17.16.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:24:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/dp: remove dp_display_en/disable prototypes and data argument
Date:   Sat, 18 Jun 2022 02:24:34 +0300
Message-Id: <20220617232434.1139950-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
References: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
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
Changes since v1:
- Rebased and dropped the dp_display_enable() chunk
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 96defacc92dc..c17a799d3009 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -608,9 +608,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, bool force_link_train);
-static int dp_display_disable(struct dp_display_private *dp, u32 data);
-
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 		bool plugged)
 {
@@ -894,7 +891,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp, u32 data)
+static int dp_display_disable(struct dp_display_private *dp)
 {
 	struct msm_dp *dp_display = &dp->dp_display;
 
@@ -1676,7 +1673,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display, 0);
+		dp_display_disable(dp_display);
 	}
 
 	/* completed connection */
@@ -1717,7 +1714,7 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
-	dp_display_disable(dp_display, 0);
+	dp_display_disable(dp_display);
 
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-- 
2.35.1

