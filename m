Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE9F2ED20A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 15:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbhAGOXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 09:23:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:43012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbhAGOXl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 09:23:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 028F223355;
        Thu,  7 Jan 2021 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610029374;
        bh=oNLPJObW2d3YofpkNjkaRbAPG15OxVo1dNrFQ+tYOAk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vRO705TTCihW/nt+W1NTwTO30dWw+FCwmHKdGwCkUKgJIePLYAgeMuT7Z5ZzQ+IWn
         HAecnqHoHDkHHAr+gdxLjoRDxDrI9UJwRSs4s+MkMC5lT/KvTbJ2I2B0KXxFutYKYT
         bDPXEuPIvgn6uQy6hFIKM8cdCtaEgyJ2/UZC7/BPqCzHus/RwOSFAMDVuQ4JRBqpcq
         +zSrbG69307ZWYgkOvqm42COAzZIP2Jw19THIvwdobP2YJfXjDAuT0GQtHuyW8vPHT
         B2thw+fGL1JLK+qn+FJx+afc6yWSTv8I42k0BsZdte5J3ov0uO18kAZD/KmIJ4L+IY
         Ks0qTuF9ZtQYA==
From:   Will Deacon <will@kernel.org>
To:     Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Initialize SCTLR of the bypass context
Date:   Thu,  7 Jan 2021 14:22:47 +0000
Message-Id: <161002864635.3143366.6483038182849083276.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106005038.4152731-1-bjorn.andersson@linaro.org>
References: <20210106005038.4152731-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 5 Jan 2021 16:50:38 -0800, Bjorn Andersson wrote:
> On SM8150 it's occasionally observed that the boot hangs in between the
> writing of SMEs and context banks in arm_smmu_device_reset().
> 
> The problem seems to coincide with a display refresh happening after
> updating the stream mapping, but before clearing - and there by
> disabling translation - the context bank picked to emulate translation
> bypass.
> 
> [...]

Applied to arm64 (for-next/iommu/fixes), thanks!

[1/1] iommu/arm-smmu-qcom: Initialize SCTLR of the bypass context
      https://git.kernel.org/arm64/c/aded8c7c2b72

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
