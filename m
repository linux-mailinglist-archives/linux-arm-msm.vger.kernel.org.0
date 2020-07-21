Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838002279B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 09:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgGUHpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 03:45:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728144AbgGUHpf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 03:45:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAEFE20792;
        Tue, 21 Jul 2020 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595317534;
        bh=97y2zuXcVstRXdOrZNWE3KBD6w2VxtGXrPDl5D3CkIM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WyksoiMLJAFq6dfdIMzZdi/o+mKSI6/xAJigf8NLmNQFNa40UCngkV7mj5gZP8OlV
         5EhefaL/wrY6DxxzUBcQoifbQ40+G2RTcGzjdcdRlGYssjdiXpUpLq5aG3X6Qdu1Gc
         B5ktvVZkl+7EMYj/PpL9bRyU8DzvvjOeRZFYy/go=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594796050-14511-1-git-send-email-tdas@codeaurora.org>
References: <1594796050-14511-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v0] clk: qcom: gcc: Update disp gpll0 branch for 7180/845
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@google.com, Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 21 Jul 2020 00:45:33 -0700
Message-ID: <159531753391.3847286.4226820520237148758@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-07-14 23:54:10)
> The display gpll0 branch clock needs to be always left enabled, thus
> move the clock ops to _aon branch ops.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>

I wanted to apply this but it needs more commit text. Here's the commit
text I wrote.

clk: qcom: gcc: Make disp gpll0 branch aon for sc7180/sdm845

The display gpll0 branch clock inside GCC needs to always be enabled.
Otherwise the AHB clk (disp_cc_mdss_ahb_clk_src) for the display clk
controller (dispcc) will stop clocking while sourcing from gpll0 when
this branch inside GCC is turned off during unused clk disabling. We can
never turn this branch off because the AHB clk for the display subsystem
is needed to read/write any registers inside the display subsystem
including clk related ones. This makes this branch a really easy way to
turn off AHB access to the display subsystem and cause all sorts of
mayhem. Let's just make the clk ops keep the clk enabled forever and
ignore any attempts to disable this clk so that dispcc access keep
working.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Reported-by: Evan Green <evgreen@chromium.org>
Link: https://lore.kernel.org/r/1594796050-14511-1-git-send-email-tdas@code=
aurora.org
Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver f=
or SC7180")
Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver f=
or SDM845")

> ---
>  drivers/clk/qcom/gcc-sc7180.c | 2 +-
>  drivers/clk/qcom/gcc-sdm845.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index ca4383e..538677b 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -1061,7 +1061,7 @@ static struct clk_branch gcc_disp_gpll0_clk_src =3D=
 {
>                                 .hw =3D &gpll0.clkr.hw,
>                         },
>                         .num_parents =3D 1,
> -                       .ops =3D &clk_branch2_ops,
> +                       .ops =3D &clk_branch2_aon_ops,

I'm worried that dispcc may probe before GCC and then this branch is
disabled out of boot. Then we'll try to read dispcc registers to
determine clk rates and blow up. I hope that doesn't happen and fixing
it would need this patch plus the usage of PM clks in the dispcc driver.
I suppose if we run into that problem we can use PM clks to make this
branch turn on before accessing any dispcc clks.
