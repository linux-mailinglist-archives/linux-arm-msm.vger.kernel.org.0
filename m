Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC863A2E96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhFJOwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231180AbhFJOwB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:52:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7E7CD613F8;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623336605;
        bh=CI1cqYLM9X1isZwVQgWnEbO6ahfiUuxsvScQBX/w6r0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pXtzKQMWfECe8jRESH2/uYf/7upj2eO4rMm5L0WzB3cgg6zVPAh6GgW6tm/VlSZqh
         O/2LhCPVYNfRY7d55zIZ/2LMGS0d6HDbktTJ3kwResRomNHycHjFEEMsqTmLXhrVET
         aVj5X+LW2CA925c/uZV4hYyqZ06D0LL0cYKUmYEQHarUuztny6pO0ALPYfVcQUvVuF
         /LUWjcr80rVUf5RxXbm9ribiY5JINZNWwLpHblMUCYOxwdAb0tNG2VQ8HQS6Y991LG
         82rXSy+xb1b4ManTE7SUJAPYqcUZR+UC6R3Cz0C22aRa9KTcFhA82pcJn8gtTsB/8A
         xKnY7aMXZcRVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 72F4360CE2;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Remove cros-pd-update on Trogdor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162333660546.29297.4624738540388236884.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 14:50:05 +0000
References: <20210601185959.3101132-1-swboyd@chromium.org>
In-Reply-To: <20210601185959.3101132-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  1 Jun 2021 11:59:58 -0700 you wrote:
> This compatible string isn't present upstream. Let's drop the node as it
> isn't used.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: qcom: Remove cros-pd-update on Trogdor
    https://git.kernel.org/qcom/c/f298167092fe
  - [2/2] arm64: dts: qcom: Remove cros-pd-update on Cheza
    https://git.kernel.org/qcom/c/62b837469e99

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


