Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12A729DB07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390518AbgJ1XfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:35:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:52234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390490AbgJ1Xew (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:34:52 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB478207CD;
        Wed, 28 Oct 2020 23:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603928092;
        bh=SkQS+kWFiHlNP9A0NCZXUnj0zgMwNgitxpz4kbLJEAU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Rvy2470gXdjhUuqsTnms1+9zn/3ltbcoGLut4tp8macFajRCZ/q11mXsb5MRbetJp
         x474Lxd6mDACqBiPmcl6Pl2Z9pr+557S2YUM1eKDOW49Qd2isIpjJEW+1NiCny6JNr
         AsHQgnPP4ZzPTqOL4kaUc4Y5a2EChaeY9L0PdUzg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201026161411.3708639-1-arnd@kernel.org>
References: <20201026161411.3708639-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: define to_clk_regmap() as inline function
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Mike Turquette <mturquette@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Date:   Wed, 28 Oct 2020 16:34:50 -0700
Message-ID: <160392809056.884498.15602398724017724347@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Arnd Bergmann (2020-10-26 09:13:57)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Nesting container_of() causes warnings with W=3D2, which is
> annoying if it happens in headers and fills the build log
> like:
>=20
> In file included from drivers/clk/qcom/clk-alpha-pll.c:6:
> drivers/clk/qcom/clk-alpha-pll.c: In function 'clk_alpha_pll_hwfsm_enable=
':
> include/linux/kernel.h:852:8: warning: declaration of '__mptr' shadows a =
previous local [-Wshadow]
>   852 |  void *__mptr =3D (void *)(ptr);     \
>       |        ^~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:155:31: note: in expansion of macro 'con=
tainer_of'
>   155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
>       |                               ^~~~~~~~~~~~
> drivers/clk/qcom/clk-regmap.h:27:28: note: in expansion of macro 'contain=
er_of'
>    27 | #define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, h=
w)
>       |                            ^~~~~~~~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:155:44: note: in expansion of macro 'to_=
clk_regmap'
>   155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
>       |                                            ^~~~~~~~~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:254:30: note: in expansion of macro 'to_=
clk_alpha_pll'
>   254 |  struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
>       |                              ^~~~~~~~~~~~~~~~
> include/linux/kernel.h:852:8: note: shadowed declaration is here
>   852 |  void *__mptr =3D (void *)(ptr);     \
>       |        ^~~~~~
>=20
> Redefine two copies of the to_clk_regmap() macro as inline functions
> to avoid a lot of these.
>=20
> Fixes: ea11dda9e091 ("clk: meson: add regmap clocks")
> Fixes: 085d7a455444 ("clk: qcom: Add a regmap type clock struct")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-fixes
