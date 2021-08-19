Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112A23F1A78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 15:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240152AbhHSNhW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 09:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240141AbhHSNhV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 09:37:21 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C755EC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 06:36:44 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id x11so13137443ejv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/BAopytyK/R8bUpbK+b7Q0+6GCUrOVsER44boOsZ9dQ=;
        b=UeVsli6ZqeVfyxuDP82l6Qchdxd0SS9uCWKergbqRpdGjWukw6CdmP19lDB0j6CeHc
         kZoC1YnwRSRcSKTrfDIP46iuVub+8E5lBPazngHEZVtCxE8Dt99wvylfuFdsJxJTKcei
         tgQwEKfYgXVjIv1RvlErvCsIk0WxVwr8WrCI74L3F26QlW7QyC7Y5NRDLhGrdVguY501
         hB6uoV6dn4V6XN/KCizDVURHciZZrB8Qcjs7iROlCpv14cTfzS2vaZ8BbBqS+9lSDE8U
         6DP4dPYFalWvW/zQpp560Ne0VjzaY5T/Db8Zn2uCZAWs0Ei5wlpAYXCdvXYO30jaIqBe
         /I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/BAopytyK/R8bUpbK+b7Q0+6GCUrOVsER44boOsZ9dQ=;
        b=OXBprblO6gLIKxauQDiJJj1NxAkvIHpwayUwArpROUNWS3tyT+d4SBmYc3CkNVMeXL
         qU4pqCq3KM2P2qAoXZuuJzvHc/zrym/7Fv0sIG3nC95ge138aHMZdg47y8JU5OTq4iku
         v+45DCy57RjxSob5PTMWxGSCYP36zWx5UjCO5Yfw4KsOk5t0nGBDXdKprJBi26BI01fX
         o1odGdoHetddksnVcP/HprMKv54umQKzXJIv67MFS7mBydd0XiLWFJc50PaTv40vRuNP
         ERqlLXq7epjy3JXmlRWsOxcs6CnpKM4nixMu7BqETfA0MLvr0k++jlZ0SP/MuX6GvmoG
         e8+g==
X-Gm-Message-State: AOAM532sM5VcvII3AQ+6CR5kYcTWh8ZuesmsZTnOZNNsixbke3f6OFWg
        X03+rqkLPbNlbIJSPWYLvn0MFQ==
X-Google-Smtp-Source: ABdhPJzWpeXlmAlC6oKFJXd83aDooz5YGi7xRGcALh6ivDz0hfP0Xwl6LH+PhBTG6C5khTlVBapj4Q==
X-Received: by 2002:a17:906:ad7:: with SMTP id z23mr16114025ejf.419.1629380203406;
        Thu, 19 Aug 2021 06:36:43 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:eb3d:3695:30c3:3572])
        by smtp.gmail.com with ESMTPSA id ay20sm1770138edb.91.2021.08.19.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 06:36:43 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
        abhinavk@codeaurora.org, angelogioacchino.delregno@somainline.org,
        mkrishn@codeaurora.org, kalyan_t@codeaurora.org,
        lee.jones@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1] drm/msm/dpu: Fix address of SM8150 PINGPONG5 IRQ register
Date:   Thu, 19 Aug 2021 15:36:36 +0200
Message-Id: <20210819133636.2045766-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both PINGPONG4 and PINGPONG5 IRQ registers are using the
same address, which is incorrect. PINGPONG4 should use the
register offset 30, and PINGPONG5 should use the register
offset 31 according to the downstream driver.

Fixes: 667e9985ee24 ("drm/msm/dpu: replace IRQ lookup with the data in hw catalog")
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2e482cdd7b3c5..420d78cfce8af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -794,7 +794,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 			-1),
 	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 			-1),
 };
 
-- 
2.30.2

