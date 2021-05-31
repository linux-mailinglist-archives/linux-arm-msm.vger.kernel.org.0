Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A804139696F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhEaVvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231695AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5195161376;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=1WDdo18vFIEwdotXvJ+le3pkVYQpBRUQwurH29L/fFs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Gfu9Jo2obIKv15lW/Bj2So5WYXbuU7CMefGJDSRoCxCy7r2EDCurALBpWLtzre+rQ
         gK58T9zVglEWOb2OaCDByhxzKA+HHYagSu5a5kxqVabPjL0DXFAjJdHwrlD7Vl0Fm9
         mvj4aEtAFLbRyS/GE6gCYfq8iQodxQss85nfl8D8LBRo3i94r5H/r5ZUOpqDi1MVmP
         6cCvXGnF1Dj3fx79ljy4kqIJYxTW7MdE8Xw3jubUtv0QxzA8uZHSooqzgF2SW76OKO
         cE0XIzek2KimDY9zlC7W9i1oBzTXXKJ1vjOBns4qoIqLN2EAQBnltXz17EkqNPGKUP
         CA9jLU3Mr50WQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4C22B609CD;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8916-alcatel-idol347: enable
 touchscreen
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780630.3521.15374757542967582609.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210528114345.543761-1-vincent.knecht@mailoo.org>
In-Reply-To: <20210528114345.543761-1-vincent.knecht@mailoo.org>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 28 May 2021 13:43:45 +0200 you wrote:
> Enable the MStar msg2638 touchscreen.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  .../boot/dts/qcom/msm8916-alcatel-idol347.dts | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)

Here is the summary with links:
  - [v1] arm64: dts: qcom: msm8916-alcatel-idol347: enable touchscreen
    https://git.kernel.org/qcom/c/15c5a08c8427

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


