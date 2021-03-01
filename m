Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A81732925A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238818AbhCAUnn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:43:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:53212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238439AbhCAUk3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:40:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F308764E09;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=RetPeqLiJZ+rP6oprAccX8FxFbxLY0hAQGSddnkI29M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=k6EhKDTU+jG3la0RSYasK8oAq5fOJJ3GWxial5NfQhMUiuZLNwsSTYfm8lozBzehE
         A+8SH6J92c6XLaf+2lAEihoLxbjTTlvqai69rMqGkvbt8bst4jSYaATd/NWfiXaJlC
         P6pc2J8nQDZW9FO1XSfMeOKRCZ+XBgmY9UMXLyRePv1sn+oV6qT13pLLtYzP3cFfyR
         GpVhccVFSr3TPSADgBxDJGK8BRDln5piWXpnRAdWyrzy/pLIeFEihSLB6B70nt9wzp
         lBB/qSbBJ+U5itvc7P8IgxtxFyUqolpTRsmrnNldD5zt2tyLj29WkHV59Pzazd0xU8
         bzJh0qB5girfw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EF8CD60C25;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] PCI: qcom: use PHY_REFCLK_USE_PAD only for ipq8064
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878197.6187.15565230330376349742.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <20201019165555.8269-1-ansuelsmth@gmail.com>
In-Reply-To: <20201019165555.8269-1-ansuelsmth@gmail.com>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 19 Oct 2020 18:55:55 +0200 you wrote:
> The use of PHY_REFCLK_USE_PAD introduced a regression for apq8064
> devices. It was tested that while apq doesn't require the padding, ipq
> SoC must use it or the kernel hangs on boot.
> 
> Fixes: de3c4bf6489 ("PCI: qcom: Add support for tx term offset for rev 2.1.0")
> Reported-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> Cc: stable@vger.kernel.org # v4.19+
> 
> [...]

Here is the summary with links:
  - [RESEND] PCI: qcom: use PHY_REFCLK_USE_PAD only for ipq8064
    https://git.kernel.org/qcom/c/2cfef1971aea

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


