Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8054C70AACC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 22:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjETUBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 16:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjETUBJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 16:01:09 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24515133
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 13:01:06 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f24d8440c9so2573782e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 13:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684612864; x=1687204864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/m15tgiwhJVpYle1UwrR9+q7qYpgbGWpHSlEeT8UPN0=;
        b=t1mexu5qxJBbBJltPPFF13MB0UFh19PpxpRwP6BJZkVT+8+Who4LFtvR5rRPJ6WZlf
         aF3vLsZKI/6m47koGyPqkQ70UlK6+FCGKwPDvOrnbFC8PNQfhP0qiApWMylsy0yMZfQU
         xvfiVtXg8VSS4yUPKmKCyljjLAAZ6erdXVUaW0xoQUQzWEmQ+vEWGSuF9Rl6a9+GwK04
         MjvFr6NVTJcMeOwmNqAvDtJoBI3hfXJWSgSWQh37YGFopku6dwx6cXsg41nbNgzynZi7
         bz1RCJHueQJ/y9/P6dR+NQfrYqmcGufHo/y4g0Tcz/g1fqtxutbRF7N1sgijjpkaOBXD
         JYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684612864; x=1687204864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m15tgiwhJVpYle1UwrR9+q7qYpgbGWpHSlEeT8UPN0=;
        b=bCPINoRXDFt91ZD5g9pZAKMcF1/R67c1LDesNVMCeXZNgPUcwrvT/0Ts6iNpdXCQn0
         nn/hgejAFRUg0ZJdLmRyOwic4J0tbVNw85q8tFn+vkxoKGOo0o5J02oowf9MSJIlvwD7
         DHYK6EkJ6atBJ+381xyTRwplI+9BW+T4RSlYzdhHYMU6gcV1msuGlIgzt8qdT6rWTzWg
         FM43DxNcbexqrvqLzgaek/+irT5+EGFMxEmzZlOiMG0Wws+jTAe2i2Ed5hy3JwrCnVvo
         raGExEjhB/+K/QEHCiSx+0IQwI4qD+o4g30HuGs5HfdJEVN91zq/r/s31QaglpQuXXBv
         QAVA==
X-Gm-Message-State: AC+VfDwhfuH//mVDNoKMzLQgvQOPI1O7xjwfIJJB/ireiX19132T3IU1
        AMZ0z7EyY4qzfXvCULdOLDheSA==
X-Google-Smtp-Source: ACHHUZ4JAZCnM9aejw/rIPOad6sYyqPsXDK/bsqCMQMPQLijIi9hM33boelYXdGRDoI5/m9y8r3qjw==
X-Received: by 2002:a05:6512:1048:b0:4f1:276f:a25 with SMTP id c8-20020a056512104800b004f1276f0a25mr2170344lfb.5.1684612864403;
        Sat, 20 May 2023 13:01:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c4-20020a05651c014400b002ad9b741959sm418061ljd.76.2023.05.20.13.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 13:01:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm/dsi: remove extra call to dsi_get_pclk_rate()
Date:   Sat, 20 May 2023 23:01:02 +0300
Message-Id: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In dsi_calc_clk_rate_v2() there is no need to call dsi_get_pclk_rate().
This function has just been called (from dsi_calc_pclk()) and its
result is stored at msm_host->pixel_clk_rate. Use this variable
directly.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Fix typos in commit message (Marijn)

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 961689a255c4..2b257b459974 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -633,7 +633,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
+	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
 	do_div(pclk_bpp, 8);
 	msm_host->src_clk_rate = pclk_bpp;
 
-- 
2.39.2

