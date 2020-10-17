Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3D9290FA9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Oct 2020 07:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436768AbgJQFyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Oct 2020 01:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411862AbgJQFym (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Oct 2020 01:54:42 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933C2C05BD28
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 21:38:30 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id i12so4500539ota.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 21:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R/eL9BOLO7lfTYwfmIUA3Aou+j6yOxaxr5STlBPy4E8=;
        b=Tk/YA6qo/6rOkDz5xz5TMpyb/nimdkJlU2E/WNrecuaem8ut0FqfNLxQpze6aI/o81
         U4mvWAxfiHjKzj4PppSiggeSvuFmijySekSmYFElvLaMVfQHjGuxy4wvRDr7G6kqQZG1
         r6d9JpAOfpJJSbcjoj2nLJyCuxlpDa4oOLAWXjjVXmTy9ZP3TSdR3RfgFIAI3n+YDToD
         NVyno5FjnfuvMuyD7kiaTVriaksYl2c4mePBekhgwlPoHfNIo/PeDDoqIgoN70E6Acsd
         r7imQQ/QlbUNQaw8OBvCQ2JnZgI/W5vVdDOBWRWxUTe7HwcY+tzKupk0Gxo04G22vTJd
         Fd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R/eL9BOLO7lfTYwfmIUA3Aou+j6yOxaxr5STlBPy4E8=;
        b=mxqSqV8ky2LBhQ5pq5tPemI1zwgfyCaFMGHREnp6y3b0ImUhaO4m2mlhhg6sl1+0+B
         cymt8hUuEV4e/Dz6S0esCjICF0X433gGbkE6Xz0bQd1TZquT9HWp14XauVlgcJS9UW79
         Awo7tgyO1nNNmTzXsu60rVM2DodWQEkKzIEDiaxiMwkeCjHhws1M00oGySwZVM23TvGH
         AOt4uZrEwxFKvWbr/Acdh1YY3xnN4MgZGEfroBOlcTzUpUC8VsbC2Nlp2NVAcNmjrA0k
         FCr2enVSIaQa1MfHBKkhLNxG+pxIwKy6AGB38V6nHIiGVuvBzmL/CSCB5bbMbttAxduG
         PnDw==
X-Gm-Message-State: AOAM531+fJuKXYg5djDGZZvkob7IoezmbOFo0dtkLGP1xYeMFd+D+1Q4
        iA0F4nZBwfqrL/H1zWztGH8lUmALm3s6nA==
X-Google-Smtp-Source: ABdhPJwYTHQyiuBoo03LmtYktPRELqpF0a1iE0YTfXNgfPbXq/MBB3sgEV7hoaQd0dVnrJaUTkda5Q==
X-Received: by 2002:a9d:7c87:: with SMTP id q7mr4988506otn.140.1602909509962;
        Fri, 16 Oct 2020 21:38:29 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t65sm1640038oib.50.2020.10.16.21.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 21:38:29 -0700 (PDT)
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
Subject: [PATCH v4 3/3] iommu/arm-smmu-qcom: Implement S2CR quirk
Date:   Fri, 16 Oct 2020 21:39:07 -0700
Message-Id: <20201017043907.2656013-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017043907.2656013-1-bjorn.andersson@linaro.org>
References: <20201017043907.2656013-1-bjorn.andersson@linaro.org>
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

Changes since v3:
- Move the reservation of the "identity context bank" to the Qualcomm specific
  implementation.
- Implement the S2CR quirk with the newly introduced write_s2cr callback.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 0089048342dd..c0f42d6a6e01 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -10,8 +10,14 @@
 
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
+	bool bypass_cbndx;
 };
 
+static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
+{
+	return container_of(smmu, struct qcom_smmu, smmu);
+}
+
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,mdp4" },
@@ -25,9 +31,32 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 
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
 
@@ -46,6 +75,44 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
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
+	if (qsmmu->bypass_cbndx) {
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
+
+	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs && smmu->smrs[idx].valid)
+		reg |= ARM_SMMU_S2CR_EXIDVALID;
+	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_S2CR(idx), reg);
+}
+
 static int qcom_smmu_def_domain_type(struct device *dev)
 {
 	const struct of_device_id *match =
@@ -87,6 +154,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
+	.write_s2cr = qcom_smmu_write_s2cr,
 };
 
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
-- 
2.28.0

