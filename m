Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E286354B4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 05:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbhDFDkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 23:40:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:49664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233129AbhDFDkR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 23:40:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1E32D60FE6;
        Tue,  6 Apr 2021 03:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617680410;
        bh=RLDIdeXIyb7W9M0NdsK8Oc62auwQ1Rcj79NHczeLd6I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NNqISSHT5SMqikvrAJK5Lzds8fBZ4i/LfvdsIVUd1SX/0EO8iQ8lFM966VOA6m1QC
         PWHlu29aZXn/IgudsvBPmDUi9saWisK4gUThtL+44G01UrYdyBXC4ry0att1LE+v91
         p/mOxzv/kSOcCYKYgblVryAcwgjtDPMmZvaI1qnD7cpAg3QJ2og0GzygMzHffCSUEP
         xsHbl4zeNzTYQfu8ZvWsMjRmr+6GqUuNRZTN4illUhhRrJeVAs+8EaCGNxFlvWzNtU
         BMUqeE3+W6AauroCjazrkrMvZ9veVmn3Gw8dC0feDBmhV6fRuc6Joamru9oUXuLA3q
         wy0smINK2XBbg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0E0916096D;
        Tue,  6 Apr 2021 03:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and
 panel bits
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161768041005.22037.169549095763783033.git-patchwork-notify@kernel.org>
Date:   Tue, 06 Apr 2021 03:40:10 +0000
References: <20210404194437.537011-1-amit.pundir@linaro.org>
In-Reply-To: <20210404194437.537011-1-amit.pundir@linaro.org>
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  5 Apr 2021 01:14:37 +0530 you wrote:
> From: Sumit Semwal <sumit.semwal@linaro.org>
> 
> Enabling the Display panel for beryllium requires DSI
> labibb regulators and panel dts nodes to be added.
> It is also required to keep some of the regulators as
> always-on.
> 
> [...]

Here is the summary with links:
  - [v4] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and panel bits
    https://git.kernel.org/qcom/c/0e5a6f27036e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


