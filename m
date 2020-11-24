Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941AE2C345F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 00:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732189AbgKXXKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 18:10:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:33522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732194AbgKXXKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 18:10:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606259405;
        bh=dAp/l9H8C62qwe3VSfXdj4Rg7VMewH2nSD5IUX2NobU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=j220P1rVhG7Okh23lRsLbjXqrt+2LohsMjXS1XFIlPa5Yqpgx1VR2P0ZcY+72dLMT
         Ibcx2Y34NfJvAOX5LrxowMyfRJEgn03W+UvBiKnAYpv2fUdqDXQqxsrfxQBFaUVScM
         yVE8URPdJUKQe6xRHFmxVOSNEz7LOn0p8gB+YTeU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: pm6150x: add ADC_TM definitions
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160625940551.12963.12585735924272364802.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 23:10:05 +0000
References: <1602160825-10414-2-git-send-email-jprakash@codeaurora.org>
In-Reply-To: <1602160825-10414-2-git-send-email-jprakash@codeaurora.org>
To:     Jishnu Prakash <jprakash@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  8 Oct 2020 18:10:25 +0530 you wrote:
> Add ADC_TM peripheral definitions for PM6150 and PM6150L. Add
> ADC peripheral definition for PM6150l, which is needed for ADC_TM.
> 
> Signed-off-by: Jishnu Prakash <jprakash@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/pm6150.dtsi  | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/pm6150l.dtsi | 24 ++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: pm6150x: add ADC_TM definitions
    https://git.kernel.org/qcom/c/7ee3eae86833

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


