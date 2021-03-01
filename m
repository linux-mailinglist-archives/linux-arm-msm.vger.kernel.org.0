Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE67132929D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239003AbhCAUsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:48:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:55170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238067AbhCAUpn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:45:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3B6D164ECE;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=Rc6UEJXMwGqhV6BNV+Sp6+r/8o7KC0mg5CNSMDpaz/o=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Nc5+wz6EJP0I/eFWrSyl/tvLUJXaxRGKt+XvYbfQqATHLg+9snjfXYqMQnxP9pr1N
         A1vTwtQm7qMEGfclFAYlY9Fg1y/AEihA5CViT2cLJwK2sDyW+2M8q91oiqFS2MUrfC
         XD0xLAhMMyYGFc0l/yNrCChyhH3E3jTE1lCkEXRzOLXAlbcvVPCO7lCKGMSzxcsw7g
         4c/IPxJUwr1FZBRERe9ILMeSSq9AEhI2GIEilAEq7DyDuT5hKT7V5oh9WnCTyPOfCG
         iEIE05TDudsZMqbN9zHsB9+ZlkFX7LumV96rD9l07iv36YFdydFlGnY+lNwBb/Nm31
         DOPr0NxrT0Ccg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 37ADF60C26;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] Consolidate RPM interconnect and support to MSM8939
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878322.6187.7331337979387718910.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20201204075345.5161-1-jun.nie@linaro.org>
In-Reply-To: <20201204075345.5161-1-jun.nie@linaro.org>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  4 Dec 2020 15:53:40 +0800 you wrote:
> This patch set split shared RPM based interconnect operation code and add
> support to MSM8939 interconnect.
> 
> Changes vs V1:
>   - Rebase to latest icc code.
>   - Remove unnecessary comment and info.
>   - Fix some format issues.
> 
> [...]

Here is the summary with links:
  - [v2,1/5] interconnect: qcom: Consolidate interconnect RPM support
    https://git.kernel.org/qcom/c/62feb14ee8a3
  - [v2,2/5] interconnect: qcom: qcs404: use shared code
    https://git.kernel.org/qcom/c/dfbd988f1ce6
  - [v2,3/5] dt-bindings: interconnect: single yaml file for RPM interconnect drivers
    https://git.kernel.org/qcom/c/4187f9c16b7d
  - [v2,4/5] dt-bindings: interconnect: Add Qualcomm MSM8939 DT bindings
    https://git.kernel.org/qcom/c/4ec908d21040
  - [v2,5/5] interconnect: qcom: Add MSM8939 interconnect provider driver
    https://git.kernel.org/qcom/c/6c6fe5d3dc5e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


