Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE6A302E5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 22:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732835AbhAYVwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 16:52:39 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:36133 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732749AbhAYVwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 16:52:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611611503; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=oHOfrs93dyIetVBU17pSKVVbhMAMi8Wbu2YOAnCq9/E=; b=pqrS83KCenanL+hYK3YUx+RwfcUPxAyf1eZypWMYunSfSMzYOQLxeSbAXQ68vziu6lPuEFFs
 CRNS5XpMVZQ+lVbGXVrZwc6rYLYxnUWXLXMnwF5izxodO/5T+Pp1eHAKJcrnbjchOGPNuhbH
 kQOdAnEEPwBVbKbBCz1NaYAqJ6E=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 600f3d50f07bb817adaee6fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Jan 2021 21:51:12
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84EF7C43462; Mon, 25 Jan 2021 21:51:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89640C433C6;
        Mon, 25 Jan 2021 21:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89640C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 25 Jan 2021 14:51:07 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] iommu/arm-smmu: Add support for driver IOMMU
 fault handlers
Message-ID: <20210125215107.GB16374@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>, Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201124191600.2051751-1-jcrouse@codeaurora.org>
 <20201124191600.2051751-2-jcrouse@codeaurora.org>
 <20210122124125.GA24102@willie-the-truck>
 <8ba2f53d-abbf-af7f-07f6-48ad7f383a37@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ba2f53d-abbf-af7f-07f6-48ad7f383a37@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 22, 2021 at 12:53:17PM +0000, Robin Murphy wrote:
> On 2021-01-22 12:41, Will Deacon wrote:
> >On Tue, Nov 24, 2020 at 12:15:58PM -0700, Jordan Crouse wrote:
> >>Call report_iommu_fault() to allow upper-level drivers to register their
> >>own fault handlers.
> >>
> >>Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >>---
> >>
> >>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 16 +++++++++++++---
> >>  1 file changed, 13 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>index 0f28a8614da3..7fd18bbda8f5 100644
> >>--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>@@ -427,6 +427,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> >>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> >>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> >>  	int idx = smmu_domain->cfg.cbndx;
> >>+	int ret;
> >>  	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> >>  	if (!(fsr & ARM_SMMU_FSR_FAULT))
> >>@@ -436,11 +437,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> >>  	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> >>  	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> >>-	dev_err_ratelimited(smmu->dev,
> >>-	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> >>+	ret = report_iommu_fault(domain, dev, iova,
> >>+		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >>+
> >>+	if (ret == -ENOSYS)
> >>+		dev_err_ratelimited(smmu->dev,
> >>+		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> >>  			    fsr, iova, fsynr, cbfrsynra, idx);
> >>-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> >>+	/*
> >>+	 * If the iommu fault returns an error (except -ENOSYS) then assume that
> >>+	 * they will handle resuming on their own
> >>+	 */
> >>+	if (!ret || ret == -ENOSYS)
> >>+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> >
> >Hmm, I don't grok this part. If the fault handler returned an error and
> >we don't clear the FSR, won't we just re-take the irq immediately?
> 
> If we don't touch the FSR at all, yes. Even if we clear the fault indicator
> bits, the interrupt *might* remain asserted until a stalled transaction is
> actually resolved - that's that lovely IMP-DEF corner.
>
> Robin.
> 

This is for stall-on-fault. The idea is that if the developer chooses to do so
we would stall the GPU after a fault long enough to take a picture of it with
devcoredump and then release the FSR. Since we can't take the devcoredump from
the interrupt handler we schedule it in a worker and then return an error
to let the main handler know that we'll come back around clear the FSR later
when we are done.

It is assumed that we'll have to turn off interrupts in our handler to allow
this to work. Its all very implementation specific, but then again we're
assuming that if you want to do this then you know what you are doing.

In that spirit the error that skips the FSR should probably be something
specific instead of "all errors" - that way a well meaning handler that returns
a -EINVAL doesn't accidentally break itself.

Jordan

> >I think
> >it would be better to do this unconditionally, and print the "Unhandled
> >context fault" message for any non-zero value of ret.

> >
> >Will
> >

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
