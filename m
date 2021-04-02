Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4484E3525E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 05:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhDBD4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 23:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhDBD4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 23:56:17 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189A3C0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 20:56:16 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id v10so2846865pfn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 20:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/1tfZ3KHdBRbQ7iOu9GTGKGQQTHAyTZW2kSrQXENCl0=;
        b=xy6IMHoIjKIxBBq1kpYTDQkjsdBtbEb9bsTqof3z3+10iqaOGUpFsKODpR2BJE3V9l
         GmHQkPX+aJ2RR3K3StqZLC8YUG97r6rnTP0DUEOCtlI45bDPntoC5EDK8/o/40jBt+f6
         i4DpeVwqoXl/vTCrrToqU1FTaunO+/av8VfWuE9t5zC+ZIURcbT7dLpY27n5VNF1kIgE
         oZ7+0JcvmhEF5Al57VnaIZ8tvVoUPybyc+uccsmJzhB1U2vxUeXO8ahOxWyIefHDk/YQ
         v4rQbwt2snwgK37SuSn/xwWdY7/zh3Y2dIqm4pzm3G97MzEveVEI5ydK+0teBebf4qCo
         rGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/1tfZ3KHdBRbQ7iOu9GTGKGQQTHAyTZW2kSrQXENCl0=;
        b=j7aI31C17oHz75JYi6MSUZQOxafyqwyHeRnvstHP6rLlqsAa+VwDsXwc5zKQYqiXjC
         0FaZz0zgNDGWhJ3WYxGpVNTHvgevu/ykvhKO1iY40U6kWXDff5VF/lpJKrXg28r8HLuv
         AALbsfIsFZ/6LlMjQpsQv9PcBbU1SYgM8NY47k1r50Qj+6hL+cj/z4QniR+v/O9DfJvh
         RZ7oT38zXkAikAA8lOMNHXz76asKJjlIGoIXJUzlOD/oLHO/qwa/liTN9fjWr8C6epWf
         zgghaeLzVNWvfrBBIYO231/tL5Bk+kecOHBFm6oKdcxL1SO04/125ycuYm6+sg0I9IH+
         u+pg==
X-Gm-Message-State: AOAM531sVDDMVWkPWtMlL0cueT06arDEGvvG1mf6j8Cs5Nevv07V1FGj
        0om36mifQzzF1ts/Og9e2hVqsw==
X-Google-Smtp-Source: ABdhPJxq0/P3BZCjsJltqsSX1E8fe3pwGt3mKPGSYK3eBXms5/r6xe7yM/u4Bry3jlTaGPDMJyCnlw==
X-Received: by 2002:a65:6a01:: with SMTP id m1mr10169543pgu.215.1617335775654;
        Thu, 01 Apr 2021 20:56:15 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 81sm6875972pfu.164.2021.04.01.20.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 20:56:15 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ACPI/IORT: Add Qualcomm Snapdragon platforms to iort_plat_info[]
Date:   Fri,  2 Apr 2021 11:56:01 +0800
Message-Id: <20210402035602.9484-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402035602.9484-1-shawn.guo@linaro.org>
References: <20210402035602.9484-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SMMU driver on Qualcomm Snapdragon platforms needs to hook up some
QCOM specific arm_smmu_impl.  Define model identifier for QCOM SMMU and
add Qualcomm SC8180X platform to iort_plat_info[], so that SMMU
driver can detect the model and handle QCOM specific arm_smmu_impl.

Some device chooses to use manufacturer name in IORT table, like Lenovo
Flex 5G, while others use SoC vendor name, such as Microsoft Surface Pro
X and Samsung Galaxy Book S.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/acpi/arm64/iort.c | 5 +++++
 include/linux/acpi_iort.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index e2a96d2d399a..f88b8c0a7d84 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1467,6 +1467,11 @@ static struct acpi_platform_list iort_plat_info[] __initdata = {
 	/* HiSilicon Hip08 Platform */
 	{"HISI  ", "HIP08   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
 	 "Erratum #162001800", IORT_SMMU_V3_PMCG_HISI_HIP08},
+	/* Qualcomm Snapdragon Platform */
+	{ "LENOVO", "CB-01   ", 0x8180, ACPI_SIG_IORT, equal,
+	  "QCOM SMMU", IORT_SMMU_QCOM },
+	{ "QCOM  ", "QCOMEDK2", 0x8180, ACPI_SIG_IORT, equal,
+	  "QCOM SMMU", IORT_SMMU_QCOM },
 	{ }
 };
 
diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
index 678cdf036948..66c859ea2abf 100644
--- a/include/linux/acpi_iort.h
+++ b/include/linux/acpi_iort.h
@@ -21,6 +21,7 @@
  */
 #define IORT_SMMU_GENERIC		0x00000000 /* Generic SMMU */
 #define IORT_SMMU_V3_PMCG_HISI_HIP08	0x00000001 /* HiSilicon HIP08 PMCG */
+#define IORT_SMMU_QCOM			0x00000002 /* QCOM SMMU */
 
 struct iort_smmu_pdata {
 	struct acpi_iort_node *node;
-- 
2.17.1

