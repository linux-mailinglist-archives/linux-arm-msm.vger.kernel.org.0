Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE5D279953
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgIZNAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729476AbgIZNAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9611EC0613D5;
        Sat, 26 Sep 2020 06:00:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k15so6819496wrn.10;
        Sat, 26 Sep 2020 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POwNz31ZN3LOQvK8MbPorXqI52RXX9/Ai5jo+kx6R5E=;
        b=n/LlruLXp5eS3hUv4JVlIQ1RePSbyLXxeXGV+9PARKUxGojZ93WfkBuzL+BjVrKxdU
         CtbQiP2nnjvnhIZVM+gmIH+oePtSMU6/RNATnAbo4x9/mtvdLD3kmw8sjQl7mUwWdvSN
         cY7k5e+9GIPJ0M9tyStdj9TVC2TN6K39aZ+56rr5Y+fBU66cuN8+1GNutQzhw7bXAOLT
         4cN/soOvcCIf1vhp410SEB27vmGidsDYm4NiVn3IJkaDUv1El+vL0GZhftJXpILrC+2K
         twtk6ycSorMIjJ3/B38bvdjGeeZtSIPr2NIWh1MhPaXBIu1wUNrHhtUasdldNHtFSEyK
         iWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POwNz31ZN3LOQvK8MbPorXqI52RXX9/Ai5jo+kx6R5E=;
        b=qmIh13PP3R4BxKxcjj6LMAxv63HXfNQGLpTTO/WCcP8qfAcFS1+vk08wDXoAeOHpw7
         jTYRwPPDiDwxNFhNyonwWOxTvcQ50/LM8v1UeqN4FdeBTmsMEazOar9uw5d6uHHxhGSV
         hvOrAYBAbVaMzMYGH9bPk+G38jv1FaJFv5mRUn56BxIyYOXHcBgHU7/ghmaXp7PDfhUK
         u1rxIOARou4V/vGl2fuXcvh7O21jPECGnpp0ownj8CbrSFDxYxEawDiKXsdAXKrQ3Zw0
         YhNbWfnehFDF6XqNGUdm9mIeHbHeW3TXZEjLtpEzHfO1hUqgZkEjJ1BqC8qA+zNbrx6H
         A3kA==
X-Gm-Message-State: AOAM533oBJYNeUKA0k2MasqDrCJ0i6rmGI0qsvN8t+/HPa5h4zvsLnCN
        nUZ7x7QgRSjdpX9SH2zQNxk=
X-Google-Smtp-Source: ABdhPJxKO7cz2KLjIhwJxFhZR3eStWHED3pAB8ByU4QPl9SSq0oDXBVFVySh0V+586xr+M/Jh7mSWg==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr9728962wrn.5.1601125217236;
        Sat, 26 Sep 2020 06:00:17 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:16 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] iommu/arm-smmu-qcom: Add stream_mapping_reset detail to QCOM SMMUv2
Date:   Sat, 26 Sep 2020 15:00:04 +0200
Message-Id: <20200926130004.13528-9-kholk11@gmail.com>
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
some context banks are hyp-protected and cannot be disabled,
nor the relative S2CRs can be set as bypass, or a hyp-fault
will be triggered and the system will hang.

This is seen on at least Qualcomm SDM630, SDM636 and SDM660.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b18e70bddf29..364908cc2adf 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -85,6 +85,18 @@ static int qcom_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static void qcom_smmuv2_stream_mapping_reset(struct arm_smmu_device *smmu)
+{
+	/*
+	 * Broken firmware quirk:
+	 * On some Qualcomm SoCs with certain hypervisor configurations,
+	 * some context banks are hyp-protected and cannot be disabled,
+	 * nor the relative S2CRs can be set as bypass, or a hyp-fault
+	 * will be triggered and the system will hang.
+	 */
+	return;
+}
+
 static void qcom_smmuv2_test_smr_masks(struct arm_smmu_device *smmu)
 {
 	/*
@@ -99,6 +111,7 @@ static void qcom_smmuv2_test_smr_masks(struct arm_smmu_device *smmu)
 
 static const struct arm_smmu_impl qcom_smmuv2_impl = {
 	.cfg_probe = qcom_smmuv2_cfg_probe,
+	.stream_mapping_reset = qcom_smmuv2_stream_mapping_reset,
 	.test_smr_masks = qcom_smmuv2_test_smr_masks,
 };
 
-- 
2.28.0

