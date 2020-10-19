Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525AF292D76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 20:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbgJSSWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 14:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730654AbgJSSWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 14:22:48 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BD0C0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 11:22:48 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id l85so931468oih.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3LEDkBR8wJEGqVwvG1n0vRZnt/gLCojl7HrdvEA23Ug=;
        b=YrXdztVk2xUzJpFj9keaplNRccfTfjsSp/1YpeMFBVOGa098MtUAjHt61JjJfsvx/w
         7EKLabdjT74UjcZyARJs/+dEFCBrXaKQUCXVdXINEZn74DjZFX9xZpHprPKxlyFl4v7q
         1IXwJueTvIPnVUUy5jqry7hlVBoPJstOWFATwNXXfQfByZWagKZZAej5cizJzQP0llFM
         cVHzvgqxTsGL3FeHLVjhsIybaxWtM6L8hPG5pnNywmmUeiEieclplkHhmKrxZGxFkFnh
         obpbsliy1aQ0//16iq5tEFV3B3LLNNHnDcGgNnXATsxulFTVxLPxNIkr7OJSSHCcd6uS
         UJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LEDkBR8wJEGqVwvG1n0vRZnt/gLCojl7HrdvEA23Ug=;
        b=cbqR1aufDGFGQ5reaX2MDFpHjUalya5Dcx3ivzAtmzdPe8+eN1qIO5r0Q/JVOk2Y0/
         asdaikPOCpMzN2eCCfBj6A/MQB+iWa6AcmWDMdLaz8Vr/psEiKqTAjhw6vmbYdY3TT4w
         eDY2div9WYVd8oggeHJ9Q5NXmcyHnwqVKWmuBAsGAAXIGJ93+5CqxsBOVB+BvT0pG4Ql
         V2ky2pa5CKayk7zHqRFZ5aH1D6V+a8+NgcYztom6RxNa9AKIo4Qtlp6uNV0fnh7cSeLp
         AhOLZ1RmGihWzVv0BDYWeaEQW2ZoHxk7bobuUxKN02wkpJGGh4AuPRHoNJobgXhiMjSK
         GNlw==
X-Gm-Message-State: AOAM531oWO6N7JYA1c+qczyOhIHm/Q1jXL/u2eTkFQcnzaUCXJ3wl7/m
        bHatQPxX2MWjT6UN5GSz6vJa1w==
X-Google-Smtp-Source: ABdhPJz2Xt6yCi4zpBwEAH7Rya8QNBfEhDx9AF+q00be7ONZJMUUj3jtzUAoihEPhpft+Di3dh/oKQ==
X-Received: by 2002:aca:b5c6:: with SMTP id e189mr495877oif.47.1603131768050;
        Mon, 19 Oct 2020 11:22:48 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o8sm175296oog.47.2020.10.19.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 11:22:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Rob Clark <robdclark@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 3/3] iommu/arm-smmu-qcom: Implement S2CR quirk
Date:   Mon, 19 Oct 2020 11:23:23 -0700
Message-Id: <20201019182323.3162386-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
References: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The firmware found in some Qualcomm platforms intercepts writes to S2CR
in order to replace bypass type streams with fault; and ignore S2CR
updates of type fault.

Detect this behavior and implement a custom write_s2cr function in order
to trick the firmware into supporting bypass streams by the means of
configuring the stream for translation using a reserved and disabled
context bank.

Also circumvent the problem of configuring faulting streams by
configuring the stream as bypass.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Made the bypass_cbndx an integer...
- Separated out the "quirk enabled or not" into a bool, rather than reusing
  (the valid) context bank 0 to represent this.
- Dropped the unused EXIDS handling.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 48627fcf6bed..66ba4870659f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -10,8 +10,15 @@
 
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
+	bool bypass_quirk;
+	u8 bypass_cbndx;
 };
 
+static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
+{
+	return container_of(smmu, struct qcom_smmu, smmu);
+}
+
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,mdp4" },
@@ -25,9 +32,33 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 
 static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 {
+	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 reg;
 	u32 smr;
 	int i;
 
+	/*
+	 * With some firmware versions writes to S2CR of type FAULT are
+	 * ignored, and writing BYPASS will end up written as FAULT in the
+	 * register. Perform a write to S2CR to detect if this is the case and
+	 * if so reserve a context bank to emulate bypass streams.
+	 */
+	reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, S2CR_TYPE_BYPASS) |
+	      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, 0xff) |
+	      FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, S2CR_PRIVCFG_DEFAULT);
+	arm_smmu_gr0_write(smmu, last_s2cr, reg);
+	reg = arm_smmu_gr0_read(smmu, last_s2cr);
+	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS) {
+		qsmmu->bypass_quirk = true;
+		qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
+
+		set_bit(qsmmu->bypass_cbndx, smmu->context_map);
+
+		reg = FIELD_PREP(ARM_SMMU_CBAR_TYPE, CBAR_TYPE_S1_TRANS_S2_BYPASS);
+		arm_smmu_gr1_write(smmu, ARM_SMMU_GR1_CBAR(qsmmu->bypass_cbndx), reg);
+	}
+
 	for (i = 0; i < smmu->num_mapping_groups; i++) {
 		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
 
@@ -45,6 +76,41 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static void qcom_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 cbndx = s2cr->cbndx;
+	u32 type = s2cr->type;
+	u32 reg;
+
+	if (qsmmu->bypass_quirk) {
+		if (type == S2CR_TYPE_BYPASS) {
+			/*
+			 * Firmware with quirky S2CR handling will substitute
+			 * BYPASS writes with FAULT, so point the stream to the
+			 * reserved context bank and ask for translation on the
+			 * stream
+			 */
+			type = S2CR_TYPE_TRANS;
+			cbndx = qsmmu->bypass_cbndx;
+		} else if (type == S2CR_TYPE_FAULT) {
+			/*
+			 * Firmware with quirky S2CR handling will ignore FAULT
+			 * writes, so trick it to write FAULT by asking for a
+			 * BYPASS.
+			 */
+			type = S2CR_TYPE_BYPASS;
+			cbndx = 0xff;
+		}
+	}
+
+	reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, type) |
+	      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, cbndx) |
+	      FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, s2cr->privcfg);
+	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_S2CR(idx), reg);
+}
+
 static int qcom_smmu_def_domain_type(struct device *dev)
 {
 	const struct of_device_id *match =
@@ -86,6 +152,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
+	.write_s2cr = qcom_smmu_write_s2cr,
 };
 
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
-- 
2.28.0

