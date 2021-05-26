Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF8B391FFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235803AbhEZTFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235541AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 58F496142D;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=aDjtntaCzESw+RkNmvhc3Mm7SeC6C0u4PyEq5YW9hgE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JfIZQY/ec5/qHOHJ6bL/okX8zGgn7nSydeRtvD+GZ6I+KpfX7vIqAN6ky1Y1gR4P+
         P0htVls9ylDB7Bu8gq5IHnfgic4PGt6h2715nKlxSdZ0JOXhFa1hRuVpXVvpN1gB7P
         LJ7/FEKwOodojL1rZZNlgn0KgZUsmEwp7ia9UZdokNBEYlKoi1ZXl+yYgZQ8KQHjsl
         mL05wyYDHzHpN3sd62xhtt/BtAFFBA3CaRufpcMj/1ptCbFiVKv2/avUAPZ9BlkVw7
         1COOfH1Sf94MlnOlEp635ttLWPC2QBo1rgiWEovTtibaDgsUampeZDN7sOz1c3e/QQ
         K6bjIGvXZMvWA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 54424609B2;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: core: Parse firmware-name DT property
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580434.26840.8810360346452999461.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210126084252.238078-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20210126084252.238078-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 26 Jan 2021 10:42:52 +0200 you wrote:
> On production devices the firmware could be located on different
> places, this path could be provided by special firmware-name DT
> property.
> 
> Here we check for existence of such DT property and if it exist
> take the firmware path from there. Otherwise, if the property
> is missing we fallback to the predefined path from driver resource
> structure.
> 
> [...]

Here is the summary with links:
  - venus: core: Parse firmware-name DT property
    https://git.kernel.org/qcom/c/18a6262b05f7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


