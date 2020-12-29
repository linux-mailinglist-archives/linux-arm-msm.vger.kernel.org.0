Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCDD2E7395
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgL2URs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:60236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 02E9822B48;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=JSjNRw6U8w7CRA0VHh2m+lpMoc4NjdQNIGzmab1EOq0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=h4Gn6SjS9bG+J6OOVLi4/VIM7m0/ZfAj+XAWDtrPtAthyL3sJLKwcrk5jawSRpQ4z
         SLT/2Wt+40iXD1lvabd9/Nev2xKg38jQHE/YHo8npP4s6kyeaN5WmN/rixVBDk8NaN
         +z4+iE7GVtCgv8N6VhWwZ6WZvXi0j2Wt4JANaylP/dDT09i07raykCNJm26vsmNL4H
         ZcgOw7fOm9zkwKrR8RPsy0PJftZXa0GPhzCsgmn8Rwx3jQqOOEG1uvkRxei6ZDpPK6
         stCluokGxhiJ1ZPHMqylnILVAYQuzb+IYnYcg3VZzcvwZlyss78ABQqwUUX7ctWByK
         +0xZnUpsz5nDQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id F2E40604D7;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Mark SPMI as maintained
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293299.13751.13165566872008827061.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201207214204.1284946-1-sboyd@kernel.org>
In-Reply-To: <20201207214204.1284946-1-sboyd@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  7 Dec 2020 13:42:04 -0800 you wrote:
> I can do more than just review patches here. The plan is to pick up
> patches from the list and shuttle them up to gregkh. The korg tree will
> be used to hold the pending patches. Move the list away from
> linux-arm-msm to just be linux-kernel as SPMI isn't msm specific
> anymore.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Mark SPMI as maintained
    https://git.kernel.org/qcom/c/aec273a3191e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


