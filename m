Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BF3367502
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 00:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbhDUWLO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Apr 2021 18:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235448AbhDUWLN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Apr 2021 18:11:13 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B5FC06174A;
        Wed, 21 Apr 2021 15:10:40 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id y1so6798868plg.11;
        Wed, 21 Apr 2021 15:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkoDKXBORJsqE7IKc03ttO430VTwoSOVe4XRCyNvB4A=;
        b=MyKV7gdYb+FFVYLQH1QEe30v0Ta6kUT4h9YnS7QfRbI/gZtcN53j3MCJyz7zdwxk8n
         KKA42sJFBo142Z5CJPfHlcF9QSanKVJAnS3tRHQyY7YZYt62hssxFwXrbkLQL+e9G8Gs
         z5kFTivhkQmBM8QvvaXvUcpBvflxbIiViCO24aQGjuhlL9RfN9xBcqh4oPFYUPpljaAv
         tr7SVQ3hjj68885dBm4b/m4Hm7W8GimDJey2ZU9z1+6my/T+GLkI7Yg6guVxTSmsvtxF
         3rXfPn1lSrjf5G8mr7kF5E7Xz2AdRXBQTMhnGPXWune1Ur2uIJ+YSPO9SXMnL/Oxvitw
         k0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkoDKXBORJsqE7IKc03ttO430VTwoSOVe4XRCyNvB4A=;
        b=DAG31+TKX/Dhg4XxCjeCgWU8OsYS0o1Wz05EH6wqcD7y0kIT/C0tyz6Xd4ktsL7Zyv
         ZdKzgo/JUvpeZjYKlowSBT9BSFVimLxr2f4QqZe1qJhac2sePaxwAQErHrstqSpM0EzV
         mUXy62vCGlRJjwCPI4Qz0vTZIdf2J22v3CkrV3w8tVKYAtdgXyXOT+a8E2xK7muR4/iP
         KsW00fVPu/5Xt1Z+OKWkuZzqMc7/icYu3CNPJONbUqdRRQsOOdOF6TELJ/EY4IW2VAbM
         6BXnwlybe3d/Rzzpo5IDUSz5x5UQgcPh6HBC1EeHe8JP1rCjM5zrhsLrhg77uiaJuujK
         YLSw==
X-Gm-Message-State: AOAM532J/K1NyNG2jS3jzqLVyKLItMmcT28qmYVp0UEyL9P1vQSNGHMY
        ZUEiMWt0LP0nz0arnsKmgB8=
X-Google-Smtp-Source: ABdhPJzpPgM6e3+a2yGIV98aPkPhua5zknl4irN8nKi5xP/IR5IHueVdGGGiPBEMYtgp6a2gT5nH9Q==
X-Received: by 2002:a17:902:8688:b029:ea:f782:5eae with SMTP id g8-20020a1709028688b02900eaf7825eaemr100027plo.15.1619043039754;
        Wed, 21 Apr 2021 15:10:39 -0700 (PDT)
Received: from localhost.localdomain ([103.248.31.176])
        by smtp.googlemail.com with ESMTPSA id a16sm308965pgl.12.2021.04.21.15.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 15:10:39 -0700 (PDT)
From:   Amey Narkhede <ameynarkhede03@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Amey Narkhede <ameynarkhede03@gmail.com>
Subject: [PATCH] iommu/qcom: Cleanup resources in case of probe error path
Date:   Thu, 22 Apr 2021 03:40:30 +0530
Message-Id: <20210421221030.70647-1-ameynarkhede03@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If device registration fails, remove sysfs attribute
and if setting bus callbacks fails, unregister the device
and cleanup the sysfs attribute.

Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 4294abe389b2..5fa128a1f7f0 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -850,10 +850,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
-		return ret;
+		goto err_sysfs_remove;
 	}

-	bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
+	ret = bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
+	if (ret)
+		goto err_unregister_device;

 	if (qcom_iommu->local_base) {
 		pm_runtime_get_sync(dev);
@@ -862,6 +864,14 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	}

 	return 0;
+
+err_unregister_device:
+	iommu_device_unregister(&qcom_iommu->iommu);
+
+err_sysfs_remove:
+	iommu_device_sysfs_remove(&qcom_iommu->iommu);
+
+	return ret;
 }

 static int qcom_iommu_device_remove(struct platform_device *pdev)
--
2.31.1

I assume its ok to leave pm_runtime_enable in case of error.
