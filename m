Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E902768BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 08:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgIXGP7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 02:15:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgIXGP7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 02:15:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D792320702;
        Thu, 24 Sep 2020 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600928157;
        bh=FYKhygRGLCFyNdkjnICFM64KAKwmd6wBhNdDogeSdRA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tBPrve2+kzsKJDkJf38NlVKLW0rdEu2RDr/cs94SHAxvR2xvoc2w5BP3S6WaAO/tP
         rTQABPuLF/xzC3xpI68MXTLZz7ctRgq3rQEqzY3I87gSo0cWwe6oZIs+rl4RHPP+4M
         04oW8KDkdd4nHzwjyrCfAvENgY0DyC0fZORGr7tA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3370cff3-9296-74fc-8e7d-ff93c3978351@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca> <20200911153412.21672-7-jonathan@marek.ca> <160080149549.310579.17453759593211612997@swboyd.mtv.corp.google.com> <3370cff3-9296-74fc-8e7d-ff93c3978351@marek.ca>
Subject: Re: [PATCH v3 6/7] clk: qcom: Add display clock controller driver for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Wed, 23 Sep 2020 23:15:55 -0700
Message-ID: <160092815523.310579.15502532225598451868@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 09:24:04)
> On 9/22/20 3:04 PM, Stephen Boyd wrote:
> > Quoting Jonathan Marek (2020-09-11 08:34:06)
> >> Add support for the display clock controller found on SM8150
> >> based devices. This would allow display drivers to probe and
> >> control their clocks.
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >>   drivers/clk/qcom/Kconfig         |    9 +
> >>   drivers/clk/qcom/Makefile        |    1 +
> >>   drivers/clk/qcom/dispcc-sm8150.c | 1152 ++++++++++++++++++++++++++++=
++
> >>   3 files changed, 1162 insertions(+)
> >>   create mode 100644 drivers/clk/qcom/dispcc-sm8150.c
> >=20
> > If the bindings are the same for these two drivers I wonder if there is
> > anything different between the two. Maybe the two drivers can be one
> > driver?
> >=20
>=20
> Possibly, the biggest difference seems to be the plls (trion vs lucid,=20
> different config), which could be resolved in the probe() function. If=20
> you think combining the drivers is the right thing to do then I can do th=
at.

If that's the main difference then it sounds OK to merge the two.
