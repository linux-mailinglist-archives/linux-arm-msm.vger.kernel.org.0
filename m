Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EB1279951
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729505AbgIZNA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729374AbgIZNAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:15 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421DDC0613CE;
        Sat, 26 Sep 2020 06:00:15 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z4so6893581wrr.4;
        Sat, 26 Sep 2020 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0jmpuG1sG/LCfKsjazCgf9OHk0sr2fgX8L2MMSiufQc=;
        b=GVKvSy0sgUcoO2wR+MPkLvnJLC1JWabHJc374jpH3QNtS+OfhY6zKPZQ9y7/DUWg2t
         dXP6qfinI7aP9ZHV/Q0esy4mb+4RrRwh8LZzflfZXhJ8ztBASY53Buc0mfVJp0117cKO
         lpK+3kZfPe5kGjDw/3N6wQL7dQMROqYdr8yY8hdYXL/QzKBHbqSpkprUtarWqzg1+G6d
         qDM9cgm8D00Rd2gnb+hKzULNIfLZ4v4eHEAglF9eO/hf7FQFCRQGhmZgVgBfemAmzOQd
         D7b8FCHnlRCnNHZfUvr3f9q2XVyNA3KwYH6PyML+Rwb/D4yjC/gsmepbEL90w1t5Z/X5
         Qb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0jmpuG1sG/LCfKsjazCgf9OHk0sr2fgX8L2MMSiufQc=;
        b=IouWwKXtfvakFQm8KWfVwVay8+8X+6xRjMUqMLeam23Shj612BXFnbQK+Egs66nSR2
         z2LuYVv1qujTXzvI71DvWqSELBDvz/O6MiLhzesnRgkO3z2GzuWi4IQmquq2J6rfvkJt
         tJZ98wrZ2+NxU0OqdQPn1rr6DqHWwvts6r4ZfuwCoWfThV7yHbzsEuDS4+6w0NsZ7Qll
         s4utHWfbrLPHSpERhzSj1BpOLaV6o8kOFjnwxqQj7PpoNUNOcFaA/gED2H3QakNNEyil
         Ip9l0p3scXR3YF7dQM7Zk5rWTai2v6rDuJph95oW+VKhtBwkxtnfuYNbID//5RUYZKec
         Qn/A==
X-Gm-Message-State: AOAM533ly12mgzT/8/hVJ5vKSQGeaooOeCQeC8Gafan5+aCM3eaQmZ4W
        VXtjKck1UqR5r0TtXXRzQJetj5+AFEhK0g==
X-Google-Smtp-Source: ABdhPJyIuZfQRoZQ+orDTsJ4JEDVE4SCSy84utTQYhNdRFzDilj+Ty9sQoQIxOcufdQGIoZ1ebtlGg==
X-Received: by 2002:a5d:56cd:: with SMTP id m13mr9197517wrw.261.1601125213898;
        Sat, 26 Sep 2020 06:00:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] iommu/arm-smmu-qcom: Add test_smr_masks detail to QCOM SMMUv2
Date:   Sat, 26 Sep 2020 15:00:01 +0200
Message-Id: <20200926130004.13528-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130004.13528-1-kholk11@gmail.com>
References: <20200926130004.13528-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

On some Qualcomm SoCs with certain hypervisor configurations,
writing the streamid masks to the SMRs will trigger a hyp-fault
and crash the system.

This is seen on at least Qualcomm SDM630, SDM636 and SDM660.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index f5bbfe86ef30..b18e70bddf29 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -85,8 +85,21 @@ static int qcom_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static void qcom_smmuv2_test_smr_masks(struct arm_smmu_device *smmu)
+{
+	/*
+	 * Broken firmware quirk:
+	 * On some Qualcomm SoCs with certain hypervisor configurations,
+	 * writing the streamid masks to the SMRs will trigger a hyp-fault
+	 * and crash the system.
+	 */
+	smmu->streamid_mask = 0x7FFF;
+	smmu->smr_mask_mask = 0x7FFF;
+}
+
 static const struct arm_smmu_impl qcom_smmuv2_impl = {
 	.cfg_probe = qcom_smmuv2_cfg_probe,
+	.test_smr_masks = qcom_smmuv2_test_smr_masks,
 };
 
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
-- 
2.28.0

