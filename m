Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5374428E934
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 01:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731046AbgJNXd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 19:33:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727890AbgJNXd1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 19:33:27 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF8FC2078A;
        Wed, 14 Oct 2020 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602718405;
        bh=wBJdGMuCbxB+/x8tgiFHN84xb+woI7yw+Ucn/eFhAvs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O85Aa0lVcvK49vkvt0QagZkTvUXcWsSoVlPv13RzrzfAhhAzTZ8V4jaGTlpLivuc+
         y5r7vCE36G2QrHaxDWMw/BuuiI2FnWpR3zkq17rfJpv9vInQ5B++VozyqPMCTrJA1n
         wLPI2Le72bQRWmZ0PRhtk3pTNy5+BaJK0lh/UG7U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VTEQMqnmC_OMtADTdrs+2zxCd8ODSRpxtxP6SKBnx2qg@mail.gmail.com>
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid> <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid> <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com> <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com> <160271644762.884498.446447786516269652@swboyd.mtv.corp.google.com> <CAD=FV=VTEQMqnmC_OMtADTdrs+2zxCd8ODSRpxtxP6SKBnx2qg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        ARM/QUALCOMM SUPPORT <linux-soc@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 16:33:24 -0700
Message-ID: <160271840430.884498.12165227808003957407@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-10-14 16:07:52)
> Hi,
>=20
> On Wed, Oct 14, 2020 at 4:00 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Doug Anderson (2020-10-14 15:28:58)
> > > Hi,
> > >
> > > On Wed, Oct 14, 2020 at 3:10 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > > Quoting Douglas Anderson (2020-10-14 14:05:22)
> > > > > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/=
qcom/lpasscorecc-sc7180.c
> > > > > index abcf36006926..48d370e2108e 100644
> > > > > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > > @@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audi=
o_hm_sc7180_desc =3D {
> > > > >         .num_gdscs =3D ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> > > > >  };
> > > > >
> > > > > +static void lpass_pm_runtime_disable(void *data)
> > > > > +{
> > > > > +       pm_runtime_disable(data);
> > > > > +}
> > > > > +
> > > > > +static void lapss_pm_clk_destroy(void *data)
> > > > > +{
> > > > > +       pm_clk_destroy(data);
> > > > > +}
> > > >
> > > > Why are these helpers added again? And do we even need them? Can't =
we
> > > > just pass pm_runtime_disable or pm_clk_destroy to the
> > > > devm_add_action_or_reset() second parameter?
> > >
> > > Unfortunately, we can't due to the C specification.  Take a look at
> > > all the other users of devm_add_action_or_reset() and they all have
> > > pretty much the same stupid thing.
> >
> > Ok, but we don't need two of the same functions, right?
>=20
> How would you write it more cleanly?=20

Oh I see I'm making it confusing. Patch 1 has two functions for
pm_runtime_disable() and pm_clk_destroy(), called
lpass_pm_runtime_disable() and lapss_pm_clk_destroy() respectively
(please fix the lapss typo regardless).

Then this patch seems to introduce them again, but really the diff is
getting confused and it looks like the functions are introduced again.
Can you move them to this location (or at least near it) in the first
patch so that this doesn't look like they're being introduced again?

> > > ...actually, do we even need the runtime_disable in the error path?
> > > When the dev goes away does it matter if you left pm_runtime enabled
> > > on it?
> > >
> >
> > I don't know. The device isn't destroyed but maybe when the driver is
> > unbound it resets the runtime PM counters?
>=20
> Certainly it seems safest just to do it...
>=20

Can you confirm? I'd rather not carry extra code.
