Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2031832F738
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 01:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCFAUS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 19:20:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:33610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229701AbhCFAUI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 19:20:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 949C464E86;
        Sat,  6 Mar 2021 00:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614990008;
        bh=nzageHlfJkMYkZnOb+4t7vfAX3KeSze9Z+kqhE4rZZI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sPjzltggkgefKQXWEEYgpaWaQmLT5ZAiLaJP8IfEpZZstr2rAjuqz2hVnZUdZHmnj
         0cIj4j/GMIBpvR533PrOPSM5g49MCbCc81+obFu6r4jA8YEPJJiHqotw1nwhSUpf17
         5ZfRo/8cQ9Mx70a8w25GDZi1lmzFk1IWBtlX7Q6YGzb+tmsAC3O7Lra3nKheazC1EP
         0Q04okMwlZiRD5DYdeEo6ONtlWIXbVpbiFtGs1hnP9t8CLDTbzEBOhWlCTk4peNa8a
         Ybq5VKxfMWf6GbZUbCLYApsqWp6w+H8bdzi2w21CgaXxfiXLerl5vZtQq8I3SV3m/H
         ZaEBTAdkVptWw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 88092609D4;
        Sat,  6 Mar 2021 00:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6]: arm64: dts: qcom: sm8350: more device support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161499000855.12377.17668563736396464151.git-patchwork-notify@kernel.org>
Date:   Sat, 06 Mar 2021 00:20:08 +0000
References: <20210204170907.63545-1-vkoul@kernel.org>
In-Reply-To: <20210204170907.63545-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Feb 2021 22:39:01 +0530 you wrote:
> This series adds more support for smmu, usb and ufs to SM8350 and MTP. This
> also adds regulator names which is very handy to have while looking at
> regulators.
> 
> Jack Pham (2):
>   arm64: dts: qcom: sm8350: add USB and PHY device nodes
>   arm64: dts: qcom: sm8350-mtp: enable USB nodes
> 
> [...]

Here is the summary with links:
  - [1/6] arm64: dts: qcom: Add SM8350 apss_smmu node
    https://git.kernel.org/qcom/c/c7f1529a6753
  - [2/6] arm64: dts: qcom: sm8350: add USB and PHY device nodes
    https://git.kernel.org/qcom/c/82d9f16129b5
  - [3/6] arm64: dts: qcom: sm8350-mtp: enable USB nodes
    https://git.kernel.org/qcom/c/59411de54f24
  - [4/6] arm64: dts: qcom: Add SM8350 UFS nodes
    https://git.kernel.org/qcom/c/1256d61304d6
  - [5/6] arm64: dts: qcom: sm8350-mtp: enable UFS nodes
    https://git.kernel.org/qcom/c/3b0dd979628e
  - [6/6] arm64: dts: qcom: sm8350-mtp: add regulator names
    https://git.kernel.org/qcom/c/e568107363e8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


