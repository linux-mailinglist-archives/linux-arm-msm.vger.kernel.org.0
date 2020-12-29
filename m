Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2112E73BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgL2USX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:60240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726547AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EA5A122D0B;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=j07RQn0hgWCQFvkUFQctQN9vn03dLvoRIA8WtjoCrlc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hHj0jotRRP00YS57LCTWmABahYGDlTW2dFXVZqbo4+cc/OoggEWgeVRlTPncxe/ix
         IdfGhfkaoYYd5LKVUpLT45aOC4VovaEbdm4y3ErUBrUT1m54lpadqozFsO+z6WXDf7
         t9QsjTNxXx8kFO49vk8wUdEmFivCPaBkWUtme5WzRLO/8bEw6FezpdXZcRcuwic1oX
         dgTK7vBmr9CqfPb06zTt4L8QsuOjYJfLjWXzftXucT3luuG4V+gF6nlGL2iCj7lZME
         o22UTxSDgn8Xg8nnmzKRIwVQ2uHvUSW36kY+VoX8KdI722xBPRpkt6QRgGibYwPKI1
         JSeDR7Y2fuXIw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E5584604D7;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] spmi: get rid of a warning when built with W=1
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293493.13751.10948023871253472668.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <b7c07d7476697145bbd685d11a57b40d222f2c50.1597235356.git.mchehab+huawei@kernel.org>
In-Reply-To: <b7c07d7476697145bbd685d11a57b40d222f2c50.1597235356.git.mchehab+huawei@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 12 Aug 2020 14:29:18 +0200 you wrote:
> The SPMI core complaing with this warning when built with W=1:
> 
> 	drivers/spmi/spmi.c: In function ‘spmi_controller_remove’:
> 	drivers/spmi/spmi.c:548:6: warning: variable ‘dummy’ set but not used [-Wunused-but-set-variable]
> 	  548 |  int dummy;
> 	      |      ^~~~~
> 
> [...]

Here is the summary with links:
  - spmi: get rid of a warning when built with W=1
    https://git.kernel.org/qcom/c/b1f0aeecd25a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


