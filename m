Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB142E73BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgL2USM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726530AbgL2USJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8292322CAE;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=P5kj4lTGdGY9G7Ijb11fLjFXmpgWM5jAK4mI58WD9SI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hD+yHsi0claS+xNbOWT1ogjJoF6i6eaLlp1Q6QrTy/DiV+f81S49+W8BC7ZECTk30
         ZC+8UrusjjOntxa7kt9Vw8Y/5ZauF+b/VondAPJt+3oWyvtQ5HKgG/562zUw9sR524
         5V9GIDaLSn/mxw+oy//e504Apn0NisamUuEBh51raojVTmss3rUPZ+n77PVR0Z10Qi
         72iemNAO2hXgTaFBL+SdKYyoV34MpDH2Hh1LYe8GqDJuadw9enY7KEUatmqPkOu5Bh
         N1A6sWtr2+ntp5ZxijD++uXM9z3r7uenrIFPVzVP0V2VLsKzEu8xsV23IaA6iFUNr5
         RldZrt8yM2c9w==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 7EF3160591;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] interconnect: qcom: use icc_sync state for sm8[12]50
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293451.13751.9985072719978950667.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201027133418.976687-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201027133418.976687-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 27 Oct 2020 16:34:18 +0300 you wrote:
> In addition to the rest of Qcom interconnect drivers use icc_sync_state
> for SM8150/SM8250 interconnect drivers to notify the interconnect
> framework when all consumers are probed and there is no need to keep the
> bandwidth set to maximum anymore.
> 
> Also move the BCM initialization before creating the nodes to set the
> max bandwidth in hardware for the initialization/probing stage.
> 
> [...]

Here is the summary with links:
  - [v2] interconnect: qcom: use icc_sync state for sm8[12]50
    https://git.kernel.org/qcom/c/fce52ad34832

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


