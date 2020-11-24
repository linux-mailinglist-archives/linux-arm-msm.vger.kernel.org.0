Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56222C1C8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgKXEKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728702AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=8eUH2W4ozpA9Tl13+/PgcwzHOUb8ddn2ELye6EiAwj8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iuMtrp6fVXS9C31rAchw8TbLxf88XKtBhI2Iy2IHoTrlAOBAtNVntby+o0LqDKn20
         /XGFluC6RChPDSDEldYlq1GNU5wZAphBDhdXjnWF8mYZ5J+MR4D4skGiQA1BuxLMTP
         Esl01wHkouPDuTXigC7YbAwe7HcvX+SOuUpHpzSs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add support for PRNG EE
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100880.17117.6665511422420194365.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20200921065806.10928-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20200921065806.10928-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 21 Sep 2020 12:28:06 +0530 you wrote:
> RNG (Random Number Generator) in SM8250 features PRNG EE (Execution
> Environment), hence add devicetree support for it.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: sm8250: Add support for PRNG EE
    https://git.kernel.org/qcom/c/65389ce63624

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


