Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C282C1C85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgKXEKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728669AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=xc/ML4cwXSRzy+NNCYyDz1M++TJMFpEtYpC9rllgaoM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=amDABt3wcx4xzi2geR37IPZYnyDRnWCdPbQD8mT/KQxWZxKbPwF1r+t8aAVI5670y
         ZVWIudsICB8bfbCF+YTRHNb+79Gy9VpMt10br4NGXzsAu6s2VxCpHvP+udWhf8ljvM
         aZH2mdNHkvd7l51aLuwdF2zILqlyeBW3CJIN5HzQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: add soc ids for msm8953 variants
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100851.17117.10329119642093175351.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201004082223.324019-1-junak.pub@gmail.com>
In-Reply-To: <20201004082223.324019-1-junak.pub@gmail.com>
To:     Vladimir Lypak <junak.pub@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun,  4 Oct 2020 11:22:24 +0300 you wrote:
> Add SoC IDs for MSM8953, APQ8053, SDM(SDA)450, SDM(SDA)632.
> 
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Here is the summary with links:
  - soc: qcom: socinfo: add soc ids for msm8953 variants
    https://git.kernel.org/qcom/c/903b08340b88

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


