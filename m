Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A55AE3D4BBB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhGYDqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbhGYDqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:46:08 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C371C061799
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:26:30 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so6435704oth.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
        b=T4ZvBinIYvzQj0wWKnaURygYFC2E8hXmRZ1ZtD4KlsPvtaZ0cFoZfK0iRpA8KWTzLF
         CIbCxifoBvbYOZVB97EkjwgnLgzyC+SwnJKlzG0JDrqag/Ri8ZAO1YgIe0MInyV0rBBQ
         AgO5NCpTP1bTaBjQUienFQi8F9Tdqt9Zqoup4M7jy/4tNtdQ4x6dZw2ZGjcmVGdm2gzU
         ZAEx8G3ft3CUzTeoUHLzsJZEcqxrcD2Fa5M4Ia8Pz2QS8D3I1Bwm3U6M1t/TrbtLEMZ9
         2V2i+KpfabqUX5eh9vinXE8LjV//GvsaLvmISWVyFnpalEri1aC4/JXOD5nAVQQRr3Q8
         JqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
        b=ikNnLaoR+DhDh/djkPb6MzEy8oGYndOChpc37WMxPafNDqG2EiSxc2tHaPB/4x9mDx
         COH0ysNUmCbFNpE1BOeG/vF2DyaajkKZy6Z9hlzXso9g+XiWCuV1LDV8uqtVXh+PFVRz
         /JGAjyLvxzj9jodBDILd6cjE6ntJRK2GITgQ+hW2WQCIxkBo2fr3L83utbXv98Pc3ia7
         VKUNPNgiiKasxUzVtUGMaqAc+V0yq60X5TpRfoBc9ytO7Wy/MoKuM1b7lFuPHnaSZ45u
         qPQwoUwr4tctAFsXqRLjhX7K4ThgylDTcrpgtIr94cyj1tB+qmwpkwKd78TkAh11EX8L
         ZUUg==
X-Gm-Message-State: AOAM533oY4UC3ktWTUJvx4IztdfD6Mqww8zTkA4n8ujn6vm+9saSKGOg
        6CPiJWzgszvB5pBTNYyMOzN25A==
X-Google-Smtp-Source: ABdhPJwzlSIVW2aW5cAHty03J7MuoqU0oXzGi7uz1brYzycm4HpPSCcTzEv7utPTS/ArSjZlgLegPw==
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr8032327otb.281.1627187189689;
        Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
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
Subject: [PATCH 5/5] drm/msm/dp: Add sc8180x DP controllers
Date:   Sat, 24 Jul 2021 21:24:36 -0700
Message-Id: <20210725042436.3967173-7-bjorn.andersson@linaro.org>
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

