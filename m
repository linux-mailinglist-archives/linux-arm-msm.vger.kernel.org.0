Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D882C2E17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403913AbgKXRKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:10:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:43424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403886AbgKXRKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:10:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606237804;
        bh=TzECCmX5JPQ0IZrnl9TnlzD3tzBsfov7SHgrxvreQME=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oJXlL7NumZnrDls/odab1RzQb7YCLeXB6pOCcOAyxgEBwvPUQww7LpOJIr+O5Ew7n
         wYyHIvoYUv9UEobrPv6/uLyCh7DcnauJgstXu2nKFECZPgo7E4mXta39dxAUE7GQpW
         cDYFajrMIVtahIRk6Jd1dDbRZI8gwCdCuOQB/ju8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: fix indentation error in sm8250 cpu nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160623780480.30668.9763505783656664939.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 17:10:04 +0000
References: <20201123144016.19596-1-jonathan@marek.ca>
In-Reply-To: <20201123144016.19596-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 09:40:16 -0500 you wrote:
> Use tabs instead of 6 spaces.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 34 ++++++++++++++--------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: fix indentation error in sm8250 cpu nodes
    https://git.kernel.org/qcom/c/e9fd12df325e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


