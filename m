Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58FC3292DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236308AbhCAUyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:54:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:55878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243678AbhCAUup (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id CFE3A64F1A;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=7NyI0+kxtFV/WCm92JWDE3hmMpdgqJR5lS+l1XoVevs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IqJx67TBUdA8ueBvQpePSnNblpbb5MtNL+T7SsmSeWgO3UEOqOf7OdDpACI+5QELJ
         UqJG1/pAd7Jqmn6RwTbdSn6VqNMfvzl0RHLPU33oGdXk3iIXZijLX4q0gDqdc6aCZR
         IbdfmzK/0LWwT9KH1oeXjld5PYXTp1hlQQKdm50wem2C3OIA6jArXPMuoWGX6hkhpR
         YblxzIk/DAF7XtEvgSJlInjQu4cVj3f4O7k2KxP6yo8WkUC/oxfWyB691loM4o4qc2
         B2VkNTvnfUWKQucInoN03QmkflK0srse+VsfFI+OBE1YvvigVjYDkeEc2btKRYTEfc
         DHF6l5VYswxYQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CC91C60C27;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: core: Fix platform driver shutdown
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878483.6187.12423418754061505842.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 21 Dec 2020 11:58:20 +0200 you wrote:
> With TZ system reboot cannot finish successfully. To fix that
> enable core clocks by runtime pm before TZ calls and disable
> clocks after that.
> 
> Fixes: 7399139be6b2 ("media: venus: core: add shutdown callback for venus")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> [...]

Here is the summary with links:
  - venus: core: Fix platform driver shutdown
    https://git.kernel.org/qcom/c/9eb09dc2f465

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


