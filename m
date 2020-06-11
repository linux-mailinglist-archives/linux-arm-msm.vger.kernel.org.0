Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6051F6484
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 11:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgFKJTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 05:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgFKJTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 05:19:22 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A80C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:22 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e9so2289258pgo.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LW44zHswuAYzMuilY+dT0iFunj9t8FpqpYAnSBU99cI=;
        b=CFz5N+QkeTGM4yda1nZnVC/ZMFmlXu+582R7ZVaux3GM4qfTIHjpZ6lDIshR9XLmBG
         vrxjmH2FQaN+MSwnSVQv+Kk/i4JhjLZCtg3A2JwvLJinbI9/xsNgcu59R1rYkfcB9QOU
         R1BQ3iYxPRKv/rNzpUhWu3KSivFr3KXXWer8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LW44zHswuAYzMuilY+dT0iFunj9t8FpqpYAnSBU99cI=;
        b=i9PyOuV8XGbLauy6YLjtBdeKNrD9hV8A2OfjUTMgQ3O/ybJPd14f0X0cMh14xKsqAi
         292PKY6Wxi704lcmueIF7vZG3uce2TspHHetWGrBjgkESe0WE3WSzaFOjvLGmhbiZLPf
         5up36ZuKEEZsE5MxmnsJbY2bg7N2X55Jua8ydIUc/GeuXbfvxPaa55hSS0ctumUKZVry
         6okto2t3G/nt+ml64dpB4uVyw2J1DD3p5PRPfUKh5fnf8R3VPx86ELQuM23mCVQl7p48
         jtep1JL6BaaID7y8QusNTeqcqCvf30J36mkxD+UOer499NeaVop9MBXbOyIU+BIOwYVf
         9/xg==
X-Gm-Message-State: AOAM530wDhN3IjLAiea77I48DijEUqPmkZCRfnhCPvylL0wy8DYDqzHF
        hthiyyt2B7E4mmWkjur2cYbEtQ==
X-Google-Smtp-Source: ABdhPJwPgVX/ocYKCdK6XF7rzt3W9lsXQBrRED0+FZWohspwIYG3N1BAVn1AUhU5q+HbySEnHPQwvA==
X-Received: by 2002:a65:614b:: with SMTP id o11mr5971151pgv.443.1591867162069;
        Thu, 11 Jun 2020 02:19:22 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 1sm2367852pfx.210.2020.06.11.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 02:19:21 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>
Subject: [PATCH/RFC 1/8] phy: qcom-qmp: Move phy mode into struct qmp_phy
Date:   Thu, 11 Jun 2020 02:19:12 -0700
Message-Id: <20200611091919.108018-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200611091919.108018-1-swboyd@chromium.org>
References: <20200611091919.108018-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The phy mode pertains to the phy itself, i.e. 'struct qmp_phy', not the
wrapper, i.e. 'struct qcom_qmp'. Move the phy mode into the phy
structure to more accurately reflect what is going on. This also cleans
up 'struct qcom_qmp' so that it can eventually be the place where qmp
wrapper wide data is located, paving the way for the USB3+DP combo phy.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index d9d3e2fd4b53..fa8faa2d3d69 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1350,6 +1350,7 @@ struct qmp_phy_cfg {
  * @index: lane index
  * @qmp: QMP phy to which this lane belongs
  * @lane_rst: lane's reset controller
+ * @mode: current PHY mode
  */
 struct qmp_phy {
 	struct phy *phy;
@@ -1363,6 +1364,7 @@ struct qmp_phy {
 	unsigned int index;
 	struct qcom_qmp *qmp;
 	struct reset_control *lane_rst;
+	enum phy_mode mode;
 };
 
 /**
@@ -1381,7 +1383,6 @@ struct qmp_phy {
  * @phy_mutex: mutex lock for PHY common block initialization
  * @init_count: phy common block initialization count
  * @phy_initialized: indicate if PHY has been initialized
- * @mode: current PHY mode
  * @ufs_reset: optional UFS PHY reset handle
  */
 struct qcom_qmp {
@@ -1399,7 +1400,6 @@ struct qcom_qmp {
 	struct mutex phy_mutex;
 	int init_count;
 	bool phy_initialized;
-	enum phy_mode mode;
 
 	struct reset_control *ufs_reset;
 };
@@ -2161,9 +2161,8 @@ static int qcom_qmp_phy_set_mode(struct phy *phy,
 				 enum phy_mode mode, int submode)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	struct qcom_qmp *qmp = qphy->qmp;
 
-	qmp->mode = mode;
+	qphy->mode = mode;
 
 	return 0;
 }
@@ -2176,8 +2175,8 @@ static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
 	void __iomem *pcs_misc = qphy->pcs_misc;
 	u32 intr_mask;
 
-	if (qmp->mode == PHY_MODE_USB_HOST_SS ||
-	    qmp->mode == PHY_MODE_USB_DEVICE_SS)
+	if (qphy->mode == PHY_MODE_USB_HOST_SS ||
+	    qphy->mode == PHY_MODE_USB_DEVICE_SS)
 		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
 	else
 		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
@@ -2223,7 +2222,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 	struct qmp_phy *qphy = qmp->phys[0];
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qphy->mode);
 
 	/* Supported only for USB3 PHY */
 	if (cfg->type != PHY_TYPE_USB3)
@@ -2249,7 +2248,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	int ret = 0;
 
-	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qphy->mode);
 
 	/* Supported only for USB3 PHY */
 	if (cfg->type != PHY_TYPE_USB3)
-- 
Sent by a computer, using git, on the internet

