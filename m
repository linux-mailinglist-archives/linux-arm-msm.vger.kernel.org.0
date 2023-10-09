Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2507BE8EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377484AbjJISKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377457AbjJISKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:53 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D840A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:52 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50567477b29so6217628e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875050; x=1697479850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMPNImdJ1XH1qKLcBF8egU3WJE3EwSdEbTA3EmbAyxE=;
        b=r9Uhgx14W+xAXrUCjDjTfqeU2/keBFNRH9E2HehNh7AJA7YHakniPVRrLMURmW+T56
         mMb+1NbUjisMfGYQmzQt05NFtrKAp91fagP2bnJdhu2tnMgSv7qo0OmenZ6hjRtYkLES
         FgrRGBcRewypnb+WcYPlg/FrlLrXO0q/FImE6+UGsNHSQ32t7eREzBciO5OAQT9trgMv
         c8Rdh3DDsgrFeo+0eypCIBxicISlXUtVz4ea+sQLmVMg4TQJoTh5AGopb81GKd6+XCQX
         UAUgkdubVz/xUYsW7MBhs7rpihJ3vnfVNLCivuN4P+XakaDy9sn6RsoyXIIha1VnnH1n
         lmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875050; x=1697479850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMPNImdJ1XH1qKLcBF8egU3WJE3EwSdEbTA3EmbAyxE=;
        b=rItC+50O7p3jw4VPK5wTod0iyrmJCAWCJvjh107iHJ5LljSkWFv3xRgZoQs6g54N1f
         ElpsYvc2TAtXUmj0HtRsfJtPbnQApMTz1L3H+f3L6RlMLXYarlhPEVLmK5Vk1WAUx46c
         S0SGrZeikMtONIuJlzRMaWC3qyAAzM7JWVuHSp8jDa/1naLA0ugcK/yqsqNtrgCFQdAh
         ArJbT5UOPZRYMvDQzgd7lGVPgZ6u98fsSn17+30kIu5vHKn732hC7POLxHy0PzkZrcwC
         xCLyX3LlQQNdCBq8aQbt6a8yagLtprXIEJV5nqke3vH6aK/FJgUa9si2l5TubQtmkSsq
         3ygw==
X-Gm-Message-State: AOJu0YxlawDRKdQQxPVllz3QbzAPzRBMYFOyBWQgXR/LGCIaA8ud9QBO
        96hmxXcbRs9PA/FiqW+hNGnY0Q==
X-Google-Smtp-Source: AGHT+IGxFWo1cv7MZPWO4e5pj8qUwRrrnJfIcbY5MCcf9WtFviJE0fE4zMGxdE7ohyapXkTdwdxUSg==
X-Received: by 2002:a05:6512:3b29:b0:503:293a:dc1b with SMTP id f41-20020a0565123b2900b00503293adc1bmr17109215lfv.30.1696875050408;
        Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
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
Subject: [PATCH v2 11/13] drm/msm: only register 'kms' debug file if KMS is used
Date:   Mon,  9 Oct 2023 21:10:38 +0300
Message-Id: <20231009181040.2743847-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is little point in having the empty debugfs file which always
returns -ENODEV. Change this file to be created only if KMS is actually
used.

Reviewed-by: Rob Clark <robdclark@gmail.com>
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

