Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE9130803B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 22:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhA1VIN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 16:08:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:58634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231261AbhA1VIM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 16:08:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 764F264DE0;
        Thu, 28 Jan 2021 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611868051;
        bh=EA9BDZCY3xfLPZ5DrPbxdvDp0B8+AD1wKoUQ2tj2HgM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EbUwE2Gv3WqHJjijQHrCIdctsUeD/cJ4CquNn84mwNd7vFg/eXvaq3OhIVsOWD6T/
         dSFCapbzKCDNC/qgXuAZcgopCFDMAFvH/Z/oCC8m/Xx6V+Z6ElD1LHVSTN9n8MPbSe
         VUKwqldjN3M4wbQaHQyvVfhkP/m1pzhqdP0ARnTu4Y4CIi+B9yPxednixOJ39gaQ61
         9vPYgrKkKHYR8In9pBsiMx6pDt39sTVjkzz9ye2bpgnBIdVWydmBFlZwqCrZqUVIj6
         GeyjkK8jrbeWdSn4WyDK2qHZjYbGKszQaw111CUMZNm9Lq4MdgywYmqs78/qpJbzbG
         AakAK7nfngRGg==
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, architt@codeaurora.org,
        joro@8bytes.org, sricharan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] iommu/msm: Hook up iotlb_sync_map
Date:   Thu, 28 Jan 2021 21:07:21 +0000
Message-Id: <161186579710.2024269.3735234829301775634.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e95223a0abf129230a0bec6743f837075f0a2fcb.1611764372.git.robin.murphy@arm.com>
References: <e95223a0abf129230a0bec6743f837075f0a2fcb.1611764372.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Jan 2021 16:29:28 +0000, Robin Murphy wrote:
> The core API can now accommodate invalidate-on-map style behaviour in a
> single efficient call, so hook that up instead of having io-pgatble do
> it piecemeal.

Applied to arm64 (for-joerg/mtk), thanks!

[1/2] iommu/msm: Hook up iotlb_sync_map
      https://git.kernel.org/arm64/c/c867c78acae9
[2/2] iommu/io-pgtable: Remove TLBI_ON_MAP quirk
      https://git.kernel.org/arm64/c/3d5eab41451f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
