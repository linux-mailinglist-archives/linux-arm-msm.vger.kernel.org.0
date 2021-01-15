Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F462F7ED6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbhAOPBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:01:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:38758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbhAOPBb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:01:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 71E252395A;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610722810;
        bh=VgrABEc745ZCATzTiO1K3Chf20J+rAtd381nTnexJqs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HPZgSa+rPhovanhHr0X55u5l3KPMLJxx2IuDbt6wVHPrQ/uxV6K4jexRjqxhI3QdX
         I7qCle7Koa1acAwKCaRuqA/C+edp5OVhGSTdN0NY9mp4C81eGNKujKEferEIZpRFsY
         EjSDkPEcO5822cubWgFPtZfn2o3TwsyR0hqtyT3vgKgLIqQyznhKMUSXCMie3vAabp
         YF+3O+zSboN1LaWoFbLJwAhJVHA6VJ7StayKxnc80GHvAUQnOj6wYpoAgKx3sepHiX
         +KZwlMeH10JtHZJuGvNUQThLATLbVjpx4UQEUmkVOtWK8l6P1DchC0lN1lTuzzL7pw
         5weunX8QFsQBw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 6DE47605AB;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] soc: qcom: socinfo: add qrb5165 SoC ID
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072281044.19141.15423510694802965786.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:00:10 +0000
References: <20201222130448.4125297-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201222130448.4125297-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 22 Dec 2020 16:04:46 +0300 you wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [1/3] soc: qcom: socinfo: add qrb5165 SoC ID
    https://git.kernel.org/qcom/c/0c0d0e56e08c
  - [2/3] soc: qcom: socinfo: add several PMIC IDs
    https://git.kernel.org/qcom/c/4305324208d8
  - [3/3] soc: qcom: socinfo: add info from PMIC models array
    https://git.kernel.org/qcom/c/734c78e7febf

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


