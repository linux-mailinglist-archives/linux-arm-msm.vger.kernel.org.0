Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFB2279957
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729587AbgIZNAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729445AbgIZNAR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767A5C0613D4;
        Sat, 26 Sep 2020 06:00:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o5so6810275wrn.13;
        Sat, 26 Sep 2020 06:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJru3Yf9kUEHtScNf7bPezrHXeNo+5yqG0dd6MucAIM=;
        b=iUHAdBiM4Ztclp83OHMT5Spe42ecEdk6Ebg6KRMLcO5EmTMcu3595Gzo5uBdbdSJqb
         maGTK5QGoXom4E650DbDb87MPdXVAaDqOwD4oKu0TsU1J9T8mOi8H+WejzIl7RKnSViW
         CA0OjHc2YAetYFdlmdgrT4YVJjB7DM8GwRHz/cQIfuUF+Qg/yskAecqitcS4q9LwyaOT
         5Ccxz5MQ5vdBM31N3pDL+7ocPQuIFCyc7cHqLoLTwPav8e5Bn/r7GILrJ5VXCovKeJXt
         yhhLmdUj6OH9g9wnN3VNY4Fr9b6XT7Nd8CJFpGUFvaHAgoYttdtta0XdT/rFx01BhuIo
         eTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJru3Yf9kUEHtScNf7bPezrHXeNo+5yqG0dd6MucAIM=;
        b=PDY8wS6vfYtrcojNFdh9h9uRFIV1eLeSLbOZxi9XJ2nqXTMDwUHIwGlAbk/3UruYbn
         Q3TGKiwWtIy6KmhKxbCSnJJgS3r8iA1k+J9KU8k9L/d/uPgT8pjh7PPoZNLwovwuOADX
         a/Dx/khPvqMD1Wf8aqQSMQwEUfrzPnS9+hqqKyNHAUGMiNM3heMAF8PQ67ojDJZ6Fvbg
         DoFrj6IpoOinp4GtYY8AzsxKVFoqreclCcr3fvBFyH2IHS/e7B+DCp29pM6cYZF2fBQl
         uzU95lIRyp3/2ca1Tz9rNd9OyEJbRy8rbPTm/GQbuDsbSqBwTWtY3d8uJ+6qn3VkCuDh
         3bCQ==
X-Gm-Message-State: AOAM530UaN/CSrgV7FduD4fAE0M1e4o0gFiKPTkYsJdBh90SXrFFMBfJ
        98wUXWM0aBuX2cMOtBsKKj8=
X-Google-Smtp-Source: ABdhPJyFsQlj8vbeDAz3ASb3mPXPpgHdSK0AAp1BxkI4M+J1BqiaypCACxgG7WA9tqBFM1sOkflgEg==
X-Received: by 2002:adf:e6cf:: with SMTP id y15mr9453310wrm.346.1601125216046;
        Sat, 26 Sep 2020 06:00:16 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:15 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] iommu/arm-smmu: Support stream_mapping_reset implementation detail
Date:   Sat, 26 Sep 2020 15:00:03 +0200
Message-Id: <20200926130004.13528-8-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130004.13528-1-kholk11@gmail.com>
References: <20200926130004.13528-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some IOMMUs may be in need of overriding the stream mapping reset
function and this is seen on at least some Qualcomm SoCs:
add a stream_mapping_reset function to the implementation details
and call it in the appropriate function.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 5 +++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8c070c493315..44571873f148 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1656,6 +1656,11 @@ static void arm_smmu_stream_mapping_reset(struct arm_smmu_device *smmu)
 {
 	int i;
 
+	if (smmu->impl && smmu->impl->stream_mapping_reset) {
+		smmu->impl->stream_mapping_reset(smmu);
+		return;
+	}
+
 	/*
 	 * Reset stream mapping groups: Initial values mark all SMRn as
 	 * invalid and all S2CRn as bypass unless overridden.
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2cd3d126f675..9c045594b8cf 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -387,6 +387,7 @@ struct arm_smmu_impl {
 	int (*cfg_probe)(struct arm_smmu_device *smmu);
 	int (*reset)(struct arm_smmu_device *smmu);
 	int (*init_context)(struct arm_smmu_domain *smmu_domain);
+	void (*stream_mapping_reset)(struct arm_smmu_device *smmu);
 	void (*test_smr_masks)(struct arm_smmu_device *smmu);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
-- 
2.28.0

