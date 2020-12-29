Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA7F2E73CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgL2US1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgL2USZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7077422D6D;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=e2j1cXR9qFVw7lqkEuHni34nwW+3xq8lEQVMg5ih+Ls=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oWSZaKt5HMp7uCDUFHWXQjg2e4ywFGzxgsp4ZGnIpYHgLeImsJrILGUeYqiMwNDwF
         xIl+EU9DtdfA2RK8T7bN2ntWf/Y7dECDhkSVb+yp9NRXl83hgE67TtFtdOMoZBu3Kh
         ctLpsW0qZF2YGE0oUYZfMlnAwg0u8y9EXqaiGY8e1ScUKye3JRFhuKiiwL5IwTtHFd
         uE8wvxMIvAqST2vYd67XCIOXz/8uG4AyJw8VZpB+IUlGCd+LSVTYapgsSoWswAMrVZ
         gZHhz4EVIe8CzYunIjo3+vJprsuESvif2btROJxbgdfRDQv3hzfCTUfvgoDFhg/6Ho
         gZ4QfUTw1K1Fg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 6CE1660591;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: Remove auto-start option
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293544.13751.4083149125649093939.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201118053102.13119-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20201118053102.13119-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 18 Nov 2020 11:01:02 +0530 you wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> There is really no point having an auto-start for channels.
> This is confusing for the device drivers, some have to enable the
> channels, others don't have... and waste resources (e.g. pre allocated
> buffers) that may never be used.
> 
> [...]

Here is the summary with links:
  - bus: mhi: Remove auto-start option
    https://git.kernel.org/qcom/c/ed5298c7d500

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


