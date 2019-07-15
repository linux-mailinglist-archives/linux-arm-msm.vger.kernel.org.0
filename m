Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E873C69F30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 00:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731798AbfGOWwU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 18:52:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:55764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731510AbfGOWwU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 18:52:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B684820665;
        Mon, 15 Jul 2019 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563231139;
        bh=ZCdJ1ycn0CxlKnJpJuo/5BWemLaxhnpXFuxvBtoMCfY=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=pebcRePPBwxpFeT85sYCJcPyWCipi5BcXDFouHHHVeglQ5r9R3yDnXmhxR5ZlLLJ+
         ZgXAUpdUlIgqxlXvXlz0V5hP+67MKwkbk3cYqjKy8SWLJ58IdnZ55H/N6iWiNLTVVA
         EuVCsb/TD/ne9+cSKff/wOe76cad8I9meXs3uppw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1557339895-21952-3-git-send-email-tdas@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-3-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/3] clk: qcom: rcg2: Add support for hardware control mode
User-Agent: alot/0.8.1
Date:   Mon, 15 Jul 2019 15:52:18 -0700
Message-Id: <20190715225219.B684820665@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-05-08 11:24:54)
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 57dbac9..5bb6d45 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -289,6 +289,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg,=
 const struct freq_tbl *f)
>         cfg |=3D rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
>         if (rcg->mnd_width && f->n && (f->m !=3D f->n))
>                 cfg |=3D CFG_MODE_DUAL_EDGE;
> +       if (rcg->flags & HW_CLK_CTRL_MODE)
> +               cfg |=3D CFG_HW_CLK_CTRL_MASK;
> +

Above this we have commit bdc3bbdd40ba ("clk: qcom: Clear hardware clock
control bit of RCG") that clears this bit. Is it possible to always set
this bit and then have an override flag used in sdm845 that says to
_not_ set this bit? Presumably on earlier platforms writing the bit is a
no-op so it's safe to write the bit on those platforms.

This way, if it's going to be the default we can avoid setting the flag
and only set the flag on older platforms where it shouldn't be done for
some reason.

>         return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
>                                         mask, cfg);
>  }
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
>=20
