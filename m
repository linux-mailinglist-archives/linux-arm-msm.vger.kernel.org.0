Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C81357D41
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 09:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhDHHWi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 03:22:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:50438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhDHHWi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 03:22:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41C7B61057;
        Thu,  8 Apr 2021 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617866547;
        bh=VWHJ4S2NUazxjkcoG14YcKlRYbUJn67YeARgQ2HlvR4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Kbuf8KejErJteWnVQN2yKiXOpnWkPkaFgNWLhc/vJGIjXKzJaXXAZs2JUX3qPePPa
         p4yDTB/XtA+46L4MNcLTtoIRXjxJIHYKarVYxy8edzjI8/UsTIyDlpC8Z7328uT53l
         gXdxm5wyFkE1TgJ5pNqHATwWCnzMxl+u+RzrbQP4rnC/cHcvESv8FPg2s/xYYp7DdW
         8pWvGGjcLP7LnPihWJNaPzTylr9jStwPmgDtyyTfllZpoYLWcOQHxZZZKe5tn9zD20
         a40Y7yM4NlK6u1mJZlUmH2WkDtu3nAfSCHduDhaiNQBQBd4n44nxEOxUbYmtAk3CGb
         SFNa/vK9MQ2KQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615944142-12171-5-git-send-email-tdas@codeaurora.org>
References: <1615944142-12171-1-git-send-email-tdas@codeaurora.org> <1615944142-12171-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 4/6] clk: qcom: Add graphics clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 08 Apr 2021 00:22:25 -0700
Message-ID: <161786654585.3790633.12597782416303763853@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-03-16 18:22:20)
> +static struct clk_regmap_div gpu_cc_hub_ahb_div_clk_src =3D {
> +       .reg =3D 0x11c0,
> +       .shift =3D 0,
> +       .width =3D 4,
> +       .clkr.hw.init =3D &(struct clk_init_data) {
> +               .name =3D "gpu_cc_hub_ahb_div_clk_src",
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .hw =3D &gpu_cc_hub_clk_src.clkr.hw,

Can you follow what Dmitry has done and use .hws instead of
clk_parent_data when the whole array is clk_hw pointers?

> +               },
> +               .num_parents =3D 1,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_regmap_div_ro_ops,
> +       },
> +};
> +
