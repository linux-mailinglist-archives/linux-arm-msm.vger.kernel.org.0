Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF4D44381A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 22:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhKBV6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 17:58:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:59866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhKBV6v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 17:58:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1164F60EBD;
        Tue,  2 Nov 2021 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635890176;
        bh=oouxKCA5Vs0WFHSRq/Xx8b7jRM+YfD5kWuHpY4xDUzA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r8QsGPIFXeDVHgVsfZl5SkeIb/oBa/MoiNzZwati9OuxGJrsn3hTN+hAPNolNDnaS
         h3fHWSzVeXpCQ2fHGN42fuTD23W6Y31ePp+v8cs9+aUsBlW8u7LfGtnCk/ulASNKSo
         FJQKXzUjsIxnzOhi3qjml70WMknAfRRK7iqVRolm0nQdSMCuuJ0xd/O9Hdf0acCL7Z
         6priLo2IeJW23r2BtEyCzwGFqPY7atg3hh0d4ox/OmOBaKBjhHk+Sv5QUja3+83nBF
         t5nEVNBr/v09rk3gXI78pksR0Pmq+zc+BFYqcbsf7TGOxyIkDb0NpUNVrqvYb8CY7A
         kORr+d7ITryLw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1635847013-3220-2-git-send-email-tdas@codeaurora.org>
References: <1635847013-3220-1-git-send-email-tdas@codeaurora.org> <1635847013-3220-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/4] clk: qcom: clk-alpha-pll: Increase PLL lock detect poll time
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 02 Nov 2021 14:56:14 -0700
Message-ID: <163589017472.2993099.8634048687805619874@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-11-02 02:56:50)
> PLL poll for lock detection can take more than 100us for certain type

What types of PLLs? Is this fixing something that's broken? Or fixing a
future problem?

> of PLLs, thus update to 200us.
>=20

Does it needs a Fixes tag?

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index eaedcce..7cf6cfa 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -204,7 +204,7 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u3=
2 mask, bool inverse,
>         if (ret)
>                 return ret;
>=20
> -       for (count =3D 100; count > 0; count--) {
> +       for (count =3D 200; count > 0; count--) {
>                 ret =3D regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val=
);
>                 if (ret)
