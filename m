Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4F639205C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbhEZTFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:41128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234111AbhEZTFR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D6F65613B5;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=4rlGyjxNQvU2JyEP8QaR6AY21CO/WZw8/V3iHP8Mx7k=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vKDXOwrQswkjMlr5EfoatbHVns5LPTDFZngEpk6W0hEcmH4yBtDvgcxXEa9fyZvaU
         ppXufLVGxK1UUMqIie2Yc4QaM5Xx6ilIQuZSVlqZ1uk11Dm/1YrIWvggGQyaw40Rtu
         g2PH9YId93987s35BQ8hhpCp30v/RAYw3oS8t55jjrn1sW5rIMeW6xONa9e9Cx+Iof
         7EGk+T6Hzl9oMqEYWtBEbMdn0RscSXHBT/ssDcMufj+Am+Q1dEP+gKzVB64+/ntXf1
         YePoDGcetrC3BwyNMR3B6Kt9oLunDZW66d5s4b/LI0xa5N8RheTtslvsmWuaTmq5R2
         Q9Neo1DhG8WNg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D229360CE1;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RFC PATCH v2] Bluetooth: hci_qca: Add device_may_wakeup support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580785.26840.9681783169714333246.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <1615446220-969-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1615446220-969-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 12:33:40 +0530 you wrote:
> Based on device may wakeup status, Bluez stack will enable/disable
> passive scanning with whitelist in BT controller while suspending.
> As interrupt from BT SoC is handled by UART driver,we need to use
> device handle of UART driver to get the status of device may wakeup
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [RFC,v2] Bluetooth: hci_qca: Add device_may_wakeup support
    https://git.kernel.org/qcom/c/c1a74160eaf1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


