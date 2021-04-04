Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D6A353956
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 20:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhDDSKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 14:10:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229918AbhDDSKQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 14:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D18D56135D;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617559811;
        bh=AbGdf39E0Vshy6gMJAzGonqMjvjLci+mbnrYLJsMlb0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NNiR1M9oAxxNxA95Do8yUQNgOiHo61uz+35PNw6Upr+BumaID12+Mn3DqiPxIxw6a
         79ZcYVhdRkq+zhDuzyA/qtOpzpR81m3vh784MVBuBq4YQIVY/frU2fjSEBszFM8Ka2
         nxRKGIi8dyeYhQEF8mFElO9d4iBFYlWpDx2rwuLaWYXuyLLQRp2j7F+rLOSkDx8/MA
         Uub3vBhQvtKthzAnZAEwi02IiPljKYBJLtz7Ikc1DfjNrNmwL6fS9x6H1AMomJFCII
         Ojt1/NAsXlKC7RHCq16zKkQsYhDMjbcOum6FVZTu4biKlpYR9OnO3k/0QQGL5Mrzak
         5hpdli9zxk8uA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C2AB5609FF;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] kernel-doc and MAINTAINERS clean-up
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161755981179.6823.1282421826121358216.git-patchwork-notify@kernel.org>
Date:   Sun, 04 Apr 2021 18:10:11 +0000
References: <20210327065642.11969-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210327065642.11969-1-lukas.bulwahn@gmail.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 27 Mar 2021 07:56:40 +0100 you wrote:
> Roughly 900 warnings of about 21.000 kernel-doc warnings in the kernel tree
> warn with 'cannot understand function prototype:', i.e., the kernel-doc parser
> cannot parse the function's signature. The majority, about 600 cases of those,
> are just struct definitions following the kernel-doc description. Further,
> spot-check investigations suggest that the authors of the specific kernel-doc
> descriptions simply were not aware that the general format for a kernel-doc
> description for a structure requires to prefix the struct name with the keyword
> 'struct', as in 'struct struct_name - Brief description.'. Details on
> kernel-doc are at the Link below.
> 
> [...]

Here is the summary with links:
  - [1/2] MAINTAINERS: add another entry for ARM/QUALCOMM SUPPORT
    https://git.kernel.org/qcom/c/99d52c872d34
  - [2/2] soc: qcom: address kernel-doc warnings
    https://git.kernel.org/qcom/c/8058dfa05ab7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


