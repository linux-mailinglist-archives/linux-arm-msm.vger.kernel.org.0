Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFC5125B85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 07:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfLSGhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 01:37:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:32890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfLSGhU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 01:37:20 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5AF942146E;
        Thu, 19 Dec 2019 06:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576737439;
        bh=yRJjq73VrCXzrGKoNaP61mnvcp0MNycnYRKc7arf59I=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=QRLP6y/MnrskiUUDf6VdJ4zAy8HOPx0j52OfP4d2uQa0H9wxL5USYs99wGHfnGy2H
         Q6LOnfwNLt9SSFIcO0KOZOFgeplCnglH0Syx3J2zRzSUdW9j9IuwZu6SHwfzDk0mM5
         tg2ITOBcdEwsLN9TraWBHGSq0VCD7QtL21+YQslk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191207203603.2314424-2-bjorn.andersson@linaro.org>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org> <20191207203603.2314424-2-bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
From:   Stephen Boyd <sboyd@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 22:37:18 -0800
Message-Id: <20191219063719.5AF942146E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-12-07 12:36:02)
> The CLKREF clocks are all fed by the clock signal on the CXO2 pad on the
> SoC. Update the definition of these clocks to allow this to be wired up
> to the appropriate clock source.
>=20
> Retain "xo" as the global named parent to make the change a nop in the
> event that DT doesn't carry the necessary clocks definition.

Something seems wrong still.

I wonder if we need to add the XO "active only" clk to the rpm clk
driver(s) and mark it as CLK_IS_CRITICAL. In theory that is really the
truth for most of the SoCs out there because it's the only crystal that
needs to be on all the time when the CPU is active. The "normal" XO clk
will then be on all the time unless deep idle is entered and nobody has
turned that on via some clk_prepare() call. That's because we root all
other clks through the "normal" XO clk that will be on in deep
idle/suspend if someone needs it to be.

Did the downstream code explicitly enable this ln_bb_clk in the phy
drivers? I think it may have?

