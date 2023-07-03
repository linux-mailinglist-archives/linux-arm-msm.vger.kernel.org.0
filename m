Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06647745341
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjGCAiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjGCAh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:59 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F91FE47
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:58 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6a152a933so58373321fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344676; x=1690936676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKBTuSmWc6m/vBhUXH7Ge8kqDNa4v+VkPqYeWVoQJxE=;
        b=D2KKaR54BK7dLTNQL+gPJYFHqB2bXzAxJo0VXg5ldZk8aDJu5TD5HO31aH8PjbaP7F
         VEFhSwNTxKFGyfq+6yu18fIWmq7Xr4DPYaLvNZ2euPW/BwjalfU8fItSeyrgwOIppQZx
         nCu3I7AG6J7LVVHy+cYAhaSyGt+KGAVfeSQe7vwiLwUaWBal9vy+s3Uhim92zVeN/dO0
         k6YZSy2HdM3PvJZKganTMI74ywq4EMJP07Vc5rVlCAuQwjvPqjYe8XCiMqn7VRFQAE8L
         lnuNtbFXdXoEJUOHQe3BYIJNernXz1oFnMY95ltWjnRqnEMxOTTVlNo6IcX+SH+oxx2M
         41yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344676; x=1690936676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKBTuSmWc6m/vBhUXH7Ge8kqDNa4v+VkPqYeWVoQJxE=;
        b=WC/KK96QfdM4FxkggO38ckqNpYkhlBxuGVcbK8AXk8J7jiM0SZb0nBOy8xek7ZKx3w
         D/IKMdH6kvz+tcwvKcEcojhtr0crTRkORajVSGk7qNfA8RJ0/kdODihI0d3arXiHZcxK
         O6JxA75llGqlZedCpsDFDzoqpQoMyB/OlbAwOTfVD7RD0+FEW7UDYO9zXnsVU+cjW3K6
         mACs6LERcZN0Pjq11F7/GuVOJqeuU7tfHTr3Dj9dWKPYkFjR+NzbCs+02nKBKUo/VOUd
         Z7oG9KN/Zw4V9j4LMtqIaCLeJ2ppDTUBxffo7/DcFgGn8XROZ9Qyaqj0Z23/qpOE7Vrh
         6rPw==
X-Gm-Message-State: ABy/qLbpeoNmFyZAfHJeG0Nc3Z8keBPAUn2M1oj6Nni8je6/WFtGGBls
        EgAnEWkMDBguVFYA9Sn3Nd8/8w==
X-Google-Smtp-Source: APBJJlE6U0fecDvP6B4B/j7NsX8K79v1J/m+hXQSir44s2OaIGnsJVjeEfunwHF45FXBM+kmeDs58g==
X-Received: by 2002:a2e:3508:0:b0:2b6:98c3:7a70 with SMTP id z8-20020a2e3508000000b002b698c37a70mr5451330ljz.41.1688344676723;
        Sun, 02 Jul 2023 17:37:56 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:56 -0700 (PDT)
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
Subject: [PATCH 12/13] drm/msm: make fb debugfs file available only in KMS case
Date:   Mon,  3 Jul 2023 03:37:44 +0300
Message-Id: <20230703003745.34239-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

Don't register the 'fb' debugfs file, if there is no KMS (and so no
framebuffers).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 06fc632fd6f9..04d304eed223 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -266,6 +266,9 @@ static int msm_fb_show(struct seq_file *m, void *arg)
 static struct drm_info_list msm_debugfs_list[] = {
 		{"gem", msm_gem_show},
 		{ "mm", msm_mm_show },
+};
+
+static struct drm_info_list msm_kms_debugfs_list[] = {
 		{ "fb", msm_fb_show },
 };
 
@@ -314,9 +317,13 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	if (priv->kms)
+	if (priv->kms) {
+		drm_debugfs_create_files(msm_kms_debugfs_list,
+					 ARRAY_SIZE(msm_kms_debugfs_list),
+					 minor->debugfs_root, minor);
 		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
 				    dev, &msm_kms_fops);
+	}
 
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
-- 
2.39.2

