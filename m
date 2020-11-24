Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DF12C3167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 20:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgKXTuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 14:50:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:59152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728052AbgKXTuF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 14:50:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606247404;
        bh=FzZWBre//IxDJVmPI8/z3SZaMcf/z0EwE6synzojEQ8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VhyicMwNVjSKTkxzlC9paHLdueXgPrf7Z09jQJhS4Y0fJhI94leCZV/tWdqPlCSto
         y9/tPe070FiXDBcrKbFb6TnwyXA/AJZWWD5ellRGvkc8F/X8Ko7+qriDE5NdgiI4yx
         bR8psBRkdivsFACmwWqfA+B4W4gSuI5ddE+uS5RM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Limit ipa iommu streams
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160624740472.13327.492820448503068898.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 19:50:04 +0000
References: <20201123052305.157686-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201123052305.157686-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 22 Nov 2020 23:23:05 -0600 you wrote:
> The Android and Windows firmware does not accept the use of 3 as a mask
> to cover the IPA streams. But with 0x721 being related to WiFi and 0x723
> being unsed the mapping can be reduced to just cover 0x720 and 0x722,
> which is accepted.
> 
> Fixes: e9e89c45bfeb ("arm64: dts: sdm845: add IPA iommus property")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sdm845: Limit ipa iommu streams
    https://git.kernel.org/qcom/c/95e6f8467c83

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


