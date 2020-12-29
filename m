Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9DA2E7370
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgL2URH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1002B223DB;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=Yj3tfi5kY5MbCfvyAek26il0Zil/W75TfmtJid33zAg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tO+R/w2s95/VlzBBdQ8vPPJTmSZEUoZgGRCx0VfqMRDTPjFjnrzftv2w/fp6UY2bG
         Kxt5cBpHdSj0a4oK2+AaQCzFRLjmxvOw7kCLLo3SKnMujD182D0WAFS5KiP5QPI5Mi
         qrEGhe6U6l/hZ1Nc01En31s4hzDYtbPLeUBjr3mMVJdR5xWEpkU1OkDuNhvCxCmD5/
         KMsB/ob29SrKDX/x/gbfh+EPwwdsUW8CrQagYJLeQ6mhhYxgLak/FnGWFz46vhdApO
         cD4B9AxSd6JtMdInjbFNQEPlenjMAcICIXToe3FLhdNOOHwbOKy6v8qWSKuuzCk1/1
         LobsVj7U/56jg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 0C09760591;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293104.13751.2221339391299663222.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
In-Reply-To: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
To:     Asutosh Das (asd) <asutoshd@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 27 Oct 2020 12:10:36 -0700 you wrote:
> From: Can Guo <cang@codeaurora.org>
> 
> During clock gating, after clocks are disabled,
> put hba into LPM to save more power.
> 
> Acked-by: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2,1/2] scsi: ufs: Put hba into LPM during clk gating
    https://git.kernel.org/qcom/c/dd7143e27cb7
  - [v2,2/2] ufs: qcom: Enable aggressive power collapse for ufs hba
    https://git.kernel.org/qcom/c/61906fd465c0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


