Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97BFA2E7361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgL2UQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726260AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C70E72226A;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=tUWu5DwJVp1T1MrAn+LdN0/b0JzaXhOyBOTdOXxxg64=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ECajFSM19NTem1mWluroofaSWT0vl22KBLYhHPSk7TxeQXox6ddwoe3U1tmejl6AR
         HwMwBG9eG71hA8lsx4Uumh8iaXG/j4wedEOIb8a5QPivx5ARnJ6GcKSvzWpLUwECBx
         2HTf+e2PXEE3ycZjFUnMCnmkWiU9DMe9sn4gtk+J21SlCkRknWTQhyg1WHIIFE964O
         nPvZHQZOLfzsgPlSkST8p28j6Ndz0jNw0QzhBkCxT1jt6nlzYZBagsED5k718n/SeK
         Xsg6rfllStjaJRWwOkv0uCcNiyNnKzAV2KYDhu27py9dGlcUT9QvaaGoUy7FvJQ41n
         mrIzc/KM8fpsQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id BD6EF600D9;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v12 0/2] Add documentation and machine driver for SC7180 sound
 card
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293077.13751.9908044789725229445.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201027032234.1705835-1-cychiang@chromium.org>
In-Reply-To: <20201027032234.1705835-1-cychiang@chromium.org>
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 27 Oct 2020 11:22:32 +0800 you wrote:
> Note:
> - The machine driver patch is made by the collaboration of
>   Cheng-Yi Chiang <cychiang@chromium.org>
>   Rohit kumar <rohitkr@codeaurora.org>
>   Ajit Pandey <ajitp@codeaurora.org>
>   But Ajit has left codeaurora.
> 
> [...]

Here is the summary with links:
  - [v12,1/2] ASoC: google: dt-bindings: Add sc7180-trogdor machine bindings
    https://git.kernel.org/qcom/c/e158d2d83cab
  - [v12,2/2] ASoC: qcom: sc7180: Add machine driver for sound card registration
    https://git.kernel.org/qcom/c/9e3ecb5b1681

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


