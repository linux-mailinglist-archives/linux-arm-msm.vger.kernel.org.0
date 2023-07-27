Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3716765870
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 18:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjG0QVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 12:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjG0QVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 12:21:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF047272C
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:08 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5227799c224so1478017a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690474867; x=1691079667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff7pcNWnC+mCuZW5Iqk7Mr4Q5RnrHyj1/dSEByNgwvE=;
        b=F7pTPmX05AChk1JmSOZtUfjAyYV+Q2cFNbhOlOCcypcVPx+lBq5wHlzB5rvZCDdrTr
         ggAZcQ3p9w9XVkVkzwCaJk8iyHjEjh74/xUs5MlBz2xtByIImX0q1tOdDmoJ84XotkXz
         2ZowCpOR05X0F5YL625Y2QFaxccIbeZ+BPjm8JDzm+Ala7MKIP0OZFrruhwh7mZoVSsW
         lq3R25/UZsLptTYgrgNPViPntqdd6Mxc5vxhlLHpuTZ7EgkNApJ/xCjPOVutSQ6SZ8pM
         xJRkT2VweOVWB4hX2uAosPDL33Fb5rX8SyiYATmrixO9lvMUgVWzOVTL+RKD3KBfQUv2
         rmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474867; x=1691079667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ff7pcNWnC+mCuZW5Iqk7Mr4Q5RnrHyj1/dSEByNgwvE=;
        b=DoquevB4Qxx/KuyjYJj+nGtuzY0Ay/aL5bEE3r8B40PicHCob6ZDrTE5+CmWp6+UWv
         po8kj0VVvui+Q/6UfPBvT2qbCAc2aHDBpiHPPVVQ0kA/Pg3407XS/SFsdgsoHywAIi+/
         leodoSUd5XieU2HEj1Pd8mQ3b/gTh0UGw8PwcOYtNw3VEGLsBuc7HxnrdcsSU7ZbPlri
         3VrnIDWKU455DMtBsVJzWiKhZxTvYbfEen4NCAjEtDUQ9M/vrHsM6p8cNb0Uypq5TIho
         DVTyVRdy/qE8OqfLJnBQ4RSocDbK3DlK12ofbOcuwy+XHdSTmc9w9ZWPNx3F/uaPOONL
         PFNA==
X-Gm-Message-State: ABy/qLbW/HhnmfQdqVrNY6LZeuLf0nn0ezfw4SCQVAEM01nxQKH0soJx
        ZY08dNzpxJ0/pSW3KquCqV1JxQ==
X-Google-Smtp-Source: APBJJlHUnevxUVtsFnPoIsbTNstCQExHnpMiK/GlYKJcitznW/AdxALaLgtqVPtPPWeDNk6ZiSqicg==
X-Received: by 2002:a05:6402:785:b0:522:1f09:dde3 with SMTP id d5-20020a056402078500b005221f09dde3mr2395007edy.3.1690474867464;
        Thu, 27 Jul 2023 09:21:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:21:07 -0700 (PDT)
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
Subject: [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
Date:   Thu, 27 Jul 2023 19:20:58 +0300
Message-Id: <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
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

The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
Rather than checking for the flag, check for the presense of the
corresponding interrupt line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 9298c166b213..912a3bdf8ad4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 	c->idx = cfg->id;
 	c->caps = cfg;
 
-	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
+	if (cfg->intr_rdptr) {
 		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
 		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
-- 
2.39.2

