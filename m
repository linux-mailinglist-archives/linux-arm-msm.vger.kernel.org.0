Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650C63292E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhCAUyq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:54:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:56480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243675AbhCAUup (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 94C1E64F0D;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=g0p2M2urSFk6B60sW71MYiwi+Fv4UAq2xaZh4mhMxv8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ickVdoiMgrbUrZMMGk0Yqq1ewuDdpf1Y8h+WjCqYvuF0kQBFznXhp4zw/kt2ZdkJk
         Kha6rlTXXFp6lZuhJXAf9zK0qoNP8oQPS+svNUokUOjzLtC7qoprl8vTSAiqe6t3hh
         3ucs2eiazwrqk+IcMofekYeu5tznj6U+K2tPVPoTmSRRmNWWL2L+2ANEgmsRs8RUFt
         ihFtuKw3p1alkTk+DLfimr1A8xOsngiKffQDm7G+eXX7KWwaEv9oL8P46rpGTGbxfV
         dP/74efEJBCGvDGzVrRnpxBq82RInn5gfdlXRvyB1VOXNmcpiU+DjeYJXQMzXEPVB1
         gMwri4kR+Ij+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 90F8B60C26;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] spmi: spmi-pmic-arb: Fix hw_irq overflow
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878458.6187.886212008130537752.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1612812784-26369-1-git-send-email-subbaram@codeaurora.org>
In-Reply-To: <1612812784-26369-1-git-send-email-subbaram@codeaurora.org>
To:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  8 Feb 2021 11:33:04 -0800 you wrote:
> Currently, when handling the SPMI summary interrupt, the hw_irq
> number is calculated based on SID, Peripheral ID, IRQ index and
> APID. This is then passed to irq_find_mapping() to see if a
> mapping exists for this hw_irq and if available, invoke the
> interrupt handler. Since the IRQ index uses an "int" type, hw_irq
> which is of unsigned long data type can take a large value when
> SID has its MSB set to 1 and the type conversion happens. Because
> of this, irq_find_mapping() returns 0 as there is no mapping
> for this hw_irq. This ends up invoking cleanup_irq() as if
> the interrupt is spurious whereas it is actually a valid
> interrupt. Fix this by using the proper data type (u32) for id.
> 
> [...]

Here is the summary with links:
  - spmi: spmi-pmic-arb: Fix hw_irq overflow
    https://git.kernel.org/qcom/c/d19db80a3665

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


