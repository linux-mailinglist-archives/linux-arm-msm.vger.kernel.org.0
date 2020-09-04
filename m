Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA0825DEB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 17:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgIDP4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 11:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgIDPz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 11:55:26 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADEAC06125F
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 08:55:22 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id v54so4956858qtj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A7svwNgsY0UiMpV566sgNDGzXgT7VfisHtnxe6fo6Bo=;
        b=SJb3QhpYN6eU3JoTjsYO9t+QvUwc0b/xpfl5OAl/hynvIxgP9pQtQGZ7Q8P6XbdYOx
         4ZmHDqCeABKsnyHLKLa/r1yj5s7wu0jme98WGPofmclJAqP1x8v1Qtsto93CKB8eFPbS
         d0rLzoytt+cTrw2VjSrbaM+Jqq9LKRqgmjXUemY119lVYuf68vDkVWFjJVhE+nfRUonE
         c+jT35sndJqqYDxgbHkVUFha3/taxEbjypD0TJEBf074vc1FB/fhvmH75GtEaBIZeTux
         WPHSblA16beNt6kLF9KBDd0tdQPNYaE9UaVzy8GYZnTEREbL71aqBcNgXIlp/WpxPsOV
         eUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A7svwNgsY0UiMpV566sgNDGzXgT7VfisHtnxe6fo6Bo=;
        b=VjFoW6fcgyy/SG9Mb8ICbQZdUvpjSWevdRU1LAFgV7NGMQC4IKtK+StO1Y8vbJlKnm
         MYhrMS3sicAhmOkV8qy0Xfllxx42dBoJetTPpytRZ5i+mxQ61wGi0A2v+Bq+r+7Np0/V
         fKoP96AvnnfTStyx3WdPZNja5OXVtiJAzu4a771f799woFpDSsFMMuym1Sx5VS3IRN6c
         685m2sAwBjz5ZY47Ab2j67DOJRez1Q9SueLL4TkUkd8/fxqUMr6Pm8pzkGXAsKCwYKzD
         4YBgDhwKb8vEDY4wuZzy9itNIjo0kgh5eNzUxTdBqoMUU2QfJq1WC56+JV+aajz+A26Z
         XWHw==
X-Gm-Message-State: AOAM532CTk+yqr1F0ubRE+x00Nug7PkJSq5AHqGk9Ca+rAG9U+Onsnat
        cQ3VNgZkrsU6wjUBKvfcvXWTbw==
X-Google-Smtp-Source: ABdhPJw7ASxjDOGw6iPxO7Q3Ca/q5gyDB0Ac6+j7ID3GwnYiQlbkA7Cf3QrRkFvCmJF9BhJscynS1w==
X-Received: by 2002:ac8:7145:: with SMTP id h5mr9707917qtp.110.1599234919674;
        Fri, 04 Sep 2020 08:55:19 -0700 (PDT)
Received: from localhost.localdomain (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm4724473qtq.15.2020.09.04.08.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:55:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 4/8] iommu/arm-smmu-qcom: Emulate bypass by using context banks
Date:   Fri,  4 Sep 2020 15:55:09 +0000
Message-Id: <20200904155513.282067-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some firmware found on various Qualcomm platforms traps writes to S2CR
of type BYPASS and writes FAULT into the register. In particular, this
prevents us from marking the streams for the display controller as
BYPASS to allow continued scanout of the screen through the
initialization of the ARM SMMU.

This adds a Qualcomm specific cfg_probe function, which probes for the
broken behavior of the S2CR registers and implements a custom
alloc_context_bank() that when necessary allocates a context bank
(without translation) for these domains as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Move quirk from arm_smmudevice to qcom_smmu, as we localize the quirk
  handling to the Qualcomm specific implemntation.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 229fc8ff8cea..284761a1cd8e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -11,8 +11,14 @@
 
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
+	bool bypass_broken;
 };
 
+static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
+{
+	return container_of(smmu, struct qcom_smmu, smmu);
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -162,6 +168,50 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ }
 };
 
+static int qcom_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
+					struct arm_smmu_device *smmu,
+					struct device *dev, int start)
+{
+	struct iommu_domain *domain = &smmu_domain->domain;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+
+	/* Keep identity domains as bypass, unless bypass is broken */
+	if (domain->type == IOMMU_DOMAIN_IDENTITY && !qsmmu->bypass_broken)
+		return ARM_SMMU_CBNDX_BYPASS;
+
+	/*
+	 * The identity domain to emulate bypass is the only domain without a
+	 * dev, use the last context bank for this to avoid collisions with
+	 * active contexts during initialization.
+	 */
+	if (!dev)
+		start = smmu->num_context_banks - 1;
+
+	return __arm_smmu_alloc_bitmap(smmu->context_map, start, smmu->num_context_banks);
+}
+
+static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
+{
+	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 reg;
+
+	/*
+	 * With some firmware writes to S2CR of type FAULT are ignored, and
+	 * writing BYPASS will end up as FAULT in the register. Perform a write
+	 * to S2CR to detect if this is the case with the current firmware.
+	 */
+	reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, S2CR_TYPE_BYPASS) |
+	      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, 0xff) |
+	      FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, S2CR_PRIVCFG_DEFAULT);
+	arm_smmu_gr0_write(smmu, last_s2cr, reg);
+	reg = arm_smmu_gr0_read(smmu, last_s2cr);
+	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS)
+		qsmmu->bypass_broken = true;
+
+	return 0;
+}
+
 static int qcom_smmu_def_domain_type(struct device *dev)
 {
 	const struct of_device_id *match =
@@ -200,6 +250,8 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
 }
 
 static const struct arm_smmu_impl qcom_smmu_impl = {
+	.alloc_context_bank = qcom_smmu_alloc_context_bank,
+	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
 };
-- 
2.28.0

