Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AE339203E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhEZTFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235164AbhEZTFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CE69061466;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=afUiHLPDYiKNiz6N6OVVVS8zaE61anV8jtxK7emTwvQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IuBa117nvggjfYK3Ko/qMOdDhkTjlWvtdTjT+BP5RU1c19SuBHEqRFEYgGQL4Xs2z
         cLii/vb1giXezhmazUuYI4iWn7pnqX3oVSIpeO7yM/vO5LTmaz/m5fqbXi8xUlKQzt
         Ir3CSQRFPOruG09rJJ6wTcg4oAq8T+qTkvNWiHKhr15GUwv/jZxXebUI9y+wx+PMJU
         MKIVmBs/rhyHtPZAOBzhSoEWnmUF1iriuwCgu2srEXxPAyDZ1kwRkJ+unotMlqkhD6
         qjN0TZqW7lU0jEvHVI+2eu4OUOOWtaPaAPALE4PeRcC/Wup9xVHTxIEkW6zsgRBUNf
         tMirLNHB+jm/g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CA61D609B2;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Provide errors for firmware-name
 parsing
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580682.26840.12264484670165411406.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210312002605.3273255-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210312002605.3273255-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 16:26:05 -0800 you wrote:
> Failing to read the "firmware-name" DT property without informing the
> developer is annoying, add some helpful debug prints.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Here is the summary with links:
  - remoteproc: qcom_q6v5_mss: Provide errors for firmware-name parsing
    https://git.kernel.org/qcom/c/9af2a2a9c64e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


