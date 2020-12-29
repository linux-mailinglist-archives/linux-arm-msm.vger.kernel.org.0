Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAD22E735C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgL2UQL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:59332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgL2UQK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6EF7521D94;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=tiRJuJqRAd3hfQ2zgKyCnt5+Cxq0jc2IcP6GsEn79ZA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=POYu3vvbCiAzZOv0D1U1pWwck3KMopt4Ucm0NCMHmi6O75yR6JTySA5K44H2GUg9k
         2qJuxyZYHsyRvLsmjiM9CeWaB1NPSmGkoxQpiLQxiTpdqO5l/c+nqNrEbuGf4MsxZs
         EzSQR55kXqr/cbgE5IYoRFjAKxIgli3JwNWcxW3AVdMaKPe2+dKE+ixpe9WjVjTFb4
         bLBjHkZymRlVkJzA/IEdSseXahitlevYdeq0rVh84ChrHQMm3f1OlCAUZxNvyCpheD
         T0enM7KZTa/BxO5CAhwmK1Cvn/5+2WA871ykvZnMDRIPBmWQZ9iBz8pOS7EDXqQuBk
         ZOtCO4x1nCTDw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 61FBF60626;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2] Add LT9611UXC DSI to HDMI bridge support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293039.13751.10433531324205617649.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  2 Nov 2020 04:14:33 +0300 you wrote:
> Hi,
> 
> This series adds support for Lontium LT9611UXC bridge chip which takes
> MIPI DSI as input and provides HDMI signal as output.
> 
> The chip can be found in Qualcomm RB5 platform [1], [2].
> 
> [...]

Here is the summary with links:
  - [v4,1/2] dt-bindings: display: bridge: Add documentation for LT9611UXC
    https://git.kernel.org/qcom/c/25d7361ff96a
  - [v4,2/2] drm: bridge: add support for lontium LT9611UXC bridge
    https://git.kernel.org/qcom/c/0cbbd5b1a012

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


