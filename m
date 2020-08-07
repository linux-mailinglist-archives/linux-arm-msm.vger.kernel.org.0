Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB17923F47E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 23:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgHGVmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 17:42:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgHGVmp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 17:42:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE0BA2086A;
        Fri,  7 Aug 2020 21:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596836564;
        bh=amSzRwwB4oYiIBlYBqJnUvxcuZpXcMQU+1NE13Uhz/w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=o3p7EbfjtrsPbqMjEVpHTChatxG2U+g+Y/76zMxBGYfXNq47yA5q1xAtEyNT7UUTA
         AVnyg+xclHYJkn7eJbqYZFYEenzOPSzAbYIobeJ86YspziAZBtnBN382qb27VMzAcs
         FykDgGgEcIVzWrR+yMzt3LPk7wQt6K6G9b8/UIBw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <13ac9aad-2377-472d-b2be-a762a21c2dac@codeaurora.org>
References: <1595606878-2664-1-git-send-email-tdas@codeaurora.org> <1595606878-2664-5-git-send-email-tdas@codeaurora.org> <159665909245.1360974.10366839079633595523@swboyd.mtv.corp.google.com> <13ac9aad-2377-472d-b2be-a762a21c2dac@codeaurora.org>
Subject: Re: [PATCH v5 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 07 Aug 2020 14:42:43 -0700
Message-ID: <159683656359.1360974.18078513144154056292@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-08-05 22:23:05)
> On 8/6/2020 1:54 AM, Stephen Boyd wrote:
> >> +                               .hw =3D &core_clk_src.clkr.hw,
> >> +                       },
> >> +                       .num_parents =3D 1,
> >> +                       .flags =3D CLK_SET_RATE_PARENT,
> >> +                       .ops =3D &clk_branch2_ops,
> >> +               },
> >> +       },
> >> +};
> >> +
> >> +static struct clk_regmap *lpass_core_cc_sc7180_clocks[] =3D {
> >> +       [EXT_MCLK0_CLK_SRC] =3D &ext_mclk0_clk_src.clkr,
> >> +       [LPAIF_PRI_CLK_SRC] =3D &lpaif_pri_clk_src.clkr,
> >> +       [LPAIF_SEC_CLK_SRC] =3D &lpaif_sec_clk_src.clkr,
> >> +       [CORE_CLK_SRC] =3D &core_clk_src.clkr,
> >=20
> > And all of these, can they have LPASS_ prefix on the defines? Seems
> > like we're missing a namespace otherwise.
> >=20
>=20
> These are generated as they are in the HW plan. Do you still think I=20
> should update them?
>=20

As long as there aren't going to be conflicts in the clk names I guess
it's OK to do nothing here.
