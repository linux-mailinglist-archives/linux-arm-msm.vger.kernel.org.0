Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510BD39206A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234592AbhEZTFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235845AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6B8D561624;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=whbrzKzLMUJKLZ9bQGYrZ0/RTBUTRMnmin+Sfwnxi34=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dTjr6G/rIekqDfwHFnIyr+0WLvhMzjT7fMnG0r0YvD1lEA5jDBCh9OtouSwjab6G2
         vBDFpmboiPW8EkzC/dF/uQiKHUPNtAOViogtWe6CKCbg6skWt4O+UNh9Ad+ndRxaDz
         9vQxdpdj/F2ipVHCj+aQ0FzZ3UH0iGBHIXtZ5xy0Aax+ML6S+sxNOAL7zCSX0H0fXW
         TcWJ0js7Dzj465B8jXX/7JbV/R5mbUlywT48qq8+p9fqVMy0O5xpcidTg54Jgqbgt4
         g5zSpIXBJmBBmE3MPH9R+7mB7uV+dn+Ekb/XduRoVRbOGp/QVKe6ng+kt9qK0jHmOf
         MVL2ycc0KK5XQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 67900609B2;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: fix hw overload error log condition
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580842.26840.5695493108224299210.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <1617888900-857-1-git-send-email-mansur@codeaurora.org>
In-Reply-To: <1617888900-857-1-git-send-email-mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  8 Apr 2021 19:05:00 +0530 you wrote:
> In current video driver, frequency is calculated for all the
> running video instances and check aganist maximum supported frequency.
> If both calculated frequency and maximum supported frequency are same,
> even then HW overload error is printed.
> Fix this by printing error log only when frequency is greater than
> maximum supported frequency.
> 
> [...]

Here is the summary with links:
  - venus: fix hw overload error log condition
    https://git.kernel.org/qcom/c/bcf6b264a806

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


