Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6841833A13C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 22:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234593AbhCMVAf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 16:00:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:41726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234555AbhCMVA3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 16:00:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 795FC64ECE;
        Sat, 13 Mar 2021 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615669229;
        bh=aHBPuI9lHuBKVFS9eVmtjaCk1/L0V9vWiX5uC0uAvmg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oFRRHmNztEMlyTqsSixbCiMrdUF/xDjX95Lt14e15nJjkDxcLAsP82z7/S9YHa7vH
         by0K290+GccYGNEwqgWSOpwp75gzSwZZ1jrvHP3DGrONFZqiTWsPascnVHWXjTUPrI
         KCLk6lOK+eqnhh5BWTM41qWrWSVDxJI8YIFVfNrBsmnYjHkM5h9P/1yptl2oGE5dz9
         tCs58GBD8qwCVo8E0NR4kfYi5p5uBsrHILmoRpJMxvbsW1xMB0gAbX6o2RK8ojGPHK
         7hJFPRzf5ZeqOnPw5QirrpZ86Be1scdTSN1MTv1DsR/BGQpI75/T2Rc16vQiIwmHgT
         zN0CuA1Q6fsqQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210224095013.1.I2e2ba4978cfca06520dfb5d757768f9c42140f7c@changeid>
References: <20210224095013.1.I2e2ba4978cfca06520dfb5d757768f9c42140f7c@changeid>
Subject: Re: [PATCH] clk: qcom: gcc-sc7180: Use floor ops for the correct sdcc1 clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     vbadigan@codeaurora.org, tdas@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Sat, 13 Mar 2021 13:00:28 -0800
Message-ID: <161566922826.1478170.8804841574246579434@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-02-24 09:50:25)
> While picking commit a8cd989e1a57 ("mmc: sdhci-msm: Warn about
> overclocking SD/MMC") back to my tree I was surprised that it was
> reporting warnings.  I thought I fixed those!  Looking closer at the
> fix, I see that I totally bungled it (or at least I halfway bungled
> it).  The SD card clock got fixed (and that was the one I was really
> focused on fixing), but I totally adjusted the wrong clock for eMMC.
> Sigh.  Let's fix my dumb mistake.
>=20
> Now both SD and eMMC have floor for the "apps" clock.
>=20
> This doesn't matter a lot for the final clock rate for HS400 eMMC but
> could matter if someone happens to put some slower eMMC on a sc7180.
> We also transition through some of these lower rates sometimes and
> having them wrong could cause problems during these transitions.
> These were the messages I was seeing at boot:
>   mmc1: Card appears overclocked; req 52000000 Hz, actual 100000000 Hz
>   mmc1: Card appears overclocked; req 52000000 Hz, actual 100000000 Hz
>   mmc1: Card appears overclocked; req 104000000 Hz, actual 192000000 Hz
>=20
> Fixes: 6d37a8d19283 ("clk: qcom: gcc-sc7180: Use floor ops for sdcc clks")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-fixes
