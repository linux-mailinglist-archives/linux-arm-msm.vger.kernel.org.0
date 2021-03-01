Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECFF3292E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239459AbhCAUzD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:55:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:56490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243694AbhCAUup (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A637164F04;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=kjmasYu49vwQO8uyW6yyFyTuow8iJvYeeuG6s1rEItE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ubUCxL48am5B7npCwK47PGxPqJ8VMEV9s+rugTaqT9asdpUoPtuXMnj/ejCKftPZg
         Q4PDj7w3NWjJvAJHjEE7QAIloTS0cxRcfaCu4iJzN4vx9Lp9XgfD1zfbnJHvWeVTxU
         IB1+gC05ns9Ka82DXczSDoyHgrl6b2u062c2/OL7ffq/rkbhUTcc8KQ0BZMGObxGzs
         j0hHCgmBrurXNpkCTNF5Wr+0lM6UQYCu4AN03gFDe1jMObEwk0uUt49uiAUDHz9EHw
         HpQshinC5fE1idhDQnxTITGMsLiDY/0OaBCEDbxiwEfspj+f63qczr9aND7MGkS4dh
         8QWh0JHxyKHGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A289B60A1B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: Remove bit clock state check
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878466.6187.4491101312140950178.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210127151824.8929-1-srivasam@codeaurora.org>
In-Reply-To: <20210127151824.8929-1-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 27 Jan 2021 20:48:24 +0530 you wrote:
> No need of BCLK state maintenance from driver side as
> clock_enable and clk_disable API's maintaing state counter.
> 
> One of the major issue was spotted when Headset jack inserted
> while playback continues, due to same PCM device node opens twice
> for playaback/capture and closes once for capture and playback continues.
> 
> [...]

Here is the summary with links:
  - [v2] ASoC: qcom: lpass-cpu: Remove bit clock state check
    https://git.kernel.org/qcom/c/6c28377b7114

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


