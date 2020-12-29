Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46BB2E735A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgL2UQM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:59344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbgL2UQL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9177520867;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=I6LSfPNfVDUm9xJoq2xWbqN7S+i+mZuHMqAkGFgJVz8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=G8cL3L/QNAaPcfp86vuErBe2dmsidvPSVDehXQjoe5LwKSjoovibsd4V8xbcgjKhi
         8I9xkwSRkgmr/qG7RayLTQN8LYi/9BaofHdzel/4a6wN9Ey8fx2NL2gICtt+W9yNih
         0AMCRjjN4Q+437q6QxSuT/0OxLGLU1l4xKKw0k1zXSM9P0UN0ugesdWvYSxvwpqYiY
         9v6qiUddJiSRiKopyXD9n5eTgYWuKvibUBDvEUNBoYXS+/VZ0S5pR93sb5pW7tZpHR
         tnaA+7dCUMqRF6oJVXPVrLDZyeF6f0uXg81mZTZg28bmDjK6rO5Yl7YPRBcBWhjlrX
         2RP97uOVq2juA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 880F9604D7;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: core: Fix null pointer access
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293055.13751.3121711253292062715.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201027053310.16469-1-carl.yin@quectel.com>
In-Reply-To: <20201027053310.16469-1-carl.yin@quectel.com>
To:     =?utf-8?b?Q2FybCBZaW4o5q635byg5oiQKSA8Y2FybC55aW5AcXVlY3RlbC5jb20+?=@ci.codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 27 Oct 2020 13:33:10 +0800 you wrote:
> From: carl <carl.yin@quectel.com>
> 
> function parse_ev_cfg and parse_ch_cfg access mhi_cntrl->mhi_dev
> before it is set in function mhi_register_controller,
> use cntrl_dev to instead mhi_dev.
> 
> Signed-off-by: carl <carl.yin@quectel.com>
> 
> [...]

Here is the summary with links:
  - bus: mhi: core: Fix null pointer access
    https://git.kernel.org/qcom/c/f4d0b39c8425

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


