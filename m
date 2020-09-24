Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EAA2768C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 08:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgIXGRu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 02:17:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgIXGRt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 02:17:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18A23208E4;
        Thu, 24 Sep 2020 06:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600928269;
        bh=ywMlU+ZfSYC9ZcnZdzwR0HqdVTNchu7DmscGuKbNLqQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hW8qSEmnvkfbsBJdrVB5FZeQHcwUKxske6S3exItwKYARITiaUQrM/NUjQou/yo5/
         XsuMGTBw5QV6+KKkSvq0xyHU/njZDxzgQ6Ze9wesU4fo5QEwN4fLD38H2zA5rEpZuK
         Z7URMKbOB3cZxPwmU8VuTTqcetVuDO8riVw++DUc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d7207c1c-c4e4-f994-cacb-bdfb7952732b@marek.ca>
References: <20200904030958.13325-1-jonathan@marek.ca> <20200904030958.13325-6-jonathan@marek.ca> <160080040123.310579.8471841951357841843@swboyd.mtv.corp.google.com> <0ce9fdb6-e224-ced7-ec32-fe67b2ca6127@marek.ca> <160090383364.310579.1979253418505275623@swboyd.mtv.corp.google.com> <d7207c1c-c4e4-f994-cacb-bdfb7952732b@marek.ca>
Subject: Re: [PATCH v2 5/5] clk: qcom: add video clock controller driver for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 23 Sep 2020 23:17:47 -0700
Message-ID: <160092826778.310579.12225989905897101118@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 17:54:59)
> On 9/23/20 7:30 PM, Stephen Boyd wrote:
> > Quoting Jonathan Marek (2020-09-23 09:07:16)
> >> On 9/22/20 2:46 PM, Stephen Boyd wrote:
> >>> Quoting Jonathan Marek (2020-09-03 20:09:54)
> >>>
> >>>> +                       .ops =3D &clk_branch2_ops,
> >>>> +               },
> >>>> +       },
> >>>> +};
> >>>> +
> >>>> +static struct clk_branch video_cc_mvs0_clk =3D {
> >>>> +       .halt_reg =3D 0xd34,
> >>>> +       .halt_check =3D BRANCH_HALT_SKIP, /* TODO: hw gated ? */
> >>>
> >>> Is this resolved?
> >>>
> >>
> >> Downstream has this clock as BRANCH_HALT_VOTED, but with the upstream
> >> venus driver (with patches to enable sm8250), that results in a
> >> "video_cc_mvs0_clk status stuck at 'off" error. AFAIK venus
> >> enables/disables this clock on its own (venus still works without
> >> touching this clock), but I didn't want to remove this in case it might
> >> be needed. I removed these clocks in the v3 I just sent.
> >>
> >=20
> > Hmm. Does downstream use these clks? There have been some clk stuck
> > problems with venus recently that were attributed to improperly enabling
> > clks before enabling interconnects and power domains. Maybe it's the
> > same problem.
> >=20
>=20
> Yes, downstream uses these clks.
>=20
> The "stuck" problem still happens if GSDCS/interconnects are always on,=20
> and like I mentioned, venus works even with these clocks completely=20
> removed.
>=20
> I think venus controls these clocks (and downstream just happens to try=20
> enabling it at a point where venus has already enabled it?). I'm not too =

> sure about this, it might have something to do with the GDSC having the=20
> HW_CTRL flag too..

Ok. Maybe Taniya has an idea.
