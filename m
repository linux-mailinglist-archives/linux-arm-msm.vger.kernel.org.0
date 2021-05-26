Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7644939202B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233697AbhEZTF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235364AbhEZTFJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 26E566145F;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=2ISUHnpzaEuULwycuTfF5MimMP3XU/cVS73vKfrR/A4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KacelViizE8E4KzgfQyAMq6Oe12VZngsRw6yOms4qTQHVFiFX7AaLolTbfnPHobhp
         FD7aV1VHeQvfghQcpfvS2GHASbCmXBXHwqJueJJWxvXXkombI9q0GPX4agtiRl30h0
         eVbo2P8WEhvgSGhVQmrn6udUvBge2DUDOpGwPYYYe444YzFXvuhAz3QrTiP2s3to9C
         VlYdQzb5QNUDSDpLhaG7IX6n3xwU4sTuJjxn1sRze9DcPQaqx5Yu65fE6gJFWD0sGI
         Q6VyQgZc7N3I7N1YdLH4br8SwtfcK5FyG1h7wPA5R/ogK52H50DRBqR+okOGeuhwnE
         LjWQooVqIIa2A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2284D609B2;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] usb: dwc3: qcom: skip interconnect init for ACPI probe
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580613.26840.15786275660174169955.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210311060318.25418-1-shawn.guo@linaro.org>
In-Reply-To: <20210311060318.25418-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 14:03:18 +0800 you wrote:
> The ACPI probe starts failing since commit bea46b981515 ("usb: dwc3:
> qcom: Add interconnect support in dwc3 driver"), because there is no
> interconnect support for ACPI, and of_icc_get() call in
> dwc3_qcom_interconnect_init() will just return -EINVAL.
> 
> Fix the problem by skipping interconnect init for ACPI probe, and then
> the NULL icc_path_ddr will simply just scheild all ICC calls.
> 
> [...]

Here is the summary with links:
  - usb: dwc3: qcom: skip interconnect init for ACPI probe
    https://git.kernel.org/qcom/c/5e4010e36a58

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


