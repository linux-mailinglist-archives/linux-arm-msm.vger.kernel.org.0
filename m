Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FB5276481
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 01:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgIWXan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 19:30:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:36240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbgIWXaf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 19:30:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5D732065E;
        Wed, 23 Sep 2020 23:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600903835;
        bh=YEekD48/CVeQDATxhCdijxDkNgGZL+EL076GbjZ49R0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=trOkXhbUhaazwz6ah1vmvfC5SPgR51xx5YprUD7cw4+Ma3SxBqp1zJg9A5X/OVfos
         fmpVC1eMHZ+PXBD/fJw+uT4eLLQCChsApsYgGqoG1/Rbm+vg/Lfhpk4qmMqQ3A/Oi2
         E4Z0LPl2HDlyxrJ9SYkRYq4KLTl9o/WGdtXOEcos=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0ce9fdb6-e224-ced7-ec32-fe67b2ca6127@marek.ca>
References: <20200904030958.13325-1-jonathan@marek.ca> <20200904030958.13325-6-jonathan@marek.ca> <160080040123.310579.8471841951357841843@swboyd.mtv.corp.google.com> <0ce9fdb6-e224-ced7-ec32-fe67b2ca6127@marek.ca>
Subject: Re: [PATCH v2 5/5] clk: qcom: add video clock controller driver for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Wed, 23 Sep 2020 16:30:33 -0700
Message-ID: <160090383364.310579.1979253418505275623@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 09:07:16)
> On 9/22/20 2:46 PM, Stephen Boyd wrote:
> > Quoting Jonathan Marek (2020-09-03 20:09:54)
> >=20
> >> +                       .ops =3D &clk_branch2_ops,
> >> +               },
> >> +       },
> >> +};
> >> +
> >> +static struct clk_branch video_cc_mvs0_clk =3D {
> >> +       .halt_reg =3D 0xd34,
> >> +       .halt_check =3D BRANCH_HALT_SKIP, /* TODO: hw gated ? */
> >=20
> > Is this resolved?
> >=20
>=20
> Downstream has this clock as BRANCH_HALT_VOTED, but with the upstream=20
> venus driver (with patches to enable sm8250), that results in a=20
> "video_cc_mvs0_clk status stuck at 'off" error. AFAIK venus=20
> enables/disables this clock on its own (venus still works without=20
> touching this clock), but I didn't want to remove this in case it might=20
> be needed. I removed these clocks in the v3 I just sent.
>=20

Hmm. Does downstream use these clks? There have been some clk stuck
problems with venus recently that were attributed to improperly enabling
clks before enabling interconnects and power domains. Maybe it's the
same problem.
