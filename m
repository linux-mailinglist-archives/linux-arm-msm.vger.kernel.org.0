Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DCA392021
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235769AbhEZTFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235781AbhEZTFC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C5C7561432;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=K8VzYOfzs2VYtG4fQJU6ZakrVNlvzcXCJDwUL74qDIc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dKZTY/Xkm7u6T5ljz1+ZwyM70AmPG8uSlhCIOD3Dlf70qZ2kwpR9mTq5+Oaa5xw4U
         uJVrMzK5QvMeOMLm/0P0/xsVIK+is+UZDUT6PFJzoXlJY1ckK5AzNkIaJwLfp6G0bj
         W66JgdgA6ph4Sd+5LTTUSemXDfGyRX2AtIhXAFZMqMX1Poloo73ifxQQKE9wrINeAg
         ACsS8oNiaAT9okxUFhaNLfl4K9Hnzx3Cskt84W3EErmMZVTJx4VOmUaEjrZcR30dEa
         oM8tsBYfCwXP7z4qobb9rzASgA51hFq3AfXwsc8sOBCWvnO3r7LVyOLQkiUzqxOtvl
         AcIRFtnYLnZ8g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BD8AB60C29;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v11 1/2] net: Add a WWAN subsystem
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580577.26840.16265273733676213150.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <1618562194-31913-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1618562194-31913-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 16 Apr 2021 10:36:33 +0200 you wrote:
> This change introduces initial support for a WWAN framework. Given the
> complexity and heterogeneity of existing WWAN hardwares and interfaces,
> there is no strict definition of what a WWAN device is and how it should
> be represented. It's often a collection of multiple devices that perform
> the global WWAN feature (netdev, tty, chardev, etc).
> 
> One usual way to expose modem controls and configuration is via high
> level protocols such as the well known AT command protocol, MBIM or
> QMI. The USB modems started to expose them as character devices, and
> user daemons such as ModemManager learnt to use them.
> 
> [...]

Here is the summary with links:
  - [net-next,v11,1/2] net: Add a WWAN subsystem
    https://git.kernel.org/qcom/c/9a44c1cc6388
  - [net-next,v11,2/2] net: Add Qcom WWAN control driver
    https://git.kernel.org/qcom/c/fa588eba632d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


