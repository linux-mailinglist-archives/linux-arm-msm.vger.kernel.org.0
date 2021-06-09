Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A7F3A09AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 03:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFIB6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 21:58:32 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:50797 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhFIB6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 21:58:32 -0400
Received: by mail-pj1-f50.google.com with SMTP id g4so460203pjk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 18:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vwOvA6+PDk9AU25znRXVA4uXmSYy6Z0YktvmCGpU+2Y=;
        b=R2bQla0f763vMrUouW7BxZcowdR6Lew/tHQSOl/+94ISfZfZXa0HkDn5aYiNKOR8Hr
         2XjpGRWQwc7uQiC01phHK/2LqeVpt+oZ2HOwjM4a6Y3cKx03qL2Py3zxGVYMPrHjpKxE
         voZU5nGs5JuGT/0xOJg/g0i7Dvo67f07Yhe9rCrDmyyAKEMwC0Beugeh2WAIB8N3WJts
         hxYniqMcmd9ni9giPJlk3yHNv8qsiQRihgB+rfND6Ae7jehjqiTBdW6QOulUe9BMKtcv
         G8Gi6WhhRvioO6g3nebbgcq6CcDPFSSDubONznYcOnBM5VnvaV7SIYuvXV2sVi0Tg9Sg
         uE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vwOvA6+PDk9AU25znRXVA4uXmSYy6Z0YktvmCGpU+2Y=;
        b=LiHoBvaZnxz+4v5i4FuY2qIFGZrZf996AyKp/fGhSdPYO87atl46+MndAGr2P3NTzL
         UZgYby5j7KIA2dKwaM4/NtV2KtyLYUF+UCJXsRnHOzWEVNX06MBmSGRUFUPRyXYxbpUh
         PRVUwU+5oz7ZAZZz0FoNCZubjse7bqHpAIJicJ4NTQCfUdvd88vrpbJ+PuwWr9B3HLun
         4IBev1rYIEVS5dlxmxcBEM9O8u3NPvfFTu4H/4PphFl8KvBdjTSbpV5WKq/fUaqo2HLf
         23yeRrVsZ/Pj7njbcZHgUwpEOtNKWvcvx8OoYgyP1BzqgnKIIMLFNsmneQE2Z4hwuNj1
         bJRw==
X-Gm-Message-State: AOAM532DCmVCm9KcTccv2g+P+HK7a7YzYuP0BW1zVABxFIS7hPJgHsKv
        casrBf8tghxoEqGnlRiF+48urg==
X-Google-Smtp-Source: ABdhPJz+Pz+qZ0pg7XZVrCDxfq58L9ZLUSK0eRhKOPMqRyjzs65fAJuiVWQ9exyNQwsnN05AV/w3FA==
X-Received: by 2002:a17:902:8484:b029:101:7016:fb7b with SMTP id c4-20020a1709028484b02901017016fb7bmr2638654plo.23.1623203722295;
        Tue, 08 Jun 2021 18:55:22 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id pi8sm11222043pjb.52.2021.06.08.18.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 18:55:21 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] iommu/arm-smmu-qcom: Protect acpi_match_platform_list() call with CONFIG_ACPI
Date:   Wed,  9 Jun 2021 09:55:11 +0800
Message-Id: <20210609015511.3955-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The struct acpi_platform_list and function acpi_match_platform_list()
defined in include/linux/acpi.h are available only when CONFIG_ACPI is
enabled.  Add protection to fix the build issues with !CONFIG_ACPI.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index f7e187f3fa66..a437753d84df 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -340,21 +340,25 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ }
 };
 
+#ifdef CONFIG_ACPI
 static struct acpi_platform_list qcom_acpi_platlist[] = {
 	{ "LENOVO", "CB-01   ", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
 	{ "QCOM  ", "QCOMEDK2", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
 	{ }
 };
+#endif
 
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 
+#ifdef CONFIG_ACPI
 	if (np == NULL) {
 		/* Match platform for ACPI boot */
 		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
 			return qcom_smmu_create(smmu, &qcom_smmu_impl);
 	}
+#endif
 
 	if (of_match_node(qcom_smmu_impl_of_match, np))
 		return qcom_smmu_create(smmu, &qcom_smmu_impl);
-- 
2.17.1

