Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84232E73AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgL2USF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:60242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgL2USE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2AF9D22CB8;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=UcLR1aB91aCBPl7OHh60KW6LgEW5cGur7rnlRRR86EQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jf5dgXhQiEA4eEnlNu6AWVTzCoR7WRqhTh/XBuCfjUxJrn5MoHtjwgJBP4k8BzLhd
         VA31vgr8p66wHxqxrllMT+5rxCbGhCpG1XFunQ8ESoaPW5d6Zk7Q/nBXTYRn36q7fd
         ie3uesWS+Y5FDECcL+sbN0y9EiyhyPhGAQ9O1z7FqBqkSV8YD3qruQDR1aSqg9OOHP
         NC6ezV0KKGl2h/vrdzBdFh6KgXeqxeaFNjtBh79AcyBgdgKes9AojREnmzhfUawRVG
         Uck7VXilD5E+jqKYZO0V8I/M0ov3l4U2wG3VBI6kQ7aaCvhnK71O2js4m12+ugzygM
         baA63Gg83PXCA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 278C160626;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH v3 0/4] clk: qcom : add sm8250 LPASS GFM drivers
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293415.13751.778928488874084402.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 26 Oct 2020 12:02:17 +0000 you wrote:
> This is resend of v3, due to dt_bindings check failure as
> rc1 was not out when previous v3 was sent!
> 
> This patchset adds support for GFM Muxes found in LPASS
> (Low Power Audio SubSystem) IP in Audio Clock Controller
> and Always ON clock controller.
> 
> [...]

Here is the summary with links:
  - [RESEND,v3,1/4] dt-bindings: clock: Add support for LPASS Audio Clock Controller
    https://git.kernel.org/qcom/c/a6dee2fe778b
  - [RESEND,v3,2/4] dt-bindings: clock: Add support for LPASS Always ON Controller
    https://git.kernel.org/qcom/c/7dbe5a7a3f99
  - [RESEND,v3,3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
    https://git.kernel.org/qcom/c/a2d8f507803e
  - [RESEND,v3,4/4] clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks
    https://git.kernel.org/qcom/c/794aa56a7805

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


