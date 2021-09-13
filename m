Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D44D409B89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 19:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345122AbhIMSAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 14:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344413AbhIMSAI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 14:00:08 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D19C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:52 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d11so8893259qtw.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+dSXnhdzjFJXzK51Dmd0hgv8CXCybvAs8AQlMSj0u8Q=;
        b=fd2rUMyFHZ4NlcUEDCMONElMpKRc8TTBfmbo0mL8y/rMv8e6hQBsevVu+s+y2VY7Io
         6kArj9gXsa6hY7t8w8k8nnqiCY6JtwPKyX472lRTizZc+ZJ+D4igrYGx9/jpsDGWscn2
         zbfaEWONF2r1WhqCW5XnT42+f6ZLu5XWnzOXpvDvWJFVdCgg24quHwqFNJOjM5AZQeeg
         G9y0ptvV8VUVpK12Ohpwq1UoTs605h42eA+CGkQ/5JRNrvcR3OIxXU4qJ05rxZE+b45G
         O31qKxIkoR+rymb08PSSSi0a7p8+mkF34OLw/lPl/V4ekjQQX+wdiSU5bOV0Twe/Ufsw
         i5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+dSXnhdzjFJXzK51Dmd0hgv8CXCybvAs8AQlMSj0u8Q=;
        b=2UL9tB6Jk0KDnoVbKizx+Ye+nE5oTnoj09EiHzC0YRAmHVqve5oJ4KTL1Re3LFL5tG
         /HH5AowJSq3IL+jWCZk+0qhVTjfNQIWIACljqOqQ2NP7u7fcpF+5q/ju8NGyjZbCe8Wu
         AkgdtrpAvBmezXEtFvbI8XvmYzF+WRYe5ObuZNHiyVbT9lJM2nMJW9RxZF5TVqDDkC2O
         DmgOdX838flUF4iPD5tmu+LvTM+E9ST1GD8tHUOQIEKmmuQSK1cvrQTT59LKPgHoUdnH
         2DQwa/dKOfv4ygaOMVfyKP1sLqrVqtXKG5T6xPS6o0RN2YoTYSriZSMAsrokXZMUMEs9
         os3w==
X-Gm-Message-State: AOAM533mRJIanUoFs+tTWeihAASbUA5uQYRnq1HcQVPv1hXnWyMIGFsn
        C3r2+WgSQFxB8FO6rMOal62dgQ==
X-Google-Smtp-Source: ABdhPJxyiQcEQoeEl1UqeR8DNMSgLD1602n6j8KYhmuj6B8esO/hM6jJ9/uxYF9ilMRCSDcKK/2opA==
X-Received: by 2002:ac8:5a86:: with SMTP id c6mr759716qtc.171.1631555931619;
        Mon, 13 Sep 2021 10:58:51 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id h2sm6096937qkf.106.2021.09.13.10.58.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 10:58:51 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 13/14] drm/msm: Add hdcp register ranges to sc7180 device tree
Date:   Mon, 13 Sep 2021 13:57:44 -0400
Message-Id: <20210913175747.47456-14-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This patch adds the register ranges required for HDCP to the sc7180
device tree. These registers will be used to inject HDCP key as well as
toggle HDCP on and off.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 30 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_parser.h |  4 ++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3ac3c3..4bbe2485ce3c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -20,11 +20,19 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
 };
 
 static int msm_dss_ioremap(struct platform_device *pdev,
-				struct dss_io_data *io_data)
+				struct dss_io_data *io_data, const char *name,
+				int fallback_idx)
 {
 	struct resource *res = NULL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+
+	/* Support dts which do not have named resources */
+	if (!res) {
+		if (fallback_idx >= 0)
+			res = platform_get_resource(pdev, IORESOURCE_MEM,
+						    fallback_idx);
+	}
 	if (!res) {
 		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
 			__builtin_return_address(0), __func__);
@@ -55,6 +63,8 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
 {
 	struct dp_io *io = &parser->io;
 
+	msm_dss_iounmap(&io->hdcp_tz);
+	msm_dss_iounmap(&io->hdcp_key);
 	msm_dss_iounmap(&io->dp_controller);
 }
 
@@ -64,12 +74,26 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	struct platform_device *pdev = parser->pdev;
 	struct dp_io *io = &parser->io;
 
-	rc = msm_dss_ioremap(pdev, &io->dp_controller);
+	rc = msm_dss_ioremap(pdev, &io->dp_controller, "dp_controller", 0);
 	if (rc) {
 		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
 		goto err;
 	}
 
+	rc = msm_dss_ioremap(pdev, &io->hdcp_key, "hdcp_key", -1);
+	if (rc) {
+		DRM_INFO("unable to remap dp hdcp resources, rc=%d\n", rc);
+		io->hdcp_key.base = NULL;
+		io->hdcp_key.len = 0;
+	}
+
+	rc = msm_dss_ioremap(pdev, &io->hdcp_tz, "hdcp_tz", -1);
+	if (rc) {
+		DRM_INFO("unable to remap dp hdcp resources, rc=%d\n", rc);
+		io->hdcp_tz.base = NULL;
+		io->hdcp_tz.len = 0;
+	}
+
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy)) {
 		rc = PTR_ERR(io->phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 34b49628bbaf..09d876620175 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -62,10 +62,14 @@ struct dp_display_data {
  * struct dp_ctrl_resource - controller's IO related data
  *
  * @dp_controller: Display Port controller mapped memory address
+ * @hdcp_key: mapped memory for HDCP key ingestion
+ * @hdcp_tz: mapped memory for HDCP TZ interaction
  * @phy_io: phy's mapped memory address
  */
 struct dp_io {
 	struct dss_io_data dp_controller;
+	struct dss_io_data hdcp_key;
+	struct dss_io_data hdcp_tz;
 	struct phy *phy;
 	union phy_configure_opts phy_opts;
 };
-- 
Sean Paul, Software Engineer, Google / Chromium OS

