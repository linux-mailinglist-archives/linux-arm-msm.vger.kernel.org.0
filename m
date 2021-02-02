Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA62130CFB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 00:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbhBBXKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 18:10:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:47842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233050AbhBBXKw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 18:10:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A926364E41;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612307411;
        bh=IOCM2bkiQ5OO0oovNJbOtsEm+h+xDOV2jNJhXnAl9XA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=eq/QDDJwR+42JbxcHpPB5E+TjcKlpX7OPXg+LUAjHJf+kU1HJWuBA96e/1Lg0p85s
         uLZdI/WquIBE13EEDX1TsUdSBwNQFBB/0hdwjxLOK9ydpNg1FTJIudzHiQGvI3Imkj
         24HZ3rwnMShZiND5B325q+WKKjveTveNqX/mnPr7/Fs8GIrbgJv06vw6zBNfD3478G
         cgA069GPDluHUP6smi5F6oQ3a5C4Xa0BKSQAsS0wmA0i+RXh/QRg+ET0ci8B6btTCv
         FfBfsieaF7x7lXkiYW+Rc4L4aUf08E1wxKY9Xoy3L6Y1s8otmZTbpnMB1UeYWn1AYK
         cQfbPSg5hAF+g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 98D78609E1;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add missing device_type under
 pcie[01]
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161230741162.30835.7416717697522512442.git-patchwork-notify@kernel.org>
Date:   Tue, 02 Feb 2021 23:10:11 +0000
References: <20201224120025.6282-1-konrad.dybcio@somainline.org>
In-Reply-To: <20201224120025.6282-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 24 Dec 2020 13:00:25 +0100 you wrote:
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: msm8996: Add missing device_type under pcie[01]
    https://git.kernel.org/qcom/c/564f18f03e91

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


