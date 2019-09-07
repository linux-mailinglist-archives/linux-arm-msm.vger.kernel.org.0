Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9D0AC87A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2019 19:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389508AbfIGRuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Sep 2019 13:50:23 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42787 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389229AbfIGRuX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Sep 2019 13:50:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id w22so6596638pfi.9;
        Sat, 07 Sep 2019 10:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wK8kJ2udIf0g3BsyoIaHFt8dADR/WXvxfITihNsDeFg=;
        b=Gwsp7VRn4r5cDdw7eygkYZ/sszfgRBn/LNffK8rKLuU3OXDMBJBQUafVm/8/Ym6kxl
         K6awj9C0Ux8gpf0vABsHPwAIKvMSSj1HLTzzX71l0KzyvaROHC2yWEmvxZUqIwm2nmrV
         lmAcCTAPwuKZNItjsz1tvAaLHs33eilTvmINw0ZqMFmLGcHNMeEFjmq9aeDH8XSCV7Je
         T+U7wuABMQprBiDBJ/RIg7QDfuYLkWl0B7++OvQOJnlTCNrryYx3AgCOz1cGCJhWOuVk
         XyZoKGE/8NngV3NN1lmVf04Gjw36Ts1U5JbkQX6QXEPMa5FYJCQ1regZqneDUa94+wOD
         YkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wK8kJ2udIf0g3BsyoIaHFt8dADR/WXvxfITihNsDeFg=;
        b=HYNn3an0qeFew7Jr+XWBsgd/0Yv3Sfa1Jbi7aRGhgwVM/pZlfjToeUwg1+2BrVH0Gs
         aRhHhgBg8nnlAExKvDAdRv4pONYe/x5qJajGPvRZfcdg2++MRXI2qyn5INCvr5CIw6Bh
         KrCz3YAbOMZxm6H2BiItegllOd4O2T/gutysZ82cp6h0re/q0wbj5tkDDlbEQBgg8Ca1
         4tQcd+NyGiCt9PUCLOMC/jxbSkkMHmguJebHvD4Jr7L9okICFHEd5GuYcPoSVi600R5G
         QznwpRoHdKR5f46BLln2ZmTOvbNxhJRsRjPdnonbYEybKBG0VTu+lXak0jJMQ9F/Iil3
         M3zQ==
X-Gm-Message-State: APjAAAXzcrXoLLbi0tsSa1x4iFKYN7nXfoGBpI6MDbqvTEpNy3o8NAZO
        2jrqlakA3Bf2bWMfWElZ3rk=
X-Google-Smtp-Source: APXvYqzafbPVLonS9mDnmRUFSlGT5UrLrAnZgt7eKA+ZXKBawYn/MhQ8WUF6BIH88qCUmZL2MEVRGA==
X-Received: by 2002:a65:6795:: with SMTP id e21mr13501884pgr.428.1567878622201;
        Sat, 07 Sep 2019 10:50:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:e554::8610])
        by smtp.gmail.com with ESMTPSA id 11sm8401943pgo.43.2019.09.07.10.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2019 10:50:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/arm-smmu: fix "hang" when games exit
Date:   Sat,  7 Sep 2019 10:50:13 -0700
Message-Id: <20190907175013.24246-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

When games, browser, or anything using a lot of GPU buffers exits, there
can be many hundreds or thousands of buffers to unmap and free.  If the
GPU is otherwise suspended, this can cause arm-smmu to resume/suspend
for each buffer, resulting 5-10 seconds worth of reprogramming the
context bank (arm_smmu_write_context_bank()/arm_smmu_write_s2cr()/etc).
To the user it would appear that the system is locked up.

A simple solution is to use pm_runtime_put_autosuspend() instead, so we
don't immediately suspend the SMMU device.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note: I've tied the autosuspend enable/delay to the consumer device,
based on the reasoning that if the consumer device benefits from using
an autosuspend delay, then it's corresponding SMMU probably does too.
Maybe that is overkill and we should just unconditionally enable
autosuspend.

 drivers/iommu/arm-smmu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index c2733b447d9c..73a0dd53c8a3 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -289,7 +289,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 {
 	if (pm_runtime_enabled(smmu->dev))
-		pm_runtime_put(smmu->dev);
+		pm_runtime_put_autosuspend(smmu->dev);
 }
 
 static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
@@ -1445,6 +1445,15 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	/* Looks ok, so add the device to the domain */
 	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
 
+#ifdef CONFIG_PM
+	/* TODO maybe device_link_add() should do this for us? */
+	if (dev->power.use_autosuspend) {
+		pm_runtime_set_autosuspend_delay(smmu->dev,
+			dev->power.autosuspend_delay);
+		pm_runtime_use_autosuspend(smmu->dev);
+	}
+#endif
+
 rpm_put:
 	arm_smmu_rpm_put(smmu);
 	return ret;
-- 
2.21.0

