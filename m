Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04923292F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243467AbhCAU4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:55416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238856AbhCAUvg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:51:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 345A864F29;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=D18oixAq44+k8Ksf0V24KPVYixoS6FBrVUHpK21jeOo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=I+jZKloMv1gXHm7x5gjvZNFKfqZHiWY0OZ5YOchJk1t1ax1PLbd4ZqhnYX/Zz7QfN
         GWFRGqYJsSR9U+ICuw8MjycBjxttcozIQJ8NFiPzVyEx2L8n5Ycy14L47DZX8E6uRo
         G5Ff10ALytNb+1tRorPDVoWwUdjydw9nk20jcT/5ySoJ5MTMunVhIFXNp+XvePqb3b
         oAEC9pnAb7UhqxOL/dzdOYh3CzWpq5TGAMHKjBbdnnaOKchz4Jsb0hxDpA+KcRfWol
         sUeZtS8r2xzXLVJK6iBjebCOReXIArPs5gF1SxEC1qu4rDRuknsfFyFRcHvBBEBLed
         kS6khSzS8C+bQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 30FC860C27;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dsi: Correct io_start for MSM8994 (20nm PHY)
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878519.6187.15493258107815840209.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210118161600.104877-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210118161600.104877-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 18 Jan 2021 17:15:58 +0100 you wrote:
> The previous registers were *almost* correct, but instead of
> PHYs, they were pointing at DSI PLLs, resulting in the PHY id
> autodetection failing miserably.
> 
> Fixes: dcefc117cc19 ("drm/msm/dsi: Add support for msm8x94")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/dsi: Correct io_start for MSM8994 (20nm PHY)
    https://git.kernel.org/qcom/c/33a7808ce1ae

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


