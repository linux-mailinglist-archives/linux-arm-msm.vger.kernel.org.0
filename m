Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29490329242
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240753AbhCAUmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:42:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:52924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243684AbhCAUjA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:39:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AF86B64DE3;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=sQSt+x2kZpToPMSRGqRcubptEBiFcDLq2cYwfcjZjhI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DgObM8wdjpgaQh3ej3+sT2viRjpuWRfK7WApZkRudZQIT/UQ7LA+sJBGpR/CLw2BP
         KY6HAMzuvkvmjlz31Wns+5ni/dVD1d0DOMvB4Dr3F6BjnGEzsSze05m+z20Y2s/Oro
         WVDFFyNs50qnKe7A/Agz8QR6/02rhKwwjOH/wNyv36GC/kRNVySgUI6a5RDvB+/shg
         fhDUqFSOld2RPuboNQWInBPxm7JizXyx+1VXQf95jM+aIZK0otk7a/2/4z0Ws7mHe/
         4B+BWHaDxayK0vkzP/WMent+CEmpdbivAJhJ6dwIQ0YuEHrHPv111SsCht7ePYV+az
         NjR5ZQjrPIKig==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A134660C27;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/7] Qualcomm DRM DPU fixes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878165.6187.4964091629307291431.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 12 Jan 2021 20:26:25 +0100 you wrote:
> This patch series brings some fixes to the Qualcomm DPU driver, aim is
> to get it prepared for "legacy" SoCs (like MSM8998, SDM630/660) and to
> finally get command-mode displays working on this driver.
> 
> The series was tested against MSM8998 (the commit that introduces it to
> the hw-catalog is not included in this series, as it needs to be cleaned
> up a little more) and specifically on:
> - Sony Xperia XZ Premium (MSM8998), 4K dual-dsi LCD display, command-mode
> - F(x)Tec Pro1 (MSM8998), single-dsi OLED display, video-mode
> 
> [...]

Here is the summary with links:
  - [v2,1/7] drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
    https://git.kernel.org/qcom/c/e0485f1d0421
  - [v2,2/7] drm/msm/dpu: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
    https://git.kernel.org/qcom/c/b8dab65b5ac3
  - [v2,3/7] drm/msm/dpu: Add prog_fetch_lines_worst_case to INTF_BLK macro
    https://git.kernel.org/qcom/c/731806da2916
  - [v2,4/7] drm/msm/dpu: Allow specifying features and sblk in DSPP_BLK macro
    https://git.kernel.org/qcom/c/862314bc94dd
  - [v2,5/7] drm/msm/dpu: Disable autorefresh in command mode
    https://git.kernel.org/qcom/c/aa9223a60254
  - [v2,6/7] drm/msm/dpu: Correctly configure vsync tearcheck for command mode
    https://git.kernel.org/qcom/c/da9e7b7696d8
  - [v2,7/7] drm/msm/dpu: Remove unused call in wait_for_commit_done
    https://git.kernel.org/qcom/c/fe286893ed34

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


