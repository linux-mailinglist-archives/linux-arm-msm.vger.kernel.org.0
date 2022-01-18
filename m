Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A66492C28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 18:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347153AbiARRTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 12:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347149AbiARRTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 12:19:21 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76B7C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 09:19:20 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso7546780wmj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 09:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=49uX77VgBk1zWAbeTSxDYHuJUihy9qWOmYwQIM0d3LQ=;
        b=qFlqPzVoz0yexgbQcowIdkpsUs1QX3UrKTr/ZfD0wFpj0nYoi8rKcAQLpKfv2+Yrvy
         zdPwIANi2+uQgSD31+Sv4utYyle+i90RfSj/NSceRsTHIV5frF8afAIdjtHkoYV9roBV
         7SCeg33ZIIVsVL9mQZQ09ljylSZzvJaSLCWbLYTf+lsUHf/QtAxxjeRGn1EJZNCKnjV0
         N5IxRINNWFWrHhjSfX+Qgwdo7m8MdX0THn/DPLiKikxhl7AM67jChUz96+RMMaZLvhUg
         CQxCjFWvog5aAXCqfvFtCLYdwBNuQfaZt0wZJAlAqX7Sjk74T4oy0+IPfzm6BJzOdp7e
         7POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=49uX77VgBk1zWAbeTSxDYHuJUihy9qWOmYwQIM0d3LQ=;
        b=wzr4T4djjwV7UFFVCS0t3OH2GqMMlGBLvqc6cbMvSYaxEjkSsfhe/JE/u4tFUSzrG5
         WpO3jB5iUoBOeTlOS1w58Y80vexQ3yBOYsp4XXfGCYqX7V9mKLHVrJdvaQKmFwe2d8vm
         fruhq2WTtCzlJ5wdiMbkTu0v/BPOJwxrY6R4cl2/cKrrNpfSKXsnQDr2HzpEAS3L3c1f
         Qm6ZHrSB8e5HJrdPPiNr3ULRFYhfoXoVetaS3z/z9t6WjKmQzIExe7Pr5Cdlrv+FCrp3
         86tUInXeHbKSen3h3CQt4eBc+yPgSk1qL//4raIscvctmY6PDTwjfMRoWMlUB5eLp4jk
         NHnw==
X-Gm-Message-State: AOAM5311v3wHRkF0YldS8yhAlrCshWZ5/Ehh4536rWEhX9RgIaY5vTFH
        B0MrYuDZxn4wrDZ6XreAOnlQwSW/fI3VgA==
X-Google-Smtp-Source: ABdhPJx/wQW5QTc9U8wbimFbu5ByvqCd/289tu/HCvf0TaAz4X5aZVKxEqFpLocSS9d1uIt7Ixf1mA==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr25887013wrt.468.1642526359294;
        Tue, 18 Jan 2022 09:19:19 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id r7sm1081239wma.39.2022.01.18.09.19.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jan 2022 09:19:18 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] drm/msm/dsi: Add DSI support for QCM2290
Date:   Tue, 18 Jan 2022 18:31:28 +0100
Message-Id: <1642527088-13088-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642527088-13088-1-git-send-email-loic.poulain@linaro.org>
References: <1642527088-13088-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for QCM2290 DSI block. It's the same version as SC7180 DSI
block (2.4.1) and thus rely on io_mask.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 96bbc8b..71af048 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -192,6 +192,7 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.bus_clk_names = dsi_sc7180_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
 	.io_start = { 0xae94000 },
+	.io_mask = 0x0ffffff, /* 0xae94000: sc7180; 0x5e94000: qcm2290 */
 	.num_dsi = 1,
 };
 
-- 
2.7.4

