Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8011954EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 11:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgC0KQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 06:16:08 -0400
Received: from 8bytes.org ([81.169.241.247]:56226 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgC0KQH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 06:16:07 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 8F9B42C8; Fri, 27 Mar 2020 11:16:06 +0100 (CET)
Date:   Fri, 27 Mar 2020 11:16:05 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     iommu@lists.linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, guohanjun@huawei.com,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 00/16] iommu: Move iommu_fwspec out of 'struct device'
Message-ID: <20200327101605.GB3103@8bytes.org>
References: <20200326150841.10083-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326150841.10083-1-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 26, 2020 at 04:08:25PM +0100, Joerg Roedel wrote:
> Joerg Roedel (15):
>   iommu: Define dev_iommu_fwspec_get() for !CONFIG_IOMMU_API
>   ACPI/IORT: Remove direct access of dev->iommu_fwspec
>   drm/msm/mdp5: Remove direct access of dev->iommu_fwspec
>   iommu/tegra-gart: Remove direct access of dev->iommu_fwspec
>   iommu: Rename struct iommu_param to dev_iommu
>   iommu: Move iommu_fwspec to struct dev_iommu
>   iommu/arm-smmu: Fix uninitilized variable warning
>   iommu: Introduce accessors for iommu private data
>   iommu/arm-smmu-v3: Use accessor functions for iommu private data
>   iommu/arm-smmu: Use accessor functions for iommu private data
>   iommu/renesas: Use accessor functions for iommu private data
>   iommu/mediatek: Use accessor functions for iommu private data
>   iommu/qcom: Use accessor functions for iommu private data
>   iommu/virtio: Use accessor functions for iommu private data
>   iommu: Move fwspec->iommu_priv to struct dev_iommu

Applied.
