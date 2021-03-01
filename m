Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312043292F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237266AbhCAU4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:56632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242674AbhCAUve (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:51:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1CA2364F24;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=ZdSns4e5qedTKAIeokTi1URg1dds0KYNkwPQsmXFT1I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ONGQVv23+Io0ieGUZSRIuFgpQjTC/kdYMi1vaR53VT/K1UrtFdaBpsz+DrCupUdlA
         l/TlZf6PXBoOk6Kq6pZDGfU+VBTFBHtfmXwg1qjWCNetxn9SyzKzD54fH1shciOawN
         VrBlp098vcZSRdEDp/qRac0tehavcLVk2E4evL3iQpcxi3zfOa4kCd9l6sWX3d05dz
         ymvUQtS49OS3/vuW1oDIk6Px9cJrOuJ6eD2tjM7xUt2PVovDD9tItcUAK4VJQf9Oir
         gjZ5Bqv0d81f9Wcjy5gkQZxbpvwxdT14HiJHOfVvuGo6cQFVEsiNPx97owpNQU0BMu
         B4qlrkhljKtBg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 194DA60997;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] phy: qualcomm: usb28nm: Add MDM9607 init sequence
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878510.6187.9035896860130312290.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210131013124.54484-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210131013124.54484-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 31 Jan 2021 02:31:24 +0100 you wrote:
> This is required to bring up the PHY on MDM9607-based boards.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-hs-28nm.yaml   |  1 +
>  drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c         | 13 +++++++++++++
>  2 files changed, 14 insertions(+)

Here is the summary with links:
  - phy: qualcomm: usb28nm: Add MDM9607 init sequence
    https://git.kernel.org/qcom/c/557a28811c7e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


