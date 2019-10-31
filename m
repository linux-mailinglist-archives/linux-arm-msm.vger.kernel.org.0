Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2802DEB8F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 22:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbfJaVdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 17:33:25 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44541 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfJaVdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 17:33:24 -0400
Received: by mail-pl1-f194.google.com with SMTP id q16so3301906pll.11;
        Thu, 31 Oct 2019 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVsbwFP8AeKgn5KuqXlWOVRdSf7M1xugTS7jUvEVQtc=;
        b=oU/f2dvCHCBjQ55JB95SZcIANhYyJ9ITAqAZyUPy+8WCm30d3ew7K9ot3ljlismeG0
         64ZZ6rY+w87JZZP2/a/NOpuKpPQSzTOlD6tYFFErCKbk2o/d38myrMyLZHkj0eGMRWrK
         ZO4/0jwX0Y6hEQ1RTWCi/Wj/qeV6Wo9aIp8ZOQwP8c7XCPdeYxXsyETJzw4XyKMBU/lz
         qM9LlLfdRcPdbBy3/9gWJq9L5Nx5jDZR2yKoRwucfTLbyKtZ15BBcdJfb9rJadDqa8HN
         cFg/4VEnXCe2aLl7T7z7Yxd+De1QrhbV0OXFW9p/LS6zk0ELprOQr2XP2R2mafFphhso
         jwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVsbwFP8AeKgn5KuqXlWOVRdSf7M1xugTS7jUvEVQtc=;
        b=NFnW2mhp5adHImTqoqHB2wsTI17mwJsXyaeLl13nAyRBVNRbXrnMac5gk8Qg1nxrKl
         fskmVyNG5wsG+ihUUJmr0N1NSAYvrgW1IiGdzSgpjQaxObu3OiKEFeZHzR1bcTzx3vMx
         nBJZWFqUebrMvbn37AiNNhtEZ9K0SmX92uvSUZPjMRWh5Jbo2oqC8uH6k35hyuKCMHUV
         CypFRnCCKJigmykT49IzTxnRlt0B0/FAMiwYXOnvTFZI4gsyNYqyCj0ld+qKeMI5uy5c
         Y32j3pslfrjuA8zrBxNRES8DiQt2bEuHoxoJsss2fLRbH+sTzWmpIQl9HSWx3RX1h4Af
         hq3A==
X-Gm-Message-State: APjAAAW16FqoAXfPYQDkwInUGEsmcNRXGv8ifv4acnmmQOM8FyRJTA0b
        Cb0m3rDY0mzPBMBYnkjwF+A=
X-Google-Smtp-Source: APXvYqzA8b8TES3q8RMzhJpNbYR+VN+AMBJwUdINXVcCiKsaNB6N/jCmLAzvR9lFLICCokguWu+7lg==
X-Received: by 2002:a17:902:bb84:: with SMTP id m4mr8839423pls.211.1572557603878;
        Thu, 31 Oct 2019 14:33:23 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id 135sm4038808pgh.89.2019.10.31.14.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 14:33:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/arm-smmu: avoid pathological RPM behaviour for unmaps
Date:   Thu, 31 Oct 2019 14:31:02 -0700
Message-Id: <20191031213102.17108-1-robdclark@gmail.com>
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
To the user it would appear that the system just locked up.

A simple solution is to use pm_runtime_put_autosuspend() instead, so we
don't immediately suspend the SMMU device.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm-smmu.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 7c503a6bc585..5abc0d210d90 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -122,7 +122,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 {
 	if (pm_runtime_enabled(smmu->dev))
-		pm_runtime_put(smmu->dev);
+		pm_runtime_put_autosuspend(smmu->dev);
 }
 
 static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
@@ -1154,6 +1154,20 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	/* Looks ok, so add the device to the domain */
 	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
 
+	/*
+	 * Setup an autosuspend delay to avoid bouncing runpm state.
+	 * Otherwise, if a driver for a suspendend consumer device
+	 * unmaps buffers, it will runpm resume/suspend for each one.
+	 *
+	 * For example, when used by a GPU device, when an application
+	 * or game exits, it can trigger unmapping 100s or 1000s of
+	 * buffers.  With a runpm cycle for each buffer, that adds up
+	 * to 5-10sec worth of reprogramming the context bank, while
+	 * the system appears to be locked up to the user.
+	 */
+	pm_runtime_set_autosuspend_delay(smmu->dev, 20);
+	pm_runtime_use_autosuspend(smmu->dev);
+
 rpm_put:
 	arm_smmu_rpm_put(smmu);
 	return ret;
-- 
2.21.0

