Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A891EE790
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 17:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgFDPUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 11:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729035AbgFDPUH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 11:20:07 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D40D8206E6;
        Thu,  4 Jun 2020 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591284007;
        bh=w2uxMGuh2+1k7LPoRuxUyCewdA+D0PptbvSog58dJiE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W+f0x/FEf8ckxVQEj4c9o8Sbp2+VQ4FAQSK+8OHNGhIInSIYdLal8pWCCNaPj+G6V
         4HfPBpL4h6mXmSMBnKRvcLZHWbD2kv+SvkhdQIXzZwlnHNpXCMrpJCg9WvsZda25/U
         mnPnjW+sbeRpfeHXwCs/6+Pl17xFrsbh45/X29Js=
Date:   Thu, 4 Jun 2020 16:20:02 +0100
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu: Mark qcom_smmu_client_of_match as
 possibly unused
Message-ID: <20200604152002.GC3650@willie-the-truck>
References: <20200603211507.27756-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603211507.27756-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 03, 2020 at 03:15:07PM -0600, Jordan Crouse wrote:
> When CONFIG_OF=n of_match_device() gets pre-processed out of existence
> leaving qcom-smmu_client_of_match unused. Mark it as possibly unused to
> keep the compiler from warning in that case.
> 
> Fixes: 0e764a01015d ("iommu/arm-smmu: Allow client devices to select direct mapping")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm-smmu-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index cf01d0215a39..063b4388b0ff 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -12,7 +12,7 @@ struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  };
>  
> -static const struct of_device_id qcom_smmu_client_of_match[] = {
> +static const struct __maybe_unused of_device_id qcom_smmu_client_of_match[] = {

Yikes, I've never seen that between the 'struct' and the struct name before!
I'd be inclined to stick it at the end, right before the '='.

With that:

Acked-by: Will Deacon <will@kernel.org>

Will
