Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395BF2E73D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgL2USj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E491C22E01;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=0M+NmELun8LmlNpkpQyhiLlCzpUSeZK+DZ8ny9lpnGo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Q6VeIRcd6yfGw3MeWCJVnpIaS1kkVv3o9YJ1/FyimYg4ml+1gOYlmxLCXcZDO5gLF
         4Yd0Ogw3JFfB0Cj9ehsbRzXZvKoDf5UAwrfpzB6Sk+b2WgqHWKeCiogxNnMQhgv/uJ
         fTIVKj/fQM95j0qETIs5bMXUjLv5yXkcJiT7b2eDSglxNNjvzPmsfBsQttcGp/pfHy
         jbdUKhD/WWXs+PWVPjLEr2JrMFcfdvWUrkS/ZfcBfu5rLfT56GyVZYeRDgNw2PE+4L
         p4YslCRKs5evIlv68zcg2Drk2HdvIkygQxK/1fv+CAZWrkGn52mLvCGVNgLrtSis53
         YcCEZq6HnqHHA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E046C604D7;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: sysmon: fix shutdown_acked state
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293591.13751.4235218848958063380.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201204193740.3162065-1-arnd@kernel.org>
In-Reply-To: <20201204193740.3162065-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  4 Dec 2020 20:37:35 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The latest version of sysmon_stop() starts by initializing
> the sysmon->shutdown_acked variable, but then overwrites it
> with an uninitialized variable later:
> 
> drivers/remoteproc/qcom_sysmon.c:551:11: error: variable 'acked' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         else if (sysmon->ept)
>                  ^~~~~~~~~~~
> drivers/remoteproc/qcom_sysmon.c:554:27: note: uninitialized use occurs here
>         sysmon->shutdown_acked = acked;
>                                  ^~~~~
> 
> [...]

Here is the summary with links:
  - remoteproc: sysmon: fix shutdown_acked state
    https://git.kernel.org/qcom/c/9d7b4a40387d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


