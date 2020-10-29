Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5FF29F326
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 18:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgJ2R0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 13:26:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:43712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbgJ2R0Q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 13:26:16 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CAFF206CB;
        Thu, 29 Oct 2020 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603992375;
        bh=ydtT245KR4NOVY4gur+adaCMxoV41NBuWwlp88cEl8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CYT+Aaf4mrNMx1sFQUTd5llJYqfeqgcZLxEcsAuy3xMBgfjPjBCVTpQUYv58eaCk5
         4NisOpJzE1bJoj3JWcE8rnPiKgsOV9MMkuUIs9m/G221zTHsJb2Uct40FZVjv/puBI
         QetIP8XCZNX0p/kL0f0uDAC7nRFocK+i4DkNiL7Y=
Date:   Thu, 29 Oct 2020 17:26:08 +0000
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/4] iommu/arm-smmu: Add adreno-smmu implementation
 and bindings
Message-ID: <20201029172607.GA30745@willie-the-truck>
References: <20201027223408.469893-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027223408.469893-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 27, 2020 at 04:34:04PM -0600, Jordan Crouse wrote:
> This short series adds support for the adreno-smmu implementation of the
> arm-smmu driver and the device-tree bindings to turn on the implementation
> for the sm845 and sc7180 GPUs. These changes are the last ones needed to enable
> per-instance pagetables in the drm/msm driver.
> 
> No deltas in this patchset since the last go-around for 5.10 [1].
> 
> [1] https://patchwork.freedesktop.org/series/81393/
> 
> Jordan Crouse (3):
>   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
>   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
>   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> 
> Rob Clark (1):
>   iommu/arm-smmu: Add a way for implementations to influence SCTLR

FYI: this patch (patch 4/4) doesn't seem to have made it anywhere (I don't
have it, and neither does the archive).

Will
