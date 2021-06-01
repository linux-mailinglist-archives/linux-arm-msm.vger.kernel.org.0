Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD524396A3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 02:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhFAALo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 20:11:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:48628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232081AbhFAALo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 20:11:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8722C61026;
        Tue,  1 Jun 2021 00:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622506203;
        bh=mxOHdOAXvAMQSkPEl5lHGCDoTX9mXs0pGAg4Zhc+u7E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=D7WBeU+w+z5HPVwCOVxcQQafqQy2qXIGxO59djkftgpqDGECAL3ad2iCifFkCcrkI
         mijNvYqCblOxFRgZwamGdGEu+HWOgeT48YvDXDdTuWzum1DpNH18BawWLcq0okkZw+
         M32H6fvU6jdh84dGT+ULISvNMEQmTactL7JiPvtTVaLrbOHFPjI5z0PxKS6OrhTmTT
         oXmdeBDXsMdRBkmFlBtIsV9hDsJkvR52hVSqFySTt4r6HR6kZAVYP/0d93pdmF3IW+
         qkBsgZyKFeWoC2W0BZjVA3n2DzFYQX8cwFsdDQjTGhv43kywRyQG8mfkwPW0qnJngZ
         zJ2uo0KB69Rrg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 79397609F8;
        Tue,  1 Jun 2021 00:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document google,senor board
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162250620349.26991.12569651685550187199.git-patchwork-notify@kernel.org>
Date:   Tue, 01 Jun 2021 00:10:03 +0000
References: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 29 Apr 2021 11:10:26 +0530 you wrote:
> Document the google,senor board based on sc7280 SoC
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [1/2] dt-bindings: arm: qcom: Document google,senor board
    https://git.kernel.org/qcom/c/17bf8dfa2ac7
  - [2/2] arm64: dts: qcom: sc7280: Add "google,senor" to the compatible
    https://git.kernel.org/qcom/c/9d6e639cbaa1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


