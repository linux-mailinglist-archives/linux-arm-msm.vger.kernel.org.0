Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBD674533F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjGCAh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjGCAh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:58 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937D2E46
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:57 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6a0e36d42so46969411fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344676; x=1690936676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7GwLdWUZVT1Ti3y8jUA1Y6eL5SvuXMoiLEPs7RJxLY=;
        b=QNNnPQQ7dz3xZB2ev0BD7VEVrGaMkcM2tKSTv88yUcMezVqyKYeVdzKNsvehicWi2n
         PKFrwHTrZuNCIzFRLqaG7p1PwS8xQNbvKqZWNMALbZk2ylClaH4h0IqhjmYzhjnPm8h4
         LZcQbcItjVHRC7t5riXOR37329lDjDrCuJocVBrKSiMgK29gedWxLyvxwj3Irccxc4oG
         EvhlcAMAMfXPF17X+Fd3v5hy1tOq3tix0l4VRzQtjcTzrAGUD/oyD1GOBR14xnxYn+bz
         BHclThixPj6tclubtQkRJisBAPEaBiImHyeUz/Yx1RQYEG8dTvmyXJQODFQl0ezXqbZM
         +4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344676; x=1690936676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7GwLdWUZVT1Ti3y8jUA1Y6eL5SvuXMoiLEPs7RJxLY=;
        b=Xn2fltCp2w1xY22Tve8q3vgigXDBlU4Ni5eO5IdqUIs0qz9aUAmiiOFgwQdwW1eJI2
         UyhpqRVj8zj+fWSRx3+cek29GudrgyuFeujAea14WrkexuvSVPTdTm5BBAzEkjFwMViZ
         jhfyX5JfeOxwSahwJwDzABU0b4/9CbPxDbMiZHgyNcb/35VS776KuRIAqorIxqJqmq+0
         ImrQActipZWVUAQcKdit3szremaPtnor8e58XJjiduZSx2OiupsUidIbeD+e7dOGt1J/
         T1wRvWAYzANmqLEyXV5YVRItfJYFoYYIn3nD7vtIp/G22bqov3hg1sRs0BUcxpUrH68n
         p1iA==
X-Gm-Message-State: ABy/qLYg57H8uvp9RSyPrliMkSuvHaarnFvA7OZI6TIm5ZSLSxfoCjyj
        EPUPV0P13Swmihv7NG5LVl+5zg==
X-Google-Smtp-Source: APBJJlFKRoblJGMV6xQ3svB6jx8CgG7VOpUhAHBXfpfUHeZCmBR7GQEL8V/eIHQSK5ZNriWsQ9dXzA==
X-Received: by 2002:a05:651c:2ce:b0:2b6:d956:79d4 with SMTP id f14-20020a05651c02ce00b002b6d95679d4mr1708631ljo.14.1688344675998;
        Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
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
Subject: [PATCH 11/13] drm/msm: only register 'kms' debug file if KMS is used
Date:   Mon,  3 Jul 2023 03:37:43 +0300
Message-Id: <20230703003745.34239-12-dmitry.baryshkov@linaro.org>
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

There is little point in having the empty debugfs file which always
returns -ENODEV. Change this file to be created only if KMS is actually
used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index a0a936f80ae3..06fc632fd6f9 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -314,8 +314,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-		dev, &msm_kms_fops);
+	if (priv->kms)
+		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+				    dev, &msm_kms_fops);
 
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
-- 
2.39.2

