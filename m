Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0802AD7F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 14:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730692AbgKJNqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 08:46:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:53008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730524AbgKJNqu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 08:46:50 -0500
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD4C22076E;
        Tue, 10 Nov 2020 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605016009;
        bh=P7FNUoUlbSY2GKi42YVDRwQnkOib6vtn54EtBPOLiDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hYDBbp0DdpYpcHeeOBptc7EzMimHnzDqfHH9zPh4g/fqp3K97yvx/BjCLQYQqw/Bo
         hm5eVhisSud5otCjw5SndxHvIiSqDHPiXzMJ6baSTsO+5Okx52I/sEFrisL1N/SI1j
         l25I0lRJXC0UMHi7FqyVZDoJuf3v9Z41LMEfMTH0=
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Hanna Hawa <hannah@marvell.com>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH v19 0/4] iommu/arm-smmu: Add adreno-smmu implementation and bindings
Date:   Tue, 10 Nov 2020 13:46:40 +0000
Message-Id: <160501115071.4000419.14530620296550155623.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109184728.2463097-1-jcrouse@codeaurora.org>
References: <20201109184728.2463097-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 9 Nov 2020 11:47:24 -0700, Jordan Crouse wrote:
> This short series adds support for the adreno-smmu implementation of the
> arm-smmu driver and the device-tree bindings to turn on the implementation
> for the sm845 and sc7180 GPUs. These changes are the last ones needed to enable
> per-instance pagetables in the drm/msm driver.
> 
> v19: Rebase to kernel/git/will/linux.git for-joerg/arm-smmu/updates to pick up
>      system cache patches and devm_realloc() updates. Use a function hook to
>      modify / write sctlr
> v18: No deltas in this patchset since the last go-around for 5.10 [1].
> 
> [...]

Applied patches 1-3 to will (for-joerg/arm-smmu/updates), thanks!

[1/4] iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
      https://git.kernel.org/will/c/5c7469c66f95
[2/4] iommu/arm-smmu: Add a way for implementations to influence SCTLR
      https://git.kernel.org/will/c/bffb2eaf0ba2
[3/4] dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
      https://git.kernel.org/will/c/a29bbb0861f4

I assume the .dts change will be routed separately so as to avoid conflicts.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
