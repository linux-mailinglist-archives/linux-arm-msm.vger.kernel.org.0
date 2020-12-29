Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 314AA2E73AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgL2USF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:60246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgL2USE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 211AD22CB3;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=TssTZ7lzSxC9uYh3R0kq50G1zsrSy887Dc4bmL6lbPM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QIRlI/ggpY+CfnyoGUJzsuUsjGYohXb5qbX7pC+719ZrIeBGMUtddA+zmpIz8/1S2
         DVZOcSp+wKY6ylxU/CHnjpWAHRL0ousPmet0uRSzEtB1z2CLyuB/KVwiPkoKDrtTmm
         c7izKaFglM4W9Ov2LBD68vuAXCwp/hZblMtNJo75115yREnumEgc5doNhNn4WKhR+y
         54UbY0yeCbaFiCrLLdYhMibCtaen7+TtVwsFvUfB6pjdoDQJrfiOUSs1lCk8Z5OwPY
         pEeVB666XYpAs5zuCAf3kOomqUGL8iUu72PK+Unz96rUaOlYOBgo2QsBsew8lkQCul
         RUeyrkqe4e+ZQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 1D63A604D7;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies
 to avoid build error
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293411.13751.17469569345837308390.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201123222359.103822-1-john.stultz@linaro.org>
In-Reply-To: <20201123222359.103822-1-john.stultz@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 22:23:59 +0000 you wrote:
> The kernel test robot reported the following build error:
> 
> All errors (new ones prefixed by >>):
> 
>    xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
>    qcom-rpmh-regulator.c:(.text+0x270): undefined reference to `rpmh_write'
>    xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
>    qcom-rpmh-regulator.c:(.text+0x2f2): undefined reference to `rpmh_write'
>    xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
> >> qcom-rpmh-regulator.c:(.text+0x274): undefined reference to `rpmh_write_async'
>    xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
>    qcom-rpmh-regulator.c:(.text+0x2fc): undefined reference to `rpmh_write_async'
> 
> [...]

Here is the summary with links:
  - [v2] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies to avoid build error
    https://git.kernel.org/qcom/c/34c5aa2666db

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


