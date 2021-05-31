Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D4139696B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhEaVvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231409AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 15D946135A;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=I7A/vJJwTeOtfASXbVPnUysIOzn7DkO9w/PcHBbR+ak=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WhcKgCjOMUJDfI3/VMAf8lSE5guCRpvYGs4pF5C5qZ4YCIhtEc3qzeXh/xeZ49Wnl
         ivfJ/GYB5A0rqr99aiDcWQ578FKeZ3m+edzp0YT83/alkrYxrXeYPxpDKlasWLlSPv
         BUNm+pNPbrOzHeFKAAzAqCa7idVJR+kkdB8dXbsHNZolUGXL/Zlonten0y3tg/Shkm
         4aEE1EW88F9HMBztPm4srtKVMCZCC64NNH1MwcfRsAciarzmx0PNAsq6l8UEDGs29v
         EHn8M2CSV9QdfOABwVo71t4XowOVPuIV+coWV2PFkFmLAB9/keM7n1SlfMytZcIHcS
         APpDV2YQbsRCQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0CA8260BCF;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Move rmtfs memory region
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780604.3521.14449987205143400408.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210514113430.1.Ic2d032cd80424af229bb95e2c67dd4de1a70cb0c@changeid>
In-Reply-To: <20210514113430.1.Ic2d032cd80424af229bb95e2c67dd4de1a70cb0c@changeid>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 14 May 2021 11:34:34 -0700 you wrote:
> Move rmtfs memory region so that it does not overlap with system
> RAM (kernel data) when KAsan is enabled. This puts rmtfs right
> after mba_mem which is not supposed to increase beyond 0x94600000
> 
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Move rmtfs memory region
    https://git.kernel.org/qcom/c/d4282fb4f8f9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


