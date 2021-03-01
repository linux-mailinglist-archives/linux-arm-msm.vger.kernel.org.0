Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C970A329300
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243717AbhCAU4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:56492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243875AbhCAUxI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 96FDB64F1D;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=HjJr+4BJ0l1K3sXT5YYEzQ+RGa4wHG06MQM++S6WEt8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=a/+uLMK6JJwf8suaUJfdJ8ENvF6xljyc5zEBFmrbIgUt3gMJkHmNpoL6k/KHUOfWX
         4zDh0QfEkgvJumMJsLrgWOoIx+Dcw3dpKA/ULrDS2Ec0EWiMoIHqekd8WyzFG8pOoL
         6K5WFQOmynmuq0gU31wnEjWFPZp/34olsbEsBJdOvF5o26q+88RRJEEm3G3vlVHDkS
         yH9QX51ocPWNR9OqdD50VBce7pWFV7vWG7eDqZSFIJigz3Q2G0ZCTfruzgP2uBW7Gl
         wG6zY0yyNm2S5apwibF9poNVDwYFlb3csXi1EnFLUkbkZsgOU7+3cnVWJ0Iy1Q6EBv
         0z0nIQ0JRlh9g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 93C4860C26;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: pci_generic: Increase num of elements in hw event
 ring
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878560.6187.11324151259767293186.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <1612514195-8257-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1612514195-8257-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Feb 2021 09:36:35 +0100 you wrote:
> We met some sporadic modem crashes during high throughput testing, this
> has been root caused to a lack of elements in the event ring. Indeed,
> the modem is simply crashing when event ring becomes empty.
> 
> It appears that the total number event ring elements is too low given
> the performances of the modem (IPA hardware accelerator). This change
> increases the number of elements in the hardware event ring to 2048,
> which is aligned with what is defined in downstream version:
> https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/sm8150-mhi.dtsi?h=msm-4.14#n482
> 
> [...]

Here is the summary with links:
  - bus: mhi: pci_generic: Increase num of elements in hw event ring
    https://git.kernel.org/qcom/c/026c5b1ec29c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


