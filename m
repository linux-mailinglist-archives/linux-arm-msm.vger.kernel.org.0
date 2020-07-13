Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2847221D73E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 15:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbgGMNdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 09:33:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:43222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729564AbgGMNdb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 09:33:31 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD012206F0;
        Mon, 13 Jul 2020 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594647211;
        bh=V6r4Vd0ntf60ms9BvuVNTsa0FkIV6RXDVM+LwGICXLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jebLbqpU9BkeoVARZiIrMIIpbl3sUjLWNqnwQQ2WDCSlwQ8i8dKzW/gqYFKA7+bGw
         DxLSazw26HbvtDAtyGTI7VXXv5Y3D+wk9lZlsQ7tOz8E8EB0qoNnbAp4RJ6Np/AmmA
         1P2GA7GUN8Nbuzv6Kvic8JC292fM30ZxjLrlEK2k=
Date:   Mon, 13 Jul 2020 14:33:26 +0100
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>, joro@8bytes.org
Cc:     linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu: Mark qcom_smmu_client_of_match as
 possibly unused
Message-ID: <20200713133326.GB2739@willie-the-truck>
References: <20200604203905.31964-1-jcrouse@codeaurora.org>
 <20200608151308.GB8060@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608151308.GB8060@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

I can't see this in Joerg's tree or in linux-next. Joerg: did you pick this
one up? (I thought you did, but I can't find it!).

Will
