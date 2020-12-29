Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061C22E73BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgL2USW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:60234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B7A5422D05;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=f7+WjyJfa/yhQNDOrDOx4KEKkOk6IG691JH9GXlZSRs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=X0cGEvG6ltZ2Vz9d2iYM0HSH9dL3vJfGOlmwuCP+AYEbfvQq6HyrfmKFQgSW4WN1/
         YxtwFlh9/y7HM6R8tmUuxeCeiXJmeprSsz5E2jnbQ8h7Wx0UXrjmr0fO0YY30OR13U
         SAz6a8VGjIvIJRDVLc1ZtPuVLY6eFlVEqgvdItHQfieKVX4nhOSZ4MwtZrD3vngcMW
         gExtnstoGVfdvR/6UnvxLAhPvpBJphYRL7+DyE3OtGyzefrSF0F2q5jLD8sX98FyeU
         BX+OJpcTlR9eu0/CgaWx+mljEPoneA0/BnBDxbElsB7MAZkIFFsz5dmSUFzGXVOFjh
         jEPpKJcQhpDvA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id B417E60626;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] interconnect: qcom: msm8916: Remove rpm-ids from non-RPM
 nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293473.13751.12370600723190761291.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201112105140.10092-1-georgi.djakov@linaro.org>
In-Reply-To: <20201112105140.10092-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 12 Nov 2020 12:51:40 +0200 you wrote:
> Some nodes are incorrectly marked as RPM-controlled (they have RPM
> master and slave ids assigned), but are actually controlled by the
> application CPU instead. The RPM complains when we send requests for
> resources that it can't control. Let's fix this by replacing the IDs,
> with the default "-1" in which case no requests are sent.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> [...]

Here is the summary with links:
  - interconnect: qcom: msm8916: Remove rpm-ids from non-RPM nodes
    https://git.kernel.org/qcom/c/c497f9322af9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


