Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B27716B29
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 21:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfEGTSb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 15:18:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50268 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfEGTSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 15:18:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D322E61340; Tue,  7 May 2019 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256701;
        bh=WmAf8oFe6jYa0ZDJBfWK83oRQDbYixmX8SwEtCrRmRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J842SbsUNGi43C0ZcefrYcJAiKXgRAnvHSM0h2ZOqg8w+7YClM78psIZJAGY3upmp
         q7JVB7RHaUL40Rj47pWB7X7NyTx1QzB8GtFzoMHEXCxFBsHysxQQyXiA69WfLNzi6w
         JDYnTGF+al7zS/gEi+RBS9Ru3ERax3UiARkP9DIY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0104B6122D;
        Tue,  7 May 2019 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256699;
        bh=WmAf8oFe6jYa0ZDJBfWK83oRQDbYixmX8SwEtCrRmRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BP4m2EGtwQ8mxr/7UXXTDo0zZpiO9oFVEL2ql5XL1QYVf9ODAftOh7G6S6cqnbSaq
         TeTOu6iI9vOdnEEztUWhRqh8oD6Q69YQwxA7RTMhQJ0rJ7mlCvcEd+p0bT+btJU8C8
         DLcJTnL0Ih4V7/1pLLW3Cdw515RoChoUMRR0JL2k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0104B6122D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Bruce Wang <bzwang@chromium.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] drm/msm/dpu: Avoid a null de-ref while recovering from kms init fail
Date:   Tue,  7 May 2019 13:18:10 -0600
Message-Id: <1557256691-25798-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
References: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the failure path for dpu_kms_init() it is possible to get to the MMU
destroy function with uninitialized MMU structs. Check for NULl and skip
if needed.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 885bf88..1beaf29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -56,7 +56,7 @@ static const char * const iommu_ports[] = {
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
 static int dpu_kms_hw_init(struct msm_kms *kms);
-static int _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
+static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
 static unsigned long dpu_iomap_size(struct platform_device *pdev,
 				    const char *name)
@@ -725,17 +725,20 @@ static const struct msm_kms_funcs kms_funcs = {
 #endif
 };
 
-static int _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
+static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
 {
 	struct msm_mmu *mmu;
 
+	if (!dpu_kms->base.aspace)
+		return;
+
 	mmu = dpu_kms->base.aspace->mmu;
 
 	mmu->funcs->detach(mmu, (const char **)iommu_ports,
 			ARRAY_SIZE(iommu_ports));
 	msm_gem_address_space_put(dpu_kms->base.aspace);
 
-	return 0;
+	dpu_kms->base.aspace = NULL;
 }
 
 static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
-- 
2.7.4

