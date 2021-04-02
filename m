Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62BE3525E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 05:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhDBD4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 23:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhDBD4K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 23:56:10 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B8BC0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 20:56:10 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so4057020pjq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 20:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3vSAibITlctZ+axCGeiS+YHWaedHLZOtjiiZrdl7kVA=;
        b=DdtjBmLapl6ihIdyi3DbORJDOpZiQmd2/DIoazZED6QAcPOiibgOUoSw/hh/2efXQY
         XqSV5EsQF1YtTniwtU89fDSBmXjJ463iBEBlRSBY4KBdJF6V3gloxNrsEIjRGEddQilY
         TUsNzdHjHvJYsN+ZT8nmO+FMXgZmWZgiqml+T+hFDR96bzRd4YQE5beBNc0sH7HI8Flg
         SnJ4xpuYLY5UN+9pv+crdT3AVh6BoBVqY8jRa2nP8z/RH9mwoJXAEme3j7TGbAHP7Jao
         NcQ0G+eLxKAZfbi0PVEZFeTUEuzc8W3vcVOGXoDm7N6+Jsdtg1Y0bDTE2HUUjzVGHRsC
         P/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3vSAibITlctZ+axCGeiS+YHWaedHLZOtjiiZrdl7kVA=;
        b=T0kljlLQ/vqrf9Kv+kKYRq2DsgouCMaeshgs7Q0nuNpcJkSelK8fy/SRSrxkM6V4Qm
         PBYVJcJfdAz17lGkREd2F8SBAxRY8HmD/bQcLb8FTX5iGhKlwi+qCwpDxdx+lxEnAbh2
         tvYjwXMCM9pkWSwHYELRKzv5/nLMUIfbg2aU+ON0zl8F29schvPd1VOnhPFVgmUscJVV
         QJoso++/vUu1MMTHIa3gn9hfXVuzzSanyjIgPrY0N6s+0BLDO5dKpd+hrUJltpVRyRIG
         QUWFvc+TgMTZf3TZYNHrU6t/YSFjDfzKU1FFOnAXDHYz9EnbtHXPc/50hbhFu1FkOmu/
         qgRg==
X-Gm-Message-State: AOAM533PYSIlLnX7AwnHoYH3aWtFA22wjwwxEvexrwWJXnEqKKNkVCJ+
        v4aRJ/7RWs5YRKSE02BLN/1OZA==
X-Google-Smtp-Source: ABdhPJyzqyV12ZOHEwY9sNHMMIBiWniMm0Ha2uR3l8clGankE7q85oofBXXEahu/WSzSbEbYAhNEmw==
X-Received: by 2002:a17:90a:14c3:: with SMTP id k61mr11945464pja.206.1617335769945;
        Thu, 01 Apr 2021 20:56:09 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 81sm6875972pfu.164.2021.04.01.20.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 20:56:09 -0700 (PDT)
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
Subject: [PATCH v2 0/3] arm-smmu-qcom: Create qcom_smmu_impl for ACPI boot
Date:   Fri,  2 Apr 2021 11:55:59 +0800
Message-Id: <20210402035602.9484-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The arm-smmu-qcom driver needs to hook up qcom_smmu_impl for booting up
Snapdragon platforms.  Such hook-up is being done for DT boot by
matching compatibles.  The series tries to handle the hook-up for ACPI
boot by looking at model identifier, which is figured out by IORT driver
using acpi_match_platform_list() helper.  It helps to get Debian
installer booting with ACPI work for Qualcomm SC8180X based laptops like
Lenovo Flex 5G.

Changes for v2:
- Rather than using asl_compiler_id in IORT table, follow suggestion
  from Robin Murphy to use acpi_match_platform_list() to match platform.


Shawn Guo (3):
  ACPI/IORT: Consolidate use of SMMU device platdata
  ACPI/IORT: Add Qualcomm Snapdragon platforms to iort_plat_info[]
  iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI boot

 drivers/acpi/arm64/iort.c                   | 36 +++++++++------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  6 +++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  9 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  9 ++++--
 drivers/perf/arm_smmuv3_pmu.c               |  8 +++--
 include/linux/acpi_iort.h                   | 12 +++++--
 6 files changed, 51 insertions(+), 29 deletions(-)

-- 
2.17.1

