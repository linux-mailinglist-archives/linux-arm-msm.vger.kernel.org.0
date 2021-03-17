Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121C833F370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhCQOl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbhCQOk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:40:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE6BC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:56 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 18so3336264lff.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qLhXbs59yVzmO7WojFz9RpxOwJYiP3BLmuIktV2OyGs=;
        b=nl1bUP9vw/IpaBHzsqo3AEkPL5XzqGHwM4VB5iC4H7lhplNQYalpa4tunxNqcNXG2Q
         +kwqgJ9rrXh45B+GHRNqlUm1javIx8k9gevIMqvcjQ68ufswedqa7XuIXnsvXuiC+Jr/
         fxrxt8z5JaXiyrV6CkTahzhmSocdrkCXprfq7CILPaxuHuOVEJhy9aDUnKStpsPWvMi+
         ttJgZGrXC9Ad0SJzZrkmxhs5ZUfvn0mOeGkfG5Q7to+1EODAPHvEwYZL7oY48iRvX9h8
         zO5QIkOf8NrU8chm0xaxbBV9B9ozVCDGFKdNeUliel/dF/1uapgLajsfCXSS3FpprYLB
         WoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qLhXbs59yVzmO7WojFz9RpxOwJYiP3BLmuIktV2OyGs=;
        b=rd3uxDSNeeDDV0bRZwSxrol2rkE3dfFa6Zwf4otVItKAzaaLMfmcMijJ0o7Fbjjp9r
         r7JOQw/pf5PlX/UA0an6yzNELKYFzHYEzKaEc8sHYM0MEmg0zxNjQaN+6tyL8J74ICpO
         uTfWkG9S1keBGU7rAcMzJRGmg3kReXpnlPxJBSx4QftVFT/YIqa0Kfvm/2ZS11Lh9WQs
         LbSOvm/8bKPfqZMav1J/EuCJFejgwQaHlyQM0cPpd65h/hzh74JyC/MlXSWfr4tOpGzG
         P15JcYSsLdpD3tzfk5az/KNmGRA0gbg43T7Vx3UeAjH837pJ+ajZfTd/XzPihkvLhzRr
         22Gw==
X-Gm-Message-State: AOAM531rFrNJI5Vi8s7MFoIxvFhMWY01zt3f/ay2Hhl8w7PmmjKldlzK
        qUEsOENzXTms6c8ISn13yy7RLg==
X-Google-Smtp-Source: ABdhPJwAJamfu7D7LdWLEBNqDKVW0j5aucbHTLXOxUTXvfOKJkzzZArUgosgoQtyi1cE8yxIArK7nw==
X-Received: by 2002:a05:6512:10c9:: with SMTP id k9mr2714800lfg.532.1615992054711;
        Wed, 17 Mar 2021 07:40:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 13/26] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date:   Wed, 17 Mar 2021 17:40:26 +0300
Message-Id: <20210317144039.556409-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8c0bc5ccba8f..0c26451db310 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -734,7 +734,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -748,31 +748,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	return 0;
 
 fail:
-	if (phy->pll) {
-		of_clk_del_provider(dev->of_node);
-		phy->pll = NULL;
-	}
-
 	return ret;
 }
 
-static int dsi_phy_driver_remove(struct platform_device *pdev)
-{
-	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
-
-	if (phy && phy->pll) {
-		of_clk_del_provider(pdev->dev.of_node);
-		phy->pll = NULL;
-	}
-
-	platform_set_drvdata(pdev, NULL);
-
-	return 0;
-}
-
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
-	.remove     = dsi_phy_driver_remove,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
-- 
2.30.2

