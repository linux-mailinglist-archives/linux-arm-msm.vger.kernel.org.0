Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31F3F40AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 07:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbfKHGmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 01:42:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:59248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbfKHGmJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 01:42:09 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E978C21D7E;
        Fri,  8 Nov 2019 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573195328;
        bh=cl6ZS58VdbvS4YiW96ap38rwmt3DLpIvcS0JMa4AI60=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=oegjtXRVFGMs9ibbPbFM5x4nAuh1XClhQc1/gMTciwe4ATeIEATj/Rz2liR3wiZSO
         vIQplbI2ZykzuY5OX+T2D2ltcwkm1c5xSAkpC5ZqM7uI2DkZJZ3LA1lyO3NWDSHbzS
         4gEDzmnUHXA/YxoysqU9thWqWwCkyFUCT/GhjUiM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7f3697ae-2e12-f306-b288-4dec19544275@codeaurora.org>
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org> <1569959842-8399-1-git-send-email-jhugo@codeaurora.org> <20191107215506.8FBFA2084D@mail.kernel.org> <7f3697ae-2e12-f306-b288-4dec19544275@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 4/6] dt-bindings: clock: Add support for the MSM8998 mmcc
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 22:42:07 -0800
Message-Id: <20191108064207.E978C21D7E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-11-07 14:35:21)
> On 11/7/2019 2:55 PM, Stephen Boyd wrote:
> > Quoting Jeffrey Hugo (2019-10-01 12:57:22)
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/D=
ocumentation/devicetree/bindings/clock/qcom,mmcc.txt
> >> index 8b0f7841af8d..a92f3cbc9736 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
> >=20
> >>  =20
> >>   - reg : shall contain base register location and length
> >>   - #clock-cells : shall contain 1
> >>   - #reset-cells : shall contain 1
> >>  =20
> >> +For MSM8998 only:
> >> +       - clocks: a list of phandles and clock-specifier pairs,
> >> +                 one for each entry in clock-names.
> >> +       - clock-names: "xo" for the xo clock.
> >> +                      "gpll0" for the global pll 0 clock.
> >> +                      "dsi0dsi" for the dsi0 pll dsi clock (required =
if dsi is
> >> +                               enabled, optional otherwise).
> >> +                      "dsi0byte" for the dsi0 pll byte clock (require=
d if dsi
> >> +                               is enabled, optional otherwise).
> >> +                      "dsi1dsi" for the dsi1 pll dsi clock (required =
if dsi is
> >> +                               enabled, optional otherwise).
> >> +                      "dsi1byte" for the dsi1 pll byte clock (require=
d if dsi
> >> +                               is enabled, optional otherwise).
> >> +                      "hdmipll" for the hdmi pll clock (required if h=
dmi is
> >> +                               enabled, optional otherwise).
> >> +                      "dpvco" for the displayport pll vco clock (requ=
ired if
> >> +                               dp is enabled, optional otherwise).
> >> +                      "dplink" for the displayport pll link clock (re=
quired if
> >> +                               dp is enabled, optional otherwise).
> >=20
> > I'm not sure why it's optional. The hardware is "fixed" in the sense
> > that the dp phy is always there and connected to this hardware block.
> >  From a driver perspective I agree it's optional to be used, but from a
> > DT perspective it's always there so it should be required.
> >=20
>=20
> Sure, the DP phy is technically always there, but does a particular=20
> platform have an actual DP output connected to the phy?  If not, why=20
> bother describing something that isn't even used?

If the DP phy isn't connected then having it be marked as status =3D
"disabled" is the typical approach to the problem. I agree it may not be
used on some particular board using the SoC, but this is an SoC that is
made once so we should be able to describe it regardless of how it's
used by some board.

>=20
>  From a more practical sense its undefined how to actually get the DP=20
> clocks - the DP binding is implicitly a clock provider since it has=20
> #clock-cells, but it doesn't specify how to actually get the clocks.=20
> The DSI binding tells you which index is the dsi clock, and which is the =

> byte clock.
>=20
> The HDMI binding is not a clock provider at all.  Needs to be revised,=20
> which didn't appear trivial when I took a quick look while working on mmc=
c.
>=20
> I want to do the right thing here by specifying all the external clocks=20
> up front, and not have to worry about backwards compatibility with=20
> pre-existing DTs later on, but I also would like to focus on one problem =

> at a time, and not go dig into all the problems with DP/HDMI before=20
> landing this, particularly as those components also rely on the mmcc.
>=20
> Is that justification enough for you?  If not, how would you like to=20
> proceed?  Make them required in the binding, and just have an invalid=20
> (per the binding) DT until all the problems get sorted out?
>=20

If we can make the clks 'required' and not cause the DTS checker system
to blow up then I'll be happy.

I hope we can have a property like:
=09
	clocks =3D <&gcc KNOWN_CLK>, <0>, <0>, <&dp_phy 1>;

where <0> means "I don't know right now", and that will be enough to
please the checker and can be filled in later on when we sort out the
HDMI and DP bindings. If this doesn't work then I guess I'll just have
to get over it and complain to Rob Herring.

