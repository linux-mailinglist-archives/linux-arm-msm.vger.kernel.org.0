Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1852E737E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgL2URd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:60230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbgL2URc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 35A50223E8;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=36DG5jRENgZdZBq7UG8l7G5Q7r/6p8X1RKMqNzq03zs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qGnmupVNeFVUS072ASnCsUCdgAsSS9s6+fBgHKWgkPF65LU6iPfFIU1Xg4innJdk4
         3M7yYb4m1rKJLNNyTVfOOcajF3l3bZFRBVP8/oq1vFyKJ0619hqemlul8EazzjM2G0
         bLhZNaOeOrcMRvhBFojmy4xfn6zwEMUxRflpKkn/fgoEqUdYzH3JVaik6+27+7B6Yy
         DLc7FwRLGLLVk477ASmFhePGeOnSq5DwDocN0YKuTktZucQDw+z9+r1tORNHVT2KN8
         3x6rArJyqPuM4NrjTSQAktX06CUmEbuR3MWn118uBfDa/mKw6qcCtLJ9izNPttaGf8
         g13raGFzM+Hxg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2F1B260626;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PMX55 compatibles
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293118.13751.7595887656109473199.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201126093018.1085594-1-vkoul@kernel.org>
In-Reply-To: <20201126093018.1085594-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 15:00:17 +0530 you wrote:
> Add PMX55 compatibles for PMIC found in SDX55 platform
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt       | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [1/2] regulator: dt-bindings: Add PMX55 compatibles
    https://git.kernel.org/qcom/c/1008521b9b4f
  - [2/2] regulator: qcom-rpmh: Add support for SDX55
    https://git.kernel.org/qcom/c/36dd70ceb4d9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


