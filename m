Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C5125259C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 04:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgHZCsR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 22:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgHZCrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 22:47:19 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C29C061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 19:47:19 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k13so194258plk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PYGWCSTwJhvFWjkJL5bmMKN2P6gpWXjSaK/EHq+OFls=;
        b=gmZuxiFZ/L09TxqfY65i+tEt1wI6DfK0zatd4VvKz6oN+zEu8gGwjYcittr2sr4jrq
         i3K3HQkpthnCsSOz6lc1yuwXlNqxT/gjtCS5LfBzbe+/XYnQ3b78fMYcRCV6vjeClAoB
         wh4XkuYhjVW8Brt17IZ7antwwHwmcEfqNATSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PYGWCSTwJhvFWjkJL5bmMKN2P6gpWXjSaK/EHq+OFls=;
        b=TNFDfBnL+8XjYss/l34gb/Ww/NmojfitGaWcPdmEv85AKTOZqeythZxNDAaAvkhauY
         qEhdDJKbnA6G4xpAKpl20g9eO7pXTFqc6qvykNh6wOsdaxglU0Zo2lHBRettRjZvDGxL
         tZBtJs2TuiwHBY6pY7g+5aKd7oBbbZSKfnu713v2zdHfTGJvCOBwrkH7bQDMESNRGy6B
         AbmHoB05hE5Wwpkk3b09K0Aawlo5YotLyaPPQg2At807yOKVVq2t6u99hbkNUiYXndCH
         gLUjxIxNc66XF31BVcd7NwfzX7ED1Uh5mD3w1OY1s3rl1mfUfbHJhs2yFRkAkPf/2AY2
         muRA==
X-Gm-Message-State: AOAM530cRsIq/+v4VBJnSqwHNe/EjZDp7lUWgW5YDwiyScmQow+tb2M5
        jJjpGBpg/3YWAbKvauu366INYg==
X-Google-Smtp-Source: ABdhPJxSm++7q5yzP7pW+068nqYQ1OFNov+TEjg86LYZ+iq6sZqNsYbOUX4NAuujySrdnWJo/h3OWQ==
X-Received: by 2002:a17:902:900a:: with SMTP id a10mr9995410plp.203.1598410035953;
        Tue, 25 Aug 2020 19:47:15 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u65sm684381pfb.102.2020.08.25.19.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 19:47:15 -0700 (PDT)
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
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH v1 2/9] phy: qcom-qmp: Move phy mode into struct qmp_phy
Date:   Tue, 25 Aug 2020 19:47:04 -0700
Message-Id: <20200826024711.220080-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200826024711.220080-1-swboyd@chromium.org>
References: <20200826024711.220080-1-swboyd@chromium.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 562053ce9455..7ee9e966dc6d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1812,6 +1812,7 @@ struct qmp_phy_cfg {
  * @index: lane index
  * @qmp: QMP phy to which this lane belongs
  * @lane_rst: lane's reset controller
+ * @mode: current PHY mode
  */
 struct qmp_phy {
 	struct phy *phy;
@@ -1825,6 +1826,7 @@ struct qmp_phy {
 	unsigned int index;
 	struct qcom_qmp *qmp;
 	struct reset_control *lane_rst;
+	enum phy_mode mode;
 };
 
 /**
@@ -1843,7 +1845,6 @@ struct qmp_phy {
  * @phy_mutex: mutex lock for PHY common block initialization
  * @init_count: phy common block initialization count
  * @phy_initialized: indicate if PHY has been initialized
- * @mode: current PHY mode
  * @ufs_reset: optional UFS PHY reset handle
  */
 struct qcom_qmp {
@@ -1861,7 +1862,6 @@ struct qcom_qmp {
 	struct mutex phy_mutex;
 	int init_count;
 	bool phy_initialized;
-	enum phy_mode mode;
 
 	struct reset_control *ufs_reset;
 };
@@ -2801,9 +2801,8 @@ static int qcom_qmp_phy_set_mode(struct phy *phy,
 				 enum phy_mode mode, int submode)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	struct qcom_qmp *qmp = qphy->qmp;
 
-	qmp->mode = mode;
+	qphy->mode = mode;
 
 	return 0;
 }
@@ -2816,8 +2815,8 @@ static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
 	void __iomem *pcs_misc = qphy->pcs_misc;
 	u32 intr_mask;
 
-	if (qmp->mode == PHY_MODE_USB_HOST_SS ||
-	    qmp->mode == PHY_MODE_USB_DEVICE_SS)
+	if (qphy->mode == PHY_MODE_USB_HOST_SS ||
+	    qphy->mode == PHY_MODE_USB_DEVICE_SS)
 		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
 	else
 		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
@@ -2863,7 +2862,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 	struct qmp_phy *qphy = qmp->phys[0];
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qphy->mode);
 
 	/* Supported only for USB3 PHY */
 	if (cfg->type != PHY_TYPE_USB3)
@@ -2889,7 +2888,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	int ret = 0;
 
-	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qphy->mode);
 
 	/* Supported only for USB3 PHY */
 	if (cfg->type != PHY_TYPE_USB3)
-- 
Sent by a computer, using git, on the internet

