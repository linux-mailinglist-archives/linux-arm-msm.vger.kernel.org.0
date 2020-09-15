Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E82269A06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 02:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgIOAB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 20:01:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgIOAB7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 20:01:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5A9720829;
        Tue, 15 Sep 2020 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600128118;
        bh=aDtVpbNbbuicIiX3Coqdnk0nSk8LgHP0iQgY2aJiAKg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jxw/TupX0o/bxM+BFImHj3AYgjkwRrhgfN4QNxrlO0/2vP3Y2+qTlBqKSsT/mGNt+
         Nn2TvfgA1BdnQGrLZiqOBBH2ULH7qVuChk6hhqYaTkE0meClo06iCZOLwzTp0H0C1r
         8Ko8S1tUiav57sb8GyidbjFjEt0WJXhohKvcYwCA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200911153441.GA18190@kozik-lap>
References: <20200902150348.14465-1-krzk@kernel.org> <20200902163558.GA4137028@piout.net> <20200911153441.GA18190@kozik-lap>
Subject: Re: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
To:     Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 14 Sep 2020 17:01:56 -0700
Message-ID: <160012811662.4188128.10109140799333292326@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-09-11 08:34:41)
> On Wed, Sep 02, 2020 at 06:35:58PM +0200, Alexandre Belloni wrote:
> > On 02/09/2020 17:03:39+0200, Krzysztof Kozlowski wrote:
> > > The at91sam9g45_pcr_layout is not used so drop it to fix build warnin=
g:
> > >=20
> > >   drivers/clk/at91/at91sam9g45.c:49:36: warning:
> > >     'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-var=
iable=3D]
> > >=20
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >=20
> > > ---
> > >  drivers/clk/at91/at91sam9g45.c | 7 -------
> > >  1 file changed, 7 deletions(-)
> > >=20
>=20
> Hi Stephen,
>=20
> If the dev_err_probe() waits/skips/goes to /dev/null, then how about the
> fixes in the series? This patch and few other?

Yes if dev_err_probe() is superseded by Rob's work then the fixes should
be fine to pick up. Can you resend the fixes?
