Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3521350C21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 03:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhDABxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 21:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:51422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232782AbhDABxI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 21:53:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11F8C60FE9;
        Thu,  1 Apr 2021 01:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617241988;
        bh=37JUz0qhV8xVpWHS2xEgP03SB1g4t2FHZ8M3ahU6ZJk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pP+VeSi1ETwMrbpxwFEphhwBv/QMNSPnQbk8sA2WsKpdqKeOrFu3eY0C7xGVMfW2L
         Nlcoeo+kFVNsrPs2aDLEfF2bQGie57qkEFaQCMTS70tAbPO1nTwSED/aHQvnHpciSX
         npRR6O5WS37v5hv2YrkJwM+LCLqpHKBTI1hwYM66DzsN+DZC0/6VgbRuE8UECcgPJZ
         R7xwJK9iGdH3gl4pgrDmECUreu6WolrTzY9hVeJJYA53ZKIPsUyInP+A9Z0deJOTqz
         gUxdPZnwkZ/pFBjbS+HkPv6P2c8l0ZEbCQlL9zEHNzFzALvzacu1dLGi2EOSkhioQl
         7LmR1/XGthjKw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3917fba4-e5b0-911f-9220-f401a90aac38@somainline.org>
References: <20210220155618.176559-1-konrad.dybcio@somainline.org> <20210220155618.176559-5-konrad.dybcio@somainline.org> <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com> <3917fba4-e5b0-911f-9220-f401a90aac38@somainline.org>
Subject: Re: [PATCH 5/6] clk: qcom: gcc-sdm660: Account for needed adjustments in probe function
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Wed, 31 Mar 2021 18:53:06 -0700
Message-ID: <161724198675.2260335.14358880292682931985@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-02-25 11:09:14)
> Hi and sorry for the late reply,
>=20

I'm sorry too. This fell off my review queue for some time.

>=20
> >> +
> >> +       /* Keep bimc gfx clock port on all the time */
> >> +       clk_prepare_enable(gcc_bimc_gfx_clk.clkr.hw.clk);
> >> +
> > Preferably just set these various bits with regmap_update_bits() during
> > probe. Also, please do it before regsitering the clks, not after.
>=20
> To be fair, now I think that simply adding CLK_IS_CRITICAL flag to the cl=
ocks in question is the smartest thing to do. Magic writes don't tell a who=
le lot.

This is how it's been done in various other qcom clk drivers. Usually
there is a comment about what is enabled, but really it's just setting
random bits that sadly aren't already set by default.

>=20
>=20
> >> +       /* Set the HMSS_GPLL0_SRC for 300MHz to CPU subsystem */
> >> +       clk_set_rate(hmss_gpll0_clk_src.clkr.hw.clk, 300000000);
> > Is this not already the case?
>=20
>=20
> This is a mission-critical clock and we cannot trust the bootloader with =
setting it. Otherwise dragons might appear.
>=20

What does the bootloader set it to?
