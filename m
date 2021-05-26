Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826E8392059
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbhEZTFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235697AbhEZTFQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C4A0861585;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=Hu6Qa/Fh65avW4EJtzE9R35VcY4ollLD24AdUKaVECw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pWtnwcwU2briamkSjCA+uli0pIy9DS7l+JTM8oyOXTe01gSN7f90LQhg5zDQQqadB
         DflDqJFYk2cwL1sJLXW9BWXOTl8stboSlLU96WZBVKwCYkMnEXV5ekEj6mRjwONT5P
         Ky8hEFjUZBhsF3BfLDI8z6ggSulXOVH6QWwBq+e8lt+S9OCmTMhjCvP3VvOqYMKN2X
         aX5DDe2v+TSrhsrW14ctW0ETa89wMRZ4H+crQ8IFrKfXbtmwVfqBNRWXW6up6FW2gk
         u/DKmcdR6aHynn+TPDvuGl9lS0PRAHuDdYTXG0I0vokIDOrSqaCRptfnwWPCh31vmG
         lOsCnPBCe0VJA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BF87C60C29;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 RESEND] bus: mhi: core: Return EAGAIN if MHI ring is full
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580778.26840.5359895781444871871.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <1615408803-7016-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1615408803-7016-1-git-send-email-jhugo@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 10 Mar 2021 13:40:03 -0700 you wrote:
> From: Fan Wu <wufan@codeaurora.org>
> 
> Currently ENOMEM is returned when MHI ring is full. This error code is
> very misleading. Change to EAGAIN instead.
> 
> Signed-off-by: Fan Wu <wufan@codeaurora.org>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v3,RESEND] bus: mhi: core: Return EAGAIN if MHI ring is full
    https://git.kernel.org/qcom/c/68731852f6e5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


