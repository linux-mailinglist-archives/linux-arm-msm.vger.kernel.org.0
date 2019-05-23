Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D4C284B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 19:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731140AbfEWRRO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 13:17:14 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41034 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730924AbfEWRRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 13:17:14 -0400
Received: by mail-qt1-f195.google.com with SMTP id y22so7630112qtn.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hZe31Z2x4VZIoxtbM4ZpRRber9rntpgDGP2PgN5budQ=;
        b=b3u8Er9VI4JeQuWJ/pKPImBGjjHWw+5VyWes76BQby1qFilLFyRvguFRcg+EjEZ72N
         Iy8uiJIgS21AY13yoVx2lAKHp14UAzvZDzRYLYsqGOF7G0N/uXdqIj0hFD+AQsHLRnyp
         ib80Eiy/80UZ1pYDBN3JfBAC6sFN8VfoTKHxMSnZeQAdEnLVetLjJ6hsH4d+V0dK2tSJ
         Q6y4weOLCjuVD8ttzNYu4cGQaKmCx16rsLgH9bbWiHfeD2jqYyNtXlhkePcqLB3CROyz
         jKfANJS9/vInV8vQuBdNvhbvKw4IShqwFetNDLeB/ifaR6RsgTuoRCz6Y9WJbn2nBusU
         r9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZe31Z2x4VZIoxtbM4ZpRRber9rntpgDGP2PgN5budQ=;
        b=r9nT1fTzxGS8PslVMWg7JyyXq9//CXNFEOsSrz13GEzXn4p1F9SpWurEQh4LzQw1fn
         4PQQJNahhfovGglsMjz+/aDWwjS9f5fX+ZA9Oatev4iJgVIWtukmYpJEPkSLJEd8evnY
         VdMGGFX2EXizqBQcDl0YfBwaQLc5uc9SGQ8PAPOdJswdXNkdTE4rxa9a7Xy0U+WRvYsc
         woAkC1SPIQ63nb3qjXpUcukuMTG85pTLqSEbqBZ0FpmzQFmrK4KeKAM5Cfoa7TIh6ad/
         vtGMOam82+y4XBi9t7dJGrJl+7S9qzYaj8rcd68qxpx8Z/mdNRSO4cKaFBje+Z52lMZ8
         kvHw==
X-Gm-Message-State: APjAAAX+PyeAQHew4cFLSQ3m1BIqMHzxjVQvUNOWBi5247yaNJitqBP5
        rG2U8L3aPSyX8LKtfSCmGYr+Lw==
X-Google-Smtp-Source: APXvYqxRprHyHT6NlQk7WcwvlRTrpIwhUGLkLhawVE7G3xLGTBOWzBMT9iOE+OiXjWCjQTl9u9p9vw==
X-Received: by 2002:ac8:2fa2:: with SMTP id l31mr43692903qta.277.1558631833831;
        Thu, 23 May 2019 10:17:13 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 10:17:13 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 6/6] drm/msm/a6xx: Rename a6xx_gmu_probe to a6xx_gmu_init
Date:   Thu, 23 May 2019 13:16:45 -0400
Message-Id: <20190523171653.138678-6-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This rename makes it more clear that everything initialized in the _init
function must be cleaned up in a6xx_gmu_remove. This will hopefully
dissuade people from using device managed resources (for reasons laid
out in the previous patch).

Changes in v2:
- None

Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e2b839b5d3bd..5ab69dcd5479 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1259,7 +1259,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->initialized = false;
 }
 
-int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
+int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct platform_device *pdev = of_find_device_by_node(node);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e74dce474250..1f9f4b0a9656 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -854,7 +854,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
-	ret = a6xx_gmu_probe(a6xx_gpu, node);
+	ret = a6xx_gmu_init(a6xx_gpu, node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b46279eb18c5..64399554f2dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -53,7 +53,7 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu);
 int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 
-int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
+int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

