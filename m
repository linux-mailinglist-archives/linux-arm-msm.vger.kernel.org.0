Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C3A2CE64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 20:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbfE1SU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 14:20:29 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:34559 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728009AbfE1SU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 14:20:28 -0400
Received: by mail-yw1-f67.google.com with SMTP id n76so8296902ywd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2019 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hAfYkP7d2WvxOZhRBCRJTvRlF3xI0tTIFNDwNnfuAj0=;
        b=a0NY7VDvpEmMWaYG5YjSTHdlm8A5dz8YOT5/Xl9Ux5S6KbPv++phJXKQF8BvVN4gWD
         V0DBcUmq3FBXvTN8Mt3I2DTnvQOZXGI/z0DWr8qYOHrPPkKNiFxYequiXKor8A5/+EMf
         0oOgivtgIH2p4O//6kWq0JABwPVyU7qu4HrrMraxoJJ6HBD/hL9ir0Ahq9OHkHduN92m
         C+tsy4+c0xnlQkCcwOimJ/v5wbY8Xaco9PAdQ87wWEn/455XsCQ8CF4NH+ZY/TiZU9aQ
         SX1Qz0G9hGfWwabmpms6yvliBLge0mMgzzWhmbraS1/wQkbvb0bty6in5XUSoGJ+9mi/
         /ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hAfYkP7d2WvxOZhRBCRJTvRlF3xI0tTIFNDwNnfuAj0=;
        b=JFPUru3G2aJKB1vY6Yols2itQt8GamcB8Q0jjKHMNMibOGOVXadmsNtq09GOixCysM
         Fhm8+hQhXtlt6KyoxMkIBXLiAAd4vOwMqy7FH/xZlzXFObZwocdTBfaGMwVcEw0JrZ2j
         dOT0Zj8CSp+fbprh9v9FhPG6xWPxQ81ThKNDq9Wm+mpNEWW4HcHupnnYb3m2D7h2I+9Q
         d/Mk1ZHRb6Dr1nCSobPvCkI722FlFet8o9PBKz7Rm30rm6bgVfNDOJMRbVxlK4d7ijjF
         dMghMgh9N93jMG6I9CHKJcCuItGTrxaur4F8kB0Bk7shFC6j9key4y1OoxzoQR+L4eUn
         p4sg==
X-Gm-Message-State: APjAAAVBGO2ylkJGUt6PFlhU+kld4iYNskTJLlezpj2SaYbC8Zw690Vj
        QS/6jUre+dmjo02J/b1Xn+jS8Q==
X-Google-Smtp-Source: APXvYqwUsfLazM7BEkisBngaW/I05sfnDAWIIJL0Vzx/L8WKxqwvneq/w5ljZFczCxQdQccqOws/ow==
X-Received: by 2002:a81:2509:: with SMTP id l9mr58358293ywl.223.1559067628009;
        Tue, 28 May 2019 11:20:28 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id b1sm1113847ywa.70.2019.05.28.11.20.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 11:20:27 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Fix mmu init/destroy functions
Date:   Tue, 28 May 2019 14:20:10 -0400
Message-Id: <20190528182026.244751-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

There's a comment in _dpu_kms_hw_destroy() that reads "safe to call
these more than once during shutdown", referring to
_dpu_kms_mmu_destroy(). Unfortunately that's not the case, mmu_destroy
will fail hard if it's called twice. So fix that function to ensure it
can be called multiple times without burning.

While I'm at it, fix the error paths in _dpu_kms_mmu_init() to properly
clean up the iommu domain and not call _dpu_kms_mmu_destroy() when
things are only partially setup.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 885bf88afa3e..d50afbb37a0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -729,12 +729,16 @@ static int _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
 {
 	struct msm_mmu *mmu;
 
+	if (!dpu_kms->base.aspace)
+		return 0;
+
 	mmu = dpu_kms->base.aspace->mmu;
 
 	mmu->funcs->detach(mmu, (const char **)iommu_ports,
 			ARRAY_SIZE(iommu_ports));
 	msm_gem_address_space_put(dpu_kms->base.aspace);
 
+	dpu_kms->base.aspace = NULL;
 	return 0;
 }
 
@@ -754,25 +758,20 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	aspace = msm_gem_address_space_create(dpu_kms->dev->dev,
 			domain, "dpu1");
 	if (IS_ERR(aspace)) {
-		ret = PTR_ERR(aspace);
-		goto fail;
+		iommu_domain_free(domain);
+		return PTR_ERR(aspace);
 	}
 
-	dpu_kms->base.aspace = aspace;
-
 	ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
 			ARRAY_SIZE(iommu_ports));
 	if (ret) {
 		DPU_ERROR("failed to attach iommu %d\n", ret);
 		msm_gem_address_space_put(aspace);
-		goto fail;
+		return ret;
 	}
 
+	dpu_kms->base.aspace = aspace;
 	return 0;
-fail:
-	_dpu_kms_mmu_destroy(dpu_kms);
-
-	return ret;
 }
 
 static struct dss_clk *_dpu_kms_get_clk(struct dpu_kms *dpu_kms,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

