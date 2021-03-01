Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88943329259
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237513AbhCAUnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:43:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:53296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243010AbhCAUlH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D81764E31;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=TsV7FCrZYc5NddHat4BZbNwpJo8CPVP+s1sxi3WBIhw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XdLgbT9fN9mCLfsghu7Pp1FbSf9iYeMRT0D6M2O5k6duCpCodQjc/wtVDSNurYIYL
         /Sx2/QQ5sDLjYP+zmPbCx9z9XwO94cfXr5pHobzTOfkh8T/kMckITBmqM1idEKICb3
         dEZcQOKrmP6gI/8MT6emJNXcTCjAikTEwbtQeuwvPzLi06KkcfZos+TMNMqCw4yCrU
         km1ZT9ps8q072q6HHhPcRtbfLM7RKfRzjvpLTwIDL6oJ1mTcILCulLtoxuPyD/rJaT
         ULCzlNqE13FKdW8HmJrPtV26cJyfMOaQTswsg4h06TDULoSTG8rn027QtMkLr05yRo
         S9rM0KQPunvmw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 19C5560C25;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Wait for SSR completion during suspend
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878210.6187.14208637756942703186.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <1609348628-3932-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1609348628-3932-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 30 Dec 2020 22:47:08 +0530 you wrote:
> During SSR after memory dump collection,BT controller will be powered off,
> powered on and then FW will be downloaded.During suspend if BT controller
> is powered off due to SSR then we should wait until SSR is completed and
> then suspend.
> 
> Fixes: 2be43abac5a8 ("Bluetooth: hci_qca: Wait for timeout during suspend")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: hci_qca: Wait for SSR completion during suspend
    https://git.kernel.org/qcom/c/ad3a9c0ec2d2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


