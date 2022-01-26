Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0817C49D3CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 21:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiAZUoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 15:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiAZUoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 15:44:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D6EC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 12:44:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B80C0B82012
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 20:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73FACC340E9;
        Wed, 26 Jan 2022 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643229838;
        bh=hMFnp6vt6RjQj5N4YqXfftN5cPXqVkdDgc+4M3LUbBQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ow+HhBqTox7UbgQuOVxBEX0oc1vimaNHtYBhq99JaynmKn9hiwXRLdcx+LlY6A61u
         AkG9mpnD4iKmV3iHMXvAMuH7DR1HxjxeX13xXAvbT12GHT81JDBPYo4PLXqRu/X/S6
         XYndy9MC7OzwmVA+Ng/l8GKj4BPHePlYMw7BiFVNlYRzhv5t5CAJMBHrU+aMjKnDtj
         xvCGeYaVtdWYoUor5/6rxVQRdGf1faes40RfjlhnPiU58ddRfhonW412EHQ2/bb/Mt
         BeJUF69Zj3vVHl1zshrlKbYFxm9dQqDnh/+ONRVwbNW0BTY3fYWK4qfwFQ7odaAV8w
         D7+PoUQq7gmyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 507B4F60797;
        Wed, 26 Jan 2022 20:43:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] Add PMG1110(Seco Jr) PMIC support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164322983832.21535.14153281854344272265.git-patchwork-notify@kernel.org>
Date:   Wed, 26 Jan 2022 20:43:58 +0000
References: <1637668167-31325-1-git-send-email-quic_c_skakit@quicinc.com>
In-Reply-To: <1637668167-31325-1-git-send-email-quic_c_skakit@quicinc.com>
To:     Satya Priya Kakitapalli (Temp) <quic_c_skakit@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Tue, 23 Nov 2021 17:19:24 +0530 you wrote:
> This series depends on below series which adds the base CRD dts
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=584349
> 
> Satya Priya (3):
>   dt-bindings: regulator: Add compatible for pmg1110
>   regulator: qcom-rpmh: Add PMG1110 regulators
>   arm64: dts: qcom: sc7280: Add pmg1110 regulators for sc7280-crd
> 
> [...]

Here is the summary with links:
  - [1/3] dt-bindings: regulator: Add compatible for pmg1110
    (no matching commit)
  - [2/3] regulator: qcom-rpmh: Add PMG1110 regulators
    (no matching commit)
  - [3/3] arm64: dts: qcom: sc7280: Add pmg1110 regulators for sc7280-crd
    https://git.kernel.org/qcom/c/073a39a2a63a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


