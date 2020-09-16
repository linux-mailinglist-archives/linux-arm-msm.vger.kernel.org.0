Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8FD26CF4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 01:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgIPXMo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 19:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgIPXMQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 19:12:16 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1FEC06178A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 16:12:12 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bg9so85266plb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 16:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fo29UVf8/PljyIh0V7UDdyn+y8CbTVYNyc4tulVx7PI=;
        b=YUIG7EYxEMhHMRHx9nUL6L183hu+tRurdfnSrDdDbmRDxl33oV6N6POavkIWisH4lj
         XLfPHie4dvwVXGMiavJcref4dBuPgwRo0z+pu8c77V2I6G4WB6Y3WeMiqEOL4eJFqLRY
         Z/HzuGA/qU8e4VQOMtgZib1D85UHW6mgJbbL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fo29UVf8/PljyIh0V7UDdyn+y8CbTVYNyc4tulVx7PI=;
        b=AKxGdyUC9oo2TEwRhxgYyP3EVk+lHxYFBq1jy24fjXAnLkVdjRgdRzN4Jn2mohDvzU
         pmH5jssziTEoSXc6x4pzRtl3K8XCMuDIUEy+L9oJHJumcsZ27igUa8LI8YsRlJ8etNTG
         R+4iaNdudIu27DrNuwkRfDTyA/VdbOtEEOnvNRTZu9nY6wzL9n+pqpuj/zQOEL7yC7xr
         PZr8cabpGnxSggAlEcu094kxT6b1Jg8JyI3uxbXC2FC//Q3uXWtD9r5b1SncTtlszNms
         q/tTbqgR5zrs8A9taYch77Qx50/hmoQje8lDrQJWRv4oISeTeDImFCm/Xrjp16Zdz5nx
         jdeg==
X-Gm-Message-State: AOAM532xQ0+U+frywY0RT9hmV9ghZA4zTFCW5+ruwFESfUgzbyE0NgjR
        YuFzHt46SOFGjbxTkutW4b0qTw==
X-Google-Smtp-Source: ABdhPJzXqyZ8vyHd6MYkcoT+c+00XTal4AMIKbplQ3x6VoBKK1kaPkESPoIMw0Jz/LmObYRBcKdWYQ==
X-Received: by 2002:a17:902:b586:b029:d1:bb0f:2644 with SMTP id a6-20020a170902b586b02900d1bb0f2644mr22158185pls.34.1600297931836;
        Wed, 16 Sep 2020 16:12:11 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u6sm3643254pjy.37.2020.09.16.16.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 16:12:11 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH v4 06/10] phy: qcom-qmp: Use devm_platform_ioremap_resource() to simplify
Date:   Wed, 16 Sep 2020 16:11:58 -0700
Message-Id: <20200916231202.3637932-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200916231202.3637932-1-swboyd@chromium.org>
References: <20200916231202.3637932-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We can use the wrapper API here to save some lines and remove the need
for the 'base' and 'res' local variable.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 215abd179e74..ecfcc97277f9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3235,10 +3235,8 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct device_node *child;
 	struct phy_provider *phy_provider;
-	void __iomem *base;
 	void __iomem *serdes;
 	const struct qmp_phy_cfg *cfg;
 	int num, id;
@@ -3256,13 +3254,10 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	if (!cfg)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
 	/* per PHY serdes; usually located at base address */
-	serdes = base;
+	serdes = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(serdes))
+		return PTR_ERR(serdes);
 
 	/* per PHY dp_com; if PHY has dp_com control block */
 	if (cfg->has_phy_dp_com_ctrl) {
-- 
Sent by a computer, using git, on the internet

