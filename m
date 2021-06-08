Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8180F39FD5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 19:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhFHRSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 13:18:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232007AbhFHRSv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 13:18:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AC2061352;
        Tue,  8 Jun 2021 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623172618;
        bh=yl2qHr4XV3/1fqJTupw4COciZIVz1WyvmJNh/E3HQqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R/I/mVzq1fstGbnDEXSdA6AWxEKtxqXgdbMT/wIk7YSXVPsghiYPbnSI9yI4ZTvOP
         l4PozDCrHNIqn9stZ2jpEhz6KzeVpjDSQ7IM8tefg3kBSnFlNGQ1V9W/dLhW8kvniM
         jd2RgC55iq0cqvBOPbEvskNAck4hbKl9WncGKJB3zztKUYLv9SUZk6rPLR7ZXWEwF+
         NdpCWyf0yRKiZ+5uOW/q1CU74TOnjRJRWMcWaqkxyHACT/eenYOXtR4ENPpX0hffNn
         P+qXs7cRAKHG2aCAkfRVX8mOunUiRbIOFjCqIzn8iUq/2glJaoNUNyHK0K+BTl+xsU
         SqogcFIkL1JPw==
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCHv4 0/2] iommu/arm-smmu-qcom: Add SC7280 support
Date:   Tue,  8 Jun 2021 18:16:48 +0100
Message-Id: <162317109419.2860401.3121131384006826065.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623155117.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1623155117.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 8 Jun 2021 18:00:05 +0530, Sai Prakash Ranjan wrote:
> Patch 1 adds the sc7280 smmu compatible.
> Patch 2 moves the adreno smmu check before apss smmu to enable
> adreno smmu specific implementation.
> 
> Note that dt-binding for sc7280 is already merged.
> 
> Changes in v4:
>  * Rebased on top of arm-smmu/updates with acpi changes.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu/arm-smmu-qcom: Add SC7280 SMMU compatible
      https://git.kernel.org/will/c/0b779f562b14
[2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific impl
      https://git.kernel.org/will/c/ab9a77a141cc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
