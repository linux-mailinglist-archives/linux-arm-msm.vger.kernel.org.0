Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC76355A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 19:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240323AbhDFRaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 13:30:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:55644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235171AbhDFRaQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 13:30:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A9F1C613D2;
        Tue,  6 Apr 2021 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617730208;
        bh=oskHFNTp3kh0QJ2S3A1CtIm+AXU7Rs3v6LlVVt7KE5c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XHu/2HJ6XomdBflctyMjRFvo9d7US8M/4SwH9whckp2TEcQMfSR14EzYguviVyXeE
         l3b0QLX4JN/MGaLPbPoQcmbmNgAs+CV5Rbss+xdTJP7vCBkagqliA1pro3Hdm3t0hD
         n6ZbT27Q8cbF9ruUlwMlZbziskmRUesT8GHPfOL470Fr20L6fTrCF5E7heS64QwyNA
         4PhCGvevDbZokV4rBcNtaqR+fB8MSG4ky+4EQPwrF6yaofxiP9+f1VmlEGouJsp3AF
         inzabIRGUZj7oUpv3UfAPWLKGgwJ/1+vXt6lO/HZ+kjbiNp9L+S9ltBjPImD9t6xnh
         lf4KGZuqr6AqQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 99BD260A50;
        Tue,  6 Apr 2021 17:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: add blsp2_uart8
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161773020862.5139.16060477523132368773.git-patchwork-notify@kernel.org>
Date:   Tue, 06 Apr 2021 17:30:08 +0000
References: <20210406140551.3328241-1-alexeymin@postmarketos.org>
In-Reply-To: <20210406140551.3328241-1-alexeymin@postmarketos.org>
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  6 Apr 2021 17:05:50 +0300 you wrote:
> Add blsp2_uart8 node in order to support bluetooth on the
> Samsung Galaxy S5 phone.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)

Here is the summary with links:
  - [1/2] ARM: dts: qcom: msm8974: add blsp2_uart8
    https://git.kernel.org/qcom/c/83bbdec03fad
  - [2/2] ARM: dts: qcom: msm8974-klte: Add bluetooth support
    https://git.kernel.org/qcom/c/885aae6860fa

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


