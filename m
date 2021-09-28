Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2268E41B31D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 17:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241701AbhI1Plx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 11:41:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241702AbhI1Plr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 11:41:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9959861266;
        Tue, 28 Sep 2021 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632843607;
        bh=vzC8yQ6i9SGFeJjyc0GTvd8q7mGuRbwOKhM77VqPl+g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rjpTyIcsEu7ooeoKEsPVV45G5XNB3ENsewDegEE10yBv4BZ8Ea3Ebz/AUMK66npEL
         HEhKNOkMj+LVoMkEpGV8i82QOGsC7vhgVe7DWRnULiwA84Bp+oMNCfbwDsXSfAQQDO
         QCKLCMjVM9QJLtaNcEP/MiRD7PHDIjI4sNuy+ooDqSyOGzE0wblye/szicclBUehWS
         6D+Y50TjWca9inbTW/mici2wxB+lamn0HjPc5lPJx6fxHs9WNyL/w4+4qzFwlSybJg
         7DMavLnQ3/pa9GCEQDv05n5C4yenRy1oCqZtf8qqpHsFLDftpoqRoQOVoSMdpRcD0S
         2KFvZUY5BGb0w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 90C98609D9;
        Tue, 28 Sep 2021 15:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] arm64: dts: qcom: pm8916: Remove wrong reg-names for
 rtc@6000
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163284360758.1686.16691427442551383252.git-patchwork-notify@kernel.org>
Date:   Tue, 28 Sep 2021 15:40:07 +0000
References: <20210928112945.25310-1-stephan@gerhold.net>
In-Reply-To: <20210928112945.25310-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 28 Sep 2021 13:29:43 +0200 you wrote:
> While removing the size from the "reg" properties in pm8916.dtsi,
> commit bd6429e81010 ("ARM64: dts: qcom: Remove size elements from
> pmic reg properties") mistakenly also removed the second register
> address for the rtc@6000 device. That one did not represent the size
> of the register region but actually the address of the second "alarm"
> register region of the rtc@6000 device.
> 
> [...]

Here is the summary with links:
  - [1/3] arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
    https://git.kernel.org/qcom/c/483de2b44cd3
  - [2/3] arm64: dts: qcom: pm8916: Add pm8941-misc extcon for USB detection
    https://git.kernel.org/qcom/c/f5d7bca55425
  - [3/3] arm64: dts: qcom: msm8916-longcheer-l8150: Use &pm8916_usbin extcon
    https://git.kernel.org/qcom/c/b30cad26d803

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


