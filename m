Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5CC3292D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236461AbhCAUwc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:55772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243628AbhCAUuY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BEB3F64F18;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=+hwy3TN5TCRI0H/swwWDLb8bwP/EnjaZ25u1ghnkMJI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=N6blyUnTakSf+UsgzwSMzlY/ihu/TzdJiDH+jhk8rhu3RQvGa61qjcmL3Lsrrtg6C
         DbDcWiRTPPSUbt9usnLbLI5IMO0tL7C+RfKwyoUKN0KYPuQz7ouhU+MPqmQ3GsUz56
         peuo6/tuwsQvfUIYlKY/kTmnBAVjrj3ezv9FtfYSA9NxysHqYVzETtzcoQUEA0a5g/
         SfZXKGkxWIiXEMeErBJEuXvqtObCwe9gamXM3IxgxUcaP/xD4BcTgWPoXXzINh38GI
         FywMMeI4ucFZW8BrRUY+r2X9TLXh33wsmi9Di0Ydj9oFKPQCFpk1wmbsTftX6fYU8/
         e1a3kQm89Gucw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BAADA60C26;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/3] Add new controls for QP and layer bitrate
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878476.6187.10056945973809242312.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
In-Reply-To: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 24 Dec 2020 16:55:32 +0530 you wrote:
> This series adds frame specific min/max qp controls for hevc and layer
> wise bitrate control for h264.
> 
> Chnages since v2:
>  - Rebased the changes on latest media tree
>  - Added driver side implementation for new controls.
> 
> [...]

Here is the summary with links:
  - [v4,1/3] media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
    https://git.kernel.org/qcom/c/99d0cbe4be78
  - [v4,2/3] media: v4l2-ctrl: Add layer wise bitrate controls for h264
    https://git.kernel.org/qcom/c/4ca134ee9823
  - [v4,3/3] venus: venc: Add support for frame-specific min/max qp controls
    https://git.kernel.org/qcom/c/74c895974fd3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


