Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160322EB714
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 01:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbhAFAuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 19:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbhAFAuy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 19:50:54 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90BBC061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 16:50:13 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id s2so1729540oij.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 16:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MY//pdNJ1jtx+davhWjroAABUbia63fV6QVASGfH/ZU=;
        b=oCpQ9J6sRS9tagdGMQk9s4DATKdJwjlk3DmHZJHRC2a9b+/fhHiRhB5hmVEJbQizWJ
         pxRfpXLINKc/hGkmByZrBqVos+6zwTeuBY7c6ecAAYm5CPUavshOp9L3w4Jo2hR6Txq4
         kDyIGcPOBMdN7xlskaWqP6rfY0399nyWZnKY6s1MRSOaLbqY4jl3N8utB215yXpeQWFs
         atXjAIlecflorgcH03w5L3c9Mdc4dJhxomxcQr6Q79ow0pfYVJYlZiNQpoQuAOFvcuzj
         D4V23muW+fGVoTGgsHpC2yBP8rothR8pA9NFgm+SXHAdHx5VHv5TCvT8kMgnpCrOQ8GM
         7rJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MY//pdNJ1jtx+davhWjroAABUbia63fV6QVASGfH/ZU=;
        b=S6fDgbcMSeJ4a7aZIh+9wsQtjr1HLjiiFfbQj0ddSnTR+MGOQnCUzUyTwBbvgSboMg
         jXL1yHY+pr5Xar5ds3dhmAMD4PpqWIhVX49sF7l6m0PDZ2UgFiX+xqUW2uTn2BDiUm9J
         1XN1jMF5up0uQnyldLJ/tOvtl3L0OhIotUkE8GnYA0ubjui/VU8S29vufQwIFLKcushC
         MEQwEdImCSVsPZuT4YtOx7GqnsUZPi1bFdDC7aItUimTQktVlyg5maHokVODwdZVaQEf
         UNkYzKf4RJXTWGCInMtVJfvd0ogfk4wiw6agsVMemlsfezjIswZPrnGhRIB6nTjypGCK
         rrLw==
X-Gm-Message-State: AOAM53143rf4Cb2T9GrhdA6mp20dxOTW21bv1uA4JxdDPkakre9W8hOS
        7cdJDSgScwxZcsWElEAQarqrHg==
X-Google-Smtp-Source: ABdhPJyeUxdYzySoOkACZH8a2ASpyGaDSsM6cIg1pK6baaLSMrtCAMOXh3ocIVAnZbnhcBBeInXHSg==
X-Received: by 2002:aca:d506:: with SMTP id m6mr1570736oig.113.1609894213201;
        Tue, 05 Jan 2021 16:50:13 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t24sm222562oou.4.2021.01.05.16.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 16:50:12 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu-qcom: Initialize SCTLR of the bypass context
Date:   Tue,  5 Jan 2021 16:50:38 -0800
Message-Id: <20210106005038.4152731-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8150 it's occasionally observed that the boot hangs in between the
writing of SMEs and context banks in arm_smmu_device_reset().

The problem seems to coincide with a display refresh happening after
updating the stream mapping, but before clearing - and there by
disabling translation - the context bank picked to emulate translation
bypass.

Resolve this by explicitly disabling the bypass context already in
cfg_probe.

Fixes: f9081b8ff593 ("iommu/arm-smmu-qcom: Implement S2CR quirk")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 5dff7ffbef11..1b83d140742f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -196,6 +196,8 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 
 		set_bit(qsmmu->bypass_cbndx, smmu->context_map);
 
+		arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);
+
 		reg = FIELD_PREP(ARM_SMMU_CBAR_TYPE, CBAR_TYPE_S1_TRANS_S2_BYPASS);
 		arm_smmu_gr1_write(smmu, ARM_SMMU_GR1_CBAR(qsmmu->bypass_cbndx), reg);
 	}
-- 
2.29.2

