Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD13336B10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 05:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhCKEUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 23:20:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:56482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230052AbhCKEUK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 23:20:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B9C0A64F78;
        Thu, 11 Mar 2021 04:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615436409;
        bh=IRK4+NEjjRytsLn9tMIjxds14s98dcz37pfHalRIfVQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ozP0LGwNh1NUVNhrt75UCmWG1OgtaSd8dB3XhguXPqbwGmK+NGWhGswoxM2TuHJlN
         uVwmtwDyHC1pmmjcytrP3zILntw2vmJyEInJcfrNIcRMalOOX5oW1ytfst1z/neUV7
         IbZscAsWQbGzJlgLIukeIKHBfeoC+uuM9FLOof1o/6KF6AW2lCtUvYiqLbmt34oo/a
         LyUyMxspGOeTXuhdSZQpZTcYvM/zYjx+An+P6zzO9TJcXLMdCps+JiAS5cRW+H55Nf
         qggSVilbrO0mESZvuCH+OicpKnwI9L9aTTWxqKn2bCLtDrzfVghPMHsz5XbOMhDAaE
         W3KNPMdjhX+dg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AE3DF609E6;
        Thu, 11 Mar 2021 04:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: Introduce SM8350 HDK
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161543640970.28156.1469907553993651321.git-patchwork-notify@kernel.org>
Date:   Thu, 11 Mar 2021 04:20:09 +0000
References: <20210308182113.1284966-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210308182113.1284966-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  8 Mar 2021 10:21:13 -0800 you wrote:
> Add initial DTS for the Snapdragon 888 Mobile Hardware Development Kit,
> aka SM8350 HDK. This initial version describes debug UART, UFS storage,
> the three USB connectors and remoteprocs.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: Introduce SM8350 HDK
    https://git.kernel.org/qcom/c/a65ad1d99b5a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


