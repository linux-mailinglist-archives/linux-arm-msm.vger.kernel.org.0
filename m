Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE2A2D709A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 08:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbgLKHKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 02:10:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:57910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388329AbgLKHKA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 02:10:00 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607670559;
        bh=BXdz3hjV9jTQAtUU5cp0nkac+pcOQK0P5JoqsDaeC7I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pPwddj/XzCH/y5kSeZ1YEPHZIHLnsz48i3uN6f7SD5OPrPsI8yalnC9+FAQFOKq4p
         rquC9D6cGyeWgFOL0bZgRDaG+Z7uhtPUAiOA23M8k6zE2EhUF2l5OnXdu5cOoAekXC
         pgpOebCGNXoiUSbhDrjlfAxMEQj9PftJxHUxVJp1uQ3MFHQxbmONBqFIpICK/beVeP
         724d79IZHW4KM8yejj4xwMNiyn+zMjMXin1BXNBs2ieWgOnoA6ozHAAFlwfQhA/1Wl
         s2AQgepvhfd1PqJH5/6FydT3dZoGO6DE5kj3vtNbfUlZJdMxDJTJoF4dGqV2HuMS2c
         kUqD7x6G2mjxQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201211050257.GR8403@vkoul-mobl>
References: <20201208064702.3654324-1-vkoul@kernel.org> <20201208064702.3654324-5-vkoul@kernel.org> <160763259636.1580929.12912274485007017282@swboyd.mtv.corp.google.com> <20201211050257.GR8403@vkoul-mobl>
Subject: Re: [PATCH v2 4/5] clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Date:   Thu, 10 Dec 2020 23:09:18 -0800
Message-ID: <160767055805.1580929.10874243981268932091@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-12-10 21:02:57)
> On 10-12-20, 12:36, Stephen Boyd wrote:
> > > +
> > > +       return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> > > +                               (BIT(pll->width) - 1) << pll->post_di=
v_shift,
> >=20
> > Use GENMASK?
>=20
> Looks like this can be:
>                 GENMASK(pll->width + pll->post_div_shift - 1, pll->post_d=
iv_shift)
>=20
> Not sure which one you like :)

Preferably a local u32 mask =3D GENMASK(...)
