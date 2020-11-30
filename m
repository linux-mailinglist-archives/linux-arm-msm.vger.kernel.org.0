Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47D8C2C8D91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgK3TAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:00:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:42420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728696AbgK3TAr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:00:47 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606762807;
        bh=n4fnzvJ9ZsaofL1c+iU68nklneOw/CbZ0gFJf1SyCwc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sCOBLtmtdX6/RxBA22QDLV3ODBFS5rMpUFcZqFGJTxom7JltjGgrt0QQUarz/FI/o
         AM7fDAjzaSiOGe8F2JYVl5XTKF9SZa2IHIFbuqucH1gpOsyoTLnZOQz0MJ8txxz4vn
         GWtJ5xArQSpWbWhMsBJSn49N5JiVES3yukzvhy2s=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S
 driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160676280700.32741.989655575183508129.git-patchwork-notify@kernel.org>
Date:   Mon, 30 Nov 2020 19:00:07 +0000
References: <1600450426-14063-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1600450426-14063-1-git-send-email-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 18 Sep 2020 23:03:46 +0530 you wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add the I2S controller node to sc7180 dtsi.
> Add pinmux for primary and secondary I2S.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v4] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver
    https://git.kernel.org/qcom/c/96ddfbf46a35

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


