Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CFC392019
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235764AbhEZTFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235313AbhEZTE7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C8D861456;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=m5NfLLR7OL3X8Q2VXBZrCArS1qRbceIUMj2GPJoLuTA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EEhzanK4gf8ga/ZN9lEET1blw/0l+z+KWGSCR/CwtPE1CYZL7WCgih55EtFwzQAXL
         97aZTKksheU8ZwUfV8Kpsahmd08yVgvAik0eBxfL3sfsHlor7x1Egieb1S9bT2axvx
         yq1deNkaqxkQprONVouynf+0zA/dV4DLNnt4QXPfTk3ve5BbU4uQJ7CYLYX+qgXcuv
         BYknk1HmS16DjLJa2nx0WvfPFhFVJ/F0mdfCA5YbAa0PBjM3IAolR45SiNGpE6kZkB
         NaL8DuPVjS2Y/iBX9psWk6u8elEvldhUBSr216a/z/n3PFTAOSb7pfF8S0ZqBr3c8i
         TpcKrqtCKm9lw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7846B60C29;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: qcom,pdc: Add compatible for sc7280
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580548.26840.804451960293582506.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <1615787946-26474-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1615787946-26474-1-git-send-email-rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 15 Mar 2021 11:29:06 +0530 you wrote:
> Add the compatible string for sc7280 SoC from Qualcomm
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> This was earlier posted as part of the entire DT series for sc7280 [1]
> Rest of the patches are now picked, posting this separately so it can
> be picked up via the IRQ tree.
> 
> [...]

Here is the summary with links:
  - dt-bindings: qcom,pdc: Add compatible for sc7280
    https://git.kernel.org/qcom/c/5deaa1d7c491

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


