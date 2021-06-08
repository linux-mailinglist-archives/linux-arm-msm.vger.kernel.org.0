Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03CC239F558
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 13:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhFHLos (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 07:44:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230190AbhFHLor (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 07:44:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19D4161359;
        Tue,  8 Jun 2021 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623152575;
        bh=pIAliVku7IravaFCQrKSaIdRMGRbHps6K8o0zU2d7SI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wf/aIJ9pwkaPkFEeuHmAZ4F+HmheItHfVTFOROGzyz1DZORllE3s5ssF683Im9ZUY
         kVYsSrZBfPLM8Ylj+8fbQ/BBBQ6z4yl2E2ZT96mRS+3I6ctBehwQNz2pAOK6Rl1s81
         SxiXbefgv3cbSKGnkBnGh7bLUZmomCl7rz1cgGzRCa20bQmGZs8Oz3rKqWus0HC46u
         TioUkb3aRmbiKO3L69rCTSmGhi/TV04tYGyWdGXgzU4v4AMIi3xwhHWtgik9kOhdnA
         wN35lIaDQnUYBfVsE46OxUxJhGYHhU5eMhivNiSqQaj0r8pvdfHoZTUiIm4Lyd5y1t
         cxT8KIF1vXdOA==
From:   Will Deacon <will@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI boot
Date:   Tue,  8 Jun 2021 12:42:36 +0100
Message-Id: <162314659005.3706607.15027462198951353495.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210509022607.17534-1-shawn.guo@linaro.org>
References: <20210509022607.17534-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 9 May 2021 10:26:07 +0800, Shawn Guo wrote:
> The hookup with qcom_smmu_impl is required to do ACPI boot on SC8180X
> based devices like Lenovo Flex 5G laptop and Microsoft Surface Pro X.
> Define acpi_platform_list for these platforms and match them using
> acpi_match_platform_list() call, and create qcom_smmu_impl accordingly.
> 
> (np == NULL) is used to check ACPI boot, because fwnode of SMMU device
> is a static allocation and thus helpers like has_acpi_companion() don't
> work here.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI boot
      https://git.kernel.org/will/c/a51627c5df58

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
