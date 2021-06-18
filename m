Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E3B3AD15B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233921AbhFRRmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:42:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231685AbhFRRmN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:42:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C415A613BA;
        Fri, 18 Jun 2021 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624038003;
        bh=nz3q7pYEY6nKhSxPapEUlrmYQ2HEOAzx2Eqz8iA+p2c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GrpCngxArrLsgwPkXz7FXcHkgRvE/LVTOQANSSILibxN109UdcWp20BwMtOzvt3nS
         bZecrD23vhLFGguJTFsaxmwZ95S10TOphy7oPSKG13ScvfQdZg52yfMQKmcmVpB2Zh
         ebPhdiSbKxHd58lX7rKps77mLVpXtXt1/0r7Xx1SQNlK0yr6bjbYp/p24tpVFrjsvD
         HmpGr+vUgJ/5wjJTaz92lFZ6tcc9cp3oWWbJTte1WTFQ0hnhQdcl4DNw4j48Q02OCh
         7w2tTbpm9Pth8lQC50wgixM/C+sXLMa32mmwJy2T9XLB4g3CDHaXsKB9jVmraLkktG
         Fj+0HuUZ3HDFw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B8AE2608B8;
        Fri, 18 Jun 2021 17:40:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-edo: Fix up double "pinctrl-1"
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162403800375.25613.7573987093031861523.git-patchwork-notify@kernel.org>
Date:   Fri, 18 Jun 2021 17:40:03 +0000
References: <20210616161536.206044-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210616161536.206044-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 16 Jun 2021 18:15:36 +0200 you wrote:
> When bringing the SDC pins back to edo.dtsi I managed to define
> and overwrite pinctrl-1 instead of defining pinctrl-0 and 1. Fix it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - arm64: dts: qcom: sm8250-edo: Fix up double "pinctrl-1"
    https://git.kernel.org/qcom/c/f515dcce2d18

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


