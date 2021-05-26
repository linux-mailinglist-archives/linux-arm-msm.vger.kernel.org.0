Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C431392010
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbhEZTFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235747AbhEZTE6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 36897613ED;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=gOxbDJfdjX6HtBRLBRS+oRSQ2Zjrcht0GBKnoyY8EUQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Wqb//rB5o3DEY0SEpmwwdbqOLSFTD1dwPX/WJDFh5/uumy7WTHeTFZKXJISLT7mM5
         paI9ZSJsyOm23Y5f5JPAp0WC9NUtOHTk0W3wguXAE3k5RyLH7NQ/L5xtwy8F//CkSu
         BwZyuJJgoN+gNDx9YP1oJiycpAV44ZnPhRysAn6PKNV1MatCEYNC7Yr+QoGWX1iLfq
         vjg74iS2nbfqtwyI+Oi8zUFlqRDWlj8Vmse28LucnOml0KilXMYy/BJGsbZWzjfjNT
         egroacHczw3OMBzmIn5tjmD1NG48W9ce2V2Q0e/lmPjrl0fCpZwg+pSgSsV1+2K8Y/
         6DZnHaZCm8pMA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 314FD609B2;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] arm64: dts: qcom: enable SM8350
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580519.26840.6631074873611904287.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210413170553.1778792-1-elder@linaro.org>
In-Reply-To: <20210413170553.1778792-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 13 Apr 2021 12:05:51 -0500 you wrote:
> Add IPA-related information to "sm8350.dtsi", and enable IPA for the
> SM8350 MTP platform.
> 
> 					-Alex
> 
> Alex Elder (2):
>   arm64: dts: qcom: sm8350: add IPA information
>   arm64: dts: qcom: sm8350-mtp: enable IPA
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] arm64: dts: qcom: sm8350: add IPA information
    https://git.kernel.org/qcom/c/f11d3e7da32e
  - [net-next,2/2] arm64: dts: qcom: sm8350-mtp: enable IPA
    https://git.kernel.org/qcom/c/adfea97e4929

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


