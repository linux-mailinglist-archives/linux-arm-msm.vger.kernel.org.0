Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45A93292D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243796AbhCAUwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:56478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243670AbhCAUup (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9E31F64F0E;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=3vAASFB64ikLKOOwB0oetCsyDs0a2SFgardh2eE7pKI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cprSWB9I/6xePr6oC+1MDDqx/3lTdu/MWe9Ia9gkfVUkvUUZcHWOB0WVwfpApQ4G1
         n6k+bJfmsT2mPgwKvCdx2Rcg0iNjELgmyuzhzeNy6vA4M71smAT3BTHYH4S29ZZ0VO
         R62MZ/QWynLK2WYfIYf8oeibTEUtUptxbmDAypREPGBspzSi808lVV+s80+XofaaPd
         CE5XKx4+o+aOQo+I+4euWXfz1lx1EMKwa7vfRIOwvqpCdqTvxmpip9NpXad9t9qyYW
         vbyvBEEnV4QvlWTgjLMCjSCpMZzgCJL0cuGQkcIHscQf9wJ16axsOAwDzvRPC72Ys1
         SVnfx9dIp3xwA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A23260C25;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] interconnect: qcom: fix rpmh link failures
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878462.6187.14528138122846248252.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20201204165030.3747484-1-arnd@kernel.org>
In-Reply-To: <20201204165030.3747484-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  4 Dec 2020 17:50:03 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_COMPILE_TEST is set, it is possible to build some
> of the interconnect drivers into the kernel while their dependencies
> are loadable modules, which is bad:
> 
> arm-linux-gnueabi-ld: drivers/interconnect/qcom/bcm-voter.o: in function `qcom_icc_bcm_voter_commit':
> (.text+0x1f8): undefined reference to `rpmh_invalidate'
> arm-linux-gnueabi-ld: (.text+0x20c): undefined reference to `rpmh_write_batch'
> arm-linux-gnueabi-ld: (.text+0x2b0): undefined reference to `rpmh_write_batch'
> arm-linux-gnueabi-ld: (.text+0x2e8): undefined reference to `rpmh_write_batch'
> arm-linux-gnueabi-ld: drivers/interconnect/qcom/icc-rpmh.o: in function `qcom_icc_bcm_init':
> (.text+0x2ac): undefined reference to `cmd_db_read_addr'
> arm-linux-gnueabi-ld: (.text+0x2c8): undefined reference to `cmd_db_read_aux_data'
> 
> [...]

Here is the summary with links:
  - interconnect: qcom: fix rpmh link failures
    https://git.kernel.org/qcom/c/512d4a26abdb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


