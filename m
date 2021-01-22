Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A14E300F0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 22:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbhAVVlG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 16:41:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:59612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729363AbhAVVkw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 16:40:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6CBFF23B09;
        Fri, 22 Jan 2021 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611351612;
        bh=7epZbfbB1UufM0S8s2eyikkWlQ6IIVCKEbY/nTMysRg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WqHm1TGIApAT/ofPqtAbBBd1V1Gf1fBIArXqAe2v5M1sfVbTjrN5SnhXH+FckoFpH
         9cUP9v9RKpgThBBpo+9sFSDlZcRHXZ5an78o3k+qTxdMld2fj4Nv0Q+7SDZEBxqnbX
         xhFBQS9GWpKieJwq6bMl8ml8g/+IdFeiFFTFUI5w6J+ztUMa071hxMpZrY9ccEn9wU
         fRwEqL6tlV8cy4M/qc5t4NSW3EtGXYaMe0/uAtlppuRpfyMX8fax7EjvToZgNUxL5R
         2SHRUW7QotczSVM5NoWQ6xYFDM9AgKi6SAwzCFOVAeJO9YXDseaSI1HL8NKbpMj2nj
         mC/cgWvnE20qg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 61164652D4;
        Fri, 22 Jan 2021 21:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8] ARM: dts: qcom: ipq4019: add USB devicetree nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161135161239.27172.8830363238708746421.git-patchwork-notify@kernel.org>
Date:   Fri, 22 Jan 2021 21:40:12 +0000
References: <20200909163831.1894142-1-robert.marko@sartura.hr>
In-Reply-To: <20200909163831.1894142-1-robert.marko@sartura.hr>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  9 Sep 2020 18:38:31 +0200 you wrote:
> From: John Crispin <john@phrozen.org>
> 
> Since we now have driver for the USB PHY, and USB controller is already supported by the DWC3 driver lets add the necessary nodes to DTSI.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v8] ARM: dts: qcom: ipq4019: add USB devicetree nodes
    https://git.kernel.org/qcom/c/b8afc254b401

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


