Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27A92E73B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgL2USK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgL2USJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 62FE322CF7;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=Dx7VUh3kxyzslDVA2PlHb10c4MvuDBrJHlJlb5uGcFg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qGDCVitkvpbOTrblsfn5PzQoBZlzQs4bZ0LYeWQlV6Pqfwcb9Ot37z+N+7qOIjuoD
         TtYe7J0OFjdDR6JONxr4lq820hDINwKDB2SkMtXQ4rQdr3NiNjJY1jkM2hglFkciN4
         4k11Q/zfwfEE/pReLgOSUP+v6osoy0WlrxGqFfBu3qXGCr1264b4cH9EqU18V11HnY
         EZteb9d+iNmRVfc9+CHE6aFUzJAe/h+3WdyyD9MjpwNIU7DtbhOVrcLyZFunzSGRJF
         Awvo/mbsjWULlZq1iwv4GCKKcqPzw70P6CWM1RN9PXf01X3ttomKrD79zyX/r8Evv6
         IEHd/RlfsEKGQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 5F20760591;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] coresight: etm4x: Skip setting LPOVERRIDE bit for
 qcom,skip-power-up
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293438.13751.6300024527183266526.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201016101025.26505-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20201016101025.26505-1-saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 16 Oct 2020 15:40:25 +0530 you wrote:
> There is a bug on the systems supporting to skip power up
> (qcom,skip-power-up) where setting LPOVERRIDE bit(low-power
> state override behaviour) will result in CPU hangs/lockups
> even on the implementations which supports it. So skip
> setting the LPOVERRIDE bit for such platforms.
> 
> Fixes: 02510a5aa78d ("coresight: etm4x: Add support to skip trace unit power up")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - coresight: etm4x: Skip setting LPOVERRIDE bit for qcom,skip-power-up
    https://git.kernel.org/qcom/c/ac0f82b1b495

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


