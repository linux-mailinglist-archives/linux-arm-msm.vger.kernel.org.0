Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0242D43004A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 06:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240685AbhJPEmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 00:42:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:42774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240738AbhJPEmQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 00:42:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3DA4D61252;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634359209;
        bh=iQHm33tclBYM/6bIoZAF5z51pyS6DEz50Em87YS0f1M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=atJP5bftH4NLyY47+qRvSfIUjs6ARRhv+cmoY94JkLC9S+KD+KIDEVyOR/geiEjBN
         MAE16m2op9pg4UYhu/it2N9Kt+iCqtAy/to6CL2gH/e0m7lEP/AdUyYnjK5REyBUpy
         +H1dAq2okv/9Ull2p/kKbavfCOpHW/MtGG7/uj4Eu53v1q6WDQD2SKo5JG5Nt6RpND
         UXuCmfv3FL1kC0nwY66KOUO0L+Dt0tC4noYXBsIw/OArLcupOuoSfg1zI2ybNnpaan
         Z2K2cSeINe+8i0oS6I59mMQWJfJrTUPEW47MxYUkuO0DPlVRJDeMmVsFChxLK4rsF1
         cS10hJHem/Lyw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 27F6460BBF;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable QTI SC7280 pinctrl,
 gcc and interconnect
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163435920915.10607.12060340773532453678.git-patchwork-notify@kernel.org>
Date:   Sat, 16 Oct 2021 04:40:09 +0000
References: <20211007052812.3717-1-quic_saipraka@quicinc.com>
In-Reply-To: <20211007052812.3717-1-quic_saipraka@quicinc.com>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu, 7 Oct 2021 10:58:12 +0530 you wrote:
> Enable the QTI SC7280 pinctrl, gcc and interconnect drivers required
> for kernel to boot to console.
> 
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and interconnect
    https://git.kernel.org/qcom/c/88800cb25484

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


