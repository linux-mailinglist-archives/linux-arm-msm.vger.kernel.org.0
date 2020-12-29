Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89BEE2E7365
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgL2URI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:60050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726284AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 70607224B2;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=Rs3ASFDQBJ5Ad43xFPsfz7rbmEhKv0xhqrQepORM/Gg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LF0BeB3Jot8PNQFefNh8O9XvQjbqAcxuHiV3EkZh/+juiSO1cAWnMatSQbteEpjX2
         iMBevwUTkNsE+i9NNgekgpvGhhBt2+9Yea6kLda5JEh5Uls32o97LXEGRYPRiHrA8F
         UVxD0Efm3T9MQ8jO+feFZ7yqXzuwkGkZ5+rtHX0ASIF5aoz8E+QSSrXmHq1rI+mUgy
         NhrdmsxD8HmlJGUtsacXTLRQlyO+mt3j1mhK/FfI9hgqxNYHrQ4N8X15wI5ocrAXpK
         Cep2FR5ckilrw66efrpgIFgSCOyqfF35yu0TJLpsu4naRw7LgKBNcbF6/novXwmXMX
         54nCWastEadCw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 6C62B600D9;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/7] Add support for SDM630/660 Camera Subsystem
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293143.13751.15530047327349508037.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201022174706.8813-1-kholk11@gmail.com>
In-Reply-To: <20201022174706.8813-1-kholk11@gmail.com>
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 22 Oct 2020 19:46:59 +0200 you wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> This patch series implements support for the entire camera subsystem
> found in SDM630/636/660 and SDA variants, including CSIPHY 3-Phase,
> CSID v5.0, ISPIF 3.0 (though it didn't need any adaptation) and
> VFE 4.8.
> 
> [...]

Here is the summary with links:
  - [v2,1/7] media: camss: ispif: Correctly reset based on the VFE ID
    https://git.kernel.org/qcom/c/864ed874d74a
  - [v2,2/7] media: camss: vfe-4-7: Rename get_ub_size, set_qos, set_ds, wm_enable
    https://git.kernel.org/qcom/c/1786653aa2e3
  - [v2,3/7] media: camss: vfe: Add support for VFE 4.8
    https://git.kernel.org/qcom/c/40296e712cad
  - [v2,4/7] media: camss: Add support for SDM630/636/660 camera subsystem
    https://git.kernel.org/qcom/c/9e5d158189c6
  - [v2,5/7] media: camss: csiphy-3ph: Add support for SDM630/660
    https://git.kernel.org/qcom/c/e486781b74cc
  - [v2,6/7] media: dt-bindings: media: qcom,camss: Add bindings for SDM660 camss
    https://git.kernel.org/qcom/c/3cba9d22c358
  - [v2,7/7] media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660
    https://git.kernel.org/qcom/c/4863b93cfd2d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


