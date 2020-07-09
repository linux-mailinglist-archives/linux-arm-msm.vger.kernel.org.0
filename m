Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB1B21979A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 07:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgGIFBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 01:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgGIFBm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 01:01:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BD9C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 22:01:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id cv18so2902885pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 22:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+6WxJ1O6k89NNQZzhHWgQkm03zUeIAl0iKHL4vPlUk=;
        b=AOLHWt2GPk9pGPq6HPxBOiLg8IkaE8fySTF+79CaOlFbY/Ii9OChxP90kbGu1Kpp4g
         1geiQB3FJADTo1pUFgW3Sxa65geoU2CT5za4/L0HfEdsLOAuiS/hjjGJAhLd5WpirmZf
         FtqNIv1CQKnyDdPXdmuFBCNC6yhLvo2cYc6qSM5QnmTXkmdX5EeDxnIrVvTmG4ZIadtN
         9Wc0sp5jXMyQsZ3p/wY2QYy7Ht2049b7nCZwdk1eGIpkU//mzH2EjylQGA8lOiKrtshJ
         LlRfr/5BOfigasYH241F2AoEDk2ymoYdc1UD+9rYiSk5J9TrKnHdKxLfuGL8+sE3Lbxw
         Lrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+6WxJ1O6k89NNQZzhHWgQkm03zUeIAl0iKHL4vPlUk=;
        b=qFQTf0Ni6I4jy1mU35Ly892RhXHctA+VjNhDwOPTe3n6opT25CBnLstdZOqsjwSZ10
         R0MGU5Hq0HpeMKruqlwHggTA99Qa6uWk0RStCmLHNtUUPq6EOiRpsohTAOzbdYrLbdkc
         MvE1KKWTx6herwLgySaI6F3k9cBuOQGYQi+3SlU0yh77UpgPnOWfm1I3Xg15cZA7YzDN
         kM1776LdOgbVh7og1F8VAlTV+cEZIhiy9WZ8K2HEaQdk4gVsSr2dJb4YLVNRsy6Dgtn4
         UAo2J38WLKHcud5aPi5j6zZOg1UIxft07ge/qpoiUzH0KCoWoBpB+9eqWXNxR6uJD+zt
         BssA==
X-Gm-Message-State: AOAM530ZsBrtiBOUEktHq1SBy/5nyA3UvbSv3fBvE/7HR3jYAtuNuP1z
        Pxnc2WYf71fsVWGeRF3GhTnuHw==
X-Google-Smtp-Source: ABdhPJxF4d+sWu8w2NwzlZP7r/VFELTU9n5hnbo5rdODjHR0wnwyVgaX97f2R3IqlZFh0Lej268MjA==
X-Received: by 2002:a17:90b:4d08:: with SMTP id mw8mr12970883pjb.119.1594270901682;
        Wed, 08 Jul 2020 22:01:41 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h15sm999974pjc.14.2020.07.08.22.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:01:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/5] iommu/arm-smmu: Make all valid stream mappings BYPASS
Date:   Wed,  8 Jul 2020 22:01:41 -0700
Message-Id: <20200709050145.3520931-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Turn all stream mappings marked as valid into BYPASS. This allows the
platform specific implementation to configure stream mappings to match
the boot loader's configuration for e.g. display to continue to function
through the reset of the SMMU.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm-smmu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 243bc4cb2705..2e27cf9815ab 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1924,6 +1924,22 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+int arm_smmu_setup_identity(struct arm_smmu_device *smmu)
+{
+	int i;
+
+	for (i = 0; i < smmu->num_mapping_groups; i++) {
+		if (smmu->smrs[i].valid) {
+			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
+			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
+			smmu->s2crs[i].cbndx = 0xff;
+			smmu->s2crs[i].count++;
+		}
+	}
+
+	return 0;
+}
+
 struct arm_smmu_match_data {
 	enum arm_smmu_arch_version version;
 	enum arm_smmu_implementation model;
@@ -2181,6 +2197,10 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = arm_smmu_setup_identity(smmu);
+	if (err)
+		return err;
+
 	if (smmu->version == ARM_SMMU_V2) {
 		if (smmu->num_context_banks > smmu->num_context_irqs) {
 			dev_err(dev,
-- 
2.26.2

