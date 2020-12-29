Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9232E73D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgL2USj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 049A6224B0;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=Fhc8hSAFk4btlSk7gOjaoj2WS3tGPckZ4usWVYsItvw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=L6+yIkmV66dRWurxjCf+e0X91noSlKWSHvCEM7Xv1yYkNfAWZfDaef00RA6gYGnPe
         y2efDyWAtq6Z4YwlYSiE1qktV95Sv5sfXAlX3CnU3do3/salJJlrOngOW+zSnTCjsi
         Xxhrf7g4qjwHoPbEKsHEW82UHhsNXgWjXz+sv4ZVsxGJsLKPJB4zlEQLFhjR/7MuN9
         jG5AqkO9yA+boU3GcSXa7sSbFH+MwT0xJNvTp0VQ90cuShY6+AbDvMO2sGpfXy9ArT
         zB4686H/CCl6mP7fqEsr+xfci2dsCiFOJ1k++jXIAVIJcj0jAdEsc2xhnFeUQeRarq
         30llRz1H0r5UA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 01238600D9;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: btusb: support download nvm with different
 board id for wcn6855
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293600.13751.15905613590960846517.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <1606971434-23709-1-git-send-email-zijuhu@codeaurora.org>
In-Reply-To: <1606971434-23709-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  3 Dec 2020 12:57:14 +0800 you wrote:
> From: Tim Jiang <tjiang@codeaurora.org>
> 
> we define many nvm files for wcn6855 btsoc and host driver
> should find the correct nvm file based on board ID and then
> download it.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: btusb: support download nvm with different board id for wcn6855
    https://git.kernel.org/qcom/c/ef2862a1db8f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


