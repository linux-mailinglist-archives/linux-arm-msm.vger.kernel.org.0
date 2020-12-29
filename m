Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DF72E73B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgL2USL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:60052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726529AbgL2USJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 78B5F22D00;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=ArVweN8hL5oievFrwoM8MUhWpKt43tWTzUNk0YK63UU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RBPEUxRxSVuOYjJzxcu52KXB1BhRpaMskuz4p5WdDoWzTUdLuKtWe2osXgN1hYbvJ
         AhBQh8q4916oWBTUKR4cY0H4eLl4kLIFUULJv+9toxj1YAjk9/3GdsTxRdD1WP0lxv
         RHOZWzkfC0otr2MRKJQ8Z+9Yg2E5iMc7AQnLITWc9YCoEfCxQOaQ1/2Y97uHDGG1zJ
         rd3GSPkZNkraQM5FFvTz2oqFBaL9vfTkJH1S7hWtsd2xtyl6huECPaNoowK9NAmyU+
         nZ2NUk3cS75to3BXhVtpHKUxJUOelwS3qz6Uw3mtYOeco9MsbQggnRWsbSH3UHWtCX
         QiRLrZSv4/vfg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 74A38600D9;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293447.13751.380004291390696388.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201215104537.768914-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201215104537.768914-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 15 Dec 2020 13:45:37 +0300 you wrote:
> Convert soc/qcom/qcom,smem.txt bindings to YAML format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,smem.txt           | 57 ---------------
>  .../bindings/soc/qcom/qcom,smem.yaml          | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml

Here is the summary with links:
  - [v4] dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
    https://git.kernel.org/qcom/c/e2b0330c5a20

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


