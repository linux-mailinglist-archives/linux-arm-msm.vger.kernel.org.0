Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8763B5AB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 10:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbhF1IxW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 04:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbhF1IxV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 04:53:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056EEC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 01:50:55 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id y3so827747wrq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ivMWyakmLeaYuI23t/O2pRde3mjJQDvPIshj9I2/bxk=;
        b=U5RttCDInB3rDob0B5Dcq6/Xyhvc9wz8sZ8N+wWaNMXZOvdChN7mX6a/FDT7jGGO5B
         Km08kaThC7gGa7Q83XjZak1i6z/RUGIPGFY6Et94LmQhCb/TH3SyeqANgL3dLiju9Gb0
         oSy9HN6XaHnxH34/zes1RTu2PV04E6PCf+iVrePfIvhosLHN4um3c6ZNYTUzQIJ8EOTR
         6VLle0zILlHPxBxIVW6mNzi7UdE4lqdQd/NkPjeOKZvE5y4huA81pvsVgRCU00UEsFow
         +NVfKlCppBxpRDEcNt9jpnTQ7XpYM9ZVZPcJESh+dYu/1GpjO6hLNa3Qs9nkbVwhsbj1
         EQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ivMWyakmLeaYuI23t/O2pRde3mjJQDvPIshj9I2/bxk=;
        b=a3xAzJ423MvUGb/qnWy5llLuWz5fgLrx46jyOzVmd5H8bDSnqANt7VQ9FATzPsPJyv
         wWDg1uKdr58GfjExM7oMg30X7A3Y7PxtXD9JkSwXPuF8C5fOuGnoKHDOafIsZkRj6njC
         9MKn9I151sCKxGczMrXHKg/VKAUYDVW/PPdvOgn+EM3Fm2lNfsazrUXrVpdO3wCBYN1n
         rxvYezBBoiZaVc1dIhGEkCSuAzjdf8s830rARcMJ0WDCaLwH5UrabSLmee7NROYrVK0R
         s4XBG405tjU4MTSejP2KU5q9DLoXvJW3hdsmIo/yZPMhAZy6ZUSIHYIAp6dkkdKWgrS0
         Oh7Q==
X-Gm-Message-State: AOAM5301ww1sqeEub+adfoxuKX896feFixmSDCVglTWHp+glDVDHsKE9
        +pZsM8whXFoRDpfF74Rjb2vZ6A==
X-Google-Smtp-Source: ABdhPJx5O2B7LqCOPQfcupkEEJVd6rGqE+bx5F0HEMmyXyLyhRTJwjgwPYZa2H8Ud0EveatM7tT/kQ==
X-Received: by 2002:adf:f384:: with SMTP id m4mr25707885wro.12.1624870253640;
        Mon, 28 Jun 2021 01:50:53 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:b773:c98e:f11:e83f])
        by smtp.gmail.com with ESMTPSA id j35sm7379565wms.7.2021.06.28.01.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 01:50:53 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, jonathan@marek.ca, dmitry.baryshkov@linaro.org,
        angelogioacchino.delregno@somainline.org, lee.jones@linaro.org,
        kalyan_t@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1] drm/msm/dpu: Fix sm8250_mdp register length
Date:   Mon, 28 Jun 2021 10:50:33 +0200
Message-Id: <20210628085033.9905-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The downstream dts lists this value as 0x494, and not
0x45c.

Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f3533525c..5d30c7f33930 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -244,7 +244,7 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x45C,
+	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-- 
2.30.2

