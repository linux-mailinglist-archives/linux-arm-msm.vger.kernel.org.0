Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D978D391FF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235770AbhEZTFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235337AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 12862613ED;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=bMiYe00OBXgvLqtvrqP3W+HZOLCj8bQPnr2L6fxMJkE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=k2EZHubzzwttN/2vFhQQVUZW3fSTwqMnRCxS3J1FEMD2F+oV8347fBpOIZ+gW9kkl
         I5Wd0Ls4yIAfAF1dn27xtHK6StPDMFeu2gmer2SOMcd0j8aBKtrHRjxBy8ns/bowbL
         1qBEXExs5IpQYVuJ/tCcYgKNWTymOtTESIxPLd1mofKUCWJYmIu9wZzPJY1dQCcHPL
         KZeNYUpU6ZiMAdI8rO+9Va1oETI/t/FWsgL4dUbfSe/WGL0ioJ1XWJTRpTKviguJgK
         1P0N8jiGSp+CH3UL0mHS4b3BzYbvl5ukSlwKpYIsDgIrM+pmBbucGh0b4bFU8Pfdun
         qqB4zZIQRu+Ng==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0E5E8609B2;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2 0/4] Add RTC support for PMIC PMK8350
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580405.26840.15156863687171041528.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  9 Apr 2021 19:29:22 +0530 you wrote:
> satya priya (4):
>   rtc: pm8xxx: Add RTC support for PMIC PMK8350
>   dt-bindings: mfd: Add compatible for pmk8350 rtc
>   dt-bindings: mfd: Convert pm8xxx bindings to yaml
>   dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8xxx rtc bindings
> 
>  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 99 ----------------------
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       | 54 ++++++++++++
>  .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   | 62 ++++++++++++++
>  drivers/rtc/rtc-pm8xxx.c                           | 11 +++
>  4 files changed, 127 insertions(+), 99 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>  create mode 100644 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml

Here is the summary with links:
  - [V2,1/4] rtc: pm8xxx: Add RTC support for PMIC PMK8350
    https://git.kernel.org/qcom/c/c8f0ca8b7a4b
  - [V2,2/4] dt-bindings: mfd: Add compatible for pmk8350 rtc
    https://git.kernel.org/qcom/c/c3a9432429eb
  - [V2,3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
    https://git.kernel.org/qcom/c/f2f2bc3c0cfc
  - [V2,4/4] dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8xxx rtc bindings
    https://git.kernel.org/qcom/c/8138c5f0318c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


