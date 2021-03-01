Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7BF13292F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242856AbhCAU4b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:56448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243808AbhCAUwr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:52:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 579C564F2F;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=Uaz8KgK9oD/ZX8qgifhX6/vxnRWrwPt/2O2Lbw00dTM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VR5TzLTcrOyD4KrNzKhds2uH3xNPWyT8YUbb0RwTerImglRGBDvf7l9cYoFF0R3+A
         E/PJxfhem2cwTGUVJBWg5M1ptuAd4CSPhbwJjQ6VvUPX222HPBlWHpzWPSox2uU7GZ
         eC3q7CZXF79fseXFZL6K9Z/5LuiBRPKa3iJRZ1yAkLY4OkmgMGRSOgLKIFGBxAZ3c2
         ZBFrdbDPR4hvcJtCtoayjz+k9f33sR8fXA5ltjpAJ1sFSs5d7y/dcDetnGmgWlEjlI
         xybpU5guEjaONF8zqE7xISOqbNIkh0DLtYdifrJGu7nmvjdoxMUXiuPWP6QHdexVSS
         O5cULWj3T32dg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5430D60997;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: qcom: spmi-mpp: Add PM8019 compatible
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878534.6187.1400163567202113630.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210115171115.123155-2-konrad.dybcio@somainline.org>
In-Reply-To: <20210115171115.123155-2-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 18:11:14 +0100 you wrote:
> PM8019 provides 6 MPPs. Add a compatible to support them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt | 1 +
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c                     | 1 +
>  2 files changed, 2 insertions(+)

Here is the summary with links:
  - pinctrl: qcom: spmi-mpp: Add PM8019 compatible
    https://git.kernel.org/qcom/c/564272718686

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


