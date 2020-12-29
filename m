Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525332E73B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgL2USL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:60050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbgL2USJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 59A8A22CBB;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=56THf62E6MJtrOM+gcGYMy2nP56LEebBGQHodKjWrPs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=o9dMjeyjdIPNp0bcrBHzS7UoYBF/aUXNh0+/Bc+vEQkNAKdARwlPQoe7K4F6Te7/q
         SJZVEJBMFukNUM8YOfGDIl8GSDyT4nJyeHixoUceJZR30KaU1IEbE5SJfR9JjTGxTK
         1nfIHUZyNBRbvQxanfMVapgXDlmvloG2fTch/CngOkqc4ADZzSGx3oV1jEQ+WQd4+E
         ZrTpjYpUcqvEYRHJrK5NnctYsAQ99Eu4AeosZ5pRN+Yra6DX0dl9UNQU6CODtTusfE
         gqdADc40LWOcQPf1M0IRQORviDP8NArOMgx5HFzen5/DaPXRKC+rXAIOVNG6i858l5
         Ivse4kufuohSg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 54B3D604D7;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] venus: vdec: return parsed crop information from stream
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293434.13751.9683910959048848456.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201021000943.656247-1-acourbot@chromium.org>
In-Reply-To: <20201021000943.656247-1-acourbot@chromium.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 21 Oct 2020 09:09:43 +0900 you wrote:
> Per the stateful codec specification, VIDIOC_G_SELECTION with a target
> of V4L2_SEL_TGT_COMPOSE is supposed to return the crop area of capture
> buffers containing the decoded frame. Until now the driver did not get
> that information from the firmware and just returned the dimensions of
> CAPTURE buffers.
> 
> The firmware unfortunately does not always provide the crop information
> from the stream ; also make sure to detect when that happens and
> fallback to providing the coded size in these cases.
> 
> [...]

Here is the summary with links:
  - [v2] venus: vdec: return parsed crop information from stream
    https://git.kernel.org/qcom/c/de04408fd12d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


