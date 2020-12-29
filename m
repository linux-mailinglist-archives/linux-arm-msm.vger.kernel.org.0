Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D672E73A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgL2URz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbgL2URy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B55BD22C97;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=KnlCavXWN7u4O7W3Vot1NJQjNzcwjf/OazMlGvWP7zk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Cttgd2/VWB+9rzcNJLyF0BQNDs4wp23CZ9sXB6Y/8fUWEXasII4AvFyk3EJltm5Uv
         Y7Iiz4omnDp+ZMmCvplewmB6hMnW/i5baYVjNob8JoTs1/3b9jci3vpwsKFjy/pWku
         oXEGWPA3223x0Q4eKgJLpopsIfmb8J7tk5ijUi0x7BBR5kjuQqRuUrCYxdMNDvyrL6
         I6E/SeuhTMj/xoNHN7M7KxQGImU9OEq6pYbcDCqXcouVCKyNXp6UC7e5fG/GibZDaX
         XnMdSylD7g8yeMKEE327pY3qf+9bA6EQZ+ZGPTXQaJiPxh3/9iEgGV7i6Z1ZaVg2nf
         YpYhiTMbaJDvg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id AFC1960626;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] dmaengine: qcom: Add ADM driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293371.13751.3050918197305472524.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201114140233.GM32650@earth.li>
In-Reply-To: <20201114140233.GM32650@earth.li>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 14 Nov 2020 14:02:33 +0000 you wrote:
> Add the DMA engine driver for the QCOM Application Data Mover (ADM) DMA
> controller found in the MSM8x60 and IPQ/APQ8064 platforms.
> 
> The ADM supports both memory to memory transactions and memory
> to/from peripheral device transactions.  The controller also provides
> flow control capabilities for transactions to/from peripheral devices.
> 
> [...]

Here is the summary with links:
  - [v5] dmaengine: qcom: Add ADM driver
    https://git.kernel.org/qcom/c/5c9f8c2dbdbe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


