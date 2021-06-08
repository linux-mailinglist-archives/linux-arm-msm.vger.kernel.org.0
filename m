Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7D739F550
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 13:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhFHLog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 07:44:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:39402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231630AbhFHLog (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 07:44:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1666561351;
        Tue,  8 Jun 2021 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623152563;
        bh=pOzoKPtk0XS1kxkNA7PWuBAkl2UNNnQrdZwUcp7dwwY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FbmTRSwDXkDzelC64LEQowqRTdlVawzUifOUIiPjivItS4VFLBhnMuzDthSBs5w8n
         1Ac3OzetZzhKnJa+9L5rgvmzvqfZiPQTbR4vypcNGn8GMbsOVmLSFVac1hZvjhDodb
         bsqKgEfi3lk2FLt4al/EdPrQFOaTafzxjY4c3xaiXiXtMuL6JdpxV7QTU8NNLkygUk
         3AOhdNHCUOSgTEV4CwcuAiK/ay1itPbGVKI/1JQH2hMB+sG78dhQxWLK/vuT+VEtHo
         FYrB2K/Du0x8Yi+6rWvFbZAGkOhuVbyj+JYibwJDgwqHUWkCevC1MjTpxGhTCnR3eT
         9JLycmZVXRaqA==
From:   Will Deacon <will@kernel.org>
To:     Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        freedreno@lists.freedesktop.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>, Rob Clark <robdclark@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Joerg Roedel <joro@8bytes.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
Date:   Tue,  8 Jun 2021 12:42:32 +0100
Message-Id: <162314684999.3707477.2160007647178776134.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
References: <20210326231303.3071950-1-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Mar 2021 16:13:02 -0700, Eric Anholt wrote:
> db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> the GPU from wedging and then sometimes wedging the kernel after a
> page fault), but it doesn't have separate pagetables support yet in
> drm/msm so we can't go all the way to the TTBR1 path.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
      https://git.kernel.org/will/c/a242f4297cfe
[2/2] arm64: dts: msm8996: Mark the GPU's SMMU as an adreno one.
      https://git.kernel.org/will/c/19c07b91f85d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
