Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3484B3218
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Feb 2022 01:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354449AbiBLAiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 19:38:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354444AbiBLAiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 19:38:16 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B0E3B5
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 16:38:14 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bu29so14341195lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 16:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fx2z0CufYTJyTYpir6OaLTyO4/xLDcyc75GWCDVFbwo=;
        b=g/3MwNJZ3sMNw6g3ug72TNPOuQHA245Td1UY7zV8Jp7LHXEVrlgebnFBcjAHtWZk+F
         fMCalKwVqKiPVE1yv3dzW/6KheGEqDbc87HHKbYBmzojh0DnVEWfBx72X3QI5P3iBgfz
         4raxpbniCNJEbDPpZaO7zjHeQG2QdnlR4HXeaR8muzfZBQ7g0zgCHOjE+smRi5mPK73O
         SjC5ITr6CFeArI4TVxVfh7sAOtvtuUx/SzmUv0hUclF6ojyK0b3LW2p4nm8td4+k7eUz
         pTiE595E/+2Stond9YXMbhEF1gqTgBz2fq8u33hpMgGf4MdC2sbU3aKugVCjwTUVgF4g
         clXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fx2z0CufYTJyTYpir6OaLTyO4/xLDcyc75GWCDVFbwo=;
        b=1KYsQpQLIemgwIu43IfigI7X3KWuFRJeJpVDyTi7oVigOQn1ARu7mSM6y53s6JKY0t
         e83UGoZEiYzE8WNXEiEYXCUWBWLepG9CSM1FLvOM7fgz5yAXxSDfEpwLMRfWreMKZuJj
         CobcZSNY0DWWmS8lDQ4yiYEDJ1jf8pKEvjZHW9zN6tCgjMgSQpyyKLTGOPUBTsc8zYni
         igpcQSmJRw2MI3+wuuLQ3Vqo9VnBPVDVYjxVUisRP+9a01tfIbZcYNUQuy2W6nH8O3rM
         sE6mpuWVLGQKC3wUHsIshhtBmt5/+C0oCD2EZINSUDYKZQUDiVDSmehfdCwdEP+8zZHE
         kUbA==
X-Gm-Message-State: AOAM531Uv2aBVTpuNGrUZ7StzFE32w8+oE8WshWTTpPz4v/YHapKM+hf
        ISQhXCf1lPbICVQ+oVGij8SfzA==
X-Google-Smtp-Source: ABdhPJxEiiUQkn68ZZbE+++yK4qKDB363KHB0hiEnAhs3j/8PAEw7AfPGwI/l7/SFO2bTfSe/sEhgQ==
X-Received: by 2002:a05:6512:3d9f:: with SMTP id k31mr212281lfv.151.1644626293011;
        Fri, 11 Feb 2022 16:38:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n10sm3207217ljj.106.2022.02.11.16.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 16:38:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3] drm/msm/dpu: Only create debugfs for PRIMARY minor
Date:   Sat, 12 Feb 2022 03:38:11 +0300
Message-Id: <20220212003811.1818774-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

From: Bjorn Andersson <bjorn.andersson@linaro.org>

dpu_kms_debugfs_init() is invoked for each minor being registered. Most
of the files created are unrelated to the minor, so there's no reason to
present them per minor.
The exception to this is the DisplayPort code, which ends up invoking
dp_debug_get() for each minor, each time associate the allocated object
with dp->debug.

As such dp_debug will create debugfs files in both the PRIMARY and the
RENDER minor's debugfs directory, but only the last reference will be
remembered.

The only use of this reference today is in the cleanup path in
dp_display_deinit_sub_modules() and the dp_debug_private object does
outlive the debugfs entries in either case, so there doesn't seem to be
any adverse effects of this, but per the code the current behavior is
unexpected, so change it to only create debugfs files for the PRIMARY
minor.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[DB: slightly change description and in-patch comment]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
This is a replacement for
https://patchwork.freedesktop.org/patch/467273/ with the patch
subject and comment being fixed.
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5f0dc44119c9..c394bd6b2e5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -271,6 +271,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	if (!p)
 		return -EINVAL;
 
+	/* Only create a set of debugfs for the primary node, ignore render nodes */
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return 0;
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 
-- 
2.34.1

