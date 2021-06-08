Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC7639F7B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 15:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbhFHNXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 09:23:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:57564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232844AbhFHNXy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 09:23:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8D0D61278;
        Tue,  8 Jun 2021 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623158522;
        bh=1B0V9z2K8C4YqPZ9oRq6fJf5vTfU8V/BGjXcAyZ0Ipk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GxbVdLUn37Rx8oxDk6pnmaYJTu39tZWmSzLrUDzNiwFYa7f8N09j7D6RTqn5hsogy
         OQ02qIGa++FBw0b1flzNTNSacmdHl+qIcg4KVxUcrE4NHI2urTyuVcNNiUTbqxbB1A
         UeA19PXOCIVKPTDOtFLT3TDNcFAhTfJyHwdWfaeKt5BGzX5GPnEBmjoYPKU6TipVij
         38i4Xre1AwTcHdMq5+AJ/ghfv5nRYFCx9fYR9dtkHDOqA8jf9ul5RcHtBvA/4PXCTd
         oaE/hmnKtR4/DgnLSmmkfEfC2YE0s7E0aM+U1GDj0wydQA+QnrkInhUiEHtP51G9cp
         g+MOneZjK6EmQ==
From:   Will Deacon <will@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mark.rutland@arm.com, ChenXiaoSong <chenxiaosong2@huawei.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, yi.zhang@huawei.com,
        linux-arm-kernel@lists.infradead.org, yukuai3@huawei.com
Subject: Re: [PATCH -next,resend] perf: qcom: Remove redundant dev_err call in qcom_l3_cache_pmu_probe()
Date:   Tue,  8 Jun 2021 14:21:51 +0100
Message-Id: <162315291963.2245694.11680522659290211747.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210608084816.1046485-1-chenxiaosong2@huawei.com>
References: <20210608084816.1046485-1-chenxiaosong2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 8 Jun 2021 16:48:16 +0800, ChenXiaoSong wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Applied to will (for-next/perf), thanks!

[1/1] perf: qcom: Remove redundant dev_err call in qcom_l3_cache_pmu_probe()
      https://git.kernel.org/will/c/5ca54404e68d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
