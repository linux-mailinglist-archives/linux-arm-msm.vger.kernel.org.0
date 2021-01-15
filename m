Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA2F2F7E03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 15:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731147AbhAOOUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:20:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:55508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731501AbhAOOUt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:20:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4E9A7238A0;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610720409;
        bh=zVTpEjRvXlMVHAPvNO8bzm1YE1up6BK1KZsUmAtqWEU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cVlOWWRn406dtw0ePfZbA0K6Bamh2ZWJeKTWBIKj1wSDdF//AR4dFoeSc3vnoypOz
         901mYZi2uc1m/eREfyaD5kyQtE5fuI4p6eytVpePSy8tXOTsb3yVBbnayDXaKiNBVg
         ptQmgQpO76IMTxqI+/omdhPq8GhBpngaeLJyj216O3zRDT+pm/MUZplkgZ0m8zxae/
         20wRQmQSM8kZumFjJzRMRCZJaVrTg6Ft9khzc6SG9Lgym1gvDV2PbUGXQeqJ0gk7+y
         qoUUFyzEok5nU3PMUaODQSblFSnSZPmHD8OKTmhnYyaGSYQc0L2GzMwKNJNcg0pG4M
         sgDYMDzR9Jt3A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4AFD96017C;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: Clean up sc7180-trogdor voltage rails
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072040930.1237.12094062614066916216.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 14:20:09 +0000
References: <20201207143255.1.Ib92ec35163682dec4b2fbb4bde0785cb6e6dde27@changeid>
In-Reply-To: <20201207143255.1.Ib92ec35163682dec4b2fbb4bde0785cb6e6dde27@changeid>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  7 Dec 2020 14:33:02 -0800 you wrote:
> For a bunch of rails we really don't do anything with them in Linux.
> These are things like modem voltage rails that the modem manages these
> itself and core rails (like IO rails) that are setup to just
> automagically do the right thing by the firmware.
> 
> Let's stop even listing those rails in our device tree.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: Clean up sc7180-trogdor voltage rails
    https://git.kernel.org/qcom/c/e5376f2ea2e2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


