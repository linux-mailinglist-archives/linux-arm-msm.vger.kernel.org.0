Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AE22FE11C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 05:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbhAUEvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 23:51:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:44338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbhAUEuw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 23:50:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D531238E2;
        Thu, 21 Jan 2021 04:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611204609;
        bh=u6s4J38h1Cy1hLkhE2SBl0rA2xyUdzqNvc+EHQN1ws8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SQKg4ucDMguK6Ulq/R+8Gef6Ht5kVxOAaDSg/hwYm6Lyic02aV0PtyDgkhXDaPj11
         40a6F7yRwVKapxoj+8NgvAbvbeSwIBhAgChqicOj36dGHdsyLXMyJnja1hvnIoS3y3
         kdCHXLjulC0LoLjo3Ran8+U5lHOZwXR/zeZoDWCcsDZFr97WTDfaTUDoMftc0btA8z
         78BgkJIE+EygrLU9RUFDmvhfNTAPLI9VqaarxrkUaO0LouDdmkg8ysMw2brmx3Pu2j
         T3u6gcbysZDXZc4Ramfqtuk3lylTTjXKcD4QzOhRbXQEDcfOLWlp7Jiae2ET7MhrSa
         FazeJNm3gwmnA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 0F554600E0;
        Thu, 21 Jan 2021 04:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in
 qcom_show_pmic_model()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161120460905.18989.17071078965781508389.git-patchwork-notify@kernel.org>
Date:   Thu, 21 Jan 2021 04:50:09 +0000
References: <YAf+o85Z9lgkq3Nw@mwanda>
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 20 Jan 2021 12:57:55 +0300 you wrote:
> These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
> 
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 +-
>  1 file changed, 1 insertions(+), 1 deletions(-)

Here is the summary with links:
  - soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
    https://git.kernel.org/qcom/c/5fb33d8960dc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


