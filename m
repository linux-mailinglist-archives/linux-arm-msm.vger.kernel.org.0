Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D5739FCC7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 18:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233544AbhFHQtC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 12:49:02 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54]:33623 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbhFHQtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 12:49:01 -0400
Received: by mail-pj1-f54.google.com with SMTP id k22-20020a17090aef16b0290163512accedso2099114pjz.0;
        Tue, 08 Jun 2021 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2t+iT1aOdYCZU2AlXESXqTpbLz1wOUqv173mhLsP5Jc=;
        b=TY6Sk2eZt08YqlpdA2cn4pVa+JehYb0k4OUYb4sO8TTUbHYJeVSegoOB78bUraCAT/
         fv7Ic76M+WjKuz5VcW3wInudkLbyQLWyRjQQe2xT9eZ43uLOdX6MZU9CylSpv6oY01vN
         jLSx70QPKb7cIG8M+Vlb04dKoWfQNVS9rhla0EbeIKEOwAIgjMPC4AM5fI4mz1krklc8
         IpR+dokjcJ5myPc6sUULCwy1cOJoGF6+/2y+Gi41QP7SEmSzyV9xaSMmK3ahaLZAMBIh
         lif10rY7YaVrrZ/JD4GpT3udb6QZ3FvsVvbjQ0MQrVdBcyXVuTbPtI8iJOnwRS87Y78N
         BBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2t+iT1aOdYCZU2AlXESXqTpbLz1wOUqv173mhLsP5Jc=;
        b=rQgB6OSX3hCj55JLSS0KqsHSgt74Kl8IUSztuPrxkewtes38iwKpc8rAsT2MZqQ9mM
         vuuaymJ5qusVBPVJUbsOYLwQWsNwvw/84fIrZ/dXRlwq4/FooZ0W7I25vKDsWqShmdsQ
         I99ZOSuYgvOqxY6yGTXD0l1GboyQFm+/5rsTZ3kQIf0wQ1KHXipdaylAFMzGqEXZ9Cd7
         NHt4dLkjHfRh+B7zX2JWCSor0GrO7hSNcvIDLpj7DhKM8tveWmk8g0/pYbWXOrGFK1em
         O+t0VSUlXpKbDEdFz5Z/Dilt9Uqh3ublVfAGLd3jow7bB50jOn9HVJngSpNXVdQlMRBL
         5qPA==
X-Gm-Message-State: AOAM533mng7o4y6X1oTLUiC7eNjCWWq17AqeWHbmNgLKnrqzeO6On2WT
        G+YMbddvrD5rAA7fTRN3cLs=
X-Google-Smtp-Source: ABdhPJxo8z0gKm9nyddE2hgbA+4T56fMWkoWk4WJ05zb+Et72S0ZZzGhKucyCJluOysvsJpLM1gyLg==
X-Received: by 2002:a17:90a:5998:: with SMTP id l24mr7427786pji.169.1623170768185;
        Tue, 08 Jun 2021 09:46:08 -0700 (PDT)
Received: from localhost.localdomain ([103.200.106.115])
        by smtp.googlemail.com with ESMTPSA id t6sm2864863pjo.4.2021.06.08.09.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 09:46:07 -0700 (PDT)
From:   Amey Narkhede <ameynarkhede03@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Amey Narkhede <ameynarkhede03@gmail.com>
Subject: [PATCH] iommu/arm: Cleanup resources in case of probe error path
Date:   Tue,  8 Jun 2021 22:15:59 +0530
Message-Id: <20210608164559.204023-1-ameynarkhede03@gmail.com>
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 15 ++++++++++++---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 13 +++++++++++--
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 54b2f27b81d4..de2499754025 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3669,10 +3669,20 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
-		return ret;
+		goto err_sysfs_remove;
 	}

-	return arm_smmu_set_bus_ops(&arm_smmu_ops);
+	ret = arm_smmu_set_bus_ops(&arm_smmu_ops);
+	if (ret)
+		goto err_unregister_device;
+
+	return 0;
+
+err_unregister_device:
+	iommu_device_unregister(&smmu->iommu);
+err_sysfs_remove:
+	iommu_device_sysfs_remove(&smmu->iommu);
+	return ret;
 }

 static int arm_smmu_device_remove(struct platform_device *pdev)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 6f72c4d208ca..88a3023676ce 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2164,7 +2164,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	err = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
 	if (err) {
 		dev_err(dev, "Failed to register iommu\n");
-		return err;
+		goto err_sysfs_remove;
 	}

 	platform_set_drvdata(pdev, smmu);
@@ -2187,10 +2187,19 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	 * any device which might need it, so we want the bus ops in place
 	 * ready to handle default domain setup as soon as any SMMU exists.
 	 */
-	if (!using_legacy_binding)
-		return arm_smmu_bus_init(&arm_smmu_ops);
+	if (!using_legacy_binding) {
+		err = arm_smmu_bus_init(&arm_smmu_ops);
+		if (err)
+			goto err_unregister_device;
+	}

 	return 0;
+
+err_unregister_device:
+	iommu_device_unregister(&smmu->iommu);
+err_sysfs_remove:
+	iommu_device_sysfs_remove(&smmu->iommu);
+	return err;
 }

 static int arm_smmu_device_remove(struct platform_device *pdev)
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 4294abe389b2..b785d9fb7602 100644
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
@@ -862,6 +864,13 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	}

 	return 0;
+
+err_unregister_device:
+	iommu_device_unregister(&qcom_iommu->iommu);
+
+err_sysfs_remove:
+	iommu_device_sysfs_remove(&qcom_iommu->iommu);
+	return ret;
 }

 static int qcom_iommu_device_remove(struct platform_device *pdev)
--
2.31.1
