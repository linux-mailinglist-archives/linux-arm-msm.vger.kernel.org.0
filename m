Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE9B392072
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbhEZTF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:41064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235848AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B324B6162C;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=Sd/J2NZ5HJYm7aX7i5UdkKDD4vNmdggH/ODt+j6bHLg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aRFSA5vD9ov3FPPU4CDbF1ZWHWv1BoI2z/zxH6N4ZimQPET0WIJvklDJRqaQAuKyQ
         RgvHMfC68sz0eLPCh2jQQh8wTqyVXBIzVQldqV3E+sW5OHMvzik6xbd2mw12cXAzjP
         PYi6Imxl5M9ZaYj3u9Nnykkx1YoTSCaHomH2KDKNjTZ/OJQXI87JgcvG0evVnN+nf4
         ezVaf50WB+MMqDcGVWCRor4I4sDgU16Pv+78ut3hVue9pDrteS4/LYOICDGefP4mJi
         NtJi8Jspp2pZljGUpTdKWv5QvdvS2cEe42LDLO/OG62CLrMeQ2J67nIe7ClQyXmSQd
         3SLdfx4yYtHVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id ACE7960CE1;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: qcom: fix unintentional string concatenation
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580870.26840.10817656117004727253.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210323131728.2702789-1-arnd@kernel.org>
In-Reply-To: <20210323131728.2702789-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 23 Mar 2021 14:17:13 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang is clearly correct to point out a typo in a silly
> array of strings:
> 
> drivers/pinctrl/qcom/pinctrl-sdx55.c:426:61: error: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
>         "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
>                                                                    ^
> Add the missing comma that must have accidentally been removed.
> 
> [...]

Here is the summary with links:
  - pinctrl: qcom: fix unintentional string concatenation
    https://git.kernel.org/qcom/c/58b5ada8c465

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


