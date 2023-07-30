Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C3F7682CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 02:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjG3AfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 20:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjG3AfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 20:35:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2181BDD
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso1336073e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690677320; x=1691282120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B08+U/XiL1/l6dGTvcLD4HwsDFsKFx3gFQfwyphkLoE=;
        b=IhlpL+2CV3gPonbpS6zYM3Zx6w8mkhwAh4iiUCLpWCYRS3JL13M4/ZNaeyb+Lzdr2h
         CLG/qSR6ujhVH3BJROEX6QbQ7kDHbrEXSfn2abI+sW2jFN9TwwGo/yOk+mDJDpWKiZ01
         4MmoSTELmeG9h/Ahnqtv3iTor3sO0FGyE+QopGxR1/oF87D4D+LMapZs4SOs5lDqGmPH
         t/GeLH1IoFc/IhcMJ1Qj8LZTfTNJsnFcUeIueQHJCVgMpRWU/d6bHLsnNeOU2JtI1To0
         RZaZHpvZ4nz+Jfq8Fetld1r+pbrI81qLCpPGUy6kcw5SLbwTrTlS54Wrj6tVAJxpy3e1
         ecoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690677320; x=1691282120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B08+U/XiL1/l6dGTvcLD4HwsDFsKFx3gFQfwyphkLoE=;
        b=kZoCHGVlNClI1hsEOgSiPdXzsiSs0Zy9xIP3qOjcTzEI15lswrH3JSUE4Slv+Ymj93
         VJ1fw+0r5W7K6VNMhFl2vZYAARCxthowPGrS2mwa4N7SHb/rXUiBFpRYmBKYuMhoH/3g
         pRkBAdAjW98Srebo0Efc3wGffZhnxeSUaKLcHrQvPbZUsqggAtlApWhKj+3LE4CdVnd9
         FDKLF8VQqdVoEaAX8gXDw/6AX/auOCZgMJgv4ckhBsEiyL2y0DrgwDK+pXrPJXXM/2f3
         wJKMLdgdrIyrFw36pc2t6ol2Kpc8h8Osg6D/0xXJTbJ/OILKB8JLfBi3qXkjE+tsVMpJ
         vi8A==
X-Gm-Message-State: ABy/qLbQmWscrGu7QkfwPBmNKuw0X6okFsfQBo8ZA8TmmLquWG6dCNGW
        ggP1kxL8fISlmDPLjuBIMcpeeg==
X-Google-Smtp-Source: APBJJlGCO6R4FOu45zyNfCfgOEGN3dn4q7ZAFQLIJkdmLEBmM9VEiFjGCaDhmqulLWa3Tgn3QMxANA==
X-Received: by 2002:a2e:988b:0:b0:2b6:decf:5cbd with SMTP id b11-20020a2e988b000000b002b6decf5cbdmr3901235ljj.36.1690677320513;
        Sat, 29 Jul 2023 17:35:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 17:35:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/msm/dpu: inline _setup_pingpong_ops()
Date:   Sun, 30 Jul 2023 03:35:11 +0300
Message-Id: <20230730003518.349197-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Inline the _setup_pingpong_ops() function, it makes it easier to handle
different conditions involving PINGPONG configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 39 ++++++++-----------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 437d9e62a841..9298c166b213 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -281,27 +281,6 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
 	return 0;
 }
 
-static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
-				unsigned long features)
-{
-	if (test_bit(DPU_PINGPONG_TE, &features)) {
-		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
-		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
-		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
-		c->ops.get_line_count = dpu_hw_pp_get_line_count;
-		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
-	}
-
-	if (test_bit(DPU_PINGPONG_DSC, &features)) {
-		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
-		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
-		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
-	}
-
-	if (test_bit(DPU_PINGPONG_DITHER, &features))
-		c->ops.setup_dither = dpu_hw_pp_setup_dither;
-};
-
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 		void __iomem *addr)
 {
@@ -316,7 +295,23 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_pingpong_ops(c, c->caps->features);
+
+	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
+		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
+		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
+		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
+		c->ops.get_line_count = dpu_hw_pp_get_line_count;
+		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
+	}
+
+	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
+		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
+		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
+	}
+
+	if (test_bit(DPU_PINGPONG_DITHER, &cfg->features))
+		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 
 	return c;
 }
-- 
2.39.2

