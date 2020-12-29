Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8465D2E739E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgL2URy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgL2URx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5462D22BEA;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=9CJKOkfMS0cR6IEdhyMbDuJZXNkJzrrjAfVee6EXv+k=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fhFS60yj9OuwXrM6jwka3thUSLKnTJMNmLm943w5DnqHNMogsjTWJKY77ZOCow2yM
         7jGTyL1Lj/t4e3yEMwE59oPaxau4OHoiwmtsPyD6HILPIiAASsmtywRR11NNGrlyiN
         0aqF6DMsps3/B4Aui/xdDklu2BE9NM4vRIGu2prOSk7SLoPcZOeRPO//9ml29ND7eH
         ZapmEIGWyBmnEJL6agTD/MAWxPUVAfIUbEsN3AW4w9HNB+Fna0slJvt4kLvS1136pr
         5NztKZ6iH6YX0p6NSpnOFOxLreWGLI+NUW+JVXSJVKJRi8yLHJ1GDsaPGe1Y7G0Ruw
         UDvO7AytZwsEg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4FAE960591;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293332.13751.6021503151698525455.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 27 Oct 2020 17:04:34 +0530 you wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Update SC7180 lpass_variant structure with proper I2S bitwidth
> field bit positions, as bitwidth denotes 0 to 1 bits,
> but previously used only 0 bit.
> 
> Fixes: cba62c8b49be ("ASoC: qcom: Add support for SC7180 lpass variant")
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit positions
    https://git.kernel.org/qcom/c/cf9d21984da2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


