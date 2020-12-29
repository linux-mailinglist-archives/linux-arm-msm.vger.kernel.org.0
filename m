Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92432E73A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgL2URz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:60046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbgL2URy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9CAB722C7C;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=po7kVUM28bpitjMoeqwuZsWoub5126qTf76W/8EvOvU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RTl4mrrb4pjcPCUh7STEv2fBF9G5KEOcHq9kcPMHHw1FfYVZwpzh4Z3VN2Zv8Hqru
         aIRG78fQX01/TdacnduJSpuFBbxY0nNn9O/2lIm5aqrFTbzJAr+kQd2K1Orh3dYKkC
         gZdHmrB0hjBVLR41xZh8cmNX93O1iHRY3ncflLHsGWkGw0TlMDkmdqDK72vYxTVcql
         0um1CkckdejTjtEzlHTHTq75S23//da4g6MSAH0adF3e+lgsoriAoKUsx0PPoHSCuV
         LG5M+EhfbGUQOquC096S7siJfS9OEB/Xak5nE4aqooITXfY2QFMVJLgP2xkaxEil4b
         EeYlnJa0sdirQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 9944460591;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [Resend v1] Bluetooth: hci_qca: Enhance retry logic in qca_setup
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293362.13751.15134803305865926064.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <1605071653-5088-1-git-send-email-bgodavar@codeaurora.org>
In-Reply-To: <1605071653-5088-1-git-send-email-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 11 Nov 2020 10:44:13 +0530 you wrote:
> Currently driver only retries to download FW if FW downloading
> is failed. Sometimes observed command timeout for version request
> command, if this happen on some platforms during boot time, then
> a reboot is needed to turn ON BT. Instead to avoid a reboot, now
> extended retry logic for version request command too.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> [...]

Here is the summary with links:
  - [Resend,v1] Bluetooth: hci_qca: Enhance retry logic in qca_setup
    https://git.kernel.org/qcom/c/9e80587aba4c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


