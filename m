Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451AF2C41C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 15:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729922AbgKYOFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 09:05:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:36428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729902AbgKYOFk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 09:05:40 -0500
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96049206D8;
        Wed, 25 Nov 2020 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606313140;
        bh=CrW9VJQR3WVXiruWhGTnLGV91u/uR09AoTYqRiq51WQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OLniI8sFhqbr1EsqH5ak+Bj8H223FzLjqgx9hy4JvMdUTPhk8AxEK7UuZ3YhHe6vU
         HCfNTbwZEkTHi2hmkE5h42MvHfwZgRL7CY5oNbB7mb2njdp//PCzN1FeiwISPN8BLB
         2KZP2Yo7RgeexiluKCl5OSZ0Qa7qIDoRtkcB+oGc=
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCHv10 0/9] System Cache support for GPU and required SMMU support
Date:   Wed, 25 Nov 2020 14:05:20 +0000
Message-Id: <160630795189.1943614.1845602767779998183.b4-ty@kernel.org>
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

Applied first two patches on a shared branch for Rob:

	arm64 (for-next/iommu/io-pgtable-domain-attr), thanks!

[1/9] iommu/io-pgtable: Add a domain attribute for pagetable configuration
      https://git.kernel.org/arm64/c/a7656ecf825a
[2/9] iommu/io-pgtable-arm: Add support to use system cache
      https://git.kernel.org/arm64/c/e67890c97944

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
