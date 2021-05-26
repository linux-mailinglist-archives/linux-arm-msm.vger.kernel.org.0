Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36BA392052
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235276AbhEZTFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235824AbhEZTFP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 929EE614A7;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=ZZowgClhyKvtMeNYLyJlJf28L9as81HQef58BGBFCp8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gCWCsEDBpClLNWIqk3BiCYaMfSvxmhUIRSsC8WAlUhXx0aIxk4c/WdtOHMadgkRdg
         MNbs8vu/uhxEBtKp/0XTSgmvkoF+3yacI+rddz4iphUv7hM+pr9E0lYDNj/GaPrPrh
         5KhnNhRXK5UjLceZuZiCkmpgc5o0PYpIoGsKvqSZdSicD5nf4sJ1LFx3ZC2ng8fg55
         u1TDPTsIxVqkxSLB57aqELS+tsLgN/EKckj/aRGNZiw67HZjBkdAwwAnNh6fY4nsjx
         hJ+xLuw8xmAo+Xl3ZUc1DOh9Z9hDYkEPaQJvGPdHjJH7uiDgJUYncbyPpUlvUzuQAQ
         SD8c/Qof2UhZQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8B5A960CE1;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] bus: mhi: core: remove redundant initialization of
 variables state and ee
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580756.26840.17792518213593094922.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210311111727.8433-1-colin.king@canonical.com>
In-Reply-To: <20210311111727.8433-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 11:17:27 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variables state and ee are being initialized with values that
> are never read and are being updated later with a new values. The
> initializations are redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - [next] bus: mhi: core: remove redundant initialization of variables state and ee
    https://git.kernel.org/qcom/c/70f7025c854c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


