Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78E7392009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235842AbhEZTFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:41142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235704AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B8DD661444;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=rTmSR8VX38fZHC4OYABaP5ntzWxqjF8Uvqaf4WJoj+0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=E4Z9r+MhUPf2a5cPjUhjQ2EGGW2Gn+vNVr7qXM+h5qpjLB1gQDRMDd/uBC9CuySOV
         WxsFEEj51v5uKY31ebn/K7qYzvYfghceWGfMtKjofL/LKJNeyUEVM8ATIu9tbpo14+
         LWuNs3QUnsv78lsNgGsqE4JyfmG0ZuyiTLETl2KX9KdAW01vHqSFDK0Mdq3anPCZrQ
         4S0DstL0OGabOn7hobtfyzUc7KiNhwAr7vpQgOzo8WSFlmqtVmrYyinnRyi/aRJD5s
         nz6Ooev6f7mk41Cqd9ev8MsRGRVIfEWihvYjAbjE+OnFyixoBNMeBx4IMoGXgLRyKo
         8aiqvwUJ8CuQw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B471960CE1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Clean up MSM8939 interconnect driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580473.26840.15144099491699166407.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210205015205.22947-1-benl@squareup.com>
In-Reply-To: <20210205015205.22947-1-benl@squareup.com>
To:     Benjamin Li <benl@squareup.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Feb 2021 17:52:03 -0800 you wrote:
> Following up on a review comment on commit 6c6fe5d3dc5e ("interconnect: qcom:
> Add MSM8939 interconnect provider driver") to clean up some log pollution.
> 
> This is based on icc-next (which appears to contain a refactor commonizing
> functions into icc-rpm.c).
> 
> v2:
> - Update commit message to add a full explanation, rather than referencing a
>   previous commit.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] interconnect: qcom: icc-rpm: record slave RPM id in error log
    https://git.kernel.org/qcom/c/9b4ab638c49e
  - [v2,2/2] interconnect: qcom: msm8939: remove rpm-ids from non-RPM nodes
    https://git.kernel.org/qcom/c/7c911f9de7ab

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


