Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1E41C8D80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 16:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgEGOFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 10:05:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgEGOFJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 10:05:09 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3FCB2083B;
        Thu,  7 May 2020 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588860309;
        bh=WSIu7Z5FH7Emv/oKuxSvVTdQZPPJK253Dm+oh4ENuGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m14WVEGgqdY1BxkifsScKEe4PKnbecF54jWpO3WQvo76eVuDN39EOCgIiCQzGcK+W
         +pa/U27p31NMVqGymANvioEXgq3KJtJPrve852KmfbwHjm3SMPons+m2enqrwX3v/4
         kzw9D2KzefXg71rr3X5MGEHlREkOpIsMRpKQHFxs=
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     catalin.marinas@arm.com, Will Deacon <will@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv4 0/6] iommu/arm-smmu: Allow client devices to select identity mapping
Date:   Thu,  7 May 2020 15:04:55 +0100
Message-Id: <158885770316.87552.2164546926384187579.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Apr 2020 00:03:48 +0530, Sai Prakash Ranjan wrote:
> This series allows DRM, Modem devices to set a default
> identity mapping in qcom smmu implementation.
> 
> Patch 1 is cleanup to support other SoCs to call into
> QCOM specific  implementation.
> Patch 2 sets the default identity domain for DRM devices.
> Patch 3 implements def_domain_type callback for arm-smmu.
> Patch 4 sets the default identity domain for modem device.
> Patch 5-6 adds the iommus property for mss pil.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/6] iommu: arm-smmu-impl: Convert to a generic reset implementation
      https://git.kernel.org/will/c/64510ede3684
[2/6] iommu/arm-smmu: Implement iommu_ops->def_domain_type call-back
      https://git.kernel.org/will/c/232c5ae8a361
[3/6] iommu/arm-smmu: Allow client devices to select direct mapping
      https://git.kernel.org/will/c/0e764a01015d
[4/6] iommu/arm-smmu-qcom: Request direct mapping for modem device
      (not applied)
[5/6] dt-bindings: remoteproc: qcom: Add iommus property
      https://git.kernel.org/will/c/23cf515c6042
[6/6] arm64: dts: qcom: sdm845-cheza: Add iommus property
      https://git.kernel.org/will/c/68aee4af5f62

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
