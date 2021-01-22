Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A5F30048B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 14:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbhAVNuc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 08:50:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727519AbhAVNu1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 08:50:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BB5223A56;
        Fri, 22 Jan 2021 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611323387;
        bh=SunCbNL4thbixbqDicq4yiLamp38pRmNRlL/3HAqsk8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lk46HK/GrIT2Tqbb4rsxVgvFAOZ13xkVQe2JlPxXmufo1EC7vCIsS3D4UJahDbvjU
         t53MeaWONPrXofvDYvCD8kWznq1lUhvke7DpKq4jVqRLUoBMZjj6Y/3eOB6v02VSgK
         BrysGMDpezrrSTONUXkkYQ8iDmx5ApijCpSZiiCD0yEOsm8TuPwApntnY8Bdnq0kf7
         CeMnxKOCCzc6TdL9TaRfi0mNX8s332dJgQGjfJwSmoDw8sjsH3D5TQ1iatvz6qcK/q
         dS98DaRBtAmXPwfQ9C2GrK0Se31gAyAAN0qCAvr7udrGTsDNpWFYwSUBSQ+mMTzIN2
         g/eCH2+5EdCnQ==
From:   Will Deacon <will@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add sm8350 compatible string
Date:   Fri, 22 Jan 2021 13:49:34 +0000
Message-Id: <161132142879.229688.17163617235466107602.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115090322.2287538-1-vkoul@kernel.org>
References: <20210115090322.2287538-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Jan 2021 14:33:21 +0530, Vinod Koul wrote:
> Add compatible string for sm8350 iommu to documentation.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] dt-bindings: arm-smmu: Add sm8350 compatible string
      https://git.kernel.org/will/c/70b5b6a6daea
[2/2] iommu: arm-smmu-impl: Add SM8350 qcom iommu implementation
      https://git.kernel.org/will/c/d8498b1e4ecc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
