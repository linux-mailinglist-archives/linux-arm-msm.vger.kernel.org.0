Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3B432926D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243522AbhCAUpV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:54194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243521AbhCAUmH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:42:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7077364E4E;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=tWQ5VXxydqwi0ReJWOvXQNyXJAqIlAJUfz62otwahgE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RhZdTx1BuUoZIjsZUDCy64GHE3WM+IW/xnUeHoTzgZxLRgNHOu2915KE99SKHXbWZ
         BzyMYeYnYPiO9Ox5yKCPOeYwSMjH1TsioloX04GtOKH+gcLpH6RkSrZqJ1MV//Gzkb
         Yh6NCc4RNtywUCi0yFeUI1cDQUZ3dWa9bUwDkdrCxZOJtss2HXH6z/aETtg4Ygpr0Z
         sB9ZmBPs0qmgdBvz4etUhQ7xSIuHtBUlTQpDtXdaTAitOMz+EAh2B8sKggDDW0iaj3
         ltfWmK93biAfq0VJIsQILlsbyRDKg6VMVHnJJYSAK/SdThaUkKgWKbYMtwQu1hJTe6
         fSC5HV6936nFA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6CDE660C27;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Add support for USB3 PHY on SDX55
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878244.6187.308922422048948841.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210111113010.32056-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210111113010.32056-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 11 Jan 2021 17:00:08 +0530 you wrote:
> Hello,
> 
> This series adds USB3 PHY support for SDX55 platform. The USB3 PHY is of
> type QMP and revision 4.0.0. In this revision, "com_aux" clock is not
> utilized.
> 
> This series has been tested on SDX55-MTP along with the relevant DT node.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: phy: qcom,qmp: Add SDX55 USB PHY binding
    https://git.kernel.org/qcom/c/aa4731c8b5f4
  - [v2,2/2] phy: qcom-qmp: Add support for SDX55 QMP PHY
    https://git.kernel.org/qcom/c/86ef5a79d6bb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


