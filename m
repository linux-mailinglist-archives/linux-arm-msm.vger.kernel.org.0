Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937E62639E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 04:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730093AbgIJCMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 22:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730707AbgIJCLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 22:11:43 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A808BC06135D
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 17:49:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u13so3320026pgh.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 17:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ReQxmAY0XLGu4xlFoP8MkkA+httZz7j6v/IQOYimHkQ=;
        b=k1J3sN0sWEU5XfqO61nZD/yFIdQSDgiPAVunvU+PmSRlDKVd3tg1pCSnEutnHWko6e
         8Kdl+l7X2SYWbVHbsecO+oOJxHLPOTmBVsh1XKC1A3Q0+fryfCYYggwJ009niKyu3XWs
         BWA24Q/oMTvo6XenZ9B9v82imDaYDfbKlMpy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReQxmAY0XLGu4xlFoP8MkkA+httZz7j6v/IQOYimHkQ=;
        b=sfv9N8764gOz94vrxrfETyhuXXMA1m4m0o4y8xhRZHzcXjwM99PRDdiVFESQXUh/Ms
         yxp7Qtleoj5zD+TSQ5eOHFpu0YS7sYQI/4dzhEqwH31q0DZBU0CD/MdF6u6TDg4UPk8x
         m5xWb/BEbMVPBEPHnqUKVa5ivBjKFmOd479aFh+gaFEBWHn8vUUlk110+VEuoLZ2HMDT
         tue8xvohGtrb9Av8Z+W5uvdF2Y/IrfjIWQJkDBg5TuuIt2qNsjUbIHbWTWO/FNBFoVDl
         RP/mif7IUc2eLGQw24Jq3EP6HECoA4ItPf2lCdDLgGe+lWMvjlC/ZrX1g39IWZWGeKPF
         eOXQ==
X-Gm-Message-State: AOAM5313hzcGbFWXdheG5sL5Xg126FA9lxY/75Ug0iRnDy7eelHgQ75n
        HqTuIpSkJUFDYPlzKSWrs66dXw==
X-Google-Smtp-Source: ABdhPJxwm25YjsmYTmeysQc8B83R4lNCe6FD8p/QRsUWpFZGTzV8n4W4KXR4srjeMv3t2bSAC0lIrQ==
X-Received: by 2002:a63:348d:: with SMTP id b135mr2392054pga.89.1599698948187;
        Wed, 09 Sep 2020 17:49:08 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c7sm3899050pfj.100.2020.09.09.17.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 17:49:07 -0700 (PDT)
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
Subject: [PATCH v3 03/10] phy: qcom-qmp: Remove 'initialized' in favor of 'init_count'
Date:   Wed,  9 Sep 2020 17:48:55 -0700
Message-Id: <20200910004902.2252694-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910004902.2252694-1-swboyd@chromium.org>
References: <20200910004902.2252694-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We already track if any phy inside the qmp wrapper has been initialized
by means of the struct qcom_qmp::init_count member. Let's drop the
duplicate 'initalized' member to simplify the code a bit.

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
 drivers/phy/qualcomm/phy-qcom-qmp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 7ee9e966dc6d..4a23ba9361b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1844,7 +1844,6 @@ struct qmp_phy {
  * @phys: array of per-lane phy descriptors
  * @phy_mutex: mutex lock for PHY common block initialization
  * @init_count: phy common block initialization count
- * @phy_initialized: indicate if PHY has been initialized
  * @ufs_reset: optional UFS PHY reset handle
  */
 struct qcom_qmp {
@@ -1861,7 +1860,6 @@ struct qcom_qmp {
 
 	struct mutex phy_mutex;
 	int init_count;
-	bool phy_initialized;
 
 	struct reset_control *ufs_reset;
 };
@@ -2748,7 +2746,6 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 		dev_err(qmp->dev, "phy initialization timed-out\n");
 		goto err_pcs_ready;
 	}
-	qmp->phy_initialized = true;
 	return 0;
 
 err_pcs_ready:
@@ -2792,8 +2789,6 @@ static int qcom_qmp_phy_disable(struct phy *phy)
 
 	qcom_qmp_phy_com_exit(qmp);
 
-	qmp->phy_initialized = false;
-
 	return 0;
 }
 
@@ -2868,7 +2863,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 	if (cfg->type != PHY_TYPE_USB3)
 		return 0;
 
-	if (!qmp->phy_initialized) {
+	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -2894,7 +2889,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 	if (cfg->type != PHY_TYPE_USB3)
 		return 0;
 
-	if (!qmp->phy_initialized) {
+	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
-- 
Sent by a computer, using git, on the internet

