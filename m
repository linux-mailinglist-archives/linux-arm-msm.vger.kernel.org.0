Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1A42C1C91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgKXEKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728712AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191009;
        bh=swh+ENvmXLbhsSstDGHzR1nyOvyNdi/vTEMR2RfNGJM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YzF26SrH5kUBW7RcowAKNjpv15530fuB2w0CkxpVgjyw9MBBF2d89LueRINwrx4Vf
         hBu7xVPNdQuPW/GSbV4vT7xsnAAYC3L+NxjD/O4QOolruPr52qGv7rM59/upuKqjrS
         nyVLhsQzcub+Bs9vy1dAV5dalcimW6LxWtUtlDmI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7180: Add prox sensor to LTE sku Lazor
 boards
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100892.17117.15032683219406027113.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201120183825.547310-1-swboyd@chromium.org>
In-Reply-To: <20201120183825.547310-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 20 Nov 2020 10:38:25 -0800 you wrote:
> There's a proximity sensor on Lazor devices, but only for LTE SKUs.
> Enable it only on the Lazor LTE SKUs and also configure it properly so
> it works.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v4] arm64: dts: qcom: sc7180: Add prox sensor to LTE sku Lazor boards
    https://git.kernel.org/qcom/c/fee5dc31a588

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


