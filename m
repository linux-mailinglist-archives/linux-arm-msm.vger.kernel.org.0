Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809682C1C90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbgKXEKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728664AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=AU2dlRc0ge6dXM9CSdrKFvjZLuOMetzsrwp4J+Xbap8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kkwzz4WnjiFToAOwtUDSRA3MzLcoWXThfRrhgAqR2qQu5eqpEMXEELScPPGBcMjFO
         5LZEXeXkaIMb5zEbMStKRWJtwE0/1eWxYdpi/99LQ92MOCWRtw5bp1AcAsqYgYnVym
         OlvNsaTLQAlddk+uQgEEoyu5iuO8yrMjj/JAfcjc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: correct compatible for sm8250-mtp
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100876.17117.12005632627786593154.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20200930112133.2091505-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20200930112133.2091505-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 30 Sep 2020 14:21:33 +0300 you wrote:
> Qualcomm boards should define two compatible strings: one for board,
> anoter one for SoC family. sm8250-mtp.dts lists just the board
> compatible, which makes it incompatible with qcom.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 60378f1a171e ("arm64: dts: qcom: sm8250: Add sm8250 dts file")
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: correct compatible for sm8250-mtp
    https://git.kernel.org/qcom/c/d371a931540b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


