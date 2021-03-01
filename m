Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D11F329258
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240324AbhCAUnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:43:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:53286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239828AbhCAUkf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:40:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F0CE64E2E;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=sZrfa145X1mEMelYo996ASY5vcLk4k1k/RT/QX8nyHQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y1rd+190dbqZRdMG39M3PUvS71aINSPmijMkEhxtmgTMYPgHdTRfpV6BOMeta2eoB
         eHJVfDI7U+A/jtFgVvyMfsAi3rfJb9LSvZFrTOTcuR1zzZH0SrEPvvyOeMPWe0161v
         HAU6ZMMyVG7tXjBBgT6RqD7Lw5fS1VH7F4ob5FN9IY0mu0fqlG2qSb5TLwWY/cPjOw
         vcHeOYzKBIiqz+KwhZQT80tysuqfY1TwsuDssdHeKeRFA14w9Ti1+2X1XtzF84l4Fm
         RIZXngsvQPy9tvB+QuI+IEguz58euGV+C0uRCfr7YVjcJNSHPfR0LNRY1IWxKCLSa4
         CV2/69wPtyhxw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0B9F760C26;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] drivers/perf: Constify static struct attribute_group
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878204.6187.10960868173520973782.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210117212847.21319-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20210117212847.21319-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 17 Jan 2021 22:28:43 +0100 you wrote:
> Thie series makes a number of static struct attribute_group const. The
> only usage of the structs is to put their address in an array of pointers
> to const struct * attribute_group. With this series applied, all but two
> static struct attribute_group in drivers/perf are const (and the two
> remaining are modified at runtime and can't be const).
> 
> Patches are independent and split based on output from get_maintainers.pl.
> I can of course split differently if that's desired.
> 
> [...]

Here is the summary with links:
  - [1/4] perf: qcom: Constify static struct attribute_group
    https://git.kernel.org/qcom/c/30b34c4833ea
  - [2/4] perf/imx_ddr: Constify static struct attribute_group
    https://git.kernel.org/qcom/c/3cb7d2da183f
  - [3/4] perf: hisi: Constify static struct attribute_group
    https://git.kernel.org/qcom/c/c2c4d5c051b2
  - [4/4] perf: Constify static struct attribute_group
    https://git.kernel.org/qcom/c/f0c140481d1b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


