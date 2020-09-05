Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7191025EA3E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgIEUFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgIEUFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:05:08 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BA6C061244;
        Sat,  5 Sep 2020 13:05:07 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y6so225304plt.9;
        Sat, 05 Sep 2020 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DvFdTPchcbyWEX++eP+RtKIp66/AsHgH2aEoABwhrPw=;
        b=Owm67BOye7cLn9/FM8RhXNLMKAdbSblV5WEyMv7bJR8n9ma1DGn8BAfSLnoMQDMxMt
         EPDu/uwUkDOVTGgmEoieRU+cWIYSRwpP6G179J2U3AyXFcG4RCTV7Omxd2wkMnw2R+v+
         fRwVl1GJL4pcAu5p6rbMdMtSy5hWFVfpMXB3Fi5mveMK8gC97pkmbrGKY/DZmIW3QNIx
         g445ia8irLz4OwfA70RY95WQn+fFk8xzYycE4n89onbedeNxEeQr88b+I+Cj/mOsx3yg
         hpA3R3zMSS120XHism4saTnqpyqyPLWgVOM3h/VOWflTvyH5NhYGduGtkTNrC9FD701Z
         gevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DvFdTPchcbyWEX++eP+RtKIp66/AsHgH2aEoABwhrPw=;
        b=GdDalkbu+r9qtIfrQ3bHWhhilHsBT6qxo4Y9l+uWD70ltodsdLWLapPQ9axVEpD4OH
         xt4Iht8G9I+VWXVDIvnpAnctkHGIttoavU+wC7I6Lh4lESHTay+sxWYw6ghGyWPhbI2k
         ItSU/lGDQpH0+Vyk3Unny5bU4+wxtjSkXlNkvjrEXt17bL9wU5sMX3qHGztNc6ba0eNH
         vpo3mo6xGi5hkY7wdDly9YSaoPQ8nwdgSz7DQ6Fy9uQCDZ1F450J/0IMuIiG3nj0stNX
         XNqCWHQ1kAnI7v2nq4dFGzsaXHPdAzGnwk0t+E9faZ29pqoKzwdqtQEAmCk2uC3YYiG4
         +GAg==
X-Gm-Message-State: AOAM533ZsTd9eYatbDgoDe3VMPMSWl3pup/QR3oN1b+LeP46Cs9HaqRd
        h+drrfoQJh4aV4UY9HgpWng=
X-Google-Smtp-Source: ABdhPJxcnTtjrFZorqcAMTBoFnU7uOJs0ZXz5XW2NjfoAJXt07Zkspj2KF6vavtuzciDC2NujMM/Qw==
X-Received: by 2002:a17:90a:8402:: with SMTP id j2mr13744447pjn.153.1599336307437;
        Sat, 05 Sep 2020 13:05:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 70sm10615253pfu.107.2020.09.05.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:05:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v17 17/20] iommu/arm-smmu: Add a way for implementations to influence SCTLR
Date:   Sat,  5 Sep 2020 13:04:23 -0700
Message-Id: <20200905200454.240929-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For the Adreno GPU's SMMU, we want SCTLR.HUPCF set to ensure that
pending translations are not terminated on iova fault.  Otherwise
a terminated CP read could hang the GPU by returning invalid
command-stream data.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 3 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 1e942eed2dfc..0663d7d26908 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -129,6 +129,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
 		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
 
+	/*
+	 * On the GPU device we want to process subsequent transactions after a
+	 * fault to keep the GPU from hanging
+	 */
+	smmu_domain->cfg.sctlr_set |= ARM_SMMU_SCTLR_HUPCF;
+
 	/*
 	 * Initialize private interface with GPU:
 	 */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index dad7fa86fbd4..1f06ab219819 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -617,6 +617,9 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		reg |= ARM_SMMU_SCTLR_E;
 
+	reg |= cfg->sctlr_set;
+	reg &= ~cfg->sctlr_clr;
+
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 6c5ff9999eae..ddf2ca4c923d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -144,6 +144,7 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_SCTLR_S1_ASIDPNE	BIT(12)
 #define ARM_SMMU_SCTLR_CFCFG		BIT(7)
+#define ARM_SMMU_SCTLR_HUPCF		BIT(8)
 #define ARM_SMMU_SCTLR_CFIE		BIT(6)
 #define ARM_SMMU_SCTLR_CFRE		BIT(5)
 #define ARM_SMMU_SCTLR_E		BIT(4)
@@ -341,6 +342,8 @@ struct arm_smmu_cfg {
 		u16			asid;
 		u16			vmid;
 	};
+	u32				sctlr_set;    /* extra bits to set in SCTLR */
+	u32				sctlr_clr;    /* bits to mask in SCTLR */
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
 };
-- 
2.26.2

