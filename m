Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830213A2E98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhFJOwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:52:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231320AbhFJOwC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:52:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 92489613FF;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623336605;
        bh=UvUbr1v62l4OE73CXvu0mGJrJUm7mIDZPd8GFGq0QLU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FeJcOEreyn5+vKvym6rxDGkDlmA6y3J6/GP9+XCTza0giz4RZkq76rYASVKwk3L7x
         F7GJFNhW88huB+oHZebvkFEoqkh4/OcC3dbGyb8x+LDIm8T0EroY78gl0bRCRjI88C
         CBVC7zLj/GEwgjnH6LWHIZX/1RXPawhD2TvNSuP4mS5ScNQmgrbqd0TbgSP2JPQqyo
         GgokLj4ozmu3I1drZeTXxJhomePZfPPilQqyH4iFE8rvRs6k4OA56ibH5phCWOMg16
         GL0Xwh4n4fWQWseJeZWvKOl8Jn6a9vL7f52NvotAGWone3NOKx/7fLB7X6eS/6Th+R
         hWm5a1kWIA4LQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 898CF60952;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: pm6150: Add thermal zone for PMIC on-die
 temperature
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162333660555.29297.11042072370104295402.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 14:50:05 +0000
References: <20210603081215.v2.1.Id4510e9e4baaa3f6c9fdd5cdf4d8606e63c262e3@changeid>
In-Reply-To: <20210603081215.v2.1.Id4510e9e4baaa3f6c9fdd5cdf4d8606e63c262e3@changeid>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  3 Jun 2021 08:12:34 -0700 you wrote:
> Add a thermal zone for the pm6150 on-die temperature. The system should
> try to shut down orderly when the temperature reaches the critical trip
> point at 115°C, otherwise the PMIC will perform a HW power off at 145°C.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: pm6150: Add thermal zone for PMIC on-die temperature
    https://git.kernel.org/qcom/c/eb59cd3e3983

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


