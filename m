Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF701F6497
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 11:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgFKJUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 05:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgFKJTZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 05:19:25 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96EDC08C5C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:23 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s10so2307839pgm.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IffcdynUzLiVRH6ZJC8EjUsRzUadgkTfcsySB4WRgNE=;
        b=VNL+43GYhCqFGotP9JyZlnwxmJgU1dVnZWI+2KDxyHXld23AV/7bzPgibZ6iZibpnr
         7PiNXpZE/93VoL+CXzAUMEaoD/bLopzwG4vZG5fKs3TIAhmBQR5SAQVvnkGM9rcns7hv
         7FCF18SnLTbSfBbdL6MLXuECKryeb66Z5TqWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IffcdynUzLiVRH6ZJC8EjUsRzUadgkTfcsySB4WRgNE=;
        b=OzlBYaFMsVnrAlbVtij6vwDYOL125eePByn3L1Dy/pun4ABBtS98fiUhqShwgP6Rs7
         hWrueellhm1Bhtez2k6nFS0+indalqDPSZibTr4F9qhjqLDQKYfcFMFZJTjFOTT5MLhU
         +lO3cLR3HgkvwnJHJFVG8Hniy2JenKZnhi1LswV6BFhZH01k3YvgXNGShmB5Coi4DXxW
         uyy7UEFbjgGKGRInWKY6QmhWEyB6mUOajd/Z4efZMA3tKUEOi4em1o/WU1S1y5usum9C
         IwUqRjvOzmT/AQ/Ey+StRW7FqrSOD4dbHkuOW5WmVCMlLSTE7ZMMBU5lmQgmLgt/CDr6
         nqYg==
X-Gm-Message-State: AOAM531vj2WOySDeoKP6OXymNl0znfqUFafeYCTTeaaMhQ6Ey8pvozjE
        cGYoRz2UADQB5pZ/0qqg/2TMIA==
X-Google-Smtp-Source: ABdhPJzWzzcxsoD0Otp8bKkBEdtKvM+xPzFi8wYbCPfB57ykYKdGwXGzYzY8r1vE2jQLi2Zqg9+SZQ==
X-Received: by 2002:a63:fd57:: with SMTP id m23mr6506336pgj.325.1591867163236;
        Thu, 11 Jun 2020 02:19:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 1sm2367852pfx.210.2020.06.11.02.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 02:19:22 -0700 (PDT)
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
Subject: [PATCH/RFC 2/8] phy: qcom-qmp: Remove 'initialized' in favor of 'init_count'
Date:   Thu, 11 Jun 2020 02:19:13 -0700
Message-Id: <20200611091919.108018-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200611091919.108018-1-swboyd@chromium.org>
References: <20200611091919.108018-1-swboyd@chromium.org>
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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index fa8faa2d3d69..f3f0cab99ed0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1382,7 +1382,6 @@ struct qmp_phy {
  * @phys: array of per-lane phy descriptors
  * @phy_mutex: mutex lock for PHY common block initialization
  * @init_count: phy common block initialization count
- * @phy_initialized: indicate if PHY has been initialized
  * @ufs_reset: optional UFS PHY reset handle
  */
 struct qcom_qmp {
@@ -1399,7 +1398,6 @@ struct qcom_qmp {
 
 	struct mutex phy_mutex;
 	int init_count;
-	bool phy_initialized;
 
 	struct reset_control *ufs_reset;
 };
@@ -2114,7 +2112,6 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 		dev_err(qmp->dev, "phy initialization timed-out\n");
 		goto err_pcs_ready;
 	}
-	qmp->phy_initialized = true;
 	return 0;
 
 err_pcs_ready:
@@ -2152,8 +2149,6 @@ static int qcom_qmp_phy_disable(struct phy *phy)
 
 	qcom_qmp_phy_com_exit(qmp);
 
-	qmp->phy_initialized = false;
-
 	return 0;
 }
 
@@ -2228,7 +2223,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 	if (cfg->type != PHY_TYPE_USB3)
 		return 0;
 
-	if (!qmp->phy_initialized) {
+	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -2254,7 +2249,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 	if (cfg->type != PHY_TYPE_USB3)
 		return 0;
 
-	if (!qmp->phy_initialized) {
+	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
-- 
Sent by a computer, using git, on the internet

