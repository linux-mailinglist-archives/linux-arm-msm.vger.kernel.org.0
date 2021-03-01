Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607663292B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243507AbhCAUuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:50:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:54872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240525AbhCAUq6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C032364EEB;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=IoIBTsnpbIkBaV/KQWIlMeKMtEepH+nhHVKtdB90n80=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GswZsh27rXuwD2IBNa9XrxlR4kJa8v5WPRYBis2FiVwpiGRHIjILhfdRD0kIvoq6x
         /b6Kkjt8SHQ4IJqYbuqQrkobBe4mMAvzF2NpO5hDXGB5Ce4+KMi/RwvhGZaeIQ4u+A
         CKOWWJvrX7FW2ezqZKzbGlSm4f3JAF5BDmgByInjEe4FwtCpmRCnoYvgVWw+M723ZR
         nNH2XrsjasDNT2wco/uA9MMuFmfvBwRZcJ2ikUVpm8VUZxmUMnmEQcD5WOslvHrFs/
         wSy1fPhMiznCbbHZzItMsh/Fv6HHcPIsTWEpnou+26E/VwhRLUvGEjkoVi4LEol+0S
         YrSBO/9vf7GOw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BC96760C25;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd panels
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878376.6187.17290908038432112193.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210127152442.533468-1-iskren.chernev@gmail.com>
In-Reply-To: <20210127152442.533468-1-iskren.chernev@gmail.com>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 27 Jan 2021 17:24:40 +0200 you wrote:
> Before the offending commit in msm_atomic_commit_tail wait_flush was
> called once per frame, after the commit was submitted. After it
> wait_flush is also called at the beginning to ensure previous
> potentially async commits are done.
> 
> For cmd panels the source of wait_flush is a ping-pong irq notifying
> a completion. The completion needs to be notified with complete_all so
> multiple waiting parties (new async committers) can proceed.
> 
> [...]

Here is the summary with links:
  - drm/msm/mdp5: Fix wait-for-commit for cmd panels
    https://git.kernel.org/qcom/c/68e4f01fddb4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


