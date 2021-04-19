Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0333236466E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 16:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240158AbhDSOuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 10:50:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:39090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240569AbhDSOul (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 10:50:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C173160FEF;
        Mon, 19 Apr 2021 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618843811;
        bh=6T9jh18CFUehss8IogzxfVOEEp+GHxc/SoLrOGzY0iQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ed8rdnS8YjIlxZniNZmkRfNxeyI7X+nIUeNSN3WvnhJ6+40IDtJsJJC8VUDinaC1Z
         gqvfb9Wf1WhKM+mcTlzHBbmof/+36tbIk4TYZGeuYoYUy8NF9WIMo8KnR0TMpMWI2m
         z6mWlfIkL5oY/QipREcXWwWQRa5SMZn/AwoCB7bF0dAtqAKAe2MKq0w2qyDnMNAZdn
         ghN+dfKeSaILHv9xmanByInW22W0yaoSznLHz56jAjG1GDF0s9PGPRPyRycjhK7VHQ
         4wuWxkaztMrKcZaUWlT7CIKhkIhb9yNt/jGrbnuvDKWIwNNUAxxDlEnm//HdswxoyN
         cfojZCo9Ybnow==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B6D9F60A39;
        Mon, 19 Apr 2021 14:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: Update iommu property for simultaneous
 playback
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161884381174.13392.12055080483734365279.git-patchwork-notify@kernel.org>
Date:   Mon, 19 Apr 2021 14:50:11 +0000
References: <20210406163330.11996-1-srivasam@codeaurora.org>
In-Reply-To: <20210406163330.11996-1-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  6 Apr 2021 22:03:30 +0530 you wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Update iommu property in lpass cpu node for supporting
> simultaneous playback on headset and speaker.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: Update iommu property for simultaneous playback
    https://git.kernel.org/qcom/c/367a8230fc88

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


