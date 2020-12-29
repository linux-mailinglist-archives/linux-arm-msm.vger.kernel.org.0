Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75B92E7373
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgL2URK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 90DCB224D3;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=O5jIpQC52ia8DOgX64zTGERlspksafOW+FYS+Tz3tos=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ccgPZmAqaRRMBAtmFfIT9WDhtMe3F8rBPBd393hsihKs0IDoMGufUMUwCYZKy3aJ3
         uhptx4/u6aT2MBDPiozd9JpbyP2rKTBRrMuPdzKEAf6vHYZ3eSKk/rJECUrXIMsnEm
         F/xRFCtg4rAPTV3bJC4a3Rebf9i6u0CJEKo3TFbAPli0J1cWe7DBI92u5Uvngwptcf
         AHo8PrR7l9RJytgtvPKOezZ2BQz89JKhXIJ0euyXgPSxKTa0mqNX7qKzYmVgip95xK
         fl5deeZHBXVXOeU4WhumwV8pL5kE39N0WsRQpwtacvceXOVdpwIcWlSrhtOEEJbORE
         EbyutraQSqWnA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8CD0B600D9;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3]  drm/msm/dp: add opp_table corner voting support base on
 dp_ink_clk rate
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293157.13751.5181703320332593730.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201020220454.23512-1-khsieh@codeaurora.org>
In-Reply-To: <20201020220454.23512-1-khsieh@codeaurora.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 20 Oct 2020 15:04:54 -0700 you wrote:
> Set link rate by using OPP set rate api so that CX level will be set
> accordingly based on the link rate.
> 
> Changes in v2:
> -- remove dev from dp_ctrl_put() parameters
> -- Add more information to commit message
> 
> [...]

Here is the summary with links:
  - [v3] drm/msm/dp: add opp_table corner voting support base on dp_ink_clk rate
    https://git.kernel.org/qcom/c/ab38764752e0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


