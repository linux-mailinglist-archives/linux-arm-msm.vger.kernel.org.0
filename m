Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9D22639E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 04:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbgIJCMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 22:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730704AbgIJCLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 22:11:43 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D73C061364
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 17:49:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id u3so2186352pjr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 17:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fo29UVf8/PljyIh0V7UDdyn+y8CbTVYNyc4tulVx7PI=;
        b=ir+znU6xL6b1OkCX7R39Z1qLqEWlZGR9wfyOiujIAKUzsKR5IoNbgrnqGkwrZxktmb
         gcICbKw2Zsumywc1HvqqXl6fBgjpDDAFn6XQV2p00uw2cqG14WvaQvXf7E2u15uA+Dbr
         PorV/Eu0oTnYnF62DFpJXiCS2bnEpBx2PKqpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fo29UVf8/PljyIh0V7UDdyn+y8CbTVYNyc4tulVx7PI=;
        b=UXUlkeNqxWJW73rUlLTh+vaS4HSP68ZI267qgc27YyOAhQgs3ZUhTyJC7O9twRiryH
         B7wXq0MFJLsCCGm83KNqbgg0ZoE5UHaziwvhBb5/wXBx1/F5NQwimrcByl6foKEm1hvA
         HcRbfGtJfY6YB2k+/DHRi67CWbz4q3KeDWMAvSg/Z0qheSxy9r91leyfWdEvpP2kfSAm
         GIMi03rJlQXLmUWLT1M37l59tV9jnKtxXm9RBCLMJ7y4ZkZe14p/wzByIx+0uwECsmcC
         SYyy/p9TB6iiFbEIeJ05BV6X0hg7/EqQL7+kF4geKWaFxa1IFC7RBqbHU0ghnaWSw3LS
         9dcA==
X-Gm-Message-State: AOAM532zdRaB43kTZyLR8DhDNVVX2r/E/MbU4QLQS3OalmpFS3bk3bHG
        NcDs28woXu3kkvNcmsFoVEg2Pg==
X-Google-Smtp-Source: ABdhPJw1oxbn4IRJbY/MRML/Jli8FgJ/MJ0l59c4coFcCsIa5f7pOcW31SOyEPCKfDUGHY+rCf+lWg==
X-Received: by 2002:a17:90a:8909:: with SMTP id u9mr3006045pjn.119.1599698951298;
        Wed, 09 Sep 2020 17:49:11 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c7sm3899050pfj.100.2020.09.09.17.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 17:49:10 -0700 (PDT)
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
Subject: [PATCH v3 06/10] phy: qcom-qmp: Use devm_platform_ioremap_resource() to simplify
Date:   Wed,  9 Sep 2020 17:48:58 -0700
Message-Id: <20200910004902.2252694-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910004902.2252694-1-swboyd@chromium.org>
References: <20200910004902.2252694-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
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

