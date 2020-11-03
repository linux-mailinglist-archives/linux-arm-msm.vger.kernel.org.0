Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761AD2A4CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 18:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgKCR2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 12:28:31 -0500
Received: from z5.mailgun.us ([104.130.96.5]:27397 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727688AbgKCR2b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 12:28:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604424510; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SIY7uNxtZfwPM9wQ4XHUF5oaAuM2aQ3lzPUrO3unZnY=; b=R3ntc+63pLHixMCiiEAQgvQVTYhGsbK5zHmR2YhDFR2X8A72vI2o5YG/o0Fp1DUkqOcBIOC8
 otPwcm7WOsqTPRMCX70yoUD5kLtZQVTKK6faOxRCBq1/kQMKcvuua0cQk+e74m5EQbVJ4BIY
 c19e8AUOq6rTqElL3GB1jvJuqxA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fa19333d981633da3036ee5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 17:28:19
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70994C43387; Tue,  3 Nov 2020 17:28:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6C49C433C8;
        Tue,  3 Nov 2020 17:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6C49C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 3 Nov 2020 10:28:13 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thierry Reding <treding@nvidia.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 2/4] iommu/arm-smmu: Add a way for implementations to
 influence SCTLR
Message-ID: <20201103172813.GA5934@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>, Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thierry Reding <treding@nvidia.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201102171416.654337-1-jcrouse@codeaurora.org>
 <20201102171416.654337-3-jcrouse@codeaurora.org>
 <0a00c162-ad77-46b7-85ad-e11229b57a3d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a00c162-ad77-46b7-85ad-e11229b57a3d@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 02, 2020 at 06:18:45PM +0000, Robin Murphy wrote:
> On 2020-11-02 17:14, Jordan Crouse wrote:
> >From: Rob Clark <robdclark@chromium.org>
> >
> >For the Adreno GPU's SMMU, we want SCTLR.HUPCF set to ensure that
> >pending translations are not terminated on iova fault.  Otherwise
> >a terminated CP read could hang the GPU by returning invalid
> >command-stream data.
> >
> >Signed-off-by: Rob Clark <robdclark@chromium.org>
> >Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >---
> >
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++++
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 3 +++
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 3 +++
> >  3 files changed, 12 insertions(+)
> >
> >diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >index 1e942eed2dfc..0663d7d26908 100644
> >--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >@@ -129,6 +129,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
> >  	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
> >  		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> >+	/*
> >+	 * On the GPU device we want to process subsequent transactions after a
> >+	 * fault to keep the GPU from hanging
> >+	 */
> >+	smmu_domain->cfg.sctlr_set |= ARM_SMMU_SCTLR_HUPCF;
> >+
> >  	/*
> >  	 * Initialize private interface with GPU:
> >  	 */
> >diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >index dad7fa86fbd4..1f06ab219819 100644
> >--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >@@ -617,6 +617,9 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> >  	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> >  		reg |= ARM_SMMU_SCTLR_E;
> >+	reg |= cfg->sctlr_set;
> >+	reg &= ~cfg->sctlr_clr;
> 
> Since we now have a write_s2cr hook, I'm inclined to think that the
> consistency of a write_sctlr hook that could similarly apply its own
> arbitrary tweaks would make sense for this. Does anyone have any strong
> opinions?

None from me. That would make an eventual stall-on-fault implementation easier
too.

Jordan

> Robin.
> 
> >+
> >  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
> >  }
> >diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >index 6c5ff9999eae..ddf2ca4c923d 100644
> >--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >@@ -144,6 +144,7 @@ enum arm_smmu_cbar_type {
> >  #define ARM_SMMU_CB_SCTLR		0x0
> >  #define ARM_SMMU_SCTLR_S1_ASIDPNE	BIT(12)
> >  #define ARM_SMMU_SCTLR_CFCFG		BIT(7)
> >+#define ARM_SMMU_SCTLR_HUPCF		BIT(8)
> >  #define ARM_SMMU_SCTLR_CFIE		BIT(6)
> >  #define ARM_SMMU_SCTLR_CFRE		BIT(5)
> >  #define ARM_SMMU_SCTLR_E		BIT(4)
> >@@ -341,6 +342,8 @@ struct arm_smmu_cfg {
> >  		u16			asid;
> >  		u16			vmid;
> >  	};
> >+	u32				sctlr_set;    /* extra bits to set in SCTLR */
> >+	u32				sctlr_clr;    /* bits to mask in SCTLR */
> >  	enum arm_smmu_cbar_type		cbar;
> >  	enum arm_smmu_context_fmt	fmt;
> >  };
> >

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
