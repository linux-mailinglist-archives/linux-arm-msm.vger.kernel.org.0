Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5830D1782F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 20:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730043AbgCCTQc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 14:16:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729687AbgCCTQc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 14:16:32 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 141212073B;
        Tue,  3 Mar 2020 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583262991;
        bh=rRMdJDhihpbw492Akq7IhrH8YLKWl8VjOzCCbOZqZac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DsP98JqYh3FZtjF1CgaIUF1AvB9sYez3Kr5jeTN/D4eI6y+Y2osl0oCTFHFAcXdE3
         E2uj9eZLuK/81D2DscuklPOQ5jC12DWI+V9I2qOViOeoGxqyFsUDmSREGzym4rN9s8
         CieEbNz093Xkw5rG5vlq33olUAgybJvqxCT02uRI=
Date:   Tue, 3 Mar 2020 19:16:25 +0000
From:   Will Deacon <will@kernel.org>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
Message-ID: <20200303191624.GC27329@willie-the-truck>
References: <20200228150820.15340-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Joerg,

On Fri, Feb 28, 2020 at 04:08:06PM +0100, Joerg Roedel wrote:
> here is a patch-set to rename iommu_param to dev_iommu and
> establish it as a struct for generic per-device iommu-data.
> Also move the iommu_fwspec pointer from struct device into
> dev_iommu to have less iommu-related pointers in struct
> device.
> 
> The bigger part of this patch-set moves the iommu_priv
> pointer from struct iommu_fwspec to dev_iommu, making is
> usable for iommu-drivers which do not use fwspecs.
> 
> The changes for that were mostly straightforward, except for
> the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
> Unfortunatly I don't have the hardware for those, so any
> testing of these drivers is greatly appreciated.

I haven't had a chance to review this properly yet, but I did take it
for a spin on my Seattle board with MMU-400 (arm-smmu) and it seems to
work the same as before, so:

Tested-by: Will Deacon <will@kernel.org> # arm-smmu

I'll try to review the patches soon.

Cheers,

Will
