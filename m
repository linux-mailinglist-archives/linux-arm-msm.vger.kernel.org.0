Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FEC29F41D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 19:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725648AbgJ2Se0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 14:34:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgJ2SeZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 14:34:25 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D18EF20759;
        Thu, 29 Oct 2020 18:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603996465;
        bh=HQpIAjP1Wxod0EOhVucw1rVm/CQHnVqnXZFVdJMA/3I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WR/UvLGkSG+GOYRLKdDaQJrwlOsEA87CShZ7hL/vdp4sFUNaF1//S4AZGBo/nmWIb
         Wy1Obxgr5/Q9CVI7nbHXzcWog/SlCul5Jviz1b68vpunbOjLcL8q1xlDXYSP/E4abW
         Kzm/LmaDH+FJt2ypzm8zFjBVQ/EML1jLdoa/9tA0=
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <treding@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] iommu/arm-smmu-qcom: Support maintaining bootloader mappings
Date:   Thu, 29 Oct 2020 18:34:18 +0000
Message-Id: <160399513141.1314250.8831514745970142969.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
References: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 19 Oct 2020 11:23:20 -0700, Bjorn Andersson wrote:
> This is the revised fourth attempt of inheriting the stream mapping for
> the framebuffer on many Qualcomm platforms, in order to not hit
> catastrophic faults during arm-smmu initialization.
> 
> The new approach does, based on Robin's suggestion, take a much more
> direct approach with the allocation of a context bank for bypass
> emulation and use of this context bank pretty much isolated to the
> Qualcomm specific implementation.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/3] iommu/arm-smmu: Allow implementation specific write_s2cr
      https://git.kernel.org/will/c/56b75b51ed6d
[2/3] iommu/arm-smmu-qcom: Read back stream mappings
      https://git.kernel.org/will/c/07a7f2caaa5a
[3/3] iommu/arm-smmu-qcom: Implement S2CR quirk
      https://git.kernel.org/will/c/f9081b8ff593

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
