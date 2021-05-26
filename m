Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E98F392042
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbhEZTFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233954AbhEZTFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E7B4361469;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=xmQ0hB2n17XG9bq/9SMK9IMZd6FsHjnazQ8psNL3zhI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=eE1pKEBfdXPT+IvSylBkPyqY5+1D3CiCwzFt4Vyp3nrCuvJV3qHUafg+mnB+1Zx3o
         +DzBSWA+40JcQzVFjUiey6OmIj7CIdjdVujhcuYtdakBl7024QKGW+0DVYgLwL0+Bu
         8dJQkM99nh5elxrnq07DqO6hWUDyB8ayXoWRVqa1yJCWCw5A1+TFPfWkJDf6CGokrj
         P+yUXxdDYM62v15U7lR1PlWYdTkqe3Qfucam1iiFA29MNJrUnPcO2CEPEbUjR6adg6
         uUtOo0FR4kMOVOHWPpIGvLLJAUEt+2VT8z5qiWts9ljPDwSGWuVBpZb3EBSSzjn/pZ
         hzdP+GbqpfHmw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E3DA1609B2;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] bus: mhi: core: Add missing checks for MMIO register
 entries
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580692.26840.8943077078269410978.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <1615315490-36017-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1615315490-36017-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  9 Mar 2021 10:44:50 -0800 you wrote:
> As per documentation, fields marked as (required) in an MHI
> controller structure need to be populated by the controller driver
> before calling mhi_register_controller(). Ensure all required
> pointers and non-zero fields are present in the controller before
> proceeding with the registration.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v3] bus: mhi: core: Add missing checks for MMIO register entries
    https://git.kernel.org/qcom/c/8de5ad994143

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


