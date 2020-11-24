Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B27C2C3463
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 00:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732184AbgKXXKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 18:10:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:33514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732188AbgKXXKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 18:10:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606259405;
        bh=Orav4SCgYzPPvKeE8g8wILy4GlUe8dzhHYnhHacRdW4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OHozKn7/AZL6Hr4NWZWpUU4hvAeDfAyWA9BKV+3vtpMhgdz14S7Fl9rnxsvfa3KEh
         ysn5Nuj7t+efzhPX09517OEQfhxfrGeDHJy6zEsebSkNGY4BUFiV6gS0odBvaG0WNb
         p3k+jpISaGwMNfOdaevWb7Nl4cy9gDplxIgH5XKg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: add "pen-insert" label for
 trogdor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160625940542.12963.15869237962826843962.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 23:10:05 +0000
References: <20201116083014.547-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20201116083014.547-1-terry_hsiao@compal.corp-partner.google.com>
To:     Terry Hsiao <a804335@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 16 Nov 2020 16:30:14 +0800 you wrote:
> Add a label to the "pen-insert" node in sc7180-trogdor.dtsi
> 
> Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - arm64: dts: qcom: sc7180-trogdor: add "pen-insert" label for trogdor
    https://git.kernel.org/qcom/c/d4b85bc550f4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


