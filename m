Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF2225B709
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 01:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgIBXD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 19:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIBXCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 19:02:21 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDC6C061251
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 16:02:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so524114pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 16:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TZt2amfy5qzjmnWe5xTFuhN9jzSvSMQp9lB8VeO0GI=;
        b=DFebTShMc8xpKVOBQ2cjdLkpsamauUKkoqnBeCYWLLHkD5A37kEP/3Cq72866RcrzK
         TkHot7DuwTpHAPZDfyM2otz7atFL/81flusMaxNaQ/0qYiifQUb4IxoUNGDyRZDGqGst
         YrQPwJfHY6boslEjErd4MZXFKgAFTYkhU9pGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TZt2amfy5qzjmnWe5xTFuhN9jzSvSMQp9lB8VeO0GI=;
        b=Dc0dC4DVIHq3TivsdylTML6e+MCSluQ2Dw4XDMis4uLdT2fbVra2fPXGiD62B1Muno
         0McRft7tvhskZDLP74Db7J6MnVRkLqJ08MO+lmqfvciSgDvsOcEv/RJoU8XTZwpWawiy
         OsfJfSzKMS/MR1J3V+wK0wrPkVJXSNZ+toqKqaMUIyWY0oAdxNc+U5zdq9fsGDNCl8qf
         l4EmuJTCccXSaPhuwpdWZ33KcfsnDyX0STVK3zJ5x6mBgeMNYq/r05SkSbWTsbciBVnh
         1ce2Hnm0zJKOLvapuW69r36zrkoSsUEVDI6NMLOQLoyJqlNteDBE+GhsjaVmQ0iXJUqN
         VFZQ==
X-Gm-Message-State: AOAM53058Tjo8OQ5greJhWDBYgfV9FXUHvuXH0A3qy72peIogDc2JKuy
        Wo/qncSnQhrJrFzEa7ZkrNY9pQ==
X-Google-Smtp-Source: ABdhPJwoqwZdfX4vzGy1hAALb8ZdSSp6MKKLSNrANSwIKpt9ZrsGycADNYmWNLF+VaH/7VtrVAI1HQ==
X-Received: by 2002:a17:90a:fb52:: with SMTP id iq18mr56019pjb.162.1599087740815;
        Wed, 02 Sep 2020 16:02:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x12sm410277pjq.43.2020.09.02.16.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 16:02:20 -0700 (PDT)
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
Subject: [PATCH v2 02/10] phy: qcom-qmp: Move phy mode into struct qmp_phy
Date:   Wed,  2 Sep 2020 16:02:07 -0700
Message-Id: <20200902230215.3452712-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200902230215.3452712-1-swboyd@chromium.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

