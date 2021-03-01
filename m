Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653EB32927B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238876AbhCAUqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:54486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238859AbhCAUnX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B144A64DE8;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=11Cv2FpbVESjtnk92HczRDDoFKijWqmnGEHh8/oGn88=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bT9JUbCw40HWwzDpugwrW4865ZBNwMmQq/rkpELIzZueQ0V7W/XDlerB6OUw4Mvlv
         hXA8AhC2tGUslsNjwWQQVQln3uKgTIcUjUz8d6Uo44P+kElb/qXgS7hWT7tDJaDJ33
         DLTxJgKVOpMtwMlOHTihvJfGGyZm1Z2H0/iloIld5n/agsdGoKXrYvtsFhf1r75Qix
         WXO1qRiOD5OuEQKlg/9Y5Drt7op2Be/ZHwk23wiE/gyMGcElJCuxqJTZ6WVkzSIGqF
         qN9C2CEJlgvG1LrFJkTIG51qFnbJ1GvKYDE0kyXN+V4Qv/58MytIMJYTPjUyDmBi6o
         yPVFjSLqjobdQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id ADE0660C25;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SC8180X USB phy
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878270.6187.4140654780394236111.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210121014339.1612525-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210121014339.1612525-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 20 Jan 2021 17:43:38 -0800 you wrote:
> Add compatibles for the Qualcomm QMP PHY binding for the SuperSpeed USB
> phys found in the SC8180x platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [1/2] dt-bindings: phy: qcom,qmp: Add SC8180X USB phy
    https://git.kernel.org/qcom/c/4dd8c1c7f2bd
  - [2/2] phy: qcom-qmp: Add SC8180X USB phy
    https://git.kernel.org/qcom/c/4d1a6404e91e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


