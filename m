Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946321F909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 19:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfEORBH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 13:01:07 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39287 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfEORBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 13:01:07 -0400
Received: by mail-qt1-f196.google.com with SMTP id y42so486081qtk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZE7g/HGauausRDTK6bZw/q/K+Gnd9OS+XsSVo0GduUI=;
        b=P7qIIA/qcOgl9iUWmNJT4dv7IVphTUQWjFwSwh3SX2rrflcjjeSGKiF5UFInKtBH+Y
         WEtBBwkRWy0nZbCSC2thQEBxDvr8GY9jAgoBY++4LiJ8JPAhhV+u3V1A3X4jzE7UORMY
         dqX5CSnv7c+JrmFgu6wbyaG93t1sfhxF6E3wsOI2zKJ34XanLHagzRf2OUA017jVAtP5
         j4I7gpYUCjLYJnZ+OXDp+WrDKlZuwKwI9fFtijzx6cYuF0DrE8Bimef9jVOxop5TQGIB
         ux2I6KZ9tqb2qhyOiSb1ch3xRq+jbUxiIW1Qa11gVOwoTj10QgVlBAM4KAo1JthByqj0
         72Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZE7g/HGauausRDTK6bZw/q/K+Gnd9OS+XsSVo0GduUI=;
        b=e8MticREV2Og+IwNF8sO0MGn8NujNlenSOxwRK49NIWQFa1YgqZpKTNgBJzjAhYkcZ
         4Yboh12rO9yHQrmMaOCkbTrh+7oDu7aUpmu5OKDkJ+AF4OwqGMnGpwHow1FdXwcCv/ht
         p53yNrilI6DS8g7Y+iVZHlONL1fOSkTnFflyv+neGVgqqDQPip9wbLQmuF7viiiNFzGW
         s4uGgiWl1Ik0qgVdSNa6O0XfV8++Ti5Kgg/AaB5FYgiPqo/aHxKPPZ6BnJ+jQkYfLJXv
         bSei9oGZjf9Jbt1l6si5hffeiec2gcC3G7upq1MMCtdyFljrGxnl9PFqhxrbHSc7qieu
         rDJQ==
X-Gm-Message-State: APjAAAW7todrl02BuDcoxESqdVi0uWy2VhN2dHumeroOwcYDnijHjg81
        SfCrAFB3EfYklpa9UJHk/pAi8Q==
X-Google-Smtp-Source: APXvYqzLdXfuFpI0sV/8xgRItzIbC+3nYZhFJaitBs9ADziTO4/uBh4d2TolOL9dKNIG9a/UkMfzUQ==
X-Received: by 2002:a0c:a91d:: with SMTP id y29mr9117072qva.0.1557939666252;
        Wed, 15 May 2019 10:01:06 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id k63sm1100934qkf.97.2019.05.15.10.01.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 10:01:05 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm: Upgrade gxpd checks to IS_ERR_OR_NULL
Date:   Wed, 15 May 2019 13:00:52 -0400
Message-Id: <20190515170104.155525-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

dev_pm_domain_attach_by_name() can return NULL, so we should check for
that case when we're about to dereference gxpd.

Fixes: 9325d4266afd ("drm/msm/gpu: Attach to the GPU GX power domain")
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9155dafae2a90..38e2cfa9cec79 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -747,7 +747,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	 * will make sure that the refcounting is correct in case we need to
 	 * bring down the GX after a GMU failure
 	 */
-	if (!IS_ERR(gmu->gxpd))
+	if (!IS_ERR_OR_NULL(gmu->gxpd))
 		pm_runtime_get(gmu->gxpd);
 
 out:
@@ -863,7 +863,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 	 * domain. Usually the GMU does this but only if the shutdown sequence
 	 * was successful
 	 */
-	if (!IS_ERR(gmu->gxpd))
+	if (!IS_ERR_OR_NULL(gmu->gxpd))
 		pm_runtime_put_sync(gmu->gxpd);
 
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
@@ -1234,7 +1234,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 
 	pm_runtime_disable(gmu->dev);
 
-	if (!IS_ERR(gmu->gxpd)) {
+	if (!IS_ERR_OR_NULL(gmu->gxpd)) {
 		pm_runtime_disable(gmu->gxpd);
 		dev_pm_domain_detach(gmu->gxpd, false);
 	}
-- 
Sean Paul, Software Engineer, Google / Chromium OS

