Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFEF28E900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 01:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730399AbgJNXAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 19:00:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgJNXAu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 19:00:50 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4E4020776;
        Wed, 14 Oct 2020 23:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602716449;
        bh=Iuq4p7SE+3zmq4h6neqIJS6zra1rULNlT+guIBTPmX8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZE5CtvlSe5cF/HVaQ/RCnB6oUOGyfYTS1xCgopUkKaXeetIDNmN1NOU7k6SsccZdn
         epiNkpf53/k4E5AHBZ4taVyE5DEJi+Pu9rWNi9ryw/fLpVRAIKBaCfKTvPHT6LnRe9
         vMD+Ge1JWU7k/AagoBW7oriERIMEDyym8j+h3b+A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com>
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid> <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid> <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com> <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, open list:
        ARM/QUALCOMM SUPPORT <linux-soc@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 16:00:47 -0700
Message-ID: <160271644762.884498.446447786516269652@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-10-14 15:28:58)
> Hi,
>=20
> On Wed, Oct 14, 2020 at 3:10 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Douglas Anderson (2020-10-14 14:05:22)
> > > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom=
/lpasscorecc-sc7180.c
> > > index abcf36006926..48d370e2108e 100644
> > > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > @@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audio_hm=
_sc7180_desc =3D {
> > >         .num_gdscs =3D ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> > >  };
> > >
> > > +static void lpass_pm_runtime_disable(void *data)
> > > +{
> > > +       pm_runtime_disable(data);
> > > +}
> > > +
> > > +static void lapss_pm_clk_destroy(void *data)
> > > +{
> > > +       pm_clk_destroy(data);
> > > +}
> >
> > Why are these helpers added again? And do we even need them? Can't we
> > just pass pm_runtime_disable or pm_clk_destroy to the
> > devm_add_action_or_reset() second parameter?
>=20
> Unfortunately, we can't due to the C specification.  Take a look at
> all the other users of devm_add_action_or_reset() and they all have
> pretty much the same stupid thing.=20

Ok, but we don't need two of the same functions, right?

> ...actually, do we even need the runtime_disable in the error path?
> When the dev goes away does it matter if you left pm_runtime enabled
> on it?
>=20

I don't know. The device isn't destroyed but maybe when the driver is
unbound it resets the runtime PM counters?
