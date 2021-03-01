Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9FF3292BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239433AbhCAUuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:50:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:54486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243717AbhCAUr4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:47:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EFCDF64EF2;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=HFGpnTXw08HTGukkwXk9cPdE/FVLwKs04eEKsGwpyz0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cG8tOUiiwz10H0xebdO7KdOkUmreguU4usGI0rbeEogeaBr0vCxS8cu8NCMsdIkRY
         1zb301JWuwqixA3dlHwai8fqb4aP9u/1eku+Y/BVhwCpu3eBAaPEab7XJF1TSnksxy
         998DnyLb6zfgcqBO3AM7oZtzFSMS7SQuwwy1V8SlIx8l14YY5UMzb6aUX3D+2KMx1p
         5TED4kzBCnyISM/5F9arQeDfHWSOMsz4Bjk5S2FsKF0azHBeadxh6twL1+efIq+N2e
         +tsF5CXUQQeQlH6+aJ8eCxBicF+RrMfRCvWoTDfD9eULbtGleUN4ohIQ2PgB1y/dSQ
         fsnv4vpHsilBw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EAB3260997;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] media: venus: use contig vb2 ops
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878395.6187.11340159598107567593.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20201214125703.866998-1-acourbot@chromium.org>
In-Reply-To: <20201214125703.866998-1-acourbot@chromium.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 14 Dec 2020 21:57:03 +0900 you wrote:
> This driver uses the SG vb2 ops, but effectively only ever accesses the
> first entry of the SG table, indicating that it expects a flat layout.
> Switch it to use the contiguous ops to make sure this expected invariant
> is always enforced. Since the device is supposed to be behind an IOMMU
> this should have little to none practical consequences beyond making the
> driver not rely on a particular behavior of the SG implementation.
> 
> [...]

Here is the summary with links:
  - media: venus: use contig vb2 ops
    https://git.kernel.org/qcom/c/cc82fd691a3a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


