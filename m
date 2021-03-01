Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D68F32930B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243858AbhCAU5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:57:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:57260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243941AbhCAUxl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9FAC664F2E;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=ZFsvLcb7mI6gNsWF/GDo8gLUFvBoXIKs2ETbjb0MUbo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=U5a0hkXpAj5luw7tSM7UGpNDIUOt5wuqI543A0PAYQn26rACILB6ZhriLXaORqn5K
         mHTxP33abey08qtV6fGxvP49g0qKzjXUnizMWyKXcYsJhqn4ikljnaE3yFny99UByQ
         aSP9bmfol8TDpf1W1kQPFcrwRDMe6WqJ7mVsV7e7aQvPF7qHLJt0Qay1FQ5tLVD0Di
         ntkHYRIrRSgjCVq9PJ3xZH9GRqrYtw9AS5FdjzKYEDtFE+IuFm1akl0iIgs5w/Qtrg
         42g/lRQjeXU3IN7c1YBcQWh/Yf1UgqbaZygLsmkvQKOMLMdqb5OCmEiWgXcLk6P662
         sVvMUijwYmltA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9BE3260997;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/disp/mdp5: mdp5_cfg: Fix msm8974v2 max_clk
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878563.6187.11664621773472549540.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210203231537.77851-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210203231537.77851-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Feb 2021 00:15:36 +0100 you wrote:
> The maximum mdp clock rate on msm8974v2 is 320MHz. Fix it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - drm/msm/disp/mdp5: mdp5_cfg: Fix msm8974v2 max_clk
    https://git.kernel.org/qcom/c/7df222c35920

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


