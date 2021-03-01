Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BF23292B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239585AbhCAUt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:55366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243628AbhCAUqq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A054A64EBA;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=oRqkwHv3BHbxQE8r+PLRorbDNYBKvGV7z0rzq9vXwmo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iUADbkAsNjrTvNYinNwR74ShBjYxWHDq03Ofjd4p4L9wxzSQJyHpqsghh31x1xFQX
         9s+9OdhA3KYC2dl/U39vXS++z+OAc0Pu4WHFAnqpUajg8ayqQr4gk/eMx66gdyqOW/
         LT1UDxIfZjVRVaMdRyJi/H1LDPGTOBXuE8/AN6mdx0pi03r2GvY5S0LLeUpo3y2WLy
         rry7FjC1wQuxEwmgxUmAthxfYaR4mihPOKLtFqjRsuEihsEjKYETRViMGrp6lZXFkJ
         75Cx6aXlHCOZBIpMIcW1/1pByaO1tx2++lBQYFsPX4zT2nhnLg8BW/ML1brR77ZaBI
         NZazNTY+0+kmw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9CB5960997;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] venus: core: add support to dump FW region
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878363.6187.17347073893895062176.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <1608055716-14796-1-git-send-email-dikshita@codeaurora.org>
In-Reply-To: <1608055716-14796-1-git-send-email-dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 15 Dec 2020 23:38:36 +0530 you wrote:
> Add support to dump video FW region during FW crash
> using devcoredump helpers.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v5] venus: core: add support to dump FW region
    https://git.kernel.org/qcom/c/0ca0ca980505

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


