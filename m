Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AD72D68AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 21:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393767AbgLJU22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 15:28:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:44780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393381AbgLJU22 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 15:28:28 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607632067;
        bh=w+1UVjK8H9Lt5o8kVzgGtFbz5hezEyqIH3fXHTI36Vk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CzzOlZzrOgn/iyqppJ9OcUPsyDxKvnKZLMwX60X0xyEOxGevXMP0ELpOhU59aLHl1
         f18Tpo88dSiXywCvq8UK6Pf0L9/H1jsT6q8JKRzHWrg+lliBB8aftqKIMuhMNyhlhq
         eZo2twwH/iMGyy203kwVxbDyYOjy9vYvcpV0kwavFWA+5x0aGXELezitRMMBmySx8A
         iUr/l3PcKgpYT8W7wUFqwCL3HRcXBNZ44xgveKdLydAc1P/VY2A6/XDB9/u0WAu4xv
         dBmV7DgQeCA8phVv95RAWqxFgNNy3pyz1xzJtQE/4ARiPEq/gM2qkvvntAcXOJYire
         kBrKJLWEw7cTw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210102234.2.I26dcc0cee374f5571d9929c9985f463773167e68@changeid>
References: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid> <20201210102234.2.I26dcc0cee374f5571d9929c9985f463773167e68@changeid>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sc7180: Add 50 MHz clock rate for SDC2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, vbadigan@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 12:27:45 -0800
Message-ID: <160763206595.1580929.13652217328024757973@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-10 10:22:39)
> 50 MHz is an incredibly common clock rate for SD cards to run at.
> It's "high speed" mode in SD (not very fast these days, but it used to
> be) or:
>   #define HIGH_SPEED_MAX_DTR    50000000
>=20
> If we don't support this then older "high speed" cards can only run at
> 25 MHz or at half their normal speed.  There doesn't seem to be any
> reason to skip this clock rate, so add it.
>=20
> Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SC7180")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next
