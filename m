Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04331354B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 05:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhDFDkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 23:40:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:49670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233205AbhDFDkR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 23:40:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2592C61158;
        Tue,  6 Apr 2021 03:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617680410;
        bh=J95ljpubMICmt/GWiMgaHR/1DEbZpg5c9IUrllsC9F0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=g7BKANCB5973XaCty78RiiHYQ4cOkt7kmZ4PeZEUtJ9Hd7DVIRNaXla0VszblY0aF
         9Y0Fs1lIHMYr7nyHsU9suv5DUN7l9QR9kFGDYYoZPk6fasCFktXPEeqKm9f/Ke56Bc
         m8V+vSFvr37zKlYEou1nvMsqtp5CosO7Gnw6vMvyvbTqKOJJszQ6oOQ5giL9R7tdJ1
         NlVo8ySEJAwpsOJH3LVB/8QDJe/MPr4Z9oVPdi29Jo1MNhtPDl/08mL6iz5KjTvTIT
         D9EUdnIbT2PXtAik19X74m/LH6MifSfDfg7tBdVbtxxp632je0mS47npr3LtVfxppB
         j2Ju1VBaENmJg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 172E160A38;
        Tue,  6 Apr 2021 03:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add support for OnePlus 5/5T
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161768041009.22037.16594652578202346510.git-patchwork-notify@kernel.org>
Date:   Tue, 06 Apr 2021 03:40:10 +0000
References: <20210406010708.2376807-2-jamipkettunen@gmail.com>
In-Reply-To: <20210406010708.2376807-2-jamipkettunen@gmail.com>
To:     Jami Kettunen <jamipkettunen@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  6 Apr 2021 04:07:07 +0300 you wrote:
> Add device trees for OnePlus 5 (cheeseburger) and 5T (dumpling)
> MSM8998 SoC smartphones with initial support included for:
> 
> - UFS internal storage
> - USB peripheral mode
> - Display
> - Touch
> - Bluetooth
> - Hall effect sensor
> - Power and volume buttons
> - Capacitive keypad button backlight (on cheeseburger)
> 
> [...]

Here is the summary with links:
  - [v2,1/2] arm64: dts: qcom: Add support for OnePlus 5/5T
    https://git.kernel.org/qcom/c/47498916afea
  - [2/2] arm64: dts: qcom: msm8998: Disable MSS remoteproc by default
    https://git.kernel.org/qcom/c/03041cd25d98

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


