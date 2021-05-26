Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8485A392012
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbhEZTFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235757AbhEZTE6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 496986144E;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=5Ppq4Rhl8SE1GnmYZzhfkhNseycZfwtPIVfWxbR7GOs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EjaQqOZE/73KwQTZW9ssJu+CGt593Kolvjh19URmihObLXCxHV83Pae22cxmDvocr
         /oUIpElQwnNDOwDSOgxRpHnPlRCprw9ZMWZqc9pgeE3q4ZpldWRyuUT1i49Zviqw0t
         agPx14t23ntTEBYdtoSOGGUQWz8l288Koryv9tXewqzyViQZ864qK1AGa2vJFQ2raS
         j1G80V4pF06gn34yODEifNc9BXauskkSJYG7OLuIst4GtVSg1hLZBwOSbrDnUaHGyL
         QcQtD1xz+afaBqRbRiPbfE5baDz+55seRsL41r8FsqtqVin00oj2Beg4X+yIJlnBEc
         twxBQ3ZG1gurA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 430DA60CFD;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] media: venus: Include io.h for memremap()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580526.26840.5849915088106451959.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210202194752.247301-1-swboyd@chromium.org>
In-Reply-To: <20210202194752.247301-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Feb 2021 11:47:52 -0800 you wrote:
> This file uses memremap() now, so we should include io.h instead of
> relying on any sort of implicit include elsewhere.
> 
> Cc: Dikshita Agarwal <dikshita@codeaurora.org>
> Fixes: 0ca0ca980505 ("media: venus: core: add support to dump FW region")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - [-next] media: venus: Include io.h for memremap()
    https://git.kernel.org/qcom/c/f765f45f2910

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


