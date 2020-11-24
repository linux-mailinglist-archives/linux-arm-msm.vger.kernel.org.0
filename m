Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213032C345E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 00:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732198AbgKXXKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 18:10:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:33508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732184AbgKXXKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 18:10:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606259405;
        bh=7t8daxynGpW31zthQgymKrEV40RSuU4g7uTo4X4y+0c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NxWqB9kCP2GB1j8XTlxL3fIF9vwR4tH0h/ecwsSCC62YbRALYF9QMeXYmCaR9woQl
         TcoH+v6A8EUCB8XV28uyJrS2dsCHPAd//+hlXgINQYyY2MwuMaGuJgZz2sT9hoLNDM
         O45M8RdzmOr4Vw+slBaP6Y9RKxEEs4EOkIfgq0ds=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: qcom: sc7180: trogdor: Add ADC nodes and thermal zone
 for charger thermistor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160625940538.12963.11203654431478873143.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 23:10:05 +0000
References: <20201030084840.1.If389f211a8532b83095ff8c66ec181424440f8d6@changeid>
In-Reply-To: <20201030084840.1.If389f211a8532b83095ff8c66ec181424440f8d6@changeid>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 30 Oct 2020 08:48:43 -0700 you wrote:
> From: Antony Wang <antony_wang@compal.corp-partner.google.com>
> 
> Trogdor has a thermistor to monitor the temperature of the charger IC.
> Add the ADC (monitor) nodes and a thermal zone for this thermistor.
> 
> Signed-off-by: Antony Wang <antony_wang@compal.corp-partner.google.com>
> [ mka: tweaked commit message ]
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> [...]

Here is the summary with links:
  - arm64: qcom: sc7180: trogdor: Add ADC nodes and thermal zone for charger thermistor
    https://git.kernel.org/qcom/c/bb06eb3607e9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


