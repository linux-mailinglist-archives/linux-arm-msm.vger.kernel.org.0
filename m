Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126142C0F3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 16:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732454AbgKWPrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 10:47:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:40344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730956AbgKWPrL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 10:47:11 -0500
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B142320B1F;
        Mon, 23 Nov 2020 15:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606146431;
        bh=liw0vFpQnqcjI3i4phcXrlgXpuoa4Cd0IXbxBoIJ3xE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aqvbywYz7pfnV73A8wIB4GNBS+jqx2H8kz1q3qyS8CekS8bvtszw9/CJy8b8rohxU
         v+x/Wx0bv19xr0FVF/CvxJH4R74RTOMxR6jj4ctN662KjLLkhS73tno/olheOZ+04w
         b3YQCBsGvdokA8/oR2+l2pcrA8gahGVWlaFDh6Kg=
From:   Will Deacon <will@kernel.org>
To:     lkml <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, Marc Zyngier <maz@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH 1/2] arm-smmu-qcom: Ensure the qcom_scm driver has finished probing
Date:   Mon, 23 Nov 2020 15:46:59 +0000
Message-Id: <160614327473.875458.14207739459234972190.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112220520.48159-1-john.stultz@linaro.org>
References: <20201112220520.48159-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 Nov 2020 22:05:19 +0000, John Stultz wrote:
> Robin Murphy pointed out that if the arm-smmu driver probes before
> the qcom_scm driver, we may call qcom_scm_qsmmu500_wait_safe_toggle()
> before the __scm is initialized.
> 
> Now, getting this to happen is a bit contrived, as in my efforts it
> required enabling asynchronous probing for both drivers, moving the
> firmware dts node to the end of the dtsi file, as well as forcing a
> long delay in the qcom_scm_probe function.
> 
> [...]

Applied only the first patch to arm64 (for-next/iommu/fixes), thanks!

[1/2] arm-smmu-qcom: Ensure the qcom_scm driver has finished probing
      https://git.kernel.org/arm64/c/72b55c96f3a5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
