Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30703329267
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243426AbhCAUo5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:44:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:54078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238002AbhCAUln (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4887C64E41;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=2Ys1HuJuEIkBtsoaeCgpurDjV0XWKMvxZhCI6QC53hY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=foifN4vHYkiIog1u/h7jEltg2u8fc5BezGwEOca16weFbKjgCGYJMqHHCy92VUzlu
         tva7WQGHJG5AAkTTPfJ1/BwOSAFFkpyB6BizqpEvDy47GRE14V0PmMMok0cFeF+DBG
         BeAdJa6ilNPJ1xlOCF6G1Ktq+805WLz9N2NCdmYQMH6azP4NraPf+nUuONSU3LXVi+
         3BslSWvEmFuz0CS7u7QDdg5pLmF7L+edQdkiqTvU5fyGhCbe+Nz9s0wevWPOoZojM8
         //lkpuYXZFFhSqbtrZHVli1HtUR63+FP6vj05BKQRrUEsQdaPEkYNrqH3CtOY9iSzU
         m5X5tXLbityYQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4443C60C27;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878227.6187.17131950765836002529.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210104193044.80591-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210104193044.80591-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  4 Jan 2021 20:30:41 +0100 you wrote:
> Using this code on A5xx (and probably older too) causes a
> smmu bug.
> 
> Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system cache(LLC)")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> [...]

Here is the summary with links:
  - drm/msm: Only enable A6xx LLCC code on A6xx
    https://git.kernel.org/qcom/c/00fd44a1a470

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


