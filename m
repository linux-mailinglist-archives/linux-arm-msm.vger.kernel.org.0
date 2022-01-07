Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F117487008
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 03:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344467AbiAGCBn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 21:01:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344448AbiAGCBm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 21:01:42 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D324C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 18:01:42 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id h2so10227115lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 18:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OHbsyEqfteS19OgRRcOzHQJayCE7Kspad11GnKSJ9XY=;
        b=XSClUiDypO5YErliO//FA6YKgZb1nKZcX4VYG3rMZJ39C3UsrGP+GpaRA6Z6h2qM+v
         GIbLcKHSdf5qY+XBsm0rkxj44+wzTQbt0vwSKBH/5DPNzRVzKVIx3ePwCND5L+txbZCg
         tSc+0sSjh2zNu8nDsdElL4GeIXixf9Ewlg8lXNB8riuFuRUR8cPIfWXKKNr5DmZs8Eud
         cJBO8Ev3OU2uHU0690cM92iFddrIMJx9SrPFqAKKx6N/Q+xv3TkTlIaF2gXWgSCy+Bq8
         YuR8JTWcVb5ZGRstoDj8m0YKFILxR8lVSBIybfVjWLWQozpK85LuFqMKhZYqM03OZh9K
         0Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHbsyEqfteS19OgRRcOzHQJayCE7Kspad11GnKSJ9XY=;
        b=M6p4Oc7u4QvbQS/WLCs62CMPaGGyaVxX0UJmpSK+OJC84FZ1aGlIjdZCPnqc7cLfsT
         wzz0AE5mCg2FQC/ZhwvfB3lKZtG5TnTSsdvng0xGX2+OB/vs2fmxfWnaA9dc+TooFqIO
         T7vCNyMCfh9/vkRxc0hW7e/gp4gr52SGf1krQe9Icxc3LrkMPCksD+d+0ypAQZjRz5u7
         DFzsD/4Rq/Sv2UnDztKBZz1ZFxaz6iRj1shvl1iRW53CRapGSRS3lqp5WfjYCDxwNqM1
         AHwdZ48es6IyfO6VNkD0mKf8wR85CqcM1oU/jdeWVRzCGBU+UkHernt7DRfpo+XQ2xno
         WQkg==
X-Gm-Message-State: AOAM531RM8oXktPjEMUllbVUuMEc8cn+3e11V8IOLIZei17E4zLdgP19
        FSqv9Wc4p2TzqvcT8eEwYFH+cQ==
X-Google-Smtp-Source: ABdhPJxWuoABGW1szvhXbVPJleMmIshIUx7TC2kgz2wI6G4TwBcxecCnri+QDRzjYAmY8GBjTv7t6w==
X-Received: by 2002:a05:6512:2149:: with SMTP id s9mr53882517lfr.96.1641520900476;
        Thu, 06 Jan 2022 18:01:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:01:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH 6/7] drm/msm/dp: remove dp_display_en/disable prototypes and data argument
Date:   Fri,  7 Jan 2022 05:01:31 +0300
Message-Id: <20220107020132.587811-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index e63d6056e39d..720e80ea99cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -559,9 +559,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data);
-static int dp_display_disable(struct dp_display_private *dp, u32 data);
-
 static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 {
 	u32 state;
@@ -841,7 +838,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data)
+static int dp_display_enable(struct dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *dp_display = &dp->dp_display;
@@ -878,7 +875,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp, u32 data)
+static int dp_display_disable(struct dp_display_private *dp)
 {
 	struct msm_dp *dp_display = &dp->dp_display;
 
@@ -1548,12 +1545,12 @@ static void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (state == ST_DISPLAY_OFF)
 		dp_display_host_init(dp_display, true);
 
-	dp_display_enable(dp_display, 0);
+	dp_display_enable(dp_display);
 
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display, 0);
+		dp_display_disable(dp_display);
 	}
 
 	/* manual kick off plug event to train link */
@@ -1591,7 +1588,7 @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
-	dp_display_disable(dp_display, 0);
+	dp_display_disable(dp_display);
 
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-- 
2.34.1

