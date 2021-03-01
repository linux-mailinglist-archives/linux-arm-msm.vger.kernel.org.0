Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2946132924B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243606AbhCAUmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:42:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:52744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237399AbhCAUjn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:39:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C7D3864DF4;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=w+UkYI9lsSyvE6GEl8W2ralW712dIWn2wwwbyyUYg4w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=M3ZWLOANLDw0cu6tlOnFBNKk38AgSEE8aD76Tv86sCCNNs8wAQYZjZIoyr+UC4+pW
         QS8YZvltChHwQcy3D1QJy9zfJGiwQs0AYoj0CszXR3FaFTtRki5G5dJDnQok4Qv+0K
         hSzxXg60/TIkmiKLIaQZuMmQZ1rlOuCATyiT0dSge/Mmk3PaD+P0zxRWlkDkjgeqon
         8iQUbwU0i7hVh8Mef5rAxUNGA1uSmB2t4kCCLDZ3MrhWXEDRelT6WupkvjoZ7GTpAL
         Ps5fzUNVSm17AhIY+x30KnuuO9Xb2XCq3QnaXGgFYeYSPXMCDebkP5xsOi6PGuIk3f
         OO0jNDKl+IDEw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C3D8D60997;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] regulator: fix pm8009 bindings on sm8250
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878179.6187.17568067339749128449.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 31 Dec 2020 15:23:44 +0300 you wrote:
> PM8009 has special revision (P=1), which is to be used for sm8250
> platform. The major difference is the S2 regulator which supplies 0.95 V
> instead of 2.848V. Declare regulators data to be used for this chip
> revision. The datasheet calls the chip just pm8009-1, so use the same
> name.

Here is the summary with links:
  - [1/4] dt-bindings: regulator: qcom,rpmh-regulator: add pm8009 revision
    https://git.kernel.org/qcom/c/2bf3a72b08e7
  - [2/4] regulator: qcom-rpmh-regulator: correct hfsmps515 definition
    https://git.kernel.org/qcom/c/df6b92fa4005
  - [3/4] regulator: qcom-rpmh-regulator: add pm8009-1 chip revision
    https://git.kernel.org/qcom/c/951384cabc5d
  - [4/4] arm64: dts: qcom: qrb5165-rb5: fix pm8009 regulators
    https://git.kernel.org/qcom/c/c3da02421230

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


