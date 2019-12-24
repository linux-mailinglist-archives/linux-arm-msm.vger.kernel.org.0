Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D777A129CAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 03:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfLXCUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 21:20:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:48996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbfLXCUo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 21:20:44 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7DDB120709;
        Tue, 24 Dec 2019 02:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577154042;
        bh=O9mtkKCydjxbvbEbTt9UWnL21Le9XvS5F3KSkXo+h9I=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=EI58vkzstSDwfUm1OoFGYNELGvU5G7G7RZBH39eXzhrNo5eIg37/aRbi3lQq8Nsq7
         r13WQlkpzoZPsHN+Ksomivg+crTy4e+O5yS8Hfvov84qX6VSyIadSoqGRLAxnbvwDK
         VdrqkCLJJALp2quQkedRSFm+FKRRtUXwF8y11Dnc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191220023427.GL448416@yoga>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org> <20191207203603.2314424-2-bjorn.andersson@linaro.org> <20191219063719.5AF942146E@mail.kernel.org> <20191220023427.GL448416@yoga>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:20:41 -0800
Message-Id: <20191224022042.7DDB120709@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-12-19 18:34:27)
> On Wed 18 Dec 22:37 PST 2019, Stephen Boyd wrote:
>=20
> > Quoting Bjorn Andersson (2019-12-07 12:36:02)
> > > The CLKREF clocks are all fed by the clock signal on the CXO2 pad on =
the
> > > SoC. Update the definition of these clocks to allow this to be wired =
up
> > > to the appropriate clock source.
> > >=20
> > > Retain "xo" as the global named parent to make the change a nop in the
> > > event that DT doesn't carry the necessary clocks definition.
> >=20
> > Something seems wrong still.
> >=20
> > I wonder if we need to add the XO "active only" clk to the rpm clk
> > driver(s) and mark it as CLK_IS_CRITICAL. In theory that is really the
> > truth for most of the SoCs out there because it's the only crystal that
> > needs to be on all the time when the CPU is active. The "normal" XO clk
> > will then be on all the time unless deep idle is entered and nobody has
> > turned that on via some clk_prepare() call. That's because we root all
> > other clks through the "normal" XO clk that will be on in deep
> > idle/suspend if someone needs it to be.
> >=20
>=20
> The patch doesn't attempt to address the fact that our representation of
> XO is incomplete, only the fact that CXO2 isn't properly described.
>=20
> Looking at the clock distribution, we do have RPM_SMD_BB_CLK1_A which
> presumably is the clock you're referring to here - i.e. the clock
> resource connected to CXO.

I don't mean the buffer clks, but the XO resource specifically. It's the
representation to the RPM that deep sleep/deep idle should or shouldn't
turn off XO and achieve "XO shutdown". Basically it can never be off
when the CPU is active because then the CPU itself wouldn't be clocked,
but when the CPU isn't active we may want to turn it off if nothing is
using it during sleep to clock some sort of wakeup logic or device that
is active when the CPU is idle.

>=20
> > Did the downstream code explicitly enable this ln_bb_clk in the phy
> > drivers? I think it may have?
> >=20
>=20
> Yes, afaict all downstream drivers consuming a CLKREF also consumes
> LN_BB and ensures that this is enabled. So we've been relying on UFS to
> either not have probed yet or that UFS probed successfully for PCIe and
> USB to be functional.
>=20
> So either we need this patch to ensure that the requests propagates
> down, or I need to patch up the PHY drivers to ensure that they also
> vote for the PMIC clock - and I do prefer this patch.

Cool. Yeah seems better to just indicate that the reference clks are
clocked by something else and fix that problem now.

