Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4FDB12AF54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 23:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfLZWeG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 17:34:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:44134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbfLZWeG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 17:34:06 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1646206CB;
        Thu, 26 Dec 2019 22:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577399645;
        bh=QldJk4VKqGrvE3OjqDXhHbkHHU0eF8gSaa/4Cc6vcN0=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=jllC4FUUIZiakCJNf7Sc7uA9hN1uo7y3PGBGR6m/X92Xpj19etc719D8RL673XS9+
         c/H2UcgM0ibEKQtRG2RpOQY50GpTZFl80b99TkVX5ZcijPgiCgafrK0PFG1aNW+V4G
         DSq3dqW5gO8RzG37YNG2nU1hA3UfvNTGNA2GtDAY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191226222315.GD1908628@ripper>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org> <20191207203603.2314424-2-bjorn.andersson@linaro.org> <20191224024845.445A92070E@mail.kernel.org> <20191226222315.GD1908628@ripper>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
User-Agent: alot/0.8.1
Date:   Thu, 26 Dec 2019 14:34:04 -0800
Message-Id: <20191226223405.A1646206CB@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-12-26 14:23:15)
> On Mon 23 Dec 18:48 PST 2019, Stephen Boyd wrote:
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
> > >=20
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  .../devicetree/bindings/clock/qcom,gcc.yaml   |  6 ++--
> > >  drivers/clk/qcom/gcc-msm8996.c                | 35 +++++++++++++++--=
--
> > >  2 files changed, 32 insertions(+), 9 deletions(-)
> >=20
> > What is this patch based on? I think I'm missing some sort of 8996 yaml
> > gcc binding patch.
> >=20
>=20
> The patch applies cleanly on linux-next and afaict it depends on the
> yamlification done in 9de7269e9703 ("dt-bindings: clock: Add YAML
> schemas for the QCOM GCC clock bindings"), which git tells me is
> included in v5.5-rc1 as well.
>=20
> Am I misunderstanding your question?
>=20

There doesn't seem to be any sort of minitems or maxitems in my yaml
binding file for the clocks or clock-names properties.

