Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528B142E56F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhJOAvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:51:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:33030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229546AbhJOAvr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:51:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F36D6108B;
        Fri, 15 Oct 2021 00:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634258981;
        bh=D/rmRCWzleCXcmAZUbTDdP635Cxw3PLWPDCklIf6UsY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=potzwP9u4hIGu0ac2cRCXAz7f/8BhdKHZ6KpNuERpInZA2y0NKK8YA2d/9rNvR8Vi
         0QgoNX9mPDuHBbWZcXRIzUuBKrCDFpjMrqUxPbWvGbveP+cPIEPFVsFsQbP+UHaVdI
         wdnAjcf2ETE79gLV3F3Ua1rS2tU710czHTHOMSdqPnOATCuXfcXg64csQDqfgBCLfF
         v74totrWzYtr4V7tFrhluGL81fYIbHBXvXEyeRoHb5fbc3BN6SznesqbBGZcxqmRzC
         Rd1rwUC7KAa/5moXgwKkJERVALR+2vY9Ly4VSnHbLHaNRwKz8x7KBsP2lVVcVReobb
         7DtGQgazTnGMw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YWjPexTTQYyZ9JNM@ripper>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org> <20210829154757.784699-8-dmitry.baryshkov@linaro.org> <YV8WsQb9H7+CaLjP@ripper> <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org> <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com> <070b1b25-3718-5f3a-869b-a3954fdcc7c5@linaro.org> <163425629248.1688384.14367506222343416862@swboyd.mtv.corp.google.com> <CAA8EJpo4SCSPMVstxO_eTGHVNCEkhguJDcfE4=6Y3YSDQ+SeOw@mail.gmail.com> <163425751841.1688384.11770181770221059842@swboyd.mtv.corp.google.com> <YWjPexTTQYyZ9JNM@ripper>
Subject: Re: [PATCH v7 7/8] clk: qcom: dispcc-sm8250: stop using mmcx regulator
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Thu, 14 Oct 2021 17:49:40 -0700
Message-ID: <163425898010.1688384.4973790117705709295@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-14 17:46:51)
> On Thu 14 Oct 17:25 PDT 2021, Stephen Boyd wrote:
>=20
> > Quoting Dmitry Baryshkov (2021-10-14 17:15:39)
> > > On Fri, 15 Oct 2021 at 03:04, Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > > Quoting Dmitry Baryshkov (2021-10-14 02:53:41)
> > > > > On 13/10/2021 22:50, Stephen Boyd wrote:
> > > > > > Quoting Dmitry Baryshkov (2021-10-07 09:16:13)
> > > > > >> On 07/10/2021 18:48, Bjorn Andersson wrote:
> > > > > >>> On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:
> > > > > >>>
> > > > > >>>> Now as the common qcom clock controller code has been taught=
 about power
> > > > > >>>> domains, stop mentioning mmcx supply as a way to power up th=
e clock
> > > > > >>>> controller's gdsc.
> > > > > >>>>
> > > > > >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > >>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > >>>
> > > > > >>> Once we merge these, I expect that the boards will start cras=
hing if
> > > > > >>> the kernel is booted using an existing DTB?
> > > > > >>>
> > > > > >>> Is it okay to just merge the first 6 patches in the series no=
w and
> > > > > >>> postpone these two until we've had the dts change sitting for=
 a while?
> > > > > >>
> > > > > >> Sure it is.
> > > > > >>
> > > > > >
> > > > > > What's the merge strategy? It goes through arm-soc?
> > > > >
> > > > > I think this should go through the clk tree. There is little chan=
ce of
> > > > > conflicts.
> > > > >
> > > >
> > > > The other thing that concerns me is that we don't have backwards
> > > > compat code. If things are going to start crashing that's not very =
nice.
> > > > Is there some way to make it work with old and new DTB for one rele=
ase
> > > > so that we don't have to worry about this problem?
> > >=20
> > > I have to admit that I did not check that, but without the patch 7 the
> > > dispcc and videocc would be compatible with the old DTB. The 'supply =
=3D
> > > "mmcx"' would ensure that it is used if it is defined.
> > >=20
> >=20
> > So I can skip patch 7 and take everything else?
>=20
> If you take patch 1-5 and I pick up patch 6 for v5.16 then we should
> have transitioned with backwards compatibility.
>=20

Ok. Sounds like a deal.
