Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341F73E8449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 22:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhHJU0b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 16:26:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:39136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229764AbhHJU02 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 16:26:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1C976101D;
        Tue, 10 Aug 2021 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628627165;
        bh=sZUZNisiNzjIpVajNcqlYYjOt5HpgpxjVbVXTN3qHlc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ElntkXnT18F1lB/MSxCigZ77LaGKeLlezXPLFWKIW5F4LuiDtJwgkSuUmHlgrmXos
         d5l9ZMqERKREsVdzNQNftjDbp2JnXNyiBmLwWMINgukaytFd24mcouuonNwbpp88wQ
         b9zG+wtSmUkm6vn23fniLH8JdcEwgrSQFQRUMKOPuC3xffccxR9ODS+Dohmcd/bX4T
         U2Mgqv+qJQEWSVUJAh0KxecKDtleD36YfXOwoaucAWfuilV1K5xAcWnr1LgbtbHdLb
         b06MFk4FCdmL42HpHA+mOLw7yWKIX+uNvSbc+J4zmko5lBfCdGG+coajJKY6Hf6JZh
         bPNxyQeAkwlPA==
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to system pm callbacks
Date:   Tue, 10 Aug 2021 21:25:55 +0100
Message-Id: <162860133458.2066705.4766353866731374871.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810064808.32486-1-saiprakash.ranjan@codeaurora.org>
References: <20210810064808.32486-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 Aug 2021 12:18:08 +0530, Sai Prakash Ranjan wrote:
> Some clocks for SMMU can have parent as XO such as gpu_cc_hub_cx_int_clk
> of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states in
> such cases, we would need to drop the XO clock vote in unprepare call and
> this unprepare callback for XO is in RPMh (Resource Power Manager-Hardened)
> clock driver which controls RPMh managed clock resources for new QTI SoCs.
> 
> Given we cannot have a sleeping calls such as clk_bulk_prepare() and
> clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
> operations like map and unmap can be in atomic context and are in fast
> path, add this prepare and unprepare call to drop the XO vote only for
> system pm callbacks since it is not a fast path and we expect the system
> to enter deep sleep states with system pm as opposed to runtime pm.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to system pm callbacks
      https://git.kernel.org/will/c/afefe67e0893

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
