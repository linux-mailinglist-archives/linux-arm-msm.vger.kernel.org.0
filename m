Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D17AF3EB6C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 16:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240659AbhHMOeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 10:34:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231683AbhHMOeY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 10:34:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55089610A4;
        Fri, 13 Aug 2021 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628865237;
        bh=ta8Xk+nMxYGH0aHGwqur4BcQECkIcU85CR4uMIR+1pc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V71wdBIdMy4DFh8y6KkFUnIHxYrs6ERK3+SNWp3pZqZCaMUoj//bnkta+lzG8/MPT
         IuTVrku1jE7a92RzUJ3mrMen7NZWUxp5klnZCOdhdQ6GjsIzG/mZxZvoxo359APOOd
         R8avxgbnPIHRG1enDH7M+9tgFZ4OrArHVHQm0mUYBpqj5CTHuHoa/vJeD/E4uA/XQd
         hd9NTYHg1iBNsyYATFHz6LbKczAlUCmgZxBb2Z8jVpUlVFUypHfRjbvIWAj1Gc2t21
         mkEBsvyxc/qcWSMFjiPMFPDg535ifpaIn7GDKHB22kEffYrQ7fAHBADeZKMp9QSGPk
         rE3amI/COsAMw==
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        iommu@lists.linux-foundation.org,
        Doug Anderson <dianders@chromium.org>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCHv5] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom implementation
Date:   Fri, 13 Aug 2021 15:33:48 +0100
Message-Id: <162886044327.2821414.7990736519109651727.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210811160426.10312-1-saiprakash.ranjan@codeaurora.org>
References: <20210811160426.10312-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 Aug 2021 21:34:26 +0530, Sai Prakash Ranjan wrote:
> Currently for iommu_unmap() of large scatter-gather list with page size
> elements, the majority of time is spent in flushing of partial walks in
> __arm_lpae_unmap() which is a VA based TLB invalidation invalidating
> page-by-page on iommus like arm-smmu-v2 (TLBIVA).
> 
> For example: to unmap a 32MB scatter-gather list with page size elements
> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize (2MB
> for 4K granule) and each of 2MB will further result in 512 TLBIVAs (2MB/4K)
> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a huge
> overhead.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom implementation
      https://git.kernel.org/will/c/ef75702d6d65

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
