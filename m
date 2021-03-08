Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2F033169A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 19:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhCHSuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 13:50:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:58904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230286AbhCHSuW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 13:50:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E580A6527A;
        Mon,  8 Mar 2021 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615229421;
        bh=/hr4VkhNe3ryF1Ki7dRgBdTgIyy0X/ssVJwH1uSzxjw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jrGeWurhvm+tbs9yIp1nFQJ5d7cqLCK+21JGg8FI51py4lBnO9Wt4EHDtKYbFuoUz
         D5xu8DNOrRFVcrtr2BYfvwDiwbtvqCDGEsg8ZJUeU8J1K/XqOwhLNPT0KSK+OW+gFh
         GGo4pm545SU3n1mJkXHHHtHCESzY5GyPqO15UzaLnSTPez7A1ts2wCvL60QLBoG8m+
         Sj++RPBFF8mwuf0RYm4hkcszBXYwqzwF4mq74wdD/bVM6QLEGred8pqfwezuW33nHT
         yLb8dWFaIJ0FS5714MpqB7XdbwYVB9UDVza6yjOHWRzs0D4oUY6SXAiHOzPkz+TYFD
         cP26orVeN8UxA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D3948609DA;
        Mon,  8 Mar 2021 18:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Add sc7280 to rpmpd binding
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161522942186.22364.1500970619015198434.git-patchwork-notify@kernel.org>
Date:   Mon, 08 Mar 2021 18:50:21 +0000
References: <1614664092-9394-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1614664092-9394-1-git-send-email-rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Mar 2021 11:18:11 +0530 you wrote:
> Add compatible and constants for the power domains exposed by the RPMH
> in the Qualcomm Technologies Inc sc7280 platform.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 11 +++++++++++
>  2 files changed, 12 insertions(+)

Here is the summary with links:
  - [1/2] dt-bindings: power: rpmpd: Add sc7280 to rpmpd binding
    https://git.kernel.org/qcom/c/29c8bf8b73e8
  - [2/2] soc: qcom: rpmhpd: Add sc7280 powerdomains
    https://git.kernel.org/qcom/c/cab641cbea3e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


