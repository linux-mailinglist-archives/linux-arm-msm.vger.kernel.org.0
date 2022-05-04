Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1AE51B244
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 00:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359166AbiEDWxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 18:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbiEDWxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 18:53:09 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A8553726
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 15:49:31 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t13so2263964pgn.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 15:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dijXTkiQHrfrlF4ID+znm8V5fZSPJC1gmyuClDGbRpM=;
        b=KnQUKihb/oVI0KbzvzptyFH6gHyzwx78tuSQzyxRYYtkAIdDOZTWZhlQZhLFlBeWOp
         j8RKG5i1b4ugEU754VQCuM8t49ONqK8c8R+I2vGT2BEGRs92ej0IZ2N9VXvkWqu4ClDi
         Diq2ZeuXYyv4WvhnGPBn1lRcHUKVUIOCL2kVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dijXTkiQHrfrlF4ID+znm8V5fZSPJC1gmyuClDGbRpM=;
        b=2iLnh4BJ9Xv3qODBV9FBQ1vqDrP1paKBDYJdVM52ysaI7am5dxuI1eIjhtO/MIn20p
         gwiUa10+3c7/fq+04076kdz2ZclSq0orpIqy9b4ogBPnxh1zXn5QLoMi0uVybNj9R4RO
         VVAzOirI64VX4vPBVNkJ1AeDGwwZPt4+xPyhzAn1IAzIxPww4Vn4iQzmM0UaKT+l9BEZ
         XqYT5QnJ2mvOL0jKaRPKQsjdwwlRuFABwTnXKO5RSKBRJ/FVWJBUVkQ3lYFf0XiJaRMk
         lmm+aeis0Dkh2hDDoQiVQTU7X+jTew5/B2yhvlm96EAkomHL0cQipZO2AenkYDC68btN
         o15Q==
X-Gm-Message-State: AOAM530NRzAspWAGcNI5+Qt0LWutRiakwTMXM9tbE2Wmr7UbIA1DlYlR
        bfFKKbsNwSCCvknaZo+PcHzFGg==
X-Google-Smtp-Source: ABdhPJyMiDyPd/6VfPLzI/BKb/Du4iDMHhjPft3yL/BkGqSeg5FtyrDZBqihX1qBl5TEhX24E/4+wA==
X-Received: by 2002:a05:6a02:19c:b0:3aa:1bf8:7388 with SMTP id bj28-20020a056a02019c00b003aa1bf87388mr19780091pgb.455.1651704571489;
        Wed, 04 May 2022 15:49:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:1da3:6a8e:557c:da09])
        by smtp.gmail.com with ESMTPSA id s21-20020aa78295000000b0050dc76281b7sm9034473pfm.145.2022.05.04.15.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:49:31 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Lv Ruyi <lv.ruyi@zte.com.cn>,
        Sean Paul <sean@poorly.run>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Xu Wang <vulab@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Fix shutdown
Date:   Wed,  4 May 2022 15:49:26 -0700
Message-Id: <20220504154909.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When rebooting on my sc7280-herobrine based device, I got a
crash. Upon debugging, I found that I was in msm_drv_shutdown() and my
"pdev" was the one associated with mdss_probe().

From source, I found that mdss_probe() has the line:
  platform_set_drvdata(pdev, mdss);
...where "mdss" is of type "struct msm_mdss *".

Also from source, I saw that in msm_drv_shutdown() we have the line:
  struct msm_drm_private *priv = platform_get_drvdata(pdev);

This is a mismatch and is the root of the problem.

Further digging made it apparent that msm_drv_shutdown() is only
supposed to be used for parts of the msm display framework that also
call msm_drv_probe() but mdss_probe() doesn't call
msm_drv_probe(). Let's remove the shutdown functon from msm_mdss.c.

Digging a little further, code inspection found that two drivers that
use msm_drv_probe() weren't calling msm_drv_shutdown(). Let's add it
to them.

Fixes: ecb23f2e3009 ("drm/msm: split the main platform driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 1 +
 drivers/gpu/drm/msm/msm_mdss.c           | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 143d6643be53..2b9d931474e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1350,6 +1350,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
 	.remove = dpu_dev_remove,
+	.shutdown = msm_drv_shutdown,
 	.driver = {
 		.name = "msm_dpu",
 		.of_match_table = dpu_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 9b7bbc3adb97..3d5621a68f85 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -1009,6 +1009,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
 	.remove = mdp5_dev_remove,
+	.shutdown = msm_drv_shutdown,
 	.driver = {
 		.name = "msm_mdp",
 		.of_match_table = mdp5_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 20f154dda9cf..0454a571adf7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -397,7 +397,6 @@ MODULE_DEVICE_TABLE(of, mdss_dt_match);
 static struct platform_driver mdss_platform_driver = {
 	.probe      = mdss_probe,
 	.remove     = mdss_remove,
-	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm-mdss",
 		.of_match_table = mdss_dt_match,
-- 
2.36.0.464.gb9c8b46e94-goog

