Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF4C32927E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243601AbhCAUqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:53300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240755AbhCAUnb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D1CB164E83;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=4LFM1yJJXPwfI0Ddu+Zn1k6GypDJZr1TJY00usWuJbs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=p/+y1ayjwkLxb1vEpkl+y80ocWypjw4+yC4fnRWkAyCBbtDxLJvNcJBUI2CTS4574
         JSWEI6p7X+OwXjJ48VjxLcdfRLKfCKzmMWdBc2YQ+JtS9EwNrMPm6D85tQJakMgg/y
         IDgrsp13AqeYhXjuQiLUm0nEv4t8wk+jjFxbUYCetKi4edJdMkKYI9JLFGTAD+V9hl
         9g7/MnvArrzF96ahu3P3PH2BGAmuils2WseQem1Pk5zNqYglLR2X5L8MrjYTdY/1rX
         HqYgBLXXCvAZgEDSraR41X+xXrf819QTuw+MYMfPKKUcwDUlIRQl+tXOe1Un1HJucR
         mDivHGqafQ7sQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CE5B760997;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] media: venus: Fix uninitialized variable count being
 checked for zero
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878284.6187.14471953047875698876.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210115101126.9668-1-colin.king@canonical.com>
In-Reply-To: <20210115101126.9668-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 10:11:26 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where plat->codecs is NULL the variable count is uninitialized
> but is being checked to see if it is 0. Fix this by initializing
> count to 0.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: e29929266be1 ("media: venus: Get codecs and capabilities from hfi platform")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - [next] media: venus: Fix uninitialized variable count being checked for zero
    https://git.kernel.org/qcom/c/c5b14df7a80a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


