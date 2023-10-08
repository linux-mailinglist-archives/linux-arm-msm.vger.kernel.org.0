Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F507BCE8E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Oct 2023 15:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344784AbjJHNX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Oct 2023 09:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344778AbjJHNX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Oct 2023 09:23:28 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6C5C5
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 06:23:24 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c131ddfeb8so41659841fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Oct 2023 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696771403; x=1697376203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2idug8K8OwT9Hkyo7LhZdc3aUSwi5P2oZ6NFnNiB8oo=;
        b=Gq88azTzEQOH6F18BBj1HYQzM0i6o7teHenFuPOjigQqSkww/6QZRKiMJWlcmnvM6v
         6+qH0pywQ7s3+YzzOCNvNhyl7CU3mDf7+tFhcVGvZsHvanXwUBpaQ2Xy2enKcWPvSgI9
         FFWO8duTO17XZPfR9KE62baTEqw7pL8tFpcIJMki7+CSEqc8JzVffkrx6BZnqj+/ENT5
         +Zf2blhhLQNEEfB7J/yNAJlFV+0zpXHNjMwwvnBIHrNvdhz323kXk3ry6a4ZQjWWgvo4
         D4xjVPMqrqsOSfpBIX8zR8W/MhY82W0A6r8kaThOlO4WfscNUgDt+Ly+rGcEV58yhq5x
         4MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696771403; x=1697376203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2idug8K8OwT9Hkyo7LhZdc3aUSwi5P2oZ6NFnNiB8oo=;
        b=UsMfs+bDD9WD9SeZBRM87OyAovlp/7TmJZABwy5OoS882TGE25nC1sTRXtrnb/afNf
         GusCOw1POk5LrIGE3HZbDvOhtAuu5Pzri018OkbHDAlV0qxd7NpwKqcYJj0AMgxF3vkY
         92ykZCY4HombRIKR2mAHrA+oSV5M5iQlH75ait1895TQW7F9X6Yds/SXM1mfrClEstMK
         0AVaEMyl9nMnH5MdRAHoY4q3gR6P19PAAhxGwhA9SCpLNCXJeUjqi9pqsKJCKgvWyPHI
         CiKduTar+p7A7pNjF1hL26W9DGjVGIIG1JvRgWUs0Y0lmPsfZkTgBmq3dmiaPc4uD6xy
         q1PQ==
X-Gm-Message-State: AOJu0Yx7uADDS92jI4cL0iOa77ibjoc8veWLEr64apPtiKaX0BxEon0T
        IHSWaQnGsLsK3qXv3N6HDa//gg==
X-Google-Smtp-Source: AGHT+IHx14cJCtO/hU+EHIKoCHvXz2+uwXHhfV805Hh9E7uMBZQVVQWt2RfyIdHXS1b0gOOtFmV5Fg==
X-Received: by 2002:a05:6512:531:b0:4fd:fabf:b6ee with SMTP id o17-20020a056512053100b004fdfabfb6eemr10670377lfc.9.1696771403150;
        Sun, 08 Oct 2023 06:23:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.170.82.148])
        by smtp.gmail.com with ESMTPSA id c28-20020ac244bc000000b005046bf37bebsm1083219lfm.57.2023.10.08.06.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 06:23:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] drm/ci: pick up -external-fixes from the merge target repo
Date:   Sun,  8 Oct 2023 16:23:19 +0300
Message-Id: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
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

In case of the merge requests it might be useful to push repo-specific
fixes which have not yet propagated to the -external-fixes branch in the
main UPSTREAM_REPO. For example, in case of drm/msm development, we are
staging fixes locally for testing, before pushing them to the drm/drm
repo. Thus, if the CI run was triggered by merge request, also pick up
the -external fixes basing on the the CI_MERGE target repo / and branch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/build.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..20a6ba8a7b04 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -64,10 +64,15 @@ if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-exte
 fi
 
 # Try to merge fixes from local repo if this isn't a merge request
+# otherwise try merging the fixes from the merge target
 if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
     if [ "$(git ls-remote --exit-code --heads origin ${TARGET_BRANCH}-external-fixes)" ]; then
         git pull origin ${TARGET_BRANCH}-external-fixes
     fi
+else
+    if [ "$(git ls-remote --exit-code --heads ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes)" ]; then
+        git pull ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
+    fi
 fi
 
 for opt in $ENABLE_KCONFIGS; do
-- 
2.40.1

