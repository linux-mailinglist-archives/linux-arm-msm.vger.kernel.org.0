Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BB92D68A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 21:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390492AbgLJU2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 15:28:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:44712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393768AbgLJU17 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 15:27:59 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607632038;
        bh=SgdDD9mWoOCfUdNeIuaP7KCamYt+qpwt+S9lZvjYQos=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eUHUJh03y3BE0COmzaRQ2vR5ul7IZk/ea7Te2y6A1n1/ReSvs+tUfvyjXm5inghJr
         5iZpbreMADZPmthfOjxIcghOki8Q/w3IcD9qOW3MJ4DoqdqAcJRcEx7kALRwgsrkEP
         tkJ1bDY7sARIUqkoO1p4H1jokf+A317OD2UDKAeONmJogz0mN8KEA7Bj0JYGmuT9AN
         QT3zHlSUwKFq1tNwme8AxV+F+GK07wb9FKhnUvijoMheynzS/RzQvTxJnIEbCtD/9Z
         LKM+yIH1Xr+j0X3tqtUlBWOXPJkkzigaAEOU+vKJ4vIEGrDjvmMz/lY5Hfr32YhSI9
         IG+bvq5LQ724A==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
References: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sc7180: Use floor ops for sdcc clks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, vbadigan@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 12:27:17 -0800
Message-ID: <160763203722.1580929.17813582697140984791@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-10 10:22:38)
> I would repeat the same commit message that was in commit 5e4b7e82d497
> ("clk: qcom: gcc-sdm845: Use floor ops for sdcc clks") but it seems
> silly to do so when you could just go read that commit.
>=20
> NOTE: this is actually extra terrible because we're missing the 50 MHz
> rate in the table (see the next patch AKA ("clk: qcom: gcc-sc7180: Add
> 50 MHz clock rate for SDC2")).  That means then when you run an older
> SD card it'll try to clock it at 100 MHz when it's only specced to run
> at 50 MHz max.  As you can probably guess that doesn't work super
> well.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SC7180")
> ---
> Taniya: can you please update whatever process is used to generate
> these clock files to use floor for SD card clocks.  I hope you can
> also scour through these files looking for similar problems on other
> SoCs and submit patches for them.

Any chance the consumer of this clk can call clk_round_rate() and WARN()
if the rate is not anywhere near what it wants it to be? I fear that
this problem will just keep coming up otherwise.
