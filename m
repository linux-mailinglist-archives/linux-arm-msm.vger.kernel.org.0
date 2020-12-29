Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8472E73AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgL2USE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgL2USD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EE97D22C9E;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=OnT5SCi+kEDdeKiCoksc1SADBmKMXuM5jbHiKYZS9SM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=D9URonmQj7H/y5tbSE4nSMWPDwwdVFOJD2RvwVA+Ey2Urc/127uepk0xtJwyi55r/
         nQVKS9h5GIIhnElpJFHy5BN6PGKYuAc7AQJqs6e2kvcn3DZa69mskV/MWJQAYHwJ2b
         +NwL2s8hpgS85wynJX6w2dPG37aTSEjSz8j1J2RzhmzXI0jBpzr40z12TZzFYu4s3i
         45aCFeKibamvdp7cyKP5mL8r6ZCzcY6qDnCD6awQoU8AoSJxseJv+AxtWZnvw8kYb7
         LTkAaG6AoviaTrSgedAZlOmmX74uwIqskduV0YdrqY7oivUAgY6xrmeSZlqFaxv7vX
         3ee4F7qEPRE2A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E7AFC60591;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PM8350x compatibles
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293394.13751.251175149859625197.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201203071244.2652297-1-vkoul@kernel.org>
In-Reply-To: <20201203071244.2652297-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  3 Dec 2020 12:42:43 +0530 you wrote:
> Add PM8350 and PM8350C compatibles for these PMICs found in some
> Qualcomm platforms.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt     | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - [1/2] regulator: dt-bindings: Add PM8350x compatibles
    https://git.kernel.org/qcom/c/ff7f380d21d0
  - [2/2] regulator: qcom-rpmh: Add support for PM8350/PM8350c
    https://git.kernel.org/qcom/c/bebb2c6d5ca2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


