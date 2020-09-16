Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF9426C5EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 19:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgIPRZk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 13:25:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727021AbgIPRZi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:25:38 -0400
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94C452222E;
        Wed, 16 Sep 2020 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600272952;
        bh=27sYm41mDiVDnZrWbm0QPVBaPRpD52EfmzkcCrZV80c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pqNRMaP0X9Blp3xQCD3Zk+PlqjNSI+5urM1u/88kqjNllpJCcNBf7qN2LPn3/BTT2
         dRyX2kVPw+lPv64et2CISd3l4nVeoM+yFS2ajeTC1WSNblvCbW7Trl4WMuBEPkg7hD
         k/UqtCkwJCii1ROu6m15flANY9Y6NmenSXuaxsbw=
Received: by mail-ej1-f47.google.com with SMTP id p9so11151659ejf.6;
        Wed, 16 Sep 2020 09:15:52 -0700 (PDT)
X-Gm-Message-State: AOAM531YawbGDMzodTmV2YlokpruOKg3Bsvon+RzTPVkEgssTkV2K/pB
        B3dthBoKPV9FGnQvzp0vCAB/kz4sD6yR0KJo3N0=
X-Google-Smtp-Source: ABdhPJxEK6ZjXsdxLcZySzuz0z9lSyaAmd9P0gRxYMJTfHrR5KxRYZH+Asvudz0vhNq7zAjPO6GX+HHY/5crRL//S3M=
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr25499511ejx.215.1600272951032;
 Wed, 16 Sep 2020 09:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200902150348.14465-1-krzk@kernel.org> <20200902163558.GA4137028@piout.net>
 <20200911153441.GA18190@kozik-lap> <160012811662.4188128.10109140799333292326@swboyd.mtv.corp.google.com>
In-Reply-To: <160012811662.4188128.10109140799333292326@swboyd.mtv.corp.google.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 16 Sep 2020 18:15:39 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdjyETBwDqC+C75giz2bD0Gie-G4Yd_svpc-vYccywy_Q@mail.gmail.com>
Message-ID: <CAJKOXPdjyETBwDqC+C75giz2bD0Gie-G4Yd_svpc-vYccywy_Q@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
To:     Stephen Boyd <sboyd@kernel.org>
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
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 15 Sep 2020 at 02:01, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Krzysztof Kozlowski (2020-09-11 08:34:41)
> > On Wed, Sep 02, 2020 at 06:35:58PM +0200, Alexandre Belloni wrote:
> > > On 02/09/2020 17:03:39+0200, Krzysztof Kozlowski wrote:
> > > > The at91sam9g45_pcr_layout is not used so drop it to fix build warning:
> > > >
> > > >   drivers/clk/at91/at91sam9g45.c:49:36: warning:
> > > >     'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > >
> > > > ---
> > > >  drivers/clk/at91/at91sam9g45.c | 7 -------
> > > >  1 file changed, 7 deletions(-)
> > > >
> >
> > Hi Stephen,
> >
> > If the dev_err_probe() waits/skips/goes to /dev/null, then how about the
> > fixes in the series? This patch and few other?
>
> Yes if dev_err_probe() is superseded by Rob's work then the fixes should
> be fine to pick up. Can you resend the fixes?

Sure, I will send the fixes only.

Best regards,
Krzysztof
