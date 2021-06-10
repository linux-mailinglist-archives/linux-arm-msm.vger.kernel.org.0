Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC1E3A2E9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhFJOwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:52:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhFJOwB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:52:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 70223613E9;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623336605;
        bh=7/EDgVEV+Hrk6ZBYTwvHZScIzMawrcKoglCu4o4eFo8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Mkq2pdPNYlGLHVM4t0w6PzFDEoil0JfkbuhVJe+Z++sMvb8sS0nhDEAE14/H9nAx6
         D+OqTgnMFz9yClQszTS11qwqwB1i703u8b/9KDr/HCecqgUh0GlnEdbXCwFIWTIMHH
         FvV0pE5b3Sa6HbZ/BuqOgrnVp6ACAJB1ikuxpOO8kdWdluYRa0RbyJmXtDNbWpphSG
         bcl5YZUliyFijQjDJeh9RO4j9JX1MkZs8WLWDilr6f3LK00zH7rnmkZZ4JH/0Lonyp
         +naf0GDpovGjpXavVr1LK1+OhpqJhrF4C6Ty4QJ9MU1XEhD723Z2V1UEzp3NrjdZ7t
         vtIR7PuerB3xg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6006360952;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162333660538.29297.595353383315942452.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 14:50:05 +0000
References: <20210603122923.1919624-1-balbi@kernel.org>
In-Reply-To: <20210603122923.1919624-1-balbi@kernel.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  3 Jun 2021 15:29:23 +0300 you wrote:
> From: Felipe Balbi <felipe.balbi@microsoft.com>
> 
> Microsoft Surface Duo is based on SM8150 chipset. This new Device Tree
> is a copy of sm8150-mtp with a the addition of the volume up key and
> relevant i2c nodes.
> 
> Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo
    https://git.kernel.org/qcom/c/d1f781db47a8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


