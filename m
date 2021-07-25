Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68663D4BB9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhGYDqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhGYDp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:45:58 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B3DC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l126so6920457oib.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
        b=GP51RnXyV5DlsFpI2ZiBhXt9xZvi1sS6LzIRJewIMWMadsHwvMzlslCOM8ygyMv0EF
         Cv94UffGrQGwyIc3hwmqoGkM5X6BWL4qurb/sSc3cXSrWYKNX8Wb48HE8AJ2t7pT38O9
         4LE9U4XGDNtz93pkHz36mMH3CAa1UV8GlJuk6Mt77LoGwfENEnxSVTOaKjwACI8lwfuw
         NzZc3YsXHJZ/ZlwyLas8qIFb/MVmd2yj98fonX8pnphzcrpUeQCvi0067+vSN+WPqVG3
         zuerbA8JLUQXGBq7BOXd8gEtBk3gy0kNOw/evOJ3Sm9AjUFPWeaULHYo5gwfxKwMF8y3
         B70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
        b=fgTNA9w9uOSGT7OWuZpGK05pc8GldnDmBwdSvVSOsfzMPJzIPoPpxzrPgKIUHTvCBE
         bBfYMysaP0RXFhTVMWKdwm4k0KhqzmOcc5La7zJl4JLnKyOFs14WCx5lbHR9jJTuMzTt
         eifbL53UsPl9aVQnkmptTWiL01BBLzmmBbfqiJUxNs/GIi583B/IMq8lGNH+szsMMSR4
         r0VOQFxTy7tvlA3CN/da4Cq/NMHKU2xT7v4xgNWJzSl5ZLvn6+jLWtTDecP4KmJ+iHqx
         feFR8SrHUjQuZfh12R/1ztZ8344Ap2g+A68yBP3hHg4sqPtWd13DTwT3YvjU4EI1OTNs
         wfsw==
X-Gm-Message-State: AOAM532yXYJtKbYbpY+LVpS+IC+pUnGCn7h9tooQ6KlnvAfncNAhDu8W
        ql7ohBOc3YTmviElWsHgkVq5vg==
X-Google-Smtp-Source: ABdhPJzqm38dWktOC/MvcPenQ6kG9WAWPEUG/v1ipVnF/0XD8fc9iKqYr2zNhfv/t0WUpq2sFSIKLw==
X-Received: by 2002:aca:d505:: with SMTP id m5mr11011056oig.5.1627187187735;
        Sat, 24 Jul 2021 21:26:27 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:26:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/msm/dp: Add sc8180x DP controllers
Date:   Sat, 24 Jul 2021 21:24:34 -0700
Message-Id: <20210725042436.3967173-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Link: https://lore.kernel.org/linux-arm-msm/20210511042043.592802-5-bjorn.andersson@linaro.org/
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 92b7646a1bb7..c26805cfcdd1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -129,8 +129,20 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_dp = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0 },
+	.num_dp = 3,
+};
+
+static const struct msm_dp_config sc8180x_edp_cfg = {
+	.io_start = { 0, 0, 0xae9a000 },
+	.num_dp = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
 	{}
 };
 
-- 
2.29.2

