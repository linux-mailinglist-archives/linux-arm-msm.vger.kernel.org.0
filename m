Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D891D2F7ED7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbhAOPBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:01:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:38760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728906AbhAOPBb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:01:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7E95523382;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610722810;
        bh=aqNHMJKELlmfepdEdy6mZ+KLkt34AOaLMyZlULLBirA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TjFi4z0CJw31DpBN4Sszoq92NamvLQqUiL5Wq1qyiBcl59VGuUmDxcF+Wvz99/Sy9
         n/HO6kqY2a4dvUgnNl3w5Syu3TcQcgkBZKlDgxFPKIU7aiCNr5L/bHcejq8cwe7MZQ
         5StWwxNVOSOyW74HF4LCyq1Hg4dXMkpHo7ePAOXgIbkLz/8qz41CWZAQdyASC9aM6D
         ETZ+LYR42azBHGR/jsg9tDXcD4XfsRyKchO9vHaA5rABTOXu6uVQB2XFqYvHm+ayvr
         rOFqxHX9ILq/G3thQBdPnpvEgijtu++h8PWvEZLAkSnU8rBwjHVPn1NQ2M8zA6BVzr
         TSspG0GznJsiw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 7977960156;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: Define CPU topology
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072281049.19141.17638307453955480325.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:00:10 +0000
References: <20210112013255.415253-1-danny@kdrag0n.dev>
In-Reply-To: <20210112013255.415253-1-danny@kdrag0n.dev>
To:     Danny Lin <danny@kdrag0n.dev>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 11 Jan 2021 17:32:53 -0800 you wrote:
> sm8250 has a big.LITTLE CPU setup with DynamIQ, so all cores are within
> the same CPU cluster and LLC (Last-Level Cache) domain. Define this
> topology to help the scheduler make decisions.
> 
> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Here is the summary with links:
  - [1/2] arm64: dts: qcom: sm8250: Define CPU topology
    https://git.kernel.org/qcom/c/b4791e695526
  - [2/2] arm64: dts: qcom: sm8250: Add CPU capacities and energy model
    https://git.kernel.org/qcom/c/6aabed5526ee

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


