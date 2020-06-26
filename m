Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4F320B963
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 21:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgFZTj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 15:39:56 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61228 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgFZTjy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 15:39:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593200393; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=Xbd8tKAuYLuZLCWAKBqCJ3+EPkM4JMZiRco158CFw6w=; b=docAiVEzUQ3RIBqmbisI5XgFXQKT39gFBx+i8TkbhtT1c7XGeWagJ/OYX5f4joNg4Ngxm6f2
 sYsKvF0lpk5FlAP/IB4mW07RWBWJHPxKyA7+6DPDelrIGE8INIgDh3PJZlmo8BV03LleAXcc
 exlIUEYMKEGlSYm7VQfTFJoz39s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5ef64f07bfb34e631c0f61de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 19:39:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44708C433CA; Fri, 26 Jun 2020 19:39:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF088C433C8;
        Fri, 26 Jun 2020 19:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF088C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Fri, 26 Jun 2020 13:39:39 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu: Mark qcom_smmu_client_of_match as
 possibly unused
Message-ID: <20200626193938.GA25740@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Will Deacon <will@kernel.org>,
        linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200604203905.31964-1-jcrouse@codeaurora.org>
 <20200608151308.GB8060@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608151308.GB8060@willie-the-truck>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 08, 2020 at 04:13:08PM +0100, Will Deacon wrote:
> On Thu, Jun 04, 2020 at 02:39:04PM -0600, Jordan Crouse wrote:
> > When CONFIG_OF=n of_match_device() gets pre-processed out of existence
> > leaving qcom-smmu_client_of_match unused. Mark it as possibly unused to
> > keep the compiler from warning in that case.
> > 
> > Fixes: 0e764a01015d ("iommu/arm-smmu: Allow client devices to select direct mapping")
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Acked-by: Will Deacon <will@kernel.org>
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> > 
> >  drivers/iommu/arm-smmu-qcom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> > index cf01d0215a39..be4318044f96 100644
> > --- a/drivers/iommu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm-smmu-qcom.c
> > @@ -12,7 +12,7 @@ struct qcom_smmu {
> >  	struct arm_smmu_device smmu;
> >  };
> >  
> > -static const struct of_device_id qcom_smmu_client_of_match[] = {
> > +static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
> >  	{ .compatible = "qcom,adreno" },
> >  	{ .compatible = "qcom,mdp4" },
> >  	{ .compatible = "qcom,mdss" },
> 
> Thanks. Joerg -- can you pick this one up, please? I don't have any other
> SMMU fixes pending at the moment.
> 
> Cheers,
> 
> Will

Quick ping to pick this up for 5.8 fixes.

Thanks,
Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
