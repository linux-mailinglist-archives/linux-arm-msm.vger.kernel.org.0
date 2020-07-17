Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21AB222FD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 02:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgGQAQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 20:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgGQAQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 20:16:30 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20433C061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 17:16:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g67so5775436pgc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 17:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jlkntRV846aUEo1Gl28BULv9E1NJaLJ91w5u0IdGAqY=;
        b=OiQXSDCWqV8zDFUYVBAxlH0S9CUnxu5iNny+Dixx/cJuAc+BjwJxXZk2NeYdMn/4JM
         po5lfGXXIcu237rEjN9QS6alFZsksWl0OsLnUjjmyoaa2VSLFxdsx9c0wclqDlpeCrG+
         HRYy2HNZYiYfhM2z1JteVTx0DOTm7aLn3aPGOp6Yk9NTjXrXsTnLwm+GzAFBMlrvxdCO
         5WvH2VytlFQke6xH+sVsHW2uCY9veYAsGGSk8znuUpUCJso0sxiUmXUosE/WnKW05fVp
         9FfENWzbuDXCv41HbdfGyWbqsblDV4Cjq1n/ZcglHrIDq1Ec1+Wt0ywHHY9bNqrHZcHq
         rA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlkntRV846aUEo1Gl28BULv9E1NJaLJ91w5u0IdGAqY=;
        b=OAxlmCje85RYNcsHrxT0MeCllhWpPgKNT11s9ZQz+RL/8NnVSo/rHzIC3BWYBbs9/n
         9gZC4Ee01OlhkqOCxGa4zb5t4ULhhclJqz5x2CrfJ4DIsfFE0kzqTV4sLPUBVZ9apfYf
         v/Mv5s6Tu9JAb1gQJqVO7XT3z6fnjuSyQtXKz4gNpsEKqKAs9a9ejlO+t6NIAh34CB7j
         tPAxGJFU+M9gm8G09xMYU1fejKv1SKcF1NhnRqQXDqwuXRMgzAcLX1kVvRhcJWYYu/+E
         Ct6nIH+uEXvQFq6plpj7Llh7jhdJneL8BHsY9pY705ZfeUIBWFa2M+9IbJCgnuO3maSe
         4J8g==
X-Gm-Message-State: AOAM531BJdhs8Okfi/pBD8igN0oiU3DxkJfRQ0gdJBT1jzkIZgLv4l7T
        lQ+LjDoOqF4NdDdanGDbRXfIuXBb0pk=
X-Google-Smtp-Source: ABdhPJyOw+rZ5tyQFkUplkrS1otZKw4EmrIzCvAXE7cq7d57IJm0Q+MOF5/GsoqJxLnC2KC8CmI1AQ==
X-Received: by 2002:a63:d40d:: with SMTP id a13mr6437251pgh.225.1594944989377;
        Thu, 16 Jul 2020 17:16:29 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r7sm6211950pgu.51.2020.07.16.17.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 17:16:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 5/5] iommu/arm-smmu: Setup identity domain for boot mappings
Date:   Thu, 16 Jul 2020 17:16:19 -0700
Message-Id: <20200717001619.325317-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717001619.325317-1-bjorn.andersson@linaro.org>
References: <20200717001619.325317-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With many Qualcomm platforms not having functional S2CR BYPASS a
temporary IOMMU domain, without translation, needs to be allocated in
order to allow these memory transactions.

Unfortunately the boot loader uses the first few context banks, so
rather than overwriting a active bank the last context bank is used and
streams are diverted here during initialization.

This also performs the readback of SMR registers for the Qualcomm
platform, to trigger the mechanism.

This is based on prior work by Thierry Reding and Laurentiu Tudor.

Tested-by: John Stultz <john.stultz@linaro.org>
Tested-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Rebased to avoid conflict
- Picked up tested-by

 drivers/iommu/arm-smmu-qcom.c | 11 +++++
 drivers/iommu/arm-smmu.c      | 79 +++++++++++++++++++++++++++++++++--
 drivers/iommu/arm-smmu.h      |  3 ++
 3 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index 10eb024981d1..147af11049eb 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -26,6 +26,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 {
 	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
+	u32 smr;
 	u32 reg;
 	int i;
 
@@ -56,6 +57,16 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 		}
 	}
 
+	for (i = 0; i < smmu->num_mapping_groups; i++) {
+		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
+
+		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
+			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
+			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
+			smmu->smrs[i].valid = true;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 08a650fe02e3..69bd8ee03516 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -652,7 +652,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 }
 
 static int arm_smmu_init_domain_context(struct iommu_domain *domain,
-					struct arm_smmu_device *smmu)
+					struct arm_smmu_device *smmu,
+					bool boot_domain)
 {
 	int irq, start, ret = 0;
 	unsigned long ias, oas;
@@ -770,6 +771,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		ret = -EINVAL;
 		goto out_unlock;
 	}
