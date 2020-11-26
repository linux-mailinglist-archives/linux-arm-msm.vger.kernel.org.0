Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3762C5CB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 20:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbgKZTuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 14:50:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:38228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728224AbgKZTuG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 14:50:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606420206;
        bh=VUxaP6W6jIJ/6NWEZwArDMdk5SF4ouxGLOqCjdvpeng=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rFzQNPZLja7YKXXV558I98klTXIR2Spf7v2Hl+5YN6F4NTQeZksn3AUrC52PR0Mo4
         MPR8cKgz6kKLfQY4Bi8JFtnwunVOzh55SX3LbQ1GqPLMWp/nIYKpA06JIMQkDcFGI2
         9LH57Q5ek+WEDxerkXYS9ejW/41k8TDLWnRGipa8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974-klte: Add fuel gauge
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160642020616.4652.7484966414914447839.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Nov 2020 19:50:06 +0000
References: <20201126141144.1763779-1-iskren.chernev@gmail.com>
In-Reply-To: <20201126141144.1763779-1-iskren.chernev@gmail.com>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 16:11:43 +0200 you wrote:
> The Samsung Galaxy S5 uses a maxim17048 fuelgauge. The maxim,rcomp value
> is taken from downstream kernel. Model data and temperature-based
> compensation are not yet supported in the mainline driver, but the
> readings seem fine nevertheless.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> 
> [...]

Here is the summary with links:
  - [1/2] ARM: dts: qcom: msm8974-klte: Add fuel gauge
    https://git.kernel.org/qcom/c/da8d46992e67
  - [2/2] ARM: dts: qcom: msm8974-lge-nexus5: Add fuel gauge
    https://git.kernel.org/qcom/c/45dfa741df86

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


