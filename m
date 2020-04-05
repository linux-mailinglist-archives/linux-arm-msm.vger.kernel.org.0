Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 681F019E8CB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 05:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgDEDK6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Apr 2020 23:10:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgDEDK6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Apr 2020 23:10:58 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8897206A3;
        Sun,  5 Apr 2020 03:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586056257;
        bh=JT+cqz7qLQP4SxN8BKeesGICXxCLM/dtqRMyPQ3Sypg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gH6i3tO5MVQB3uPNo+huaHmkejxuBY4nUhUoCunnAqMsmF7anDqq0ZyFOb0Cm/062
         oNFKVzSEKGRTGILKizSs4A5zAnTdvUWnRrLd++9JV+COQo8DjgElxvI+U+quW9jfPU
         7JXLOLw2oTI3bIOEozn/Lfqjau/wBp5VXM3Uw6hE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00f701d60958$a9ed46c0$fdc7d440$@gmail.com>
References: <20200330205647.24806-1-ansuelsmth@gmail.com> <158587766752.125146.7582840761926137726@swboyd.mtv.corp.google.com> <00f701d60958$a9ed46c0$fdc7d440$@gmail.com>
Subject: Re: R: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     'Mathieu Olivari' <mathieu@codeaurora.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Mark Rutland' <mark.rutland@arm.com>,
        'Michael Turquette' <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     'Andy Gross' <agross@kernel.org>, ansuelsmth@gmail.com
Date:   Sat, 04 Apr 2020 20:10:56 -0700
Message-ID: <158605625697.158626.12280118012638752686@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting ansuelsmth@gmail.com (2020-04-02 18:39:04)
>=20
>=20
> > -----Messaggio originale-----
> > Da: Stephen Boyd <sboyd@kernel.org>
> > Inviato: venerd=C3=AC 3 aprile 2020 03:34
> > A: Andy Gross <agross@kernel.org>; Ansuel Smith
> > <ansuelsmth@gmail.com>
> > Cc: Ansuel Smith <ansuelsmth@gmail.com>; Mathieu Olivari
> > <mathieu@codeaurora.org>; Bjorn Andersson
> > <bjorn.andersson@linaro.org>; Rob Herring <robh+dt@kernel.org>; Mark
> > Rutland <mark.rutland@arm.com>; Michael Turquette
> > <mturquette@baylibre.com>; linux-arm-msm@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > clk@vger.kernel.org
> > Oggetto: Re: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for
> > ipq806x
> >=20
> > Quoting Ansuel Smith (2020-03-30 13:56:46)
> > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-
> > ipq806x.c
> > > index b0eee0903807..f7d7a2bc84c1 100644
> > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > @@ -991,6 +991,7 @@ static struct clk_branch gsbi4_h_clk =3D {
> > >                 .hw.init =3D &(struct clk_init_data){
> > >                         .name =3D "gsbi4_h_clk",
> > >                         .ops =3D &clk_branch_ops,
> > > +                       .flags =3D CLK_IGNORE_UNUSED,
> >=20
> > Is this necessary? Shouldn't we skip clks that are protected during the
> > unused phase?
> >=20
>=20
> gsbi4_h_clk is not protected. gsbi4_h_clk needs to not be disabled if unu=
sed
> (as it's used by rpm) but can't be protected since it's used by uart gsbi=
4.
> (With some test protecting also this clk cause the malfunction of uart gs=
b4)
>=20

Who owns gsbi4 on this platform? Is it RPM? If so, it should be
protected and we shouldn't touch this clk from the kernel.