+
+	/*
+	 * Use the last context bank for identity mappings during boot, to
+	 * avoid overwriting in-use bank configuration while we're setting up
+	 * the new mappings.
+	 */
+	if (boot_domain)
+		start = smmu->num_context_banks - 1;
+
 	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
 				      smmu->num_context_banks);
 	if (ret < 0)
@@ -1149,7 +1159,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct arm_smmu_master_cfg *cfg;
 	struct arm_smmu_device *smmu;
+	bool free_identity_domain = false;
+	int idx;
 	int ret;
+	int i;
 
 	if (!fwspec || fwspec->ops != &arm_smmu_ops) {
 		dev_err(dev, "cannot attach to SMMU, is it on the same bus?\n");
@@ -1174,7 +1187,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		return ret;
 
 	/* Ensure that the domain is finalised */
-	ret = arm_smmu_init_domain_context(domain, smmu);
+	ret = arm_smmu_init_domain_context(domain, smmu, false);
 	if (ret < 0)
 		goto rpm_put;
 
@@ -1190,9 +1203,33 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		goto rpm_put;
 	}
 
+	/* Decrement use counter for any references to the identity domain */
+	mutex_lock(&smmu->stream_map_mutex);
+	if (smmu->identity) {
+		struct arm_smmu_domain *identity = to_smmu_domain(smmu->identity);
+
+		for_each_cfg_sme(cfg, fwspec, i, idx) {
+			if (smmu->s2crs[idx].cbndx == identity->cfg.cbndx) {
+				smmu->num_identity_masters--;
+				if (smmu->num_identity_masters == 0)
+					free_identity_domain = true;
+			}
+		}
+	}
+	mutex_unlock(&smmu->stream_map_mutex);
+
 	/* Looks ok, so add the device to the domain */
 	ret = arm_smmu_domain_add_master(smmu_domain, cfg, fwspec);
 
+	/*
+	 * The last stream map to reference the identity domain has been
+	 * overwritten, so it's now okay to free it.
+	 */
+	if (free_identity_domain) {
+		arm_smmu_domain_free(smmu->identity);
+		smmu->identity = NULL;
+	}
+
 	/*
 	 * Setup an autosuspend delay to avoid bouncing runpm state.
 	 * Otherwise, if a driver for a suspended consumer device
@@ -1922,17 +1959,51 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 
 static int arm_smmu_setup_identity(struct arm_smmu_device *smmu)
 {
+	struct device *dev = smmu->dev;
+	int cbndx = 0xff;
+	int type = S2CR_TYPE_BYPASS;
+	int ret;
 	int i;
 
+	if (smmu->qcom_bypass_quirk) {
+		/* Create a IDENTITY domain to use for all inherited streams */
+		smmu->identity = arm_smmu_domain_alloc(IOMMU_DOMAIN_IDENTITY);
+		if (!smmu->identity) {
+			dev_err(dev, "failed to create identity domain\n");
+			return -ENOMEM;
+		}
+
+		smmu->identity->pgsize_bitmap = smmu->pgsize_bitmap;
+		smmu->identity->type = IOMMU_DOMAIN_IDENTITY;
+		smmu->identity->ops = &arm_smmu_ops;
+
+		ret = arm_smmu_init_domain_context(smmu->identity, smmu, true);
+		if (ret < 0) {
+			dev_err(dev, "failed to initialize identity domain: %d\n", ret);
+			return ret;
+		}
+
+		type = S2CR_TYPE_TRANS;
+		cbndx = to_smmu_domain(smmu->identity)->cfg.cbndx;
+	}
+
 	for (i = 0; i < smmu->num_mapping_groups; i++) {
 		if (smmu->smrs[i].valid) {
-			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
+			smmu->s2crs[i].type = type;
 			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
-			smmu->s2crs[i].cbndx = 0xff;
+			smmu->s2crs[i].cbndx = cbndx;
 			smmu->s2crs[i].count++;
+
+			smmu->num_identity_masters++;
 		}
 	}
 
+	/* If no mappings where found, free the identiy domain again */
+	if (smmu->identity && !smmu->num_identity_masters) {
+		arm_smmu_domain_free(smmu->identity);
+		smmu->identity = NULL;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index bcd160d01c53..37257ede86fa 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -321,6 +321,9 @@ struct arm_smmu_device {
 	/* IOMMU core code handle */
 	struct iommu_device		iommu;
 
+	struct iommu_domain		*identity;
+	unsigned int			num_identity_masters;
+
 	bool				qcom_bypass_quirk;
 };
 
-- 
2.26.2

