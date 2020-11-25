Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D316B2C41C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 15:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgKYOFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 09:05:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:36358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729902AbgKYOFh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 09:05:37 -0500
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3CB2A206E5;
        Wed, 25 Nov 2020 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606313137;
        bh=V88pL5dlNClg3Rp8IlVW2fGZVgMNsnMnyslRAsAM0/Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IKW4E7dLWXrWphU+1depwI0HysOt8xUnw1zycj1/GiAbqFrqnwZIpebwqZANKTBQG
         zMYtxnOpSvrzyIVc5vWcZhvjf0B+1UXybyI3H61bSs7fklfGgin3EEmIhmzeCMvb+P
         Onqnwz5eSRSV4zLPcE5iBzz27cyKD8hNX4zv1Dzg=
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv10 0/9] System Cache support for GPU and required SMMU support
Date:   Wed, 25 Nov 2020 14:05:19 +0000
Message-Id: <160630994849.3550201.9456322529162111327.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Nov 2020 12:30:09 +0530, Sai Prakash Ranjan wrote:
> Some hardware variants contain a system cache or the last level
> cache(llc). This cache is typically a large block which is shared
> by multiple clients on the SOC. GPU uses the system cache to cache
> both the GPU data buffers(like textures) as well the SMMU pagetables.
> This helps with improved render performance as well as lower power
> consumption by reducing the bus traffic to the system memory.
> 
> [...]

Applied the SMMU bits to arm64 (for-next/iommu/arm-smmu), thanks!

[3/9] iommu/arm-smmu: Add support for pagetable config domain attribute
      https://git.kernel.org/arm64/c/c99110a865a3
[4/9] iommu/arm-smmu: Move non-strict mode to use io_pgtable_domain_attr
      https://git.kernel.org/arm64/c/12bc36793fd6

[8/9] iommu: arm-smmu-impl: Use table to list QCOM implementations
      https://git.kernel.org/arm64/c/00597f9ff5ec
[9/9] iommu: arm-smmu-impl: Add a space before open parenthesis
      https://git.kernel.org/arm64/c/7f575a6087f4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
