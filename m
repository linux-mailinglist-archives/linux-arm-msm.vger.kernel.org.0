Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665FB430047
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 06:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239415AbhJPEmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 00:42:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240675AbhJPEmQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 00:42:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2B05F6124B;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634359209;
        bh=PTHUqJdU7EgW3gx5r9kt61m91QR0YHA+l1poBoTKgss=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FpNeizkae7MlZrB4YbWqktUcN3h91fyRu9fabWKZSSYAJybIkU+pG9cW08bzWy67O
         ALQQ4X7hEUF/6OqJyLj9wpY9W/NMlogKvvuPQO6IDh+BZ26QtFbvXGAl5+zj4Ujb4b
         Ukhw4/oPucZgNxbrMAR5WfBq7KTctQzRgDbKDuAWjzlTDkAoWjpsT4IFEbIgx37UC6
         U6MkQsyLGmQjlhlNf9BtIpJkgNEtMpjMU3yBYBE8SoZf8H50uOFLv6lnykAnzT9VCW
         gp/M0srtlYDnLZTCTRB6FR9anN/erjiZS0brbilJx+DB+3mi1Xw1+302BhH7KZ5Fkk
         ObgLWq8wwv5pw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 15FCE60A90;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: apq8016-sbc: Clarify firmware-names
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163435920908.10607.14267898713520012444.git-patchwork-notify@kernel.org>
Date:   Sat, 16 Oct 2021 04:40:09 +0000
References: <20210922195853.95574-1-stephan@gerhold.net>
In-Reply-To: <20210922195853.95574-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Wed, 22 Sep 2021 21:58:53 +0200 you wrote:
> Commit 0f6b380d580c ("arm64: dts: qcom: apq8016-sbc: Update modem and WiFi
> firmware path") added "firmware-name"s to the APQ8016 SBC (DB410c) device
> tree to separate the (test key)-signed firmware from other devices.
> 
> However, the added names are a bit confusing. The "modem" firmware used by
> DB410c is actually a simplified version for APQ8016 that lacks most of the
> modem functionality (phone calls, SMS etc) that is available on MSM8916.
> Placing it in "qcom/msm8916/modem.mbn" suggests that it supports all
> functionality for MSM and not just the reduced functionality for APQ.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: apq8016-sbc: Clarify firmware-names
    https://git.kernel.org/qcom/c/2533786f46d0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


