Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650893818FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 15:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhEONNn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 09:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhEONNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 09:13:41 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB2EC061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q7so911981lfr.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+nnwUqlWXgsNRotSrmVCnKmYprCSJWQpeL8q8KpmUgc=;
        b=cF2KeGsyYzGUA7pon9uebG1hW4coCHuUINWddBAL3uKXnxo9/dcRJ4EUsfq60Ldwyk
         3NkOzv1LPLiBKyaQMtudvpy/E6IkGeYn2mNAUKcA/graDG9g+8kcirZcWBNavci2TfCU
         DGUQ6C5PirDbBGRTiOSx4Rnqxgh/E0Q86Ymk4gamA2za9zTTmQlWUKixopNwQ7tQqqNn
         axtpePZ5ZtljSWbC3xTs+neG1bBnMCJbyEFcD1b/N6xXjq2lSKaCWirYKRKPYzk7i3XE
         KEL3oJp7BDoqwBGqB5AMJQjbvYeq6oPgaGyqVViSt2N23GGwiU+BdkqIZ9KNtzwpMjoU
         P3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+nnwUqlWXgsNRotSrmVCnKmYprCSJWQpeL8q8KpmUgc=;
        b=l41SUx6lZasaJlFErz7OJ94d5G0bzTHpHJOo7nhhqiGumQvJicJK+LlIZgz6vDCBwe
         dQlDn18uHM2H6PBs+pgGgJ557MGhvPSvUySpuLyf+cn/PneJVAK+uDmYJtr3+AFhicIb
         iRquu4HRxSsjh0SB/TqG19ysQC3G9CigvLN7nBpt338s/wqOowNOjIF9iouHEFcipoJ/
         0Uf7Qr1a/KpMqo2G5zj9XUCJHjAKR/pYWSXJA7f9ScJWMEAaELL3a9CtLEw/Iu97VhP6
         ub1J+mMjwrqlEBd1VNXBbAQ0aeHg3IonMIyA+5RT7giRjtqhMLFBD21WmHcLRCZbsFd0
         tLyw==
X-Gm-Message-State: AOAM531yskQoU2o7Tvl0a3cSulF+OCTXV3xhuxW3gAI0XDM4P0JK6Iel
        TzIla6JW/az3LQeQj/gj43XUfQ==
X-Google-Smtp-Source: ABdhPJzPOhQuWXDvoHnt0lj+USoizwoV+M2VpSIDnhnvmPHKD6uzEqdeNoJcuvcQjO9pPfLvbyCN+A==
X-Received: by 2002:ac2:410e:: with SMTP id b14mr5408000lfi.56.1621084344791;
        Sat, 15 May 2021 06:12:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 06:12:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 6/8] drm/msm/dsi: phy: use of_device_get_match_data
Date:   Sat, 15 May 2021 16:12:15 +0300
Message-Id: <20210515131217.1540412-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use of_device_get_match-data() instead of of_match_node().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f2b5e0f63a16..feaeb34b7071 100644
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

