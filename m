Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFCFAC237
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 23:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404586AbfIFVvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 17:51:04 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42159 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404236AbfIFVvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 17:51:04 -0400
Received: by mail-pg1-f196.google.com with SMTP id p3so4244987pgb.9;
        Fri, 06 Sep 2019 14:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eDpX53pV2w3525Sfc++y574jdtjcTxKRU6k4wrPYJJE=;
        b=R7tJANYP9RC8vMxjaiQJQysGREeC4SukBKwQay9FF+AMJE+MvsYVBFrsati6KaggWM
         VWkpRA7WPb67hbvt9c4rmHWNClvfUZwODODfoY+fH9crahdylzEddDD/2NidH2MKqLAp
         Iapm/hiz0A2mDeZEclyVm+SdU1bJGoc8FP6NklRbcl5IksRx0lwTVYI5cealjOhS7XYM
         gitoGxs4V3Z1Ekpym5seReRqr8Hs7DrGi6GbW553Hr4d3wKFAx1oTU7V3ez1y5WfY1gc
         2nf2SwaiX5AwY5cE+npxZbJaQLMTapIZxsY6RSypeBRKrquK9OECMgG8670DMSeZaHyp
         Vsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eDpX53pV2w3525Sfc++y574jdtjcTxKRU6k4wrPYJJE=;
        b=sZ9nmtGoUKt/aa0fefSOhnURt5p7IOqXJsH1cmcprbc9kTIeD/HXaa7MLC2/z4RHC/
         2RQIcFXMbvd06KMJI1Esdf22VC5lFe6UsriE2iCLnKAjs2ApTd+zyD/SwsH6Y9OeGztr
         oDDK1z8KerqH5BGcUpLriGXc+yRjQovk+KTEuc7ys+Y5PlebfjFqEDukciwi/t0XL8V3
         4WUvXyvdqjwE/LLFpbu3cVWOhLR+3ALF6Gu9/0ZWVWyi04/lq4Fu/s2CgOVRyyTpBVUH
         BckYg8xBp6V0UrB4at3YgM2jiH5L88FIYN0Ex0L98RbMsdAj4ada6+9nzPTJxJhhapRs
         OfbQ==
X-Gm-Message-State: APjAAAWTJ7moDPoouKPlFasFpUKN893OA7B/kq2Won1ZV3Uy+Q3h+ciB
        egcvBOx5X7gtDR2JACIjFaE=
X-Google-Smtp-Source: APXvYqxxmn9ULbrQFMLJEtMySO7JBNQkpSXC7k9Y2QPcQyK5SFcavLc7RGYi6hNSQ6p9Iz352cwvcQ==
X-Received: by 2002:a63:484d:: with SMTP id x13mr9803253pgk.122.1567806663646;
        Fri, 06 Sep 2019 14:51:03 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id g14sm6823936pfo.133.2019.09.06.14.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 14:51:03 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Enrico Weigelt <info@metux.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm: mark devices where iommu is managed by driver
Date:   Fri,  6 Sep 2019 14:44:02 -0700
Message-Id: <20190906214409.26677-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190906214409.26677-1-robdclark@gmail.com>
References: <20190906214409.26677-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 1 +
 drivers/gpu/drm/msm/msm_drv.c              | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7f750a9510a5..19f2bd2d6cb4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -452,6 +452,7 @@ static struct platform_driver adreno_driver = {
 		.name = "adreno",
 		.of_match_table = dt_match,
 		.pm = &adreno_pm_ops,
+		.driver_manages_iommu = true,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5751815a26d7..dec8cc6b64dc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1094,6 +1094,7 @@ static struct platform_driver dpu_driver = {
 		.name = "msm_dpu",
 		.of_match_table = dpu_dt_match,
 		.pm = &dpu_pm_ops,
+		.driver_manages_iommu = true,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index d93de3a569b4..eff1b000258e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -1134,6 +1134,7 @@ static struct platform_driver mdp5_driver = {
 		.name = "msm_mdp",
 		.of_match_table = mdp5_dt_match,
 		.pm = &mdp5_pm_ops,
+		.driver_manages_iommu = true,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3a4fd20a33e8..336a6d0a4cd3 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1388,6 +1388,7 @@ static struct platform_driver msm_platform_driver = {
 		.name   = "msm",
 		.of_match_table = dt_match,
 		.pm     = &msm_pm_ops,
+		.driver_manages_iommu = true,
 	},
 };
 
-- 
2.21.0

