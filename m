Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF542C1C87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgKXEKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:46898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728682AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=2vRo/Vwn1qSSrOByZ61mjxE1W703t6i4PHw3o48/+BY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bNqmsp8w/SjmwhERQrGA+Gx7bwIusYietCnCYPbGlg40aVOQ6tSZc076/hWOLL/Ku
         SF2C+tUQQgfhFregA+Bx7t55xCgvmPx719of3IxAannjY74Pk8nhpunnkkRH7Erehy
         HavkT2lIUQQSr48VsvmVS+4k/I+bt171vPdFdzgw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Remove double pull-up on
 p-sensor-int-l
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100859.17117.15521469773874820111.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201120200913.618274-1-swboyd@chromium.org>
In-Reply-To: <20201120200913.618274-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 20 Nov 2020 12:09:13 -0800 you wrote:
> This interrupt has an external pull-up so we don't need to pull it up
> again. Drop the internal pull here. Note I don't think this really
> changes anything, just noticed while looking at this irq pin.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Remove double pull-up on p-sensor-int-l
    https://git.kernel.org/qcom/c/d5276bfa0ca6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


