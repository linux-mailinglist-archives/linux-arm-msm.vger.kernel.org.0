Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4A1300F10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 22:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbhAVVl5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 16:41:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:59606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729264AbhAVVkx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 16:40:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5D35323B06;
        Fri, 22 Jan 2021 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611351612;
        bh=183ZpCmJmHqD8U/g33oifgGMYn86xnOObvkLbKqTe/4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KX2XIKfkUgT3tyTSiLMoSUYVOvangQK5ILq6XTUq/Q0Rkn1s7zB7DfPRQa8u2Smyu
         sD8YWdX4Qg2eAz/DSUHAIZh6O1eE1AHXjpTJ7F8vB+OlCxH3fuPIjm3zbahPB8c6V+
         ua3aobRRu6LB5CSH6V9JtqQ0MVy3u4y5Dk8rkeRueeBLEcF6CBjpF0rwkGl4wjVA3c
         IdFSv+pM2UevWJUl3z+iff/tWjg5kkrvJagvwJ7ybUc9194lxY5HGJvJ/c1XADgXfW
         Pdii+j9Blz3Jy0lX9OIrPunfSU9Hj3ZPW7Yb363SBDVo9VXWj2sOvvt4nBqBqmT/eo
         dj0apnI83fMvg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4F63D652D2;
        Fri, 22 Jan 2021 21:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/13] SDX55 defconfig updates
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161135161231.27172.15438570969792359954.git-patchwork-notify@kernel.org>
Date:   Fri, 22 Jan 2021 21:40:12 +0000
References: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 18 Jan 2021 11:08:40 +0530 you wrote:
> Hello Bjorn,
> 
> Here is the defconfig updates for related to the SDX55 platform. All of the
> drivers enabled are part of v5.11-rc1.
> 
> There is no specific order I could figure out for adding the entries, so did
> them in a kind of random manner based on the previous ones.
> 
> [...]

Here is the summary with links:
  - [01/13] ARM: configs: qcom_defconfig: Enable RPMh drivers
    https://git.kernel.org/qcom/c/a5a60f04ab39
  - [02/13] ARM: configs: qcom_defconfig: Enable SDX55 pinctrl driver
    https://git.kernel.org/qcom/c/df532200b6c5
  - [03/13] ARM: configs: qcom_defconfig: Enable SDX55 GCC driver
    https://git.kernel.org/qcom/c/33441b04d138
  - [04/13] ARM: configs: qcom_defconfig: Enable SMEM partition parser
    https://git.kernel.org/qcom/c/d18dad2640ec
  - [05/13] ARM: configs: qcom_defconfig: Enable MTD UBI driver
    https://git.kernel.org/qcom/c/dfe150173fb0
  - [06/13] ARM: configs: qcom_defconfig: Enable UBI file system
    https://git.kernel.org/qcom/c/ea07e8a9c363
  - [07/13] ARM: configs: qcom_defconfig: Enable DWC3 controller and PHYs
    https://git.kernel.org/qcom/c/ca61452bd746
  - [08/13] ARM: configs: qcom_defconfig: Enable ARM SMMU
    https://git.kernel.org/qcom/c/3afa1cb4562d
  - [09/13] ARM: configs: qcom_defconfig: Enable RPMh regulator
    https://git.kernel.org/qcom/c/caad87c68d99
  - [10/13] ARM: configs: qcom_defconfig: Enable watchdog driver
    https://git.kernel.org/qcom/c/1ca52deca3ce
  - [11/13] ARM: configs: qcom_defconfig: Enable ARM PSCI support
    https://git.kernel.org/qcom/c/7dfb6c00ff84
  - [12/13] ARM: configs: qcom_defconfig: Enable RPMh power domain driver
    https://git.kernel.org/qcom/c/88f7a858a80c
  - [13/13] ARM: configs: qcom_defconfig: Enable Command DB driver
    https://git.kernel.org/qcom/c/f147d717b133

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


