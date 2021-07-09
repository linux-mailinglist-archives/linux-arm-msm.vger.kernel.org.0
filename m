Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2713C2AB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 23:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhGIVK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 17:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhGIVKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 17:10:24 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09719C0613E9
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 14:07:40 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id t30so10110100ljo.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XL+YXT/rgnuTxArH7cCESmmrm7QQBuc6KIaqBz76zOw=;
        b=zo8nKP9LqCEewAlV/Hpu705xkphyemres9xFnaNIhUAeh5mFF+U0np4R+XJnnoxHCQ
         nfLpLUlEwcCDnPG4JheD5q7zX5smYjcU/iCf/209AbhbXsrNlVqfHEqvR/vajcEp6oKD
         WYJXijKB69beBXlThUmduFE8T/qf7LjLlS85ShhqYwJZn0cGjroWaxrrTkUlHrdkCSlN
         F0hzw7/KZgkyr0DOwglSb2K5Kdnm7jTsAVipJZJZjfLHFM6291qnng+V5NCAtZJAKdZl
         j5u/CNTmsoTEkg1kZuODwOAifNj/RP2nEMglu41qEwgxP0qy7Q3u0SWpflP+87EVQVIY
         aGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XL+YXT/rgnuTxArH7cCESmmrm7QQBuc6KIaqBz76zOw=;
        b=IMfIJk+V1s7RLlI+Pyp+4Z/f0PACWphEhRiYbI670334L1UgFIoBk5j8/C1yaPT9I7
         n19UIoSDunetLrxzspq0iU7kgW6Bm38Xji0b8Ta2QCinVEsY7kFpr1FwkuRv0nxPJSq8
         6QFh+6PUX3paKocM9gDRHaX31LLiGdhoaQZFTosNzmZSyGKOFDMFeCUW43x2eG43klCH
         C6VQI+JlzFJzwAOTdoU7tytAJ6/G2gt7csUwKdNCDRqDFVTTcsyF0y3wQ8pPaPqLGNQ9
         ONApU8Zc4201yhjoopvva5MpOOvK7UvGcEwzCe27VWMtiDWkTWYogl2lVvfiFzFeje0E
         eYHw==
X-Gm-Message-State: AOAM533qDS7sxKlZZzofz8gTRg58g/NrZt37belZlm7ZLdxVsCWbuTQV
        LrNgyuaeYpbXtcswBsTCnvzyyA==
X-Google-Smtp-Source: ABdhPJy+sbW7gwPQC1YnwBSkUQOG4O/Nqf3Ey1YaJh8/bnri/JcwqssCv9mfIPGZX+HJ8dcjCP1OsQ==
X-Received: by 2002:a2e:9e53:: with SMTP id g19mr32140951ljk.58.1625864858423;
        Fri, 09 Jul 2021 14:07:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 14:07:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 7/8] drm/msm/dsi: phy: use of_device_get_match_data
Date:   Sat, 10 Jul 2021 00:07:28 +0300
Message-Id: <20210709210729.953114-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use of_device_get_match-data() instead of of_match_node().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 952fd0b95865..c76a6438ffb9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -625,17 +625,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 {
 	struct msm_dsi_phy *phy;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *match;
 	int ret;
 
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return -ENOMEM;
 
-	match = of_match_node(dsi_phy_dt_match, dev->of_node);
-	if (!match)
-		return -ENODEV;
-
 	phy->provided_clocks = devm_kzalloc(dev,
 			struct_size(phy->provided_clocks, hws, NUM_PROVIDED_CLKS),
 			GFP_KERNEL);
@@ -644,7 +639,10 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 
 	phy->provided_clocks->num = NUM_PROVIDED_CLKS;
 
-	phy->cfg = match->data;
+	phy->cfg = of_device_get_match_data(&pdev->dev);
+	if (!phy->cfg)
+		return -ENODEV;
+
 	phy->pdev = pdev;
 
 	phy->id = dsi_phy_get_id(phy);
-- 
2.30.2

